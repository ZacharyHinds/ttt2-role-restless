CreateConVar("ttt2_rst_worldspawn", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_health_multi", 20, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_need_corpse", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_lives", 6, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
CreateConVar("ttt2_rst_min_dmg", 0.5, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_min_health", 5, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_dmg_penalty", 0.05, {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
CreateConVar("ttt2_rst_base_delay", 2, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_delay_mode", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_block_round", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt2_rst_spawn_cost", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})

if CLIENT then
  hook.Add("TTT2FinishedLoading", "mes_devicon", function() -- addon developer emblem for me ^_^
    AddTTT2AddonDev("76561198049910438")
  end)
end

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_rst_convars", function(tbl)
  tbl[ROLE_RESTLESS] = tbl[ROLE_RESTLESS] or {}

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_worldspawn",
      checkbox = true,
      desc = "ttt2_rst_worldspawn (def. 0)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_need_corpse",
      checkbox = true,
      desc = "ttt2_rst_need_corpse (def. 1)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_block_round",
      checkbox = true,
      desc = "ttt2_rst_block_round (def. 0)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_health_multi",
      slider = true,
      min = 0,
      max = 100,
      desc = "ttt2_rst_health_multi (def. 20)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_min_health",
      slider = true,
      min = 1,
      max = 100,
      desc = "ttt2_rst_min_health (def. 5)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_lives",
      slider = true,
      min = 1,
      max = 10,
      desc = "ttt2_rst_lives (def. 6)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_dmg_penalty",
      slider = true,
      min = 0,
      max = 1,
      decimal = 2,
      desc = "ttt2_rst_dmg_penalty (def. 0.05)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_min_dmg",
      slider = true,
      min = 0,
      max = 1,
      decimal = 2,
      desc = "ttt2_rst_min_dmg (def. 0.5)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_base_delay",
      slider = true,
      min = 0,
      max = 5,
      decimal = 1,
      desc = "ttt2_rst_base_delay (def. 2.0)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
      cvar = "ttt2_rst_delay_mode",
      combobox = true,
      choices = {
        "0 - Delay increases linearly",
        "1 - Delay increases exponetially"
      },
      numStart = 0,
      desc = "ttt2_rst_delay_mode (def. 0)"
  })

  table.insert(tbl[ROLE_RESTLESS], {
    cvar = "ttt2_rst_spawn_cost",
    slider = true,
    min = 0,
    max = 5,
    desc = "ttt2_rst_spawn_cost (def. 1)"
  })
end)
