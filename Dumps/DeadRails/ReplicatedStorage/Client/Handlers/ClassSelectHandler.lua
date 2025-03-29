--[[
    Script: ReplicatedStorage.Client.Handlers.ClassSelectHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:58
-- Luau version 6, Types version 3
-- Time taken: 0.007911 seconds

local Players_upvr = game:GetService("Players")
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local TweenService_upvr = game:GetService("TweenService")
local Satchel_upvr = require(ReplicatedStorage_upvr.Packages.Satchel)
local Remotes = require(ReplicatedStorage_upvr.Shared.Remotes)
local PlayerDataController = require(ReplicatedStorage_upvr.Client.Controllers.PlayerDataController)
local FetchAvailableClasses_upvr = Remotes.FetchAvailableClasses
ReplicatedStorage_upvr:WaitForChild("Assets"):WaitForChild("UI")
workspace:WaitForChild("Nodes")
local ClassSelectPrompt_upvr = workspace.Nodes:WaitForChild("ClassSelectPromptNode"):WaitForChild("ClassSelectPrompt")
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local CurrentCamera_upvr = workspace.CurrentCamera
local PlayerGui_upvr = LocalPlayer_upvr.PlayerGui
local ClassSelect_upvr = PlayerGui_upvr:WaitForChild("ClassSelect")
local Frame_upvr = PlayerGui_upvr:WaitForChild("FadeGui"):WaitForChild("Frame")
local var14_upvw = false
local tbl_upvw = {}
local var16_upvw = 0
local var17_upvw
while not PlayerDataController.isPlayerDataLoaded() do
	task.wait()
end
local any_getPlayerDataReplica_result1_upvr = PlayerDataController.getPlayerDataReplica()
local function fadeOutAsync_upvr(arg1) -- Line 62, Named "fadeOutAsync"
	--[[ Upvalues[2]:
		[1]: Frame_upvr (readonly)
		[2]: TweenService_upvr (readonly)
	]]
	Frame_upvr.BackgroundTransparency = 1
	Frame_upvr.Visible = true
	local any_Create_result1_2 = TweenService_upvr:Create(Frame_upvr, TweenInfo.new(arg1 or 1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		BackgroundTransparency = 0;
	})
	any_Create_result1_2:Play()
	any_Create_result1_2.Completed:Wait()
end
local function fadeInAsync_upvr(arg1) -- Line 73, Named "fadeInAsync"
	--[[ Upvalues[2]:
		[1]: TweenService_upvr (readonly)
		[2]: Frame_upvr (readonly)
	]]
	local any_Create_result1 = TweenService_upvr:Create(Frame_upvr, TweenInfo.new(arg1 or 1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		BackgroundTransparency = 1;
	})
	any_Create_result1:Play()
	any_Create_result1.Completed:Wait()
	Frame_upvr.Visible = false
end
local function _() -- Line 84, Named "isCacheValid"
	--[[ Upvalues[2]:
		[1]: tbl_upvw (read and write)
		[2]: var16_upvw (read and write)
	]]
	local var23 = false
	if next(tbl_upvw) ~= nil then
		if os.time() - var16_upvw >= 60 then
			var23 = false
		else
			var23 = true
		end
	end
	return var23
end
local function _() -- Line 88, Named "clearCache"
	--[[ Upvalues[2]:
		[1]: tbl_upvw (read and write)
		[2]: var16_upvw (read and write)
	]]
	tbl_upvw = {}
	var16_upvw = 0
end
local var24_upvw
local function _() -- Line 95, Named "getLocalHumanoidDescriptionAsync"
	--[[ Upvalues[3]:
		[1]: var24_upvw (read and write)
		[2]: Players_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
	]]
	if var24_upvw then
		return var24_upvw
	end
	local any_GetHumanoidDescriptionFromUserId_result1 = Players_upvr:GetHumanoidDescriptionFromUserId(LocalPlayer_upvr.UserId)
	var24_upvw = any_GetHumanoidDescriptionFromUserId_result1
	return any_GetHumanoidDescriptionFromUserId_result1
end
local ClassSelectRigNode_upvr = workspace.Nodes:WaitForChild("ClassSelectRigNode")
local function loadRigPreviewOfClass_upvr(arg1) -- Line 105, Named "loadRigPreviewOfClass"
	--[[ Upvalues[6]:
		[1]: var17_upvw (read and write)
		[2]: ReplicatedStorage_upvr (readonly)
		[3]: ClassSelectRigNode_upvr (readonly)
		[4]: var24_upvw (read and write)
		[5]: Players_upvr (readonly)
		[6]: LocalPlayer_upvr (readonly)
	]]
	local var27 = var17_upvw
	var17_upvw = ReplicatedStorage_upvr.Assets.ClassAccessories:WaitForChild(arg1):Clone()
	local var28
	if var17_upvw then
		var28 = "HumanoidRootPart"
		var17_upvw:WaitForChild(var28).Anchored = true
		var17_upvw:PivotTo(ClassSelectRigNode_upvr.CFrame - Vector3.new(0, 20, 0))
		var28 = workspace
		var17_upvw.Parent = var28
		local Humanoid = var17_upvw:WaitForChild("Humanoid")
		if var24_upvw then
			var28 = var24_upvw
		else
			local any_GetHumanoidDescriptionFromUserId_result1_2 = Players_upvr:GetHumanoidDescriptionFromUserId(LocalPlayer_upvr.UserId)
			var24_upvw = any_GetHumanoidDescriptionFromUserId_result1_2
			var28 = any_GetHumanoidDescriptionFromUserId_result1_2
		end
		local clone_2 = var28:Clone()
		clone_2:SetAccessories({}, true)
		clone_2.Parent = Humanoid
		Humanoid:ApplyDescription(clone_2)
		var17_upvw:PivotTo(ClassSelectRigNode_upvr.CFrame)
		if var27 then
			var27:Destroy()
		end
	end
end
local function _() -- Line 138, Named "getAvailableClassesAsync"
	--[[ Upvalues[3]:
		[1]: tbl_upvw (read and write)
		[2]: var16_upvw (read and write)
		[3]: FetchAvailableClasses_upvr (readonly)
	]]
	local var32 = false
	if next(tbl_upvw) ~= nil then
		if os.time() - var16_upvw >= 60 then
			var32 = false
		else
			var32 = true
		end
	end
	if var32 then
		return true, tbl_upvw
	end
	local any_await_result1, any_await_result2 = FetchAvailableClasses_upvr:InvokeServer():await()
	if any_await_result1 and any_await_result2 then
		tbl_upvw = any_await_result2
		var16_upvw = os.time()
	end
	return any_await_result1, any_await_result2
end
local function clearClassButtons_upvr() -- Line 152, Named "clearClassButtons"
	--[[ Upvalues[1]:
		[1]: ClassSelect_upvr (readonly)
	]]
	for _, v in ClassSelect_upvr.Classes.Frame:GetChildren() do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end
end
local function clearStartingItemFrames_upvr() -- Line 160, Named "clearStartingItemFrames"
	--[[ Upvalues[1]:
		[1]: ClassSelect_upvr (readonly)
	]]
	for _, v_2 in ClassSelect_upvr.ClassInfo.Frame.StartingItemsContainer:GetChildren() do
		if v_2.Name == "StartingItemFrame" then
			v_2:Destroy()
		end
	end
end
local function exitClassSelectAsync_upvr() -- Line 168, Named "exitClassSelectAsync"
	--[[ Upvalues[9]:
		[1]: var14_upvw (read and write)
		[2]: fadeOutAsync_upvr (readonly)
		[3]: var17_upvw (read and write)
		[4]: CurrentCamera_upvr (readonly)
		[5]: ClassSelect_upvr (readonly)
		[6]: PlayerGui_upvr (readonly)
		[7]: Satchel_upvr (readonly)
		[8]: fadeInAsync_upvr (readonly)
		[9]: ClassSelectPrompt_upvr (readonly)
	]]
	if not var14_upvw then
	else
		var14_upvw = false
		fadeOutAsync_upvr(1)
		if var17_upvw then
			var17_upvw:Destroy()
		end
		CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
		ClassSelect_upvr.Enabled = false
		PlayerGui_upvr.BondGui.BondInfo.Position = UDim2.fromScale(0.01, 0.593)
		Satchel_upvr:SetBackpackEnabled(true)
		fadeInAsync_upvr(1)
		ClassSelectPrompt_upvr.Enabled = true
	end
end
local ClassNameLabel_upvr = ClassSelect_upvr:FindFirstChild("ClassNameLabel", true)
local ClassDescriptionLabel_upvr = ClassSelect_upvr:FindFirstChild("ClassDescriptionLabel", true)
local StartingItemFrame_upvr = ReplicatedStorage_upvr.Assets.UI:WaitForChild("StartingItemFrame")
local EquipButton_upvr = ClassSelect_upvr:WaitForChild("EquipButton")
local var49_upvw
local BuyClass_upvr = Remotes.BuyClass
local MarketplaceService_upvr = game:GetService("MarketplaceService")
local EquipClass_upvr = Remotes.EquipClass
local function setSelectedClassAsync_upvr(arg1, arg2, arg3, arg4) -- Line 192, Named "setSelectedClassAsync"
	--[[ Upvalues[13]:
		[1]: clearStartingItemFrames_upvr (readonly)
		[2]: ClassNameLabel_upvr (readonly)
		[3]: ClassDescriptionLabel_upvr (readonly)
		[4]: StartingItemFrame_upvr (readonly)
		[5]: ClassSelect_upvr (readonly)
		[6]: EquipButton_upvr (readonly)
		[7]: var49_upvw (read and write)
		[8]: BuyClass_upvr (readonly)
		[9]: setSelectedClassAsync_upvr (readonly)
		[10]: MarketplaceService_upvr (readonly)
		[11]: LocalPlayer_upvr (readonly)
		[12]: EquipClass_upvr (readonly)
		[13]: loadRigPreviewOfClass_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	clearStartingItemFrames_upvr()
	ClassNameLabel_upvr.Text = arg2.displayName
	ClassDescriptionLabel_upvr.Text = arg2.description
	local var61
	for _, v_3 in arg2.startingItems, var61 do
		local clone = StartingItemFrame_upvr:Clone()
		clone.ItemLabel.Text = v_3.displayName
		clone.CountLabel.Text = 'x'..tostring(v_3.count or 1)
		clone.Name = "StartingItemFrame"
		clone.Parent = ClassSelect_upvr.ClassInfo.Frame.StartingItemsContainer
	end
	var61 = "Buy - %d Bonds":format(arg2.price or 0)
	if arg3 and arg4 then
		var61 = "Equipped"
		local _ = "Equipped"
	elseif arg3 then
		var61 = "Equip"
	end
	EquipButton_upvr.Text = var61
	if "Equip" == "Equipped" then
		EquipButton_upvr.AutoButtonColor = false
		EquipButton_upvr.Selectable = false
	else
		EquipButton_upvr.AutoButtonColor = true
		EquipButton_upvr.Selectable = true
	end
	if var49_upvw then
		var49_upvw:Disconnect()
		var49_upvw = nil
	end
	local const_string_upvw = "Equip"
	var49_upvw = EquipButton_upvr.Activated:Connect(function() -- Line 242
		--[[ Upvalues[11]:
			[1]: const_string_upvw (read and write)
			[2]: EquipButton_upvr (copied, readonly)
			[3]: BuyClass_upvr (copied, readonly)
			[4]: arg1 (readonly)
			[5]: setSelectedClassAsync_upvr (copied, readonly)
			[6]: arg2 (readonly)
			[7]: arg4 (readonly)
			[8]: MarketplaceService_upvr (copied, readonly)
			[9]: LocalPlayer_upvr (copied, readonly)
			[10]: EquipClass_upvr (copied, readonly)
			[11]: arg3 (readonly)
		]]
		if const_string_upvw == "Equipped" then
		else
			if const_string_upvw == "Buy" then
				EquipButton_upvr.Text = "Purchasing..."
				EquipButton_upvr.AutoButtonColor = false
				EquipButton_upvr.Selectable = false
				BuyClass_upvr:InvokeServer(arg1):andThen(function(arg1_2) -- Line 253
					--[[ Upvalues[7]:
						[1]: setSelectedClassAsync_upvr (copied, readonly)
						[2]: arg1 (copied, readonly)
						[3]: arg2 (copied, readonly)
						[4]: arg4 (copied, readonly)
						[5]: EquipButton_upvr (copied, readonly)
						[6]: MarketplaceService_upvr (copied, readonly)
						[7]: LocalPlayer_upvr (copied, readonly)
					]]
					if arg1_2.success then
						setSelectedClassAsync_upvr(arg1, arg2, true, arg4)
					else
						EquipButton_upvr.Text = "Buy - %d Bonds":format(arg2.price or 0)
						if arg1_2.message == "Not enough bonds!" then
							MarketplaceService_upvr:PromptProductPurchase(LocalPlayer_upvr, 3222878362)
						end
						warn(arg1_2.message or "Purchase failed.")
					end
				end):timeout(15):catch(function(arg1_3) -- Line 266
					--[[ Upvalues[2]:
						[1]: EquipButton_upvr (copied, readonly)
						[2]: arg2 (copied, readonly)
					]]
					EquipButton_upvr.Text = "Buy - %d Bonds":format(arg2.price or 0)
					warn("Purchase request error:", tostring(arg1_3))
				end):finally(function() -- Line 270
					--[[ Upvalues[1]:
						[1]: EquipButton_upvr (copied, readonly)
					]]
					EquipButton_upvr.AutoButtonColor = true
					EquipButton_upvr.Selectable = true
				end)
				return
			end
			if const_string_upvw == "Equip" then
				EquipButton_upvr.Text = "Equipping..."
				EquipButton_upvr.AutoButtonColor = false
				EquipButton_upvr.Selectable = false
				EquipClass_upvr:InvokeServer(arg1):andThen(function(arg1_4) -- Line 281
					--[[ Upvalues[5]:
						[1]: setSelectedClassAsync_upvr (copied, readonly)
						[2]: arg1 (copied, readonly)
						[3]: arg2 (copied, readonly)
						[4]: arg3 (copied, readonly)
						[5]: EquipButton_upvr (copied, readonly)
					]]
					if arg1_4.success then
						setSelectedClassAsync_upvr(arg1, arg2, arg3, true)
					else
						EquipButton_upvr.Text = "Equip"
						warn(arg1_4.message or "Equip failed.")
					end
				end):timeout(15):catch(function(arg1_5) -- Line 291
					--[[ Upvalues[1]:
						[1]: EquipButton_upvr (copied, readonly)
					]]
					EquipButton_upvr.Text = "Equip"
					warn("Equip request error:", tostring(arg1_5))
				end):finally(function() -- Line 295
					--[[ Upvalues[1]:
						[1]: EquipButton_upvr (copied, readonly)
					]]
					EquipButton_upvr.AutoButtonColor = true
					EquipButton_upvr.Selectable = true
				end)
			end
		end
	end)
	loadRigPreviewOfClass_upvr(arg1)
end
local ClassButton_upvr = ReplicatedStorage_upvr.Assets.UI:WaitForChild("ClassButton")
local function loadClassUIAsync_upvr() -- Line 305, Named "loadClassUIAsync"
	--[[ Upvalues[10]:
		[1]: clearClassButtons_upvr (readonly)
		[2]: clearStartingItemFrames_upvr (readonly)
		[3]: any_getPlayerDataReplica_result1_upvr (readonly)
		[4]: tbl_upvw (read and write)
		[5]: var16_upvw (read and write)
		[6]: FetchAvailableClasses_upvr (readonly)
		[7]: ClassButton_upvr (readonly)
		[8]: setSelectedClassAsync_upvr (readonly)
		[9]: ClassSelect_upvr (readonly)
		[10]: exitClassSelectAsync_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	clearClassButtons_upvr()
	clearStartingItemFrames_upvr()
	local var81
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 16. Error Block 66 start (CF ANALYSIS FAILED)
	if os.time() - var16_upvw >= 60 then
		var81 = false
	else
		var81 = true
	end
	-- KONSTANTERROR: [21] 16. Error Block 66 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [31] 24. Error Block 67 start (CF ANALYSIS FAILED)
	if var81 then
	else
		var81 = FetchAvailableClasses_upvr:InvokeServer():await()
		local any_await_result1_2, any_await_result2_2 = FetchAvailableClasses_upvr:InvokeServer():await()
		if any_await_result1_2 and any_await_result2_2 then
			tbl_upvw = any_await_result2_2
			var16_upvw = os.time()
		end
	end
	any_await_result1_2 = {}
	for i_4, v_4 in pairs(any_await_result2_2) do
		any_await_result1_2[#any_await_result1_2 + 1] = {
			key = i_4;
			value = v_4;
		}
	end
	table.sort(any_await_result1_2, function(arg1, arg2) -- Line 318
		local var89
		if arg1.value.price >= arg2.value.price then
			var89 = false
		else
			var89 = true
		end
		return var89
	end)
	-- KONSTANTERROR: [31] 24. Error Block 67 end (CF ANALYSIS FAILED)
end
local ClassSelectViewNode_upvr = workspace.Nodes:WaitForChild("ClassSelectViewNode")
local function enterClassSelectAsync_upvr() -- Line 377, Named "enterClassSelectAsync"
	--[[ Upvalues[14]:
		[1]: var14_upvw (read and write)
		[2]: ClassSelectPrompt_upvr (readonly)
		[3]: fadeOutAsync_upvr (readonly)
		[4]: PlayerGui_upvr (readonly)
		[5]: CurrentCamera_upvr (readonly)
		[6]: ClassSelectViewNode_upvr (readonly)
		[7]: ClassSelect_upvr (readonly)
		[8]: loadRigPreviewOfClass_upvr (readonly)
		[9]: any_getPlayerDataReplica_result1_upvr (readonly)
		[10]: Satchel_upvr (readonly)
		[11]: tbl_upvw (read and write)
		[12]: var16_upvw (read and write)
		[13]: loadClassUIAsync_upvr (readonly)
		[14]: fadeInAsync_upvr (readonly)
	]]
	if var14_upvw then
	else
		var14_upvw = true
		ClassSelectPrompt_upvr.Enabled = false
		fadeOutAsync_upvr(1)
		PlayerGui_upvr.BondGui.BondInfo.Position = UDim2.fromScale(0.45, 0.053)
		CurrentCamera_upvr.CameraType = Enum.CameraType.Scriptable
		CurrentCamera_upvr.CFrame = ClassSelectViewNode_upvr:WaitForChild("Attachment").WorldCFrame
		ClassSelect_upvr.Enabled = true
		loadRigPreviewOfClass_upvr(any_getPlayerDataReplica_result1_upvr.Data.currentClass)
		Satchel_upvr:SetBackpackEnabled(false)
		tbl_upvw = {}
		var16_upvw = 0
		loadClassUIAsync_upvr()
		fadeInAsync_upvr(1)
	end
end
ClassSelectPrompt_upvr.Triggered:Connect(function(arg1) -- Line 404
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: enterClassSelectAsync_upvr (readonly)
	]]
	if arg1 == LocalPlayer_upvr then
		enterClassSelectAsync_upvr()
	end
end)
local function onPlayerClassDataUpdated() -- Line 410
	--[[ Upvalues[2]:
		[1]: var14_upvw (read and write)
		[2]: loadClassUIAsync_upvr (readonly)
	]]
	if var14_upvw then
		loadClassUIAsync_upvr()
	end
end
ClassSelect_upvr:WaitForChild("ExitButton").Activated:Connect(exitClassSelectAsync_upvr)
any_getPlayerDataReplica_result1_upvr:OnSet({"classes"}, onPlayerClassDataUpdated)
any_getPlayerDataReplica_result1_upvr:OnSet({"currentClass"}, onPlayerClassDataUpdated)