-- Dieser Charakter greift weder Dinge noch Personen noch Objekte an. Bitte involvieren Sie sich nicht.

local L = LANG.GetLanguageTableReference("de")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Nahost-Bandit"
L["info_popup_" .. HANFEI.name] = [[Du bist der Nahost-Bandit!Nicht zögern, einfach machen!]]
L["body_found_" .. HANFEI.abbr] = "Das ist der Nahost-Bandit!"
L["search_role_" .. HANFEI.abbr] = "Diese Person ist der Nahost-Bandit!"
L["target_" .. HANFEI.name] = "Nahost-Bandit"
L["ttt2_desc_" .. HANFEI.name] = [[Das ist ein mächtiger Verräter! Er beginnt das Spiel mit einer C4, hoher Rüstung und einer AK. Stirbt er, wird ein Allahu Akbar-Soundeffekt ausgelöst, und er explodiert, wodurch Flächenschaden verursacht wird!]]

L["label_hanfei_armor"] = "Rüstungsmenge (Bereich: 0-500. Standardwert: 50)"
L["label_hanfei_hp"] = "Lebenspunktemenge (Bereich: 0-500. Standardwert: 150)"
L["label_hanfei_exposetime_enabled"] = "Habilitar tempo de exposição (0: Desabilitar 1: Habilitar. Padrão: 1)"
L["label_hanfei_exposetime"] = "Ausstellungszeit (Bereich: 0-120. Standardwert: 60 Sekunden)"
L["label_hanfei_tracker_mode"] = "Effektmodus auswählen (0: Kein 1: Radar 2: Tracker)"
L["ttt2_hanfei_chat_reveal"] = "{playername} ist der Nahost-Bandit in dieser Runde, lasst uns ihn gemeinsam besiegen!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Nahost-Bandit: {playername}"

L["tracker_not_available"] = "Nahöstlichen Banditen kann kein Tracker gegeben werden, da diese Ausrüstung auf dem Server nicht verfügbar ist. Wenn es nicht existiert, gehen Sie zu Benötigte Gegenstände in Ihrem Charakter, um es herunterzuladen."
