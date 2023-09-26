-- L'utilizzo di ChatGPT-4 per la traduzione potrebbe comportare imprecisioni; visita questo link per apportare modifiche: https://github.com/sbzlzh/ttt2-role_hanfei, o contatta Steam: https://steamcommunity.com/profiles/76561198444795757/
-- Questo personaggio non attacca né fatti, né persone, né oggetti, per favore non coinvolgerti.

local L = LANG.GetLanguageTableReference("it")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Bandito del Medio Oriente"
L["info_popup_" .. HANFEI.name] = [[Sei il Bandito del Medio Oriente! Non esitare, fallo!]]
L["body_found_" .. HANFEI.abbr] = "Questo è il Bandito del Medio Oriente!"
L["search_role_" .. HANFEI.abbr] = "Questa persona è il Bandito del Medio Oriente!"
L["target_" .. HANFEI.name] = "Bandito del Medio Oriente"
L["ttt2_desc_" .. HANFEI.name] = [[Questo è un traditore potente! Inizia il gioco con un C4, un'alta armatura e un AK. Alla morte, scatena un effetto sonoro di Allahu Akbar ed esplode, causando danni di area!]]

L["label_hanfei_armor"] = "Quantità di armatura (Intervallo: 0-500. Predefinito: 50)"
L["label_hanfei_hp"] = "Quantità di punti vita (Intervallo: 0-500. Predefinito: 150)"
L["label_hanfei_exposetime"] = "Tempo di esposizione (Intervallo: 0-120. Predefinito: 60 secondi)"
L["label_hanfei_tracker_mode"] = "Seleziona modalità effetto (0: Nessuno 1: Radar 2: Tracker)"
L["ttt2_hanfei_chat_reveal"] = "{playername} è il Bandito del Medio Oriente in questo turno, abbattiamolo tutti insieme!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Bandito del Medio Oriente: {playername}"
