--[[
    Script: Workspace.meanspyrobot.AntiSlideClientTest
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:44:05
-- Luau version 6, Types version 3
-- Time taken: 0.000795 seconds

local HumanoidRootPart_upvr = script.Parent:WaitForChild("HumanoidRootPart")
local var3_upvw = 1
local tbl_upvr = {}
game:GetService("RunService").Stepped:Connect(function() -- Line 11
	--[[ Upvalues[3]:
		[1]: HumanoidRootPart_upvr (readonly)
		[2]: var3_upvw (read and write)
		[3]: tbl_upvr (readonly)
	]]
	tbl_upvr[var3_upvw % 20] = HumanoidRootPart_upvr.AssemblyLinearVelocity.Magnitude
	local var7 = 0
	for i = 1, #tbl_upvr do
		var7 += tbl_upvr[i]
	end
	var7 /= #tbl_upvr
	var3_upvw += 1
	if math.abs(var7) < 0.1 then
		HumanoidRootPart_upvr.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	end
end)