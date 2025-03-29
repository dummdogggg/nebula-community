--[[
    Script: ReplicatedStorage.Client.DataBanks.ClientActivatableObjectCallbacks
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:59
-- Luau version 6, Types version 3
-- Time taken: 0.003375 seconds

local StarterGui_upvr = game:GetService("StarterGui")
local Satchel_upvr = require(game:GetService("ReplicatedStorage").Packages.Satchel)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local tbl_3_upvr = {}
local tbl_2_upvr = {
	PlayerList = true;
	Health = true;
	Backpack = true;
	Chat = true;
	EmotesMenu = true;
	Captures = true;
}
local tbl_4_upvr = {
	BadgesNotificationsActive = true;
	PointsNotificationsActive = true;
}
local function pushUI_upvr() -- Line 46, Named "pushUI"
	--[[ Upvalues[6]:
		[1]: tbl_2_upvr (readonly)
		[2]: Satchel_upvr (readonly)
		[3]: StarterGui_upvr (readonly)
		[4]: tbl_4_upvr (readonly)
		[5]: LocalPlayer_upvr (readonly)
		[6]: tbl_3_upvr (readonly)
	]]
	for i in pairs(tbl_2_upvr) do
		if i == "Backpack" then
			tbl_2_upvr[i] = Satchel_upvr:GetBackpackEnabled()
			Satchel_upvr:SetBackpackEnabled(false)
		else
			tbl_2_upvr[i] = StarterGui_upvr:GetCoreGuiEnabled(Enum.CoreGuiType[i])
			StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType[i], false)
		end
	end
	for i_2 in pairs(tbl_4_upvr) do
		tbl_4_upvr[i_2] = StarterGui_upvr:GetCore(i_2)
		StarterGui_upvr:SetCore(i_2, false)
	end
	local class_PlayerGui = LocalPlayer_upvr:FindFirstChildOfClass("PlayerGui")
	if class_PlayerGui then
		for _, v in ipairs(class_PlayerGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Enabled then
				table.insert(tbl_3_upvr, v)
				v.Enabled = false
			end
		end
	end
end
local function popUI_upvr() -- Line 76, Named "popUI"
	--[[ Upvalues[5]:
		[1]: tbl_2_upvr (readonly)
		[2]: Satchel_upvr (readonly)
		[3]: StarterGui_upvr (readonly)
		[4]: tbl_4_upvr (readonly)
		[5]: tbl_3_upvr (readonly)
	]]
	for i_4, v_2 in pairs(tbl_2_upvr) do
		if i_4 == "Backpack" then
			Satchel_upvr:SetBackpackEnabled(v_2)
		else
			StarterGui_upvr:SetCoreGuiEnabled(Enum.CoreGuiType[i_4], v_2)
		end
	end
	for i_5, v_3 in pairs(tbl_4_upvr) do
		StarterGui_upvr:SetCore(i_5, v_3)
	end
	for _, v_4 in ipairs(tbl_3_upvr) do
		if v_4.Parent then
			v_4.Enabled = true
		end
	end
	table.clear(tbl_3_upvr)
end
local module = {}
local CurrentCamera_upvr = workspace.CurrentCamera
local CaptureService_upvr = game:GetService("CaptureService")
local MouseController_upvr = require(script:FindFirstAncestor("Client").Controllers.MouseController)
function module.Camera(arg1, arg2, arg3) -- Line 103
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: CurrentCamera_upvr (readonly)
		[3]: pushUI_upvr (readonly)
		[4]: CaptureService_upvr (readonly)
		[5]: MouseController_upvr (readonly)
		[6]: popUI_upvr (readonly)
	]]
	if not arg2 or not arg3 then
	else
		if not arg1 or not arg1:IsDescendantOf(workspace) then return end
		local LockFirstPerson_upvr = Enum.CameraMode.LockFirstPerson
		local CameraMinZoomDistance_upvr = LocalPlayer_upvr.CameraMinZoomDistance
		local CameraMaxZoomDistance_upvr = LocalPlayer_upvr.CameraMaxZoomDistance
		local workspace_GetServerTimeNow_result1_upvw = workspace:GetServerTimeNow()
		local pcall_result1, pcall_result2 = pcall(function() -- Line 119
			--[[ Upvalues[12]:
				[1]: LocalPlayer_upvr (copied, readonly)
				[2]: workspace_GetServerTimeNow_result1_upvw (read and write)
				[3]: arg3 (readonly)
				[4]: arg1 (readonly)
				[5]: CurrentCamera_upvr (copied, readonly)
				[6]: pushUI_upvr (copied, readonly)
				[7]: CaptureService_upvr (copied, readonly)
				[8]: MouseController_upvr (copied, readonly)
				[9]: popUI_upvr (copied, readonly)
				[10]: CameraMinZoomDistance_upvr (readonly)
				[11]: CameraMaxZoomDistance_upvr (readonly)
				[12]: LockFirstPerson_upvr (readonly)
			]]
			LocalPlayer_upvr.CameraMode = Enum.CameraMode.Classic
			LocalPlayer_upvr.CameraMinZoomDistance = 10
			LocalPlayer_upvr.CameraMinZoomDistance = 10
			while workspace_GetServerTimeNow_result1_upvw < arg3 do
				task.wait()
				workspace_GetServerTimeNow_result1_upvw = workspace:GetServerTimeNow()
			end
			CurrentCamera_upvr.CameraType = Enum.CameraType.Scriptable
			CurrentCamera_upvr.CFrame = arg1:FindFirstChild("CaptureAttachment", true).WorldCFrame
			pushUI_upvr()
			CaptureService_upvr:CaptureScreenshot(function(arg1_2) -- Line 139
				--[[ Upvalues[2]:
					[1]: MouseController_upvr (copied, readonly)
					[2]: CaptureService_upvr (copied, readonly)
				]]
				MouseController_upvr.setMouseIconVisible(true)
				MouseController_upvr.setMouseBehavior(Enum.MouseBehavior.Default, true)
				MouseController_upvr.setMouseBehaviorLocked(false)
				local tbl = {}
				tbl[1] = arg1_2
				local any_getCurrentMouseBehavior_result1_upvr = MouseController_upvr.getCurrentMouseBehavior()
				CaptureService_upvr:PromptSaveCapturesToGallery(tbl, function(...) -- Line 146
					--[[ Upvalues[2]:
						[1]: MouseController_upvr (copied, readonly)
						[2]: any_getCurrentMouseBehavior_result1_upvr (readonly)
					]]
					MouseController_upvr.setMouseIconVisible(false)
					MouseController_upvr.setMouseBehavior(any_getCurrentMouseBehavior_result1_upvr)
					MouseController_upvr.setMouseBehaviorLocked(true)
				end)
			end)
			task.wait()
			popUI_upvr()
			CurrentCamera_upvr.CFrame = CurrentCamera_upvr.CFrame
			CurrentCamera_upvr.CameraType = CurrentCamera_upvr.CameraType
			LocalPlayer_upvr.CameraMinZoomDistance = CameraMinZoomDistance_upvr
			LocalPlayer_upvr.CameraMaxZoomDistance = CameraMaxZoomDistance_upvr
			LocalPlayer_upvr.CameraMode = LockFirstPerson_upvr
		end)
		if not pcall_result1 then
			warn("Camera callback failed:", pcall_result2)
			LocalPlayer_upvr.CameraMinZoomDistance = CameraMinZoomDistance_upvr
			LocalPlayer_upvr.CameraMaxZoomDistance = CameraMaxZoomDistance_upvr
			LocalPlayer_upvr.CameraMode = LockFirstPerson_upvr
		end
	end
