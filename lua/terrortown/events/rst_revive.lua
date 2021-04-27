if CLIENT then
    EVENT.title = "title_rst_revive"
    EVENT.icon = Material("vgui/ttt/dynamic/roles/icon_rst.vmt")

    function EVENT:GetText()
        local reviveText = {
            {
                string = "desc_rst_revive",
                params = {
                    restless = self.event.nick,
                    lives = self.event.lives,
                    max = self.event.max
                }
            }
        }

        if self.event.didWorldSpawn then
            reviveText[#reviveText + 1] = {
                string = "desc_rst_revive_worldspawn",
                params = {
                    cost = self.event.cost
                }
            }
        end

        return reviveText
    end
end

if SERVER then
    function EVENT:Trigger(restless, deaths, didWorldSpawn)
        -- self.didWorldSpawn = didWorldSpawn

        restless.wasRestlessRevive = true

        local max = GetConVar("ttt2_rst_lives"):GetInt()
        local lives = max - deaths
        local cost = GetConVar("ttt2_rst_spawn_cost"):GetInt()

        if didWorldSpawn then
            lives = lives - cost
        end


        return self:Add({
            nick = restless:Nick(),
            sid64 = restless:SteamID64(),
            lives = lives,
            max = max,
            cost = cost,
            didWorldSpawn = didWorldSpawn
        })
    end
    
    hook.Add("TTT2OnTriggeredEvent", "cancel_restless_revive_event", function(type, eventData)
        if type ~= EVENT_RESPAWN then return end
    
        local ply = player.GetBySteamID64(eventData.sid64)
    
        if not IsValid(ply) or not ply.wasRestlessRevive then return end
    
        ply.wasRestlessRevive = nil 
    
        return false
    end)
end
