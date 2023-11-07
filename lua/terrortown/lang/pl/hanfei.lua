-- Ta postać nie atakuje ani spraw, ani ludzi, ani rzeczy, proszę się w to nie angażować.

local L = LANG.GetLanguageTableReference("pl")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Bandzior z Bliskiego Wschodu"
L["info_popup_" .. HANFEI.name] = [[Jesteś Bandzior z Bliskiego Wschodu! Nie wahaj się, rób to!]]
L["body_found_" .. HANFEI.abbr] = "To jest Bandzior z Bliskiego Wschodu!"
L["search_role_" .. HANFEI.abbr] = "Ta osoba to Bandzior z Bliskiego Wschodu!"
L["target_" .. HANFEI.name] = "Bandzior z Bliskiego Wschodu"
L["ttt2_desc_" .. HANFEI.name] = [[To potężny zdrajca! Rozpoczyna grę z C4, wysoką zbroją i AK. Po śmierci wywołuje dźwiękowy efekt Allahu Akbar i eksploduje, powodując obrażenia obszarowe!]]

L["label_hanfei_armor"] = "Ilość pancerza (Zakres: 0-500. Domyślnie: 50)"
L["label_hanfei_hp"] = "Ilość punktów życia (Zakres: 0-500. Domyślnie: 150)"
L["label_hanfei_exposetime"] = "Czas ekspozycji (Zakres: 0-120. Domyślnie: 60 sekund)"
L["label_hanfei_tracker_mode"] = "Wybierz tryb efektu (0: Brak 1: Radar 2: Tracker)"
L["ttt2_hanfei_chat_reveal"] = "{playername} jest Bandziorem z Bliskiego Wschodu w tej rundzie, zdejmijmy go wszyscy razem!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Bandzior z Bliskiego Wschodu: {playername}"

--L["tracker_not_available"] = "Middle Eastern Bandit can't be given tracker as this equipment is not available on the server.If it doesn't exist, go to Required Items in your character to download it."
