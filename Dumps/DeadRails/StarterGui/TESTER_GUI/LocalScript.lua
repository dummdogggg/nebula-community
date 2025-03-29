--[[
    Script: StarterGui.TESTER_GUI.LocalScript
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Players_0 = game:GetService("Players");
local l_PlaceId_0 = game.PlaceId;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
if game:GetService("RunService"):IsStudio() then
    l_Parent_0.Enabled = false;
    return;
elseif l_PlaceId_0 == 98018823628597 or l_PlaceId_0 == 133377094302868 then
    l_Parent_0.Enabled = true;
    for _, v5 in l_Parent_0:WaitForChild("ScreenIds"):GetChildren() do
        if v5:IsA("TextLabel") then
            v5.Text = tostring(l_LocalPlayer_0.UserId);
        end;
    end;
    return;
else
    l_Parent_0.Enabled = false;
    return;
end;