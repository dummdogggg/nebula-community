--[[
    Script: ReplicatedFirst.StartClient
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:53
-- Luau version 6, Types version 3
-- Time taken: 0.001947 seconds

local LoadingScreen_upvr = require(script.Parent.LoadingScreen)
local function _() -- Line 10, Named "preGameLoadTasksAsync"
	--[[ Upvalues[1]:
		[1]: LoadingScreen_upvr (readonly)
	]]
	LoadingScreen_upvr.enableAsync()
	LoadingScreen_upvr.updateDetailText("Initializing client...")
end
local function _() -- Line 15, Named "waitForGameLoadAsync"
	--[[ Upvalues[1]:
		[1]: LoadingScreen_upvr (readonly)
	]]
	LoadingScreen_upvr.updateDetailText("Loading game...")
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
end
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
LoadingScreen_upvr.enableAsync()
LoadingScreen_upvr.updateDetailText("Initializing client...")
LoadingScreen_upvr.updateDetailText("Loading game...")
if not game:IsLoaded() then
	game.Loaded:Wait()
end
;(function() -- Line 22, Named "postGameLoadTasksAsync"
	--[[ Upvalues[3]:
		[1]: ReplicatedStorage_upvr (readonly)
		[2]: LoadingScreen_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
	]]
	local PlayerDataController = require(ReplicatedStorage_upvr.Client.Controllers.PlayerDataController)
	LoadingScreen_upvr.updateDetailText("Loading player data...")
	if not PlayerDataController.isPlayerDataLoaded() then
		PlayerDataController.waitForDataLoadAsync()
	end
	require(ReplicatedStorage_upvr.Client.LocalPlayerObjectsContainer).registerLocalPlayer()
	require(ReplicatedStorage_upvr.Client.Handlers.CursorHandler).startAsync()
	require(ReplicatedStorage_upvr.Client.Handlers.MouseLockHandler).start()
	require(ReplicatedStorage_upvr.Client.Handlers.ClientPlayerFlopHandler).start()
	require(ReplicatedStorage_upvr.Client.Handlers.ClientCommandHandler).start()
	require(ReplicatedStorage_upvr.Client.Handlers.UIHandlers.CorpseEatPromptHandler).start()
	require(ReplicatedStorage_upvr.Client.Inventory.ClientBackpackHandler).startAsync()
	if require(ReplicatedStorage_upvr.Shared.SharedConstants.FeatureFlags).Experimental.NewDragSystem then
		require(ReplicatedStorage_upvr.Client.Handlers.DraggableItemHandlers.ClientInteractableObjectHandler).start()
	end
	require(ReplicatedStorage_upvr.Client.Controllers.WeaponController).start()
	require(ReplicatedStorage_upvr.Shared.ComponentCreator).new(require(ReplicatedStorage_upvr.Shared.SharedConstants.CollectionServiceTag.CharacterTags).Dead, require(ReplicatedStorage_upvr.Client.Components.LocalDeath)):listen()
	LoadingScreen_upvr.updateDetailText("Loading map...")
	local IsMapGenerating = ReplicatedStorage_upvr:FindFirstChild("IsMapGenerating")
	while IsMapGenerating.Value do
		LoadingScreen_upvr.updateDetailText(`{IsMapGenerating:GetAttribute("GenerationText")}...`)
		task.wait()
	end
	LoadingScreen_upvr.updateDetailText("Loading character...")
	local Character = LocalPlayer_upvr.Character
	if not Character then
		LocalPlayer_upvr.CharacterAdded:Wait()
	end
	while not Character.PrimaryPart do
		task.wait()
	end
	Character:WaitForChild("HumanoidRootPart")
	Character:WaitForChild("Humanoid")
	LoadingScreen_upvr.updateDetailText("Done!")
	LoadingScreen_upvr.disableAsync()
	script:SetAttribute("IsStarted", true)
end)()