if SERVER then
  hook.Add("PostPlayerDeath", "RestlessKilled", function(ply)
    if not IsValid(ply) or ply:GetSubRole() ~= ROLE_RESTLESS then return end
    ply:SetNWInt("rst_death_count", ply:GetNWInt("rst_death_count", 0) + 1)

    local death_count = ply:GetNWInt("rst_death_count", 0)
    local spawn_delay = 3 * death_count
    local spawnpoint = spawn.GetRandomPlayerSpawnEntity(ply)
    local doWorldSpawn = GetConVar("ttt2_rst_worldspawn"):GetBool()
    local rst_health = 100 - (GetConVar("ttt2_rst_health_multi"):GetInt() * death_count)

    if rst_health < 100 then rst_health = 1 end

    ply:Revive(
      spawn_delay,
      function()
        if doWorldSpawn and spawnpoint then
          ply:SetPos(spawnpoint:GetPos())
        end
        ply:SetHealth(rst_health)
      end,
      nil,
      GetConVar("ttt2_rst_need_corpse"):GetBool(),
      false
    )
  end)
end
