L = LANG.GetLanguageTableReference("en")

L[RESTLESS.name] = "Restless"
L[RESTLESS.defaultTeam] = "TEAM Restless"
L["hilite_win_" .. RESTLESS.defaultTeam] = "THE RESTLESS WON"
L["win_" .. RESTLESS.defaultTeam] = "The Restless has won!"
L["info_popup_" .. RESTLESS.name] = [[You are a Restless! You must kill everyone and you'll come back if killed!]]
L["body_found_" .. RESTLESS.abbr] = "They were a Restless!"
L["search_role_" .. RESTLESS.abbr] = "This person was a Restless!"
L["target_" .. RESTLESS.name] = "Restless"
L["ttt2_desc_" .. RESTLESS.name] = [[Restless is a neutral killer who keeps coming back to life weaker!]]

L["restless_reviving"] = "You have {lives} lives remaining!"
L["restless_final_life"] = "This is your final life!"
L["ttt2_rst_target_mult"] = "You deal {multiplier}x damage!"
L["restless_reviving_can_buy"] = "You have {lives} lives remaining! Press Reload to respawn at a map spawnpoint at the cost of {cost} life."
L["restless_reviving_worldspawn"] = "You have {lives} lives remaining! You will respawn at a map spawnpoint"

--EVENT STRINGS
L["title_rst_revive"] = "A Restless respawned."
L["desc_rst_revive"] = "{restless} respawned with {lives}/{max} lives."
L["desc_rst_revive_worldspawn"] = "They sacrificed {cost} lives to respawn at a spawnpoint."

--SETTING STRINGS
L["label_ttt2_rst_worldspawn"] = "Always respawns at spawnpoint (instead of at their body)"
L["label_ttt2_rst_need_corpse"] = "Require their body to respawn"
L["label_ttt2_rst_block_round"] = "Block round end while respawning"
L["label_ttt2_rst_delay_mode"] = "Exponential respawn delay"
L["label_ttt2_rst_health_multi"] = "Health reduction per death"
L["label_ttt2_rst_min_health"] = "Minimum health"
L["label_ttt2_rst_lives"] = "Number of lives"
L["label_ttt2_rst_dmg_penalty"] = "Damage penalty per death"
L["label_ttt2_rst_min_dmg"] = "Minimum damage"
L["label_ttt2_rst_base_delay"] = "Base respawn delay"
L["label_ttt2_rst_spawn_cost"] = "Live cost to change spawn point"