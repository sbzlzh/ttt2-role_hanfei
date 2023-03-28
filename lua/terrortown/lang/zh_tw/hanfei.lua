-- 使用chatgpt-4翻译,可能会翻译不正确,请到此链接更改: https://github.com/sbzlzh/ttt2-role_hanfei ,或联系steam：https://steamcommunity.com/profiles/76561198444795757/
-- 该角色并没有什么事,人,物进行任何攻击,请不要带入其中
-- 更新时间: 2023年3月28日
local L = LANG.GetLanguageTableReference("zh_tw")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "中東悍匪"
L["info_popup_" .. HANFEI.name] = [[你是中東悍匪！
別軟，就是幹！]]
L["body_found_" .. HANFEI.abbr] = "這是中東悍匪！"
L["search_role_" .. HANFEI.abbr] = "這人是中東悍匪！"
L["target_" .. HANFEI.name] = "中東悍匪"
L["ttt2_desc_" .. HANFEI.name] = [[這是一個強勁的叛徒！
開局自帶C4，高護甲和AK，但死後能觸發烏拉拉的音效進行自爆並且造成範圍性傷害！]]

L["label_hanfei_armor"] = "護甲數量"
L["label_hanfei_hp"] = "生命值數量"
L["label_hanfei_exposetime"] = "暴露的時間"
L["ttt2_hanfei_chat_reveal"] = "{playername} 是本局悍匪，大家一起幹翻他！"