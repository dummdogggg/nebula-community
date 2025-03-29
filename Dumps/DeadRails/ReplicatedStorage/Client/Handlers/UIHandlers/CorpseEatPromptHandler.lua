--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.CorpseEatPromptHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
local _ = require(l_ReplicatedStorage_0.Client.Controllers.PlayerDataController);
local v5 = require(l_ReplicatedStorage_0.Shared.DataBanks.ClassEnums);
local v6 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local l_EatCorpse_0 = require(l_ReplicatedStorage_0.Shared.Remotes).Events.EatCorpse;
local _ = l_Players_0.LocalPlayer;
local v9 = nil;
local function v12(v10) --[[ Line: 22 ]] --[[ Name: createEatPrompt ]]
    -- upvalues: v9 (ref), v5 (copy), l_Players_0 (copy), l_EatCorpse_0 (copy)
    warn(v9:hasTag(v5.Tag.CorpseEatHeal));
    if not v10:IsA("Model") or not v10:IsDescendantOf(workspace) then
        return;
    elseif l_Players_0:GetPlayerFromCharacter(v10) then
        return;
    elseif v10:FindFirstChild("CorpseEatPrompt") then
        return;
    else
        local l_ProximityPrompt_0 = Instance.new("ProximityPrompt");
        l_ProximityPrompt_0.Name = "CorpseEatPrompt";
        l_ProximityPrompt_0.ObjectText = "Corpse";
        l_ProximityPrompt_0.ActionText = "Eat";
        l_ProximityPrompt_0.HoldDuration = 0.5;
        l_ProximityPrompt_0.MaxActivationDistance = 10;
        l_ProximityPrompt_0:AddTag("CorpseEatPrompt");
        l_ProximityPrompt_0.Parent = v10;
        l_ProximityPrompt_0.Triggered:Connect(function() --[[ Line: 48 ]]
            -- upvalues: l_EatCorpse_0 (ref), v10 (copy)
            l_EatCorpse_0:FireServer(v10);
        end);
        return;
    end;
end;
local function _(v13) --[[ Line: 53 ]] --[[ Name: removeEatPrompt ]]
    local l_CorpseEatPrompt_0 = v13:FindFirstChild("CorpseEatPrompt");
    if l_CorpseEatPrompt_0 then
        l_CorpseEatPrompt_0:Destroy();
    end;
end;
local function v18() --[[ Line: 60 ]] --[[ Name: createAllEatPrompts ]]
    -- upvalues: v9 (ref), v5 (copy), l_CollectionService_0 (copy), v6 (copy), v12 (copy)
    if not v9:hasTag(v5.Tag.CorpseEatHeal) then
        return;
    else
        for _, v17 in (l_CollectionService_0:GetTagged(v6.Corpse)) do
            v12(v17);
        end;
        return;
    end;
end;
local function v20(v19) --[[ Line: 71 ]] --[[ Name: onInstanceAddedCorpseTag ]]
    -- upvalues: v9 (ref), v5 (copy), v12 (copy)
    if v9:hasTag(v5.Tag.CorpseEatHeal) then
        v12(v19);
    end;
end;
local function v23(v21) --[[ Line: 77 ]] --[[ Name: onInstanceRemovedCorpseTag ]]
    local l_CorpseEatPrompt_1 = v21:FindFirstChild("CorpseEatPrompt");
    if l_CorpseEatPrompt_1 then
        l_CorpseEatPrompt_1:Destroy();
    end;
end;
return {
    start = function() --[[ Line: 83 ]] --[[ Name: start ]]
        -- upvalues: v9 (ref), v3 (copy), v18 (copy), l_CollectionService_0 (copy), v6 (copy), v20 (copy), v23 (copy)
        v9 = v3.getPlayerClassData();
        v18();
        l_CollectionService_0:GetInstanceAddedSignal(v6.Corpse):Connect(v20);
        l_CollectionService_0:GetInstanceRemovedSignal(v6.Corpse):Connect(v23);
    end
};