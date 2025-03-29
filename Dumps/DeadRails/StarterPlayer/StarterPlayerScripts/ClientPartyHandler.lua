--[[
    Script: StarterPlayer.StarterPlayerScripts.ClientPartyHandler
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:44
-- Luau version 6, Types version 3
-- Time taken: 0.006046 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerDataController = require(ReplicatedStorage.Client.Controllers.PlayerDataController)
local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local CreateParty_upvr_2 = PlayerGui:WaitForChild("CreateParty")
local ExitParty_upvr = PlayerGui:WaitForChild("ExitParty")
local ExitParty_upvr_2 = ReplicatedStorage.Remotes.ExitParty
local tbl_upvr = {
	maxPlayers = 4;
	gameMode = "Normal";
}
local Color3_fromRGB_result1_upvr = Color3.fromRGB(255, 255, 255)
local Color3_fromRGB_result1_upvr_2 = Color3.fromRGB(255, 131, 133)
local tbl_2_upvr = {
	Normal = {
		Description = "Escape to Mexico!";
		Color = Color3.fromRGB(148, 255, 119);
		FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	};
}
local tbl = {
	Description = "Less loot, stronger enemies, no passive healing, rewards more bonds upon completion";
	LockedReason = "Need at least 1 normal win";
	Color = Color3.fromRGB(200, 0, 0);
	FontFace = Font.new("rbxasset://fonts/families/Creepster.json");
}
tbl_2_upvr.Nightmare = tbl
tbl = {}
local var17_upvr = tbl
for i, _ in pairs(tbl_2_upvr) do
	table.insert(var17_upvr, i)
end
local tbl_3_upvr = {"Normal"}
PlayerDataController.waitForDataLoadAsync()
if 1 <= PlayerDataController.getReplica().Data.wins then
	table.insert(tbl_3_upvr, "Nightmare")
end
local var22_upvw = tbl_upvr
local var23_upvw = false
local var24_upvw = false
local function _() -- Line 71, Named "updatePlayerSettingUI"
	--[[ Upvalues[4]:
		[1]: CreateParty_upvr_2 (readonly)
		[2]: var22_upvw (read and write)
		[3]: Color3_fromRGB_result1_upvr_2 (readonly)
		[4]: Color3_fromRGB_result1_upvr (readonly)
	]]
	CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.TextLabel.Text = tostring(var22_upvw.maxPlayers)
	local Frame_5 = CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame
	if 5 <= var22_upvw.maxPlayers then
		Frame_5 = Color3_fromRGB_result1_upvr_2
	else
		Frame_5 = Color3_fromRGB_result1_upvr
	end
	Frame_5.TextLabel.TextColor3 = Frame_5
end
local function updateGameModeLabel_upvr() -- Line 88, Named "updateGameModeLabel"
	--[[ Upvalues[4]:
		[1]: CreateParty_upvr_2 (readonly)
		[2]: tbl_2_upvr (readonly)
		[3]: var22_upvw (read and write)
		[4]: tbl_3_upvr (readonly)
	]]
	local GameMode = CreateParty_upvr_2.Background.SettingsContainer.GameModeSetting.Frame.GameMode.GameMode
	local var29 = tbl_2_upvr[var22_upvw.gameMode]
	GameMode.Text = var22_upvw.gameMode
	GameMode.FontFace = var29.FontFace
	GameMode.TextColor3 = var29.Color
	CreateParty_upvr_2.Background.SettingsContainer.GameModeSetting.Description.Text = var29.Description
	if table.find(tbl_3_upvr, var22_upvw.gameMode) then
		CreateParty_upvr_2.Background.CreateContainer.CreateButton.Visible = true
		CreateParty_upvr_2.Background.CreateContainer.Folder.LockedReason.Visible = false
	else
		CreateParty_upvr_2.Background.CreateContainer.CreateButton.Visible = false
		CreateParty_upvr_2.Background.CreateContainer.Folder.LockedReason.Visible = true
		CreateParty_upvr_2.Background.CreateContainer.Folder.LockedReason.Text = var29.LockedReason
	end
end
local function _(arg1) -- Line 139, Named "setErrorLabelText"
	--[[ Upvalues[1]:
		[1]: CreateParty_upvr_2 (readonly)
	]]
	local Background_2 = CreateParty_upvr_2.Background
	if arg1 then
		Background_2 = "Error while creating party: "..arg1
	else
		Background_2 = ""
	end
	Background_2.ErrorLabel.Text = Background_2
end
local var33_upvw = false
local CreateParty_upvr = require(ReplicatedStorage.Shared.Remotes).CreateParty
local function _() -- Line 173, Named "onServerAllowExitParty"
	--[[ Upvalues[1]:
		[1]: ExitParty_upvr (readonly)
	]]
	ExitParty_upvr.Enabled = true
end
ReplicatedStorage.Remotes.ReservationTimeout.OnClientEvent:Connect(function(arg1) -- Line 216
	--[[ Upvalues[2]:
		[1]: var24_upvw (read and write)
		[2]: CreateParty_upvr_2 (readonly)
	]]
	var24_upvw = true
	CreateParty_upvr_2.Enabled = false
end)
updateGameModeLabel_upvr()
CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.TextLabel.Text = tostring(var22_upvw.maxPlayers)
local Frame_2 = CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame
if 5 <= var22_upvw.maxPlayers then
	Frame_2 = Color3_fromRGB_result1_upvr_2
else
	Frame_2 = Color3_fromRGB_result1_upvr
end
Frame_2.TextLabel.TextColor3 = Frame_2
CreateParty_upvr_2.Background.ErrorLabel.Text = ""
CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.Add.Activated:Connect(function() -- Line 78, Named "onAddToPlayerCount"
	--[[ Upvalues[4]:
		[1]: var22_upvw (read and write)
		[2]: CreateParty_upvr_2 (readonly)
		[3]: Color3_fromRGB_result1_upvr_2 (readonly)
		[4]: Color3_fromRGB_result1_upvr (readonly)
	]]
	var22_upvw.maxPlayers = math.clamp(var22_upvw.maxPlayers + 1, 1, 10)
	CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.TextLabel.Text = tostring(var22_upvw.maxPlayers)
	local Frame = CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame
	if 5 <= var22_upvw.maxPlayers then
		Frame = Color3_fromRGB_result1_upvr_2
	else
		Frame = Color3_fromRGB_result1_upvr
	end
	Frame.TextLabel.TextColor3 = Frame
end)
CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.Subtract.Activated:Connect(function() -- Line 83, Named "onSubtractToPlayerCount"
	--[[ Upvalues[4]:
		[1]: var22_upvw (read and write)
		[2]: CreateParty_upvr_2 (readonly)
		[3]: Color3_fromRGB_result1_upvr_2 (readonly)
		[4]: Color3_fromRGB_result1_upvr (readonly)
	]]
	var22_upvw.maxPlayers = math.clamp(var22_upvw.maxPlayers - 1, 1, 10)
	CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.TextLabel.Text = tostring(var22_upvw.maxPlayers)
	local Frame_3 = CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame
	if 5 <= var22_upvw.maxPlayers then
		Frame_3 = Color3_fromRGB_result1_upvr_2
	else
		Frame_3 = Color3_fromRGB_result1_upvr
	end
	Frame_3.TextLabel.TextColor3 = Frame_3
end)
CreateParty_upvr_2.Background.CreateContainer.CreateButton.Activated:Connect(function() -- Line 143, Named "onCreatePartyActivated"
	--[[ Upvalues[5]:
		[1]: var33_upvw (read and write)
		[2]: CreateParty_upvr_2 (readonly)
		[3]: CreateParty_upvr (readonly)
		[4]: var22_upvw (read and write)
		[5]: var23_upvw (read and write)
	]]
	if var33_upvw then
	else
		var33_upvw = true
		CreateParty_upvr_2.Background.ErrorLabel.Text = ""
		CreateParty_upvr:InvokeServer(var22_upvw):andThen(function(arg1, arg2) -- Line 152
			--[[ Upvalues[3]:
				[1]: var33_upvw (copied, read and write)
				[2]: CreateParty_upvr_2 (copied, readonly)
				[3]: var23_upvw (copied, read and write)
			]]
			var33_upvw = false
			if arg1 then
				CreateParty_upvr_2.Enabled = false
				var23_upvw = false
			else
				local Background = CreateParty_upvr_2.Background
				if arg2 then
					Background = "Error while creating party: "..arg2
				else
					Background = ""
				end
				Background.ErrorLabel.Text = Background
			end
		end):timeout(10):catch(function() -- Line 162
			--[[ Upvalues[2]:
				[1]: var33_upvw (copied, read and write)
				[2]: CreateParty_upvr_2 (copied, readonly)
			]]
			var33_upvw = false
			CreateParty_upvr_2.Background.ErrorLabel.Text = "Error while creating party: ".."Server didnt respond in time or unknown error"
		end)
	end
end)
CreateParty_upvr_2.Background.SettingsContainer.GameModeSetting.Frame.Next.Button.Activated:Connect(function() -- Line 125, Named "onNextGameMode"
	--[[ Upvalues[4]:
		[1]: var17_upvr (readonly)
		[2]: var22_upvw (read and write)
		[3]: CreateParty_upvr_2 (readonly)
		[4]: updateGameModeLabel_upvr (readonly)
	]]
	local var31 = var17_upvr[table.find(var17_upvr, var22_upvw.gameMode) + 1]
	if not var31 then
		var31 = var17_upvr[1]
	end
	var22_upvw.gameMode = var31
	CreateParty_upvr_2.Background.SettingsContainer.GameModeSetting.Frame.GameMode.UIPageLayout:Next()
	updateGameModeLabel_upvr()
end)
CreateParty_upvr_2.Background.SettingsContainer.GameModeSetting.Frame.Previous.Button.Activated:Connect(function() -- Line 111, Named "onPreviousGameMode"
	--[[ Upvalues[4]:
		[1]: var17_upvr (readonly)
		[2]: var22_upvw (read and write)
		[3]: CreateParty_upvr_2 (readonly)
		[4]: updateGameModeLabel_upvr (readonly)
	]]
	local var30 = var17_upvr[table.find(var17_upvr, var22_upvw.gameMode) - 1]
	if not var30 then
		var30 = var17_upvr[#var17_upvr]
	end
	var22_upvw.gameMode = var30
	CreateParty_upvr_2.Background.SettingsContainer.GameModeSetting.Frame.GameMode.UIPageLayout:Previous()
	updateGameModeLabel_upvr()
end)
ExitParty_upvr.ExitButton.Activated:Connect(function() -- Line 168, Named "onExitPartyActivated"
	--[[ Upvalues[2]:
		[1]: ExitParty_upvr_2 (readonly)
		[2]: ExitParty_upvr (readonly)
	]]
	ExitParty_upvr_2:FireServer()
	ExitParty_upvr.Enabled = false
end)
ExitParty_upvr_2.OnClientEvent:Connect(function() -- Line 212, Named "onClientExitPartyEvent"
	--[[ Upvalues[1]:
		[1]: ExitParty_upvr (readonly)
	]]
	ExitParty_upvr.Enabled = true
end)
ReplicatedStorage.Remotes.TeleportZoneReserved.OnClientEvent:Connect(function(arg1) -- Line 177, Named "onServerTeleportZoneReserved"
	--[[ Upvalues[7]:
		[1]: CreateParty_upvr_2 (readonly)
		[2]: var22_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: Color3_fromRGB_result1_upvr_2 (readonly)
		[5]: Color3_fromRGB_result1_upvr (readonly)
		[6]: var23_upvw (read and write)
		[7]: var24_upvw (read and write)
	]]
	CreateParty_upvr_2.Enabled = true
	var22_upvw = tbl_upvr
	CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame.TextLabel.Text = tostring(var22_upvw.maxPlayers)
	local Frame_4 = CreateParty_upvr_2.Background.SettingsContainer.PlayerCountSetting.Frame
	if 5 <= var22_upvw.maxPlayers then
		Frame_4 = Color3_fromRGB_result1_upvr_2
	else
		Frame_4 = Color3_fromRGB_result1_upvr
	end
	Frame_4.TextLabel.TextColor3 = Frame_4
	var23_upvw = true
	var24_upvw = false
	task.spawn(function() -- Line 186
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: var23_upvw (copied, read and write)
			[3]: CreateParty_upvr_2 (copied, readonly)
			[4]: var24_upvw (copied, read and write)
		]]
		local tick_result1 = tick()
		while var23_upvw do
			local clamped = math.clamp(1 - (tick() - tick_result1) / (tick_result1 + arg1 - tick_result1), 0, 1)
			if clamped <= 0 then break end
			CreateParty_upvr_2.ExpireBar.Percentage.Size = UDim2.fromScale(clamped, 1)
			if not CreateParty_upvr_2.Enabled then break end
			if var24_upvw then break end
			task.wait()
		end
	end)
end)