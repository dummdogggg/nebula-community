--[[
    Script: ReplicatedStorage.Client.Controllers.PlayerVisibilityController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:55
-- Luau version 6, Types version 3
-- Time taken: 0.004302 seconds

local module = {}
local var2_upvw = false
local tbl_upvw = {}
local Players_upvr = game:GetService("Players")
local function hideCharacter_upvr(arg1) -- Line 13, Named "hideCharacter"
	--[[ Upvalues[2]:
		[1]: tbl_upvw (read and write)
		[2]: var2_upvw (read and write)
	]]
	if not arg1 then
	else
		for _, v_4 in ipairs(arg1:GetDescendants()) do
			if v_4:IsA("BasePart") then
				({})[v_4] = v_4.Transparency
				v_4.Transparency = 1
			elseif v_4:IsA("Decal") or v_4:IsA("Texture") or v_4:IsA("ParticleEmitter") or v_4:IsA("Beam") or v_4:IsA("Trail") or v_4:IsA("BillboardGui") then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				;({})[v_4] = v_4.Transparency
				v_4.Transparency = 1
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		tbl_upvw[arg1] = {}
		arg1.DescendantAdded:Connect(function(arg1_2) -- Line 39
			--[[ Upvalues[3]:
				[1]: var2_upvw (copied, read and write)
				[2]: tbl_upvw (copied, read and write)
				[3]: arg1 (readonly)
			]]
			if not var2_upvw then
			elseif arg1_2:IsA("BasePart") or arg1_2:IsA("Decal") or arg1_2:IsA("Texture") or arg1_2:IsA("ParticleEmitter") or arg1_2:IsA("Beam") or arg1_2:IsA("Trail") then
				tbl_upvw[arg1][arg1_2] = arg1_2.Transparency
				arg1_2.Transparency = 1
			end
		end)
	end
end
local function unhideCharacter_upvr(arg1) -- Line 51, Named "unhideCharacter"
	--[[ Upvalues[1]:
		[1]: tbl_upvw (read and write)
	]]
	local var13 = tbl_upvw[arg1]
	if not var13 then
	else
		for i_5, v_5 in pairs(var13) do
			if i_5 and i_5:IsDescendantOf(game) then
				i_5.Transparency = v_5
			end
		end
		tbl_upvw[arg1] = nil
	end
end
local function _(arg1, arg2) -- Line 70, Named "onCharacterAdded"
	--[[ Upvalues[3]:
		[1]: var2_upvw (read and write)
		[2]: hideCharacter_upvr (readonly)
		[3]: tbl_upvw (read and write)
	]]
	if var2_upvw and arg2 then
		hideCharacter_upvr(arg2)
	end
	arg2.AncestryChanged:Connect(function(arg1_3, arg2_2) -- Line 76
		--[[ Upvalues[2]:
			[1]: tbl_upvw (copied, read and write)
			[2]: arg2 (readonly)
		]]
		if arg2_2 == nil and tbl_upvw[arg2] then
			tbl_upvw[arg2] = nil
		end
	end)
end
local function _(arg1) -- Line 84, Named "setupPlayerEvents"
	--[[ Upvalues[3]:
		[1]: var2_upvw (read and write)
		[2]: hideCharacter_upvr (readonly)
		[3]: tbl_upvw (read and write)
	]]
	arg1.CharacterAdded:Connect(function(arg1_4) -- Line 86
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: var2_upvw (copied, read and write)
			[3]: hideCharacter_upvr (copied, readonly)
			[4]: tbl_upvw (copied, read and write)
		]]
		if var2_upvw and arg1_4 then
			hideCharacter_upvr(arg1_4)
		end
		arg1_4.AncestryChanged:Connect(function(arg1_5, arg2) -- Line 76
			--[[ Upvalues[2]:
				[1]: tbl_upvw (copied, read and write)
				[2]: arg1_4 (readonly)
			]]
			if arg2 == nil and tbl_upvw[arg1_4] then
				tbl_upvw[arg1_4] = nil
			end
		end)
	end)
	if arg1.Character then
		local Character_upvr_3 = arg1.Character
		if var2_upvw and Character_upvr_3 then
			hideCharacter_upvr(Character_upvr_3)
		end
		Character_upvr_3.AncestryChanged:Connect(function(arg1_6, arg2) -- Line 76
			--[[ Upvalues[2]:
				[1]: tbl_upvw (copied, read and write)
				[2]: Character_upvr_3 (readonly)
			]]
			if arg2 == nil and tbl_upvw[Character_upvr_3] then
				tbl_upvw[Character_upvr_3] = nil
			end
		end)
	end
