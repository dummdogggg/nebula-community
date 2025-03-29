--[[
    Script: StarterGui.MoneyGui.MoneyUISet
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_leaderstats_0 = game.Players.LocalPlayer:WaitForChild("leaderstats");
script.Parent.Money.Text = "$" .. l_leaderstats_0.Money.Value;
l_leaderstats_0.Money.Changed:Connect(function(v1) --[[ Line: 7 ]]
    script.Parent.Money.Text = "$" .. v1;
end);