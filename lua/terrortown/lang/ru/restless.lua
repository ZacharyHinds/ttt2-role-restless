L = LANG.GetLanguageTableReference("ru")

L[RESTLESS.name] = "Беспокойный"
L[RESTLESS.defaultTeam] = "Команда беспокойных"
L["hilite_win_" .. RESTLESS.defaultTeam] = "ПОБЕДА БЕСПОКОЙНЫХ"
L["win_" .. RESTLESS.defaultTeam] = "Беспокойный победил!"
L["info_popup_" .. RESTLESS.name] = [[Вы беспокойный! Вы должны убить всех, и вы вернётесь, если вас убьют!]]
L["body_found_" .. RESTLESS.abbr] = "Он был беспокойным!"
L["search_role_" .. RESTLESS.abbr] = "Этот человек был беспокойным!"
L["target_" .. RESTLESS.name] = "Беспокойный"
L["ttt2_desc_" .. RESTLESS.name] = [[Беспокойный - нейтральный убийца, который всё слабее возвращается к жизни!]]

L["restless_reviving"] = "У вас есть {lives} оставшихся жизней!"
L["restless_final_life"] = "Это ваша последняя жизнь!"
L["ttt2_rst_target_mult"] = "Вы наносите {multiplier}x урона!"
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