end
function module.hideAllPlayers() -- Line 97
	--[[ Upvalues[3]:
		[1]: var2_upvw (read and write)
		[2]: Players_upvr (readonly)
		[3]: hideCharacter_upvr (readonly)
	]]
	var2_upvw = true
	for _, v in ipairs(Players_upvr:GetPlayers()) do
		if v.Character then
			hideCharacter_upvr(v.Character)
		end
	end
	return true
end
function module.unhideAllPlayers() -- Line 112
	--[[ Upvalues[3]:
		[1]: var2_upvw (read and write)
		[2]: tbl_upvw (read and write)
		[3]: unhideCharacter_upvr (readonly)
	]]
	var2_upvw = false
	for i_2, _ in pairs(tbl_upvw) do
		if i_2 and i_2:IsDescendantOf(game) then
			unhideCharacter_upvr(i_2)
		end
	end
	tbl_upvw = {}
	return true
end
function module.arePlayersHidden() -- Line 130
	--[[ Upvalues[1]:
		[1]: var2_upvw (read and write)
	]]
	return var2_upvw
end
function module.initialize() -- Line 135
	--[[ Upvalues[4]:
		[1]: Players_upvr (readonly)
		[2]: var2_upvw (read and write)
		[3]: hideCharacter_upvr (readonly)
		[4]: tbl_upvw (read and write)
	]]
	Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 137
		--[[ Upvalues[3]:
			[1]: var2_upvw (copied, read and write)
			[2]: hideCharacter_upvr (copied, readonly)
			[3]: tbl_upvw (copied, read and write)
		]]
		arg1.CharacterAdded:Connect(function(arg1_7) -- Line 86
			--[[ Upvalues[4]:
				[1]: arg1 (readonly)
				[2]: var2_upvw (copied, read and write)
				[3]: hideCharacter_upvr (copied, readonly)
				[4]: tbl_upvw (copied, read and write)
			]]
			if var2_upvw and arg1_7 then
				hideCharacter_upvr(arg1_7)
			end
			arg1_7.AncestryChanged:Connect(function(arg1_8, arg2) -- Line 76
				--[[ Upvalues[2]:
					[1]: tbl_upvw (copied, read and write)
					[2]: arg1_7 (readonly)
				]]
				if arg2 == nil and tbl_upvw[arg1_7] then
					tbl_upvw[arg1_7] = nil
				end
			end)
		end)
		if arg1.Character then
			local Character_upvr_2 = arg1.Character
			if var2_upvw and Character_upvr_2 then
				hideCharacter_upvr(Character_upvr_2)
			end
			Character_upvr_2.AncestryChanged:Connect(function(arg1_9, arg2) -- Line 76
				--[[ Upvalues[2]:
					[1]: tbl_upvw (copied, read and write)
					[2]: Character_upvr_2 (readonly)
				]]
				if arg2 == nil and tbl_upvw[Character_upvr_2] then
					tbl_upvw[Character_upvr_2] = nil
				end
			end)
		end
	end)
	for _, v_3_upvr in ipairs(Players_upvr:GetPlayers()) do
		v_3_upvr.CharacterAdded:Connect(function(arg1) -- Line 86
			--[[ Upvalues[4]:
				[1]: v_3_upvr (readonly)
				[2]: var2_upvw (copied, read and write)
				[3]: hideCharacter_upvr (copied, readonly)
				[4]: tbl_upvw (copied, read and write)
			]]
			if var2_upvw and arg1 then
				hideCharacter_upvr(arg1)
			end
			arg1.AncestryChanged:Connect(function(arg1_10, arg2) -- Line 76
				--[[ Upvalues[2]:
					[1]: tbl_upvw (copied, read and write)
					[2]: arg1 (readonly)
				]]
				if arg2 == nil and tbl_upvw[arg1] then
					tbl_upvw[arg1] = nil
				end
			end)
		end)
		if v_3_upvr.Character then
			local Character_upvr = v_3_upvr.Character
			if var2_upvw and Character_upvr then
				hideCharacter_upvr(Character_upvr)
			end
			Character_upvr.AncestryChanged:Connect(function(arg1, arg2) -- Line 76
				--[[ Upvalues[2]:
					[1]: tbl_upvw (copied, read and write)
					[2]: Character_upvr (readonly)
				]]
				if arg2 == nil and tbl_upvw[Character_upvr] then
					tbl_upvw[Character_upvr] = nil
				end
			end)
		end
	end
	Players_upvr.PlayerRemoving:Connect(function(arg1) -- Line 147
		--[[ Upvalues[1]:
			[1]: tbl_upvw (copied, read and write)
		]]
		if arg1.Character and tbl_upvw[arg1.Character] then
			tbl_upvw[arg1.Character] = nil
		end
	end)
	return true
end
return module