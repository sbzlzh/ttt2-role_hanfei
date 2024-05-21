-- Este personagem não ataca coisas, pessoas ou objetos, por favor, não se envolva nisso.

local L = LANG.GetLanguageTableReference("pt_br")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "Bandido do Oriente Médio"
L["info_popup_" .. HANFEI.name] = [[Você é o Bandido do Oriente Médio! Não hesite, apenas faça!]]
L["body_found_" .. HANFEI.abbr] = "Este é o Bandido do Oriente Médio!"
L["search_role_" .. HANFEI.abbr] = "Esta pessoa é o Bandido do Oriente Médio!"
L["target_" .. HANFEI.name] = "Bandido do Oriente Médio"
L["ttt2_desc_" .. HANFEI.name] = [[Este é um traidor poderoso! Ele começa o jogo com um C4, alta armadura e um AK. Ao morrer, ele aciona um efeito sonoro de Allahu Akbar e explode, causando dano em área!]]

L["label_hanfei_armor"] = "Quantidade de armadura (Faixa: 0-500. Padrão: 50)"
L["label_hanfei_hp"] = "Quantidade de pontos de vida (Faixa: 0-500. Padrão: 150)"
L["label_hanfei_exposetime_enabled"] = "Habilitar tempo de exposição (0: Desabilitar 1: Habilitar. Padrão: 1)"
L["label_hanfei_exposetime"] = "Tempo de exposição (Faixa: 0-120. Padrão: 60 segundos)"
L["label_hanfei_tracker_mode"] = "Selecionar modo de efeito (0: Nenhum 1: Radar 2: Rastreador)"
L["ttt2_hanfei_chat_reveal"] = "{playername} é o Bandido do Oriente Médio nesta rodada, vamos derrubá-lo juntos!"
L["ttt2_hanfei_chat_explode_info"] = "There was a loud explosion! Bandido do Oriente Médio: {playername}"

L["tracker_not_available"] = "O Middle Eastern Bandit não pode receber o rastreador porque esse equipamento não está disponível no servidor. Se ele não existir, vá para Required Items em seu personagem para baixá-lo."
