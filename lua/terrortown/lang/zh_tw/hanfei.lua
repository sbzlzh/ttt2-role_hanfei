-- 使用chatgpt-4翻譯，可能會翻譯不正確，請到此鏈接更改：https://github.com/sbzlzh/ttt2-role_hanfei ，或聯繫steam：https://steamcommunity.com/profiles/76561198444795757/
-- 該角色並沒有什麼事、人、物進行任何攻擊，請不要帶入其中
-- 更新時間：2023年3月28日
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
L["ttt2_hanfei_chat_exposetime"] = "發出了一聲巨大的爆炸聲！中東悍匪：{playername}"
