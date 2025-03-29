--[[
    Script: ReplicatedFirst.StartClient
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local v4 = require(script.Parent.LoadingScreen);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function _() --[[ Line: 10 ]] --[[ Name: preGameLoadTasksAsync ]]
    -- upvalues: v4 (copy)
    v4.enableAsync();
    v4.updateDetailText("Initializing client...");
end;
local function _() --[[ Line: 15 ]] --[[ Name: waitForGameLoadAsync ]]
    -- upvalues: v4 (copy)
    v4.updateDetailText("Loading game...");
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
end;
local function v25() --[[ Line: 22 ]] --[[ Name: postGameLoadTasksAsync ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v4 (copy), l_LocalPlayer_0 (copy)
    local v8 = require(l_ReplicatedStorage_0.Shared.ComponentCreator);
    local v9 = require(l_ReplicatedStorage_0.Shared.SharedConstants.FeatureFlags);
    local v10 = require(l_ReplicatedStorage_0.Shared.SharedConstants.CollectionServiceTag.CharacterTags);
    local v11 = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
    local v12 = require(l_ReplicatedStorage_0.Client.Handlers.DraggableItemHandlers.ClientInteractableObjectHandler);
    local v13 = require(l_ReplicatedStorage_0.Client.Handlers.CursorHandler);
    local v14 = require(l_ReplicatedStorage_0.Client.Handlers.MouseLockHandler);
    local v15 = require(l_ReplicatedStorage_0.Client.Handlers.ClientPlayerFlopHandler);
    local v16 = require(l_ReplicatedStorage_0.Client.Handlers.ClientCommandHandler);
    local v17 = require(l_ReplicatedStorage_0.Client.Handlers.UIHandlers.CorpseEatPromptHandler);
    local v18 = require(l_ReplicatedStorage_0.Client.Inventory.ClientBackpackHandler);
    local v19 = require(l_ReplicatedStorage_0.Client.Controllers.PlayerDataController);
    local v20 = require(l_ReplicatedStorage_0.Client.Controllers.WeaponController);
    local v21 = require(l_ReplicatedStorage_0.Client.Components.LocalDeath);
    v4.updateDetailText("Loading player data...");
    if not v19.isPlayerDataLoaded() then
        v19.waitForDataLoadAsync();
    end;
    v11.registerLocalPlayer();
    v13.startAsync();
    v14.start();
    v15.start();
    v16.start();
    v17.start();
    v18.startAsync();
    if v9.Experimental.NewDragSystem then
        v12.start();
    end;
    v20.start();
    v8.new(v10.Dead, v21):listen();
    v4.updateDetailText("Loading map...");
    local l_IsMapGenerating_0 = l_ReplicatedStorage_0:FindFirstChild("IsMapGenerating");
    while l_IsMapGenerating_0.Value do
        local l_l_IsMapGenerating_0_Attribute_0 = l_IsMapGenerating_0:GetAttribute("GenerationText");
        v4.updateDetailText((("%*..."):format(l_l_IsMapGenerating_0_Attribute_0)));
        task.wait();
    end;
    v4.updateDetailText("Loading character...");
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        l_LocalPlayer_0.CharacterAdded:Wait();
    end;
    while not l_Character_0.PrimaryPart do
        task.wait();
    end;
    l_Character_0:WaitForChild("HumanoidRootPart");
    l_Character_0:WaitForChild("Humanoid");
    v4.updateDetailText("Done!");
    v4.disableAsync();
    script:SetAttribute("IsStarted", true);
end;
v4.enableAsync();
v4.updateDetailText("Initializing client...");
v4.updateDetailText("Loading game...");
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
v25();