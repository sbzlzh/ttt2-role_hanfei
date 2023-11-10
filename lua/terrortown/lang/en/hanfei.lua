-- This character does not attack things, people, or objects. Please do not get involved.

local L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Middle Eastern Bandit"
L["info_popup_" .. HANFEI.name] = [[You are the Middle Eastern Bandit!Don't hesitate, just do it!]]
L["body_found_" .. HANFEI.abbr] = "This is the Middle Eastern Bandit!"
L["search_role_" .. HANFEI.abbr] = "This person is the Middle Eastern Bandit!"
L["target_" .. HANFEI.name] = "Middle Eastern Bandit"
L["ttt2_desc_" .. HANFEI.name] = [[This is a powerful traitor! He starts the game with a C4, high armor, and an AK. Up on death, he triggers an Allahu Akbar sound effect and explodes, causing area damage!]]

L["label_hanfei_armor"] = "Armor Amount (Range: 0-500. Default: 50)"
L["label_hanfei_hp"] = "Health Points Amount (Range: 0-500. Default: 150)"
L["label_hanfei_exposetime"] = "Exposure Time (Range: 0-120. Default: 60 seconds)"
L["label_hanfei_tracker_mode"] = "Select Effect Mode (0: None 1: Radar 2: Tracker)"
L["ttt2_hanfei_chat_reveal"] = "{playername} is the Middle Eastern Bandit this round, let's all take him down together!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Middle Eastern Bandit: {playername}"

L["tracker_not_available"] = "Middle Eastern Bandit can't be given tracker as this equipment is not available on the server.If it doesn't exist, go to Required Items in your character to download it."
