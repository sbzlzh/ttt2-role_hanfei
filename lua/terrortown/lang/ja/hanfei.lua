-- このキャラクターは事柄、人、物に対して攻撃を行っていません。どうか巻き込まないでください。

local L = LANG.GetLanguageTableReference("ja")

-- GENERAL ROLE LANGUAGE STRINGS
L[HANFEI.name] = "中東のならず者"
L["info_popup_" .. HANFEI.name] = [[あなたは中東のならず者です! 躊躇しないで、やってみましょう！]]
L["body_found_" .. HANFEI.abbr] = "これは中東のならず者です！"
L["search_role_" .. HANFEI.abbr] = "この人は中東のならず者です！"
L["target_" .. HANFEI.name] = "中東のならず者"
L["ttt2_desc_" .. HANFEI.name] = [[これは強力な裏切り者です！彼はC4、高い防具、AKでゲームを開始します。死ぬと、アッラフ・アクバールの音響効果が発生し、爆発して範囲ダメージを与えます！]]

L["label_hanfei_armor"] = "防具の量（範囲：0-500。デフォルト：50）"
L["label_hanfei_hp"] = "HPの量（範囲：0-500。デフォルト：150）"
L["label_hanfei_exposetime_enabled"] = "露出時間を有効にする（0: 無効 1: 有効. デフォルト: 1）"
L["label_hanfei_exposetime"] = "露出時間（範囲：0-120。デフォルト：60秒）"
L["label_hanfei_tracker_mode"] = "効果モードを選択（0：なし 1：レーダー 2：トラッカー）"
L["ttt2_hanfei_chat_reveal"] = "{playername} はこのラウンドの中東のならず者です。みんなで倒しましょう！"
L["ttt2_hanfei_chat_explode_info"] = "大きな音がしました！ 中東のならず者：{playername}"

L["tracker_not_available"] = "この装備はサーバーに存在しないため、中東のならず者はトラッカーを与えることができません。この装備が存在しない場合、キャラクターの必要アイテムからダウンロードする必要があります。"
