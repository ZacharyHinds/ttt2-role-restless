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

if CLIENT then
  function ROLE:AddToSettingsMenu(parent)
    local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

    form:MakeCheckBox({
      serverConvar = "ttt2_rst_worldspawn",
      label = "label_ttt2_rst_worldspawn"
    })

    form:MakeCheckBox({
      serverConvar = "ttt2_rst_need_corpse",
      label = "label_ttt2_rst_need_corpse"
    })

    form:MakeCheckBox({
      serverConvar = "ttt2_rst_block_round",
      label = "label_ttt2_rst_block_round"
    })

    form:MakeCheckBox({
      serverConvar = "ttt2_rst_delay_mode",
      label = "label_ttt2_rst_delay_mode"
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_health_multi",
      label = "label_ttt2_rst_health_multi",
      min = 0,
      max = 100,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_min_health",
      label = "label_ttt2_rst_min_health",
      min = 1,
      max = 100,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_lives",
      label = "label_ttt2_rst_lives",
      min = 1,
      max = 10,
      decimal = 0
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_dmg_penalty",
      label = "label_ttt2_rst_dmg_penalty",
      min = 0,
      max = 1,
      decimal = 2
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_min_dmg",
      label = "label_ttt2_rst_min_dmg",
      min = 0,
      max = 1,
      decimal = 2
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_base_delay",
      label = "label_ttt2_rst_base_delay",
      min = 0,
      max = 5,
      decimal = 1
    })

    form:MakeSlider({
      serverConvar = "ttt2_rst_spawn_cost",
      label = "label_ttt2_rst_spawn_cost",
      min = 0,
      max = 5,
      decimal = 0
    })

  end
end