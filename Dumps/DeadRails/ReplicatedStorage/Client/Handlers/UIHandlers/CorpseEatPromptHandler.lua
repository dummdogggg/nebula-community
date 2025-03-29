--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.CorpseEatPromptHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:48
-- Luau version 6, Types version 3
-- Time taken: 0.001852 seconds

local CollectionService_upvr = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players_upvr = game:GetService("Players")
local ClassEnums_upvr = require(ReplicatedStorage.Shared.DataBanks.ClassEnums)
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
local var6_upvw
local EatCorpse_upvr = require(ReplicatedStorage.Shared.Remotes).Events.EatCorpse
local function createEatPrompt_upvr(arg1) -- Line 22, Named "createEatPrompt"
	--[[ Upvalues[4]:
		[1]: var6_upvw (read and write)
		[2]: ClassEnums_upvr (readonly)
		[3]: Players_upvr (readonly)
		[4]: EatCorpse_upvr (readonly)
	]]
	warn(var6_upvw:hasTag(ClassEnums_upvr.Tag.CorpseEatHeal))
	if not arg1:IsA("Model") or not arg1:IsDescendantOf(workspace) then
	else
		if Players_upvr:GetPlayerFromCharacter(arg1) then return end
		if arg1:FindFirstChild("CorpseEatPrompt") then return end
		local ProximityPrompt = Instance.new("ProximityPrompt")
		ProximityPrompt.Name = "CorpseEatPrompt"
		ProximityPrompt.ObjectText = "Corpse"
		ProximityPrompt.ActionText = "Eat"
		ProximityPrompt.HoldDuration = 0.5
		ProximityPrompt.MaxActivationDistance = 10
		ProximityPrompt:AddTag("CorpseEatPrompt")
		ProximityPrompt.Parent = arg1
		ProximityPrompt.Triggered:Connect(function() -- Line 48
			--[[ Upvalues[2]:
				[1]: EatCorpse_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			EatCorpse_upvr:FireServer(arg1)
		end)
	end
end
local function _(arg1) -- Line 53, Named "removeEatPrompt"
	local CorpseEatPrompt_2 = arg1:FindFirstChild("CorpseEatPrompt")
	if CorpseEatPrompt_2 then
		CorpseEatPrompt_2:Destroy()
	end
end
local function createAllEatPrompts_upvr() -- Line 60, Named "createAllEatPrompts"
	--[[ Upvalues[5]:
		[1]: var6_upvw (read and write)
		[2]: ClassEnums_upvr (readonly)
		[3]: CollectionService_upvr (readonly)
		[4]: Tag_upvr (readonly)
		[5]: createEatPrompt_upvr (readonly)
	]]
	if not var6_upvw:hasTag(ClassEnums_upvr.Tag.CorpseEatHeal) then
	else
		for _, var12 in CollectionService_upvr:GetTagged(Tag_upvr.Corpse), nil do
			createEatPrompt_upvr(var12)
		end
	end
end
local function onInstanceAddedCorpseTag_upvr(arg1) -- Line 71, Named "onInstanceAddedCorpseTag"
	--[[ Upvalues[3]:
		[1]: var6_upvw (read and write)
		[2]: ClassEnums_upvr (readonly)
		[3]: createEatPrompt_upvr (readonly)
	]]
	if var6_upvw:hasTag(ClassEnums_upvr.Tag.CorpseEatHeal) then
		createEatPrompt_upvr(arg1)
	end
end
local function onInstanceRemovedCorpseTag_upvr(arg1) -- Line 77, Named "onInstanceRemovedCorpseTag"
	local CorpseEatPrompt = arg1:FindFirstChild("CorpseEatPrompt")
	if CorpseEatPrompt then
		CorpseEatPrompt:Destroy()
	end
end
local module = {}
local LocalPlayerObjectsContainer_upvr = require(ReplicatedStorage.Client.LocalPlayerObjectsContainer)
function module.start() -- Line 83
	--[[ Upvalues[7]:
		[1]: var6_upvw (read and write)
		[2]: LocalPlayerObjectsContainer_upvr (readonly)
		[3]: createAllEatPrompts_upvr (readonly)
		[4]: CollectionService_upvr (readonly)
		[5]: Tag_upvr (readonly)
		[6]: onInstanceAddedCorpseTag_upvr (readonly)
		[7]: onInstanceRemovedCorpseTag_upvr (readonly)
	]]
	var6_upvw = LocalPlayerObjectsContainer_upvr.getPlayerClassData()
	createAllEatPrompts_upvr()
	CollectionService_upvr:GetInstanceAddedSignal(Tag_upvr.Corpse):Connect(onInstanceAddedCorpseTag_upvr)
	CollectionService_upvr:GetInstanceRemovedSignal(Tag_upvr.Corpse):Connect(onInstanceRemovedCorpseTag_upvr)
end
return module