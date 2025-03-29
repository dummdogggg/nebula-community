--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUI
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:03
-- Luau version 6, Types version 3
-- Time taken: 0.000769 seconds

local var1_upvw = false
local module_upvr = {}
function module_upvr.setCameraModeToastEnabled(arg1) -- Line 10
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: module_upvr (readonly)
	]]
	if not arg1 and not var1_upvw then
	else
		if not var1_upvw then
			var1_upvw = true
		end
		if not arg1 then
			module_upvr.setCameraModeToastOpen(false)
		end
	end
end
local StarterGui_upvr = game:GetService("StarterGui")
function module_upvr.setCameraModeToastOpen(arg1) -- Line 24
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: StarterGui_upvr (readonly)
	]]
	assert(var1_upvw)
	if arg1 then
		StarterGui_upvr:SetCore("SendNotification", {
			Title = "Camera Control Enabled";
			Text = "Right click to toggle";
			Duration = 3;
		})
	end
end
return module_upvr