L = LANG.GetLanguageTableReference("english")

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
