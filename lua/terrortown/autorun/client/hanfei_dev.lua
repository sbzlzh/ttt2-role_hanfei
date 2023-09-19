if CLIENT then
    -- Use string or string.format("%.f",<steamid64>)
    -- addon dev emblem in scoreboard
    hook.Add("TTT2FinishedLoading", "TTT2RegisterhanfeiAddonDev", function()
        AddTTT2AddonDev("76561197990533517") -- sogou
        AddTTT2AddonDev("76561199046379906") -- 愚かなキツネ
        AddTTT2AddonDev("76561198444795757") -- 波と一緒に漂う
        AddTTT2AddonDev("76561198032479768") -- Zaratusa
    end)
end
