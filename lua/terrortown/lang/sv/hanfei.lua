-- Denna karaktär attackerar inte saker, människor eller föremål. Var vänlig och bli inte inblandad.

local L = LANG.GetLanguageTableReference("sv")

-- ALLMÄNT ROLL SPRÅK STRÄNGAR
L[HANFEI.name] = "Bandit från Mellanöstern"
L["info_popup_" .. HANFEI.name] = [[Du är Mellanösterns bandit! Tveka inte, gör det bara!]]
L["body_found_" .. HANFEI.abbr] = "Detta är Banditen från Mellanöstern!"
L["search_role_" .. HANFEI.abbr] = "Denna person är Mellanösterns bandit!"
L["target_" .. HANFEI.name] = "Bandit från Mellanöstern"
L["ttt2_desc_" .. HANFEI.name] = [[Det här är en mäktig förrädare! Han börjar spelet med en C4, hög rustning och en AK. När han dör utlöser han en Allahu Akbar-ljudeffekt och exploderar, vilket orsakar skada på området!]]

L["label_hanfei_armor"] = "Pansarbelopp (intervall: 0-500. Standard: 50)"
L["label_hanfei_hp"] = "Antal hälsopoäng (intervall: 0-500. Standard: 150)"
L["label_hanfei_exposetime_enabled"] = "Aktivera exponeringstid (0: Inaktivera 1: Aktivera. Standard: 1)"
L["label_hanfei_exposetime"] = "Exponeringstid (intervall: 0-120. Standard: 60 sekunder)"
L["label_hanfei_tracker_mode"] = "Välj effektläge (0: Ingen 1: Radar 2: Tracker)"
L["ttt2_hanfei_chat_reveal"] = "{playername} är Mellanösterns bandit denna omgång, låt oss alla ta ner honom tillsammans!"
L["ttt2_hanfei_chat_explode_info"] = "Det var en kraftig explosion! Bandit från Mellanöstern: {playername}"

L["tracker_not_available"] = "Bandit från Mellanöstern kan inte ges tracker eftersom denna utrustning inte är tillgänglig på servern. Om den inte finns, gå till Required Items i din karaktär för att ladda ner den."
