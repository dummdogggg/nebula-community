--[[
    Script: StarterGui.VersionLabel.VersionLabelHandler
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TextLabel_0 = script.Parent:WaitForChild("TextLabel");
local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("ServerVersion");
local l_PlaceId_0 = game.PlaceId;
local l_PlaceVersion_0 = game.PlaceVersion;
l_TextLabel_0.TextColor3 = if l_PlaceId_0 == 133377094302868 then Color3.fromRGB(255, 0, 0) else Color3.fromRGB(225, 225, 225);
l_TextLabel_0.Text = ("v%*.%*"):format(l_l_ReplicatedStorage_0_Attribute_0, l_PlaceVersion_0);