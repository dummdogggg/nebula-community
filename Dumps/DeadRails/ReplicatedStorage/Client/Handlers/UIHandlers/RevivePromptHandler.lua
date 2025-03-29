--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.RevivePromptHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
local v4 = require(l_ReplicatedStorage_0.Client.Controllers.PlayerDataController);
local v5 = require(l_ReplicatedStorage_0.Shared.DataBanks.ClassEnums);
v4.waitForDataLoadAsync();
v3.waitForRegisteredAsync();
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = v4.getPlayerDataReplica();
local v8 = v3.getCharacterLoadedWrapper();
local v9 = v3.getPlayerClassData();
local function v13(v10) --[[ Line: 24 ]] --[[ Name: toggleAllPrompts ]]
    -- upvalues: l_CollectionService_0 (copy), l_LocalPlayer_0 (copy)
    for _, v12 in (l_CollectionService_0:GetTagged("RevivePrompt")) do
        if not v12:IsDescendantOf(l_LocalPlayer_0.Character) then
            v12.Enabled = v10;
        end;
    end;
end;
local function v17(v14) --[[ Line: 34 ]] --[[ Name: onLocalCharacterAdded ]]
    -- upvalues: v13 (copy), v9 (copy), v5 (copy)
    v14.ChildAdded:Connect(function(v15) --[[ Line: 35 ]]
        -- upvalues: v13 (ref)
        if v15:IsA("Tool") and v15.Name == "Bandage" then
            v13(true);
        end;
    end);
    v14.ChildRemoved:Connect(function(v16) --[[ Line: 41 ]]
        -- upvalues: v9 (ref), v5 (ref), v13 (ref)
        if not v9:hasTag(v5.Tag.CanReviveWithoutBandage) and (not v16 or v16.Name == "Bandage") then
            v13(false);
        end;
    end);
end;
local function v19(_) --[[ Line: 48 ]] --[[ Name: onRevivePromptAdded ]]
    -- upvalues: v9 (copy), v5 (copy), v13 (copy)
    if v9:hasTag(v5.Tag.CanReviveWithoutBandage) then
        v13(true);
    end;
end;
if l_LocalPlayer_0.Character then
    v17(l_LocalPlayer_0.Character);
end;
v8.loaded:Connect(v17);
l_CollectionService_0:GetInstanceAddedSignal("RevivePrompt"):Connect(v19);