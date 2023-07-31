-- L'utilisation de ChatGPT-4 pour la traduction peut entraîner des imprécisions ; veuillez visiter ce lien pour apporter des modifications : https://github.com/sbzlzh/ttt2-role_hanfei, ou contactez Steam : https://steamcommunity.com/profiles/76561198444795757/
-- Ce personnage n'attaque ni les choses, ni les personnes, ni les objets, veuillez ne pas vous impliquer.

local L = LANG.GetLanguageTableReference("fr")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Bandit du Moyen-Orient"
L["info_popup_" .. HANFEI.name] = [[Vous êtes le Bandit du Moyen-Orient !
N'hésitez pas, foncez !]]
L["body_found_" .. HANFEI.abbr] = "C'est le Bandit du Moyen-Orient !"
L["search_role_" .. HANFEI.abbr] = "Cette personne est le Bandit du Moyen-Orient !"
L["target_" .. HANFEI.name] = "Bandit du Moyen-Orient"
L["ttt2_desc_" .. HANFEI.name] = [[C'est un traître puissant !
Il commence le jeu avec un C4, une armure élevée et un AK. À sa mort, il déclenche un effet sonore Allahu Akbar et explose, causant des dégâts de zone !]]

L["label_hanfei_armor"] = "Quantité d'armure"
L["label_hanfei_hp"] = "Quantité de points de vie"
L["label_hanfei_exposetime"] = "Temps d'exposition"
--L["label_hanfei_tracker_mode"] = "What type of tracking item should the Middle Eastern Bandit start with?"
L["ttt2_hanfei_chat_reveal"] = "{playername} est le Bandit du Moyen-Orient dans cette manche, abattons-le tous ensemble !"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Bandit du Moyen-Orient: {playername}"
