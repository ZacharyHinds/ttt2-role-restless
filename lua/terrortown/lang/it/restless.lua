L = LANG.GetLanguageTableReference("it")

L[RESTLESS.name] = "Insonne"
L[RESTLESS.defaultTeam] = "TEAM Insonni"
L["hilite_win_" .. RESTLESS.defaultTeam] = "GLI INSONNI HANNO VINTO"
L["win_" .. RESTLESS.defaultTeam] = "Gli Insonni hanno vinto!"
L["info_popup_" .. RESTLESS.name] = [[Sei un Insonne! Devi uccidere tutti e tornerai in vita appena muorirai!]]
L["body_found_" .. RESTLESS.abbr] = "Loro erano Insonni!"
L["search_role_" .. RESTLESS.abbr] = "Questa persona era Insonne!"
L["target_" .. RESTLESS.name] = "Insonne"
L["ttt2_desc_" .. RESTLESS.name] = [[Insonne è un ruolo che continua a ritornare in vita più debole, ha vite limitate]]

L["restless_reviving"] = "Tu hai {lives} vite rimanenti!"
L["restless_final_life"] = "Questa è la tua vita finale!"
L["ttt2_rst_target_mult"] = "Tu fai {multiplier}x di danno!"
-- L["restless_reviving_can_buy"] = "You have {lives} lives remaining! Press Reload to respawn at a map spawnpoint at the cost of {cost} life."
-- L["restless_reviving_worldspawn"] = "You have {lives} lives remaining! You will respawn at a map spawnpoint"

--SETTING STRINGS
-- L["label_ttt2_rst_worldspawn"] = "Always respawns at spawnpoint (instead of at their body)"
-- L["label_ttt2_rst_need_corpse"] = "Require their body to respawn"
-- L["label_ttt2_rst_block_round"] = "Block round end while respawning"
-- L["label_ttt2_rst_delay_mode"] = "Exponential respawn delay"
-- L["label_ttt2_rst_health_multi"] = "Health reduction per death"
-- L["label_ttt2_rst_min_health"] = "Minimum health"
-- L["label_ttt2_rst_lives"] = "Number of lives"
-- L["label_ttt2_rst_dmg_penalty"] = "Damage penalty per death"
-- L["label_ttt2_rst_min_dmg"] = "Minimum damage"
-- L["label_ttt2_rst_base_delay"] = "Base respawn delay"
-- L["label_ttt2_rst_spawn_cost"] = "Live cost to change spawn point"