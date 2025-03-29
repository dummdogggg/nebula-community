--[[
    Script: StarterPlayer.StarterCharacterScripts.MusicControl
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:47
-- Luau version 6, Types version 3
-- Time taken: 0.003948 seconds

-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(3, Enum.EasingStyle.Linear)
local CollectionService_upvr = game:GetService("CollectionService")
local Parent_upvr = script.Parent
local function _() -- Line 7, Named "getDangerScore"
	--[[ Upvalues[2]:
		[1]: CollectionService_upvr (readonly)
		[2]: Parent_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local pairs_result1, pairs_result2_3, pairs_result3_2 = pairs(CollectionService_upvr:GetTagged("Enemy"))
	local var32
	for _, v in pairs_result1, pairs_result2_3, pairs_result3_2 do
		if v and v:FindFirstChild("HumanoidRootPart") and v:IsDescendantOf(workspace) and (v.HumanoidRootPart.Position - Parent_upvr.HumanoidRootPart.Position).magnitude < 300 then
			local DangerScore = v:GetAttribute("DangerScore")
			if DangerScore then
				if v:HasTag("Outlaw") then
					local var34 = 0 + DangerScore
				elseif v:HasTag("Zombie") then
					var32 += DangerScore
				elseif v:HasTag("Supernatural") then
					local var35 = 0 + DangerScore
				end
			end
		end
	end
	pairs_result1 = "Unknown"
	local var36
	if var32 <= var34 and var35 <= var34 then
		var36 = "Outlaw"
	elseif var34 <= var32 and var35 <= var32 then
		var36 = "Zombie"
	elseif var34 <= var35 and var32 <= var35 then
		var36 = "Supernatural"
	end
	return 0 + DangerScore, var36
end
local _ = {
	Outlaw = game.SoundService.BattleSongs.BanditBattle;
	Zombie = game.SoundService.BattleSongs.ZombieBattle;
	Supernatural = game.SoundService.BattleSongs.SupernaturalBattle;
	Unknown = game.SoundService.BattleSongs.ZombieBattle;
}
local function stopBattleSongs_upvr(arg1) -- Line 49, Named "stopBattleSongs"
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: TweenInfo_new_result1_upvr (readonly)
	]]
	for _, v_2 in pairs(game.SoundService.BattleSongs:GetChildren()) do
		if v_2 ~= arg1 and v_2.IsPlaying then
			TweenService_upvr:Create(v_2, TweenInfo_new_result1_upvr, {
				Volume = 0;
			}):Play()
			task.wait(3)
			v_2:Stop()
			v_2.Volume = 0.5
		end
	end
end
local function _(arg1) -- Line 67, Named "playBattleSong"
	--[[ Upvalues[3]:
		[1]: stopBattleSongs_upvr (readonly)
		[2]: TweenService_upvr (readonly)
		[3]: TweenInfo_new_result1_upvr (readonly)
	]]
	task.spawn(stopBattleSongs_upvr, arg1)
	arg1.Volume = 0
	arg1:Play()
	TweenService_upvr:Create(arg1, TweenInfo_new_result1_upvr, {
		Volume = 0.5;
	}):Play()
end
-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [106] 70. Error Block 8 start (CF ANALYSIS FAILED)
-- KONSTANTERROR: [106] 70. Error Block 8 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [75] 47. Error Block 13 start (CF ANALYSIS FAILED)
-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [106.10]
if nil ~= true then
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [106.11]
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [106.65666]
	if nil <= game.SoundService then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not nil then
			-- KONSTANTWARNING: GOTO [106] #70
		end
	else
	end
end
-- KONSTANTERROR: [75] 47. Error Block 13 end (CF ANALYSIS FAILED)