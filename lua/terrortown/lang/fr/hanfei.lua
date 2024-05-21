-- Ce personnage n'attaque ni les choses, ni les personnes, ni les objets, veuillez ne pas vous impliquer.

local L = LANG.GetLanguageTableReference("fr")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Bandit du Moyen-Orient"
L["info_popup_" .. HANFEI.name] = [[Vous êtes le Bandit du Moyen-Orient! N'hésitez pas, foncez !]]
L["body_found_" .. HANFEI.abbr] = "C'est le Bandit du Moyen-Orient!"
L["search_role_" .. HANFEI.abbr] = "Cette personne est le Bandit du Moyen-Orient!"
L["target_" .. HANFEI.name] = "Bandit du Moyen-Orient"
L["ttt2_desc_" .. HANFEI.name] = [[C'est un traître puissant! Il commence le jeu avec un C4, une armure élevée et un AK. À sa mort, il déclenche un effet sonore Allahu Akbar et explose, causant des dégâts de zone !]]

L["label_hanfei_armor"] = "Quantité d'armure (Plage: 0-500. Par défaut: 50)"
L["label_hanfei_hp"] = "Quantité de points de vie (Plage: 0-500. Par défaut: 150)"
L["label_hanfei_exposetime_enabled"] = "Activer le temps d'exposition (0 : Désactiver 1 : Activer. Par défaut : 1)"
L["label_hanfei_exposetime"] = "Temps d'exposition (Plage: 0-120. Par défaut: 60 secondes)"
L["label_hanfei_tracker_mode"] = "Sélectionner le mode d'effet (0: Aucun 1: Radar 2: Traqueur)"
L["ttt2_hanfei_chat_reveal"] = "{playername} est le Bandit du Moyen-Orient dans cette manche, abattons-le tous ensemble!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Bandit du Moyen-Orient: {playername}"

L["tracker_not_available"] = "Le bandit du Moyen-Orient ne peut pas recevoir de traqueur car cet équipement n'est pas disponible sur le serveur. S'il n'existe pas, allez dans Objets requis dans votre personnage pour le télécharger."
