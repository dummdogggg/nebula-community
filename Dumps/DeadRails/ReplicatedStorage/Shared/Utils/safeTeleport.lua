--[[
    Script: ReplicatedStorage.Shared.Utils.safeTeleport
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:10
-- Luau version 6, Types version 3
-- Time taken: 0.001141 seconds

local TeleportService_upvr = game:GetService("TeleportService")
local function safeTeleport_upvr(arg1, arg2, arg3) -- Line 7, Named "safeTeleport"
	--[[ Upvalues[1]:
		[1]: TeleportService_upvr (readonly)
	]]
	local var2
	repeat
		local pcall_result1, pcall_result2 = pcall(function() -- Line 12
			--[[ Upvalues[4]:
				[1]: TeleportService_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: arg2 (readonly)
				[4]: arg3 (readonly)
			]]
			return TeleportService_upvr:TeleportAsync(arg1, arg2, arg3)
		end)
		local var6 = pcall_result1
		var2 = pcall_result2
		if not var6 then
			task.wait(1)
		end
	until var6 and 0 + 1 == 5
	if not var6 then
		warn(var2)
	end
	return var6, var2
end
TeleportService_upvr.TeleportInitFailed:Connect(function(arg1, arg2, arg3, arg4, arg5) -- Line 28, Named "handleFailedTeleport"
	--[[ Upvalues[1]:
		[1]: safeTeleport_upvr (readonly)
	]]
	if arg2 == Enum.TeleportResult.Flooded then
		task.wait(15)
	elseif arg2 == Enum.TeleportResult.Failure then
		task.wait(1)
	else
		error("Invalid teleport [%s]: %s":format(arg2.Name, arg3))
	end
	local tbl = {}
	tbl[1] = arg1
	safeTeleport_upvr(arg4, tbl, arg5)
end)
return safeTeleport_upvr