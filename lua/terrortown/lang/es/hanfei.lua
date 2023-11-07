-- Este personaje no ataca ni a cosas, ni a personas, ni a objetos, por favor, no te involucres en esto.

local L = LANG.GetLanguageTableReference("es")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Bandido de Oriente Medio"
L["info_popup_" .. HANFEI.name] = [[¡Eres el Bandido de Oriente Medio!¡No lo dudes, solo hazlo!]]
L["body_found_" .. HANFEI.abbr] = "¡Este es el Bandido de Oriente Medio!"
L["search_role_" .. HANFEI.abbr] = "¡Esta persona es el Bandido de Oriente Medio!"
L["target_" .. HANFEI.name] = "Bandido de Oriente Medio"
L["ttt2_desc_" .. HANFEI.name] = [[¡Este es un traidor poderoso! Comienza el juego con un C4, alta armadura y un AK. Al morir, se activa un efecto de sonido de Allahu Akbar y explota, causando daño en área!]]

L["label_hanfei_armor"] = "Cantidad de armadura (Rango: 0-500. Predeterminado: 50)"
L["label_hanfei_hp"] = "Cantidad de puntos de vida (Rango: 0-500. Predeterminado: 150)"
L["label_hanfei_exposetime"] = "Tiempo de exposición (Rango: 0-120. Predeterminado: 60 segundos)"
L["label_hanfei_tracker_mode"] = "Seleccionar modo de efecto (0: Ninguno 1: Radar 2: Rastreador)"
L["ttt2_hanfei_chat_reveal"] = "{playername} es el Bandido de Oriente Medio en esta ronda, ¡vamos a derribarlo todos juntos!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Bandido de Oriente Medio: {playername}"

--L["tracker_not_available"] = "Middle Eastern Bandit can't be given tracker as this equipment is not available on the server.If it doesn't exist, go to Required Items in your character to download it."
