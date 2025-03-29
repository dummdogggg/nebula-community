--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.SoftShutdownServiceClient
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:13
-- Luau version 6, Types version 3
-- Time taken: 0.004627 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local TeleportService_upvr = game:GetService("TeleportService")
local any_load_result1_result1_upvr = any_load_result1("Maid")
local any_load_result1_result1_upvr_2 = any_load_result1("PlayerGuiUtils")
local module = {}
local tbl_upvr = {Enum.CoreGuiType.PlayerList, Enum.CoreGuiType.Health, Enum.CoreGuiType.Backpack, Enum.CoreGuiType.Chat, Enum.CoreGuiType.EmotesMenu, Enum.CoreGuiType.All}
local any_load_result1_result1_upvr_6 = any_load_result1("SoftShutdownTranslator")
local any_load_result1_result1_upvr_5 = any_load_result1("AttributeValue")
local Workspace_upvr = game:GetService("Workspace")
local any_load_result1_result1_upvr_4 = any_load_result1("SoftShutdownConstants")
local var1_result1_upvr = any_load_result1("Rx")
local any_load_result1_result1_upvr_7 = any_load_result1("RxValueBaseUtils")
function module.Init(arg1, arg2) -- Line 32
	--[[ Upvalues[8]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_6 (readonly)
		[3]: any_load_result1_result1_upvr_5 (readonly)
		[4]: Workspace_upvr (readonly)
		[5]: any_load_result1_result1_upvr_4 (readonly)
		[6]: var1_result1_upvr (readonly)
		[7]: any_load_result1_result1_upvr_7 (readonly)
		[8]: TeleportService_upvr (readonly)
	]]
	assert(not arg1._serviceBag, "Already initialized")
	arg1._serviceBag = assert(arg2, "No serviceBag")
	arg1._maid = any_load_result1_result1_upvr.new()
	arg1._translator = arg1._serviceBag:GetService(any_load_result1_result1_upvr_6)
	arg1._isLobby = any_load_result1_result1_upvr_5.new(Workspace_upvr, any_load_result1_result1_upvr_4.IS_SOFT_SHUTDOWN_LOBBY_ATTRIBUTE, false)
	arg1._isUpdating = any_load_result1_result1_upvr_5.new(Workspace_upvr, any_load_result1_result1_upvr_4.IS_SOFT_SHUTDOWN_UPDATING_ATTRIBUTE, false)
	arg1._localTeleportDataSaysIsLobby = Instance.new("BoolValue")
	arg1._localTeleportDataSaysIsLobby.Value = false
	arg1._maid:GiveTask(arg1._localTeleportDataSaysIsLobby)
	arg1._isArrivingAfterShutdown = Instance.new("BoolValue")
	arg1._isArrivingAfterShutdown.Value = false
	arg1._maid:GiveTask(arg1._isArrivingAfterShutdown)
	task.spawn(function() -- Line 50
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		if arg1:_queryLocalTeleportInfo() then
			arg1._localTeleportDataSaysIsLobby.Value = true
		end
		if arg1:_queryIsArrivingAfterShutdown() then
			arg1._isArrivingAfterShutdown.Value = true
		end
	end)
	arg1._maid:GiveTask(var1_result1_upvr.combineLatest({
		isLobby = arg1._isLobby:Observe();
		isShuttingDown = arg1._isUpdating:Observe();
		localTeleportDataSaysIsLobby = any_load_result1_result1_upvr_7.observeValue(arg1._localTeleportDataSaysIsLobby);
		isArrivingAfterShutdown = any_load_result1_result1_upvr_7.observeValue(arg1._isArrivingAfterShutdown);
	}):Subscribe(function(arg1_2) -- Line 64
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: TeleportService_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 5. Error Block 15 start (CF ANALYSIS FAILED)
		arg1._maid._shutdownUI = nil
		-- KONSTANTERROR: [6] 5. Error Block 15 end (CF ANALYSIS FAILED)
	end))
end
function module._queryIsArrivingAfterShutdown(arg1) -- Line 99
	--[[ Upvalues[1]:
		[1]: TeleportService_upvr (readonly)
	]]
	local any_GetLocalPlayerTeleportData_result1 = TeleportService_upvr:GetLocalPlayerTeleportData()
	if type(any_GetLocalPlayerTeleportData_result1) == "table" and any_GetLocalPlayerTeleportData_result1.isSoftShutdownArrivingIntoUpdatedServer then
		return true
	end
	return false
end
function module._queryLocalTeleportInfo(arg1) -- Line 108
	--[[ Upvalues[1]:
		[1]: TeleportService_upvr (readonly)
	]]
	local any_GetLocalPlayerTeleportData_result1_2 = TeleportService_upvr:GetLocalPlayerTeleportData()
	if type(any_GetLocalPlayerTeleportData_result1_2) == "table" and any_GetLocalPlayerTeleportData_result1_2.isSoftShutdownReserveServer then
		return true
	end
	return false
