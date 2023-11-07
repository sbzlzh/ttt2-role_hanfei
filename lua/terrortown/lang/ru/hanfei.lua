-- Этот персонаж не атакует ни дела, ни людей, ни вещи, пожалуйста, не вовлекайтесь в это.

local L = LANG.GetLanguageTableReference("ru")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Бандит Ближнего Востока"
L["info_popup_" .. HANFEI.name] = [[Вы - Бандит Ближнего Востока! Не колеблясь, просто сделай это!]]
L["body_found_" .. HANFEI.abbr] = "Это Бандит Ближнего Востока!"
L["search_role_" .. HANFEI.abbr] = "Этот человек - Бандит Ближнего Востока!"
L["target_" .. HANFEI.name] = "Бандит Ближнего Востока"
L["ttt2_desc_" .. HANFEI.name] = [[Это мощный предатель! Он начинает игру с C4, высокой броней и АК. При смерти он вызывает звуковой эффект Аллаху акбар и взрывается, нанося урон по области!]]

L["label_hanfei_armor"] = "Количество брони (Диапазон: 0-500. По умолчанию: 50)"
L["label_hanfei_hp"] = "Количество здоровья (Диапазон: 0-500. По умолчанию: 150)"
L["label_hanfei_exposetime"] = "Время экспозиции (Диапазон: 0-120. По умолчанию: 60 секунд)"
L["label_hanfei_tracker_mode"] = "Выберите режим эффекта (0: Нет 1: Радар 2: Трекер)"
L["ttt2_hanfei_chat_reveal"] = "{playername} является Бандитом Ближнего Востока в этом раунде, давайте сбросим его вместе!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Бандит Ближнего Востока: {playername}"

--L["tracker_not_available"] = "Middle Eastern Bandit can't be given tracker as this equipment is not available on the server.If it doesn't exist, go to Required Items in your character to download it."
