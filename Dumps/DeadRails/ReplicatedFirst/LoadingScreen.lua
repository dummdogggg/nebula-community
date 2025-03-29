--[[
    Script: ReplicatedFirst.LoadingScreen
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:54
-- Luau version 6, Types version 3
-- Time taken: 0.001441 seconds

local module_upvr = {
	_instance = script.Parent:FindFirstChild("LoadingScreenPrefab"):Clone();
	_startTime = 0;
	_spinnerConnection = nil;
}
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local ReplicatedFirst_upvr = game:GetService("ReplicatedFirst")
local RunService_upvr = game:GetService("RunService")
function module_upvr.enableAsync() -- Line 29
	--[[ Upvalues[4]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: ReplicatedFirst_upvr (readonly)
		[4]: RunService_upvr (readonly)
	]]
	module_upvr._instance.Parent = LocalPlayer_upvr:WaitForChild("PlayerGui")
	ReplicatedFirst_upvr:RemoveDefaultLoadingScreen()
	module_upvr._startTime = os.clock()
	local SpinnerImageLabel_upvr = module_upvr._instance:FindFirstChild("SizingFrame"):FindFirstChild("ContentFrame"):FindFirstChild("SpinnerImageLabel")
	module_upvr._spinnerConnection = RunService_upvr.Heartbeat:Connect(function(arg1) -- Line 44
		--[[ Upvalues[1]:
			[1]: SpinnerImageLabel_upvr (readonly)
		]]
		local var7 = SpinnerImageLabel_upvr
		var7.Rotation += arg1 * 360
	end)
	module_upvr._startTime = os.clock()
end
function module_upvr.updateDetailText(arg1) -- Line 50
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr._instance:FindFirstChild("SizingFrame"):FindFirstChild("ContentFrame"):FindFirstChild("TextContentFrame"):FindFirstChild("DetailTextLabel").Text = arg1
end
local TweenService_upvr = game:GetService("TweenService")
function module_upvr.disableAsync() -- Line 60
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: TweenService_upvr (readonly)
	]]
	task.wait(math.max(0, (2) - (os.clock() - module_upvr._startTime)))
	if module_upvr._spinnerConnection then
		module_upvr._spinnerConnection:Disconnect()
	end
	module_upvr._instance:FindFirstChild("SizingFrame"):FindFirstChild("ContentFrame").Visible = false
	local any_Create_result1_upvr = TweenService_upvr:Create(module_upvr._instance:FindFirstChild("Background"), TweenInfo.new(1), {
		BackgroundTransparency = 1;
	})
	task.spawn(function() -- Line 80
		--[[ Upvalues[2]:
			[1]: any_Create_result1_upvr (readonly)
			[2]: module_upvr (copied, readonly)
		]]
		any_Create_result1_upvr:Play()
		any_Create_result1_upvr.Completed:Wait()
		module_upvr._instance:Destroy()
	end)
end
return module_upvr