end
local any_load_result1_result1_upvr_3 = any_load_result1("SoftShutdownUI")
function module._showSoftShutdownUI(arg1, arg2, arg3, arg4) -- Line 117
	--[[ Upvalues[3]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: any_load_result1_result1_upvr_3 (readonly)
	]]
	local any_new_result1 = any_load_result1_result1_upvr.new()
	local any_new_result1_2_upvr = any_load_result1_result1_upvr.new()
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "SoftShutdownScreenGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.AutoLocalize = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.DisplayOrder = 10000000000
	ScreenGui.Parent = any_load_result1_result1_upvr_2.getPlayerGui()
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	any_new_result1_2_upvr:GiveTask(ScreenGui)
	local any_new_result1_upvr = any_load_result1_result1_upvr_3.new()
	any_new_result1_2_upvr:GiveTask(any_new_result1_upvr)
	any_new_result1:GiveTask(function() -- Line 135
		--[[ Upvalues[2]:
			[1]: any_new_result1_upvr (readonly)
			[2]: any_new_result1_2_upvr (readonly)
		]]
		any_new_result1_upvr:Hide()
		task.delay(1, function() -- Line 138
			--[[ Upvalues[1]:
				[1]: any_new_result1_2_upvr (copied, readonly)
			]]
			any_new_result1_2_upvr:Destroy()
		end)
	end)
	arg1:_hideCoreGuiUI(any_new_result1_2_upvr, ScreenGui)
	any_new_result1:GivePromise(arg1._translator:PromiseFormatByKey(arg3)):Then(function(arg1_3) -- Line 145
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:SetSubtitle(arg1_3)
	end)
	any_new_result1:GivePromise(arg1._translator:PromiseFormatByKey(arg2)):Then(function(arg1_4) -- Line 149
		--[[ Upvalues[1]:
			[1]: any_new_result1_upvr (readonly)
		]]
		any_new_result1_upvr:SetTitle(arg1_4)
	end)
	any_new_result1_upvr:Show(arg4)
	any_new_result1_upvr.Gui.Parent = ScreenGui
	return any_new_result1, ScreenGui
end
local UserInputService_upvr = game:GetService("UserInputService")
local StarterGui_upvr = game:GetService("StarterGui")
function module._hideCoreGuiUI(arg1, arg2, arg3) -- Line 160
	--[[ Upvalues[4]:
		[1]: UserInputService_upvr (readonly)
		[2]: any_load_result1_result1_upvr_2 (readonly)
		[3]: tbl_upvr (readonly)
		[4]: StarterGui_upvr (readonly)
	]]
	if not UserInputService_upvr.ModalEnabled then
		UserInputService_upvr.ModalEnabled = true
		arg2:GiveTask(function() -- Line 164
			--[[ Upvalues[1]:
				[1]: UserInputService_upvr (copied, readonly)
			]]
			UserInputService_upvr.ModalEnabled = false
		end)
	end
	local any_getPlayerGui_result1 = any_load_result1_result1_upvr_2.getPlayerGui()
	local tbl_upvr_2 = {}
	local function _(arg1_5) -- Line 173, Named "handleChild"
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		if arg1_5:IsA("ScreenGui") and arg1_5 ~= arg3 and arg1_5.Enabled then
			tbl_upvr_2[arg1_5] = arg1_5
			arg1_5.Enabled = false
		end
	end
	for _, v in pairs(any_getPlayerGui_result1:GetChildren()) do
		if v:IsA("ScreenGui") and v ~= arg3 and v.Enabled then
			tbl_upvr_2[v] = v
			v.Enabled = false
		end
	end
	arg2:GiveTask(any_getPlayerGui_result1.ChildAdded:Connect(function(arg1_6) -- Line 184
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: tbl_upvr_2 (readonly)
		]]
		if arg1_6:IsA("ScreenGui") and arg1_6 ~= arg3 and arg1_6.Enabled then
			tbl_upvr_2[arg1_6] = arg1_6
			arg1_6.Enabled = false
		end
	end))
	arg2:GiveTask(any_getPlayerGui_result1.ChildRemoved:Connect(function(arg1_7) -- Line 188
		--[[ Upvalues[1]:
			[1]: tbl_upvr_2 (readonly)
		]]
		tbl_upvr_2[arg1_7] = nil
	end))
	arg2:GiveTask(function() -- Line 192
		--[[ Upvalues[1]:
			[1]: tbl_upvr_2 (readonly)
		]]
		for i_2, _ in pairs(tbl_upvr_2) do
			i_2.Enabled = true
		end
	end)
	for _, v_3_upvr in pairs(tbl_upvr) do
		task.spawn(function() -- Line 199
			--[[ Upvalues[3]:
				[1]: StarterGui_upvr (copied, readonly)
				[2]: v_3_upvr (readonly)
				[3]: arg2 (readonly)
			]]
			if StarterGui_upvr:GetCoreGuiEnabled(v_3_upvr) then
				StarterGui_upvr:SetCoreGuiEnabled(v_3_upvr, false)
				arg2:GiveTask(function() -- Line 203
					--[[ Upvalues[2]:
						[1]: StarterGui_upvr (copied, readonly)
						[2]: v_3_upvr (copied, readonly)
					]]
					StarterGui_upvr:SetCoreGuiEnabled(v_3_upvr, true)
				end)
			end
		end)
	end
end
function module.Destroy(arg1) -- Line 211
	arg1._maid:DoCleaning()
end
return module