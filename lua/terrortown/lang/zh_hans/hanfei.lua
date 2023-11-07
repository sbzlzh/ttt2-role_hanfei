-- 该角色并没有对事,人,物进行任何攻击,请不要带入其中。

local L = LANG.GetLanguageTableReference("zh_hans")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "中东悍匪"
L["info_popup_" .. HANFEI.name] = [[你是中东悍匪！别怂，就是干！]]
L["body_found_" .. HANFEI.abbr] = "这是中东悍匪！"
L["search_role_" .. HANFEI.abbr] = "这人是中东悍匪！"
L["target_" .. HANFEI.name] = "中东悍匪"
L["ttt2_desc_" .. HANFEI.name] = [[这是一个强劲的叛徒！开局自带C4，高护甲和AK，但死后能触发乌拉拉的音效进行自爆并且造成范围性伤害！]]

L["label_hanfei_armor"] = "护甲数量(范围：0-500。默认值：50)"
L["label_hanfei_hp"] = "生命值数量(范围：0-500。默认值：150)"
L["label_hanfei_exposetime"] = "暴露的时间(范围：0-120。默认值：60秒)"
L["label_hanfei_tracker_mode"] = "选择效果模式(0：无 1：雷达 2：追踪器)"
L["ttt2_hanfei_chat_reveal"] = "{playername} 是本局悍匪，大家一起干翻他！"
L["ttt2_hanfei_chat_explode_info"] = "发出了一声巨大的爆炸声！中东悍匪：{playername}"

L["tracker_not_available"] = "中东悍匪无法给予追踪器，因为服务器上并没有此装备。如该装备不存在，则需前往角色中的必需物品下载即可。"
