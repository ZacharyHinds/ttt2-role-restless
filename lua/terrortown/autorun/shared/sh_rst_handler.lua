if SERVER then
  hook.Add("TTT2PostPlayerDeath", "RestlessKilled", function(ply, _, attacker)
    if not IsValid(ply) or ply:GetSubRole() ~= ROLE_RESTLESS then return end
    if IsValid(attacker) and attacker:IsPlayer() and attacker:GetSubRole() == ROLE_INFECTED then return end
    ply:SetNWInt("rst_death_count", ply:GetNWInt("rst_death_count", 0) + 1)

    local death_count = ply:GetNWInt("rst_death_count", 0)
    print(ply:Nick() .. "'s Death Count: " .. death_count)
    if death_count > GetConVar("ttt2_rst_lives"):GetInt() then return end
    local spawn_delay = GetConVar("ttt2_rst_base_delay"):GetFloat()
    if GetConVar("ttt2_rst_delay_mode"):GetInt() == 0 then
      spawn_delay = spawn_delay * death_count
      print("Spawn Delay: " .. spawn_delay)
    else
      spawn_delay = spawn_delay ^ death_count
      print("Spawn Delay: " .. spawn_delay)
    end

    local spawnpoint = spawn.GetRandomPlayerSpawnEntity(ply)
    local doWorldSpawn = GetConVar("ttt2_rst_worldspawn"):GetBool()
    local rst_health = 100 - (GetConVar("ttt2_rst_health_multi"):GetInt() * death_count)
    local spawnpoint_cost = GetConVar("ttt2_rst_spawn_cost"):GetInt()

    if rst_health < GetConVar("ttt2_rst_min_health"):GetInt() then rst_health = GetConVar("ttt2_rst_min_health"):GetInt() end

    ply:Revive(
      spawn_delay,
      function()
        -- hook.Add("KeyPress", "TTT2RestlessBuyWorldSpawn", function(pl, key)
        --   if ply ~= pl or pl:Alive() then return end
        --   if death_count >= GetConVar("ttt2_rst_lives"):GetInt() then return end
        --   if key == IN_RELOAD then
        --     doWorldSpawn = true
        --     ply:SetNWInt("rst_death_count", death_count + 1)
        --   end
        -- end)
        if (doWorldSpawn or ply.rstBuyWorldSpawn) and spawnpoint then
          ply:SetPos(spawnpoint:GetPos())
          if ply.rstBuyWorldSpawn then
            ply:SetNWInt("rst_death_count", death_count + spawnpoint_cost)
            ply.rstBuyWorldSpawn = false
          end
        end
        ply:SetHealth(rst_health)
        ply:SetMaxHealth(rst_health)
      end,
      function()
        return ply:GetSubRole() == ROLE_RESTLESS
      end,
      GetConVar("ttt2_rst_need_corpse"):GetBool(),
      GetConVar("ttt2_rst_block_round"):GetBool()
    )
    local lives = GetConVar("ttt2_rst_lives"):GetInt() - death_count
    if lives - spawnpoint_cost < 0 and lives > 0 and not doWorldSpawn then
      ply:SendRevivalReason("restless_reviving", {lives = lives})
    elseif lives == 0 then
      ply:SendRevivalReason("restless_final_life")
    elseif not doWorldSpawn then
      ply:SendRevivalReason("restless_reviving_can_buy", {lives = lives, cost = GetConVar("ttt2_rst_spawn_cost"):GetInt()})
    else
      ply:SendRevivalReason("restless_reviving_worldspawn", {lives = lives})
    end
  end)

  hook.Add("TTTBeginRound", "RestlessDeathReset", function()
    for _, ply in ipairs(player.GetAll()) do
      ply:SetNWInt("rst_death_count", nil)
    end
  end)

  hook.Add("TTTEndRound", "RestlessDeathReset", function()
    for _, ply in ipairs(player.GetAll()) do
      ply:SetNWInt("rst_death_count", nil)
    end
  end)

  hook.Add("TTTPrepRound", "RestlessDeathReset", function()
    for _, ply in ipairs(player.GetAll()) do
      ply:SetNWInt("rst_death_count", nil)
    end
  end)

  hook.Add("EntityTakeDamage", "TTT2RestlessDamagePenalty", function(ply, dmginfo)

    if not ply:IsPlayer() or not IsValid(ply) then return end

    local attacker = dmginfo:GetAttacker()

    if not IsValid(attacker) or not attacker:IsPlayer() or attacker:GetSubRole() ~= ROLE_RESTLESS then return end

    local damage_penalty = GetConVar("ttt2_rst_dmg_penalty"):GetFloat() * attacker:GetNWInt("rst_death_count", 0)
    if not damage_penalty then return end

    if (1 - damage_penalty) < GetConVar("ttt2_rst_min_dmg"):GetFloat() then damage_penalty = 1 - GetConVar("ttt2_rst_min_dmg"):GetFloat() end


    print(attacker:Nick() .. "'s Damage Penalty: " .. (1 - damage_penalty))
    dmginfo:ScaleDamage(1 - damage_penalty)
  end)

  hook.Add("KeyPress", "TTT2RestlessBuyWorldSpawn", function(ply, key)
    if ply:GetSubRole() ~= ROLE_RESTLESS then return end
    local lives = GetConVar("ttt2_rst_lives"):GetInt() - ply:GetNWInt("rst_death_count")
    local cost = GetConVar("ttt2_rst_spawn_cost"):GetInt()
    if ply:Alive() or lives <= 0 then return end
    if lives - cost < 0 then return end
    if not ply.isReviving then return end
    if ply.rstBuyWorldSpawn then return end
    if key ~= IN_RELOAD then return end
    ply.rstBuyWorldSpawn = true
    if lives - cost == 0 then
      ply:SendRevivalReason("restless_final_life")
    else
      ply:SendRevivalReason("restless_reviving_worldspawn", {lives = lives - cost})
    end
  end)
end

if CLIENT then
  hook.Add("TTTRenderEntityInfo", "TTT2RestlessMultiplier", function(tData)
    if not RESTLESS then return end

    local client = LocalPlayer()

    if client:GetSubRole() ~= ROLE_RESTLESS then return end

    local ent = tData:GetEntity()

    if not ent:IsPlayer() or not IsValid(ent) then return end

    local death_count = client:GetNWInt("rst_death_count", 0)
    if not death_count then return end
    local mltplr = 1 - GetConVar("ttt2_rst_dmg_penalty"):GetFloat() * death_count

    if death_count > 0 and (GetConVar("ttt2_rst_dmg_penalty"):GetFloat() * death_count > 0) then
      tData:AddDescriptionLine(
        LANG.GetParamTranslation("ttt2_rst_target_mult", {multiplier = math.Round(mltplr, 2)}),
        RESTLESS.ltcolor
      )
    end
  end)
end
