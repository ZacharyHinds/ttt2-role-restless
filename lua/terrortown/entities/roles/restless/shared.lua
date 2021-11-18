if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_rst.vmt")

end

roles.InitCustomTeam(ROLE.name, {
    icon = "vgui/ttt/dynamic/roles/icon_rst",
    color = Color(194, 175, 91, 255)
})

function ROLE:PreInitialize()
  self.color = Color(194, 175, 91, 255)

  self.abbr = "rst"
  self.surviveBonus = 0
  self.scoreKillsMultiplier = 5
  self.scoreTeamKillsMultiplier = -16

  self.isOmniscientRole = true

  self.defaultEquipment = SPECIAL_EQUIPMENT
  self.defaultTeam = TEAM_RESTLESS

  self.conVarData = {
    pct = 0.17,
    maximum = 1,
    minPlayers = 6,
    togglable = true
  }
end

function ROLE:Initialize()
  if SERVER and JESTER then self.networkRoles = {JESTER} end
end