end
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(0.5, Enum.EasingStyle.Quad)
local var54_upvw
function module.Bond(arg1, arg2, arg3) -- Line 174
	--[[ Upvalues[4]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: TweenService_upvr (readonly)
		[3]: TweenInfo_new_result1_upvr (readonly)
		[4]: var54_upvw (read and write)
	]]
	if not arg2 then
	else
		LocalPlayer_upvr.PlayerGui.BondGui.BondInfo.BondCount.Text = arg3
		TweenService_upvr:Create(LocalPlayer_upvr.PlayerGui.BondGui.BondInfo, TweenInfo_new_result1_upvr, {
			Position = UDim2.fromScale(0.01, 0.593);
		}):Play()
		if var54_upvw then
			task.cancel(var54_upvw)
			var54_upvw = nil
		end
		var54_upvw = task.delay(5, function() -- Line 189
			--[[ Upvalues[3]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: LocalPlayer_upvr (copied, readonly)
				[3]: TweenInfo_new_result1_upvr (copied, readonly)
			]]
			TweenService_upvr:Create(LocalPlayer_upvr.PlayerGui.BondGui.BondInfo, TweenInfo_new_result1_upvr, {
				Position = UDim2.fromScale(-0.51, 0.593);
			}):Play()
			print("Close")
		end)
	end
end
return module