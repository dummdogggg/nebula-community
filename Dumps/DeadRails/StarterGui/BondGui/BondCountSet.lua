--[[
    Script: StarterGui.BondGui.BondCountSet
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:41
-- Luau version 6, Types version 3
-- Time taken: 0.000782 seconds

local PlayerDataController = require(game:GetService("ReplicatedStorage").Client.Controllers.PlayerDataController)
while not PlayerDataController.isPlayerDataLoaded() do
	task.wait()
end
local any_getPlayerDataReplica_result1 = PlayerDataController.getPlayerDataReplica()
local function _(arg1) -- Line 18, Named "setBondsText"
	script.Parent.BondInfo.BondCount.Text = tostring(arg1)
end
any_getPlayerDataReplica_result1:OnSet({"bonds"}, function(arg1, arg2) -- Line 22
	script.Parent.BondInfo.BondCount.Text = tostring(arg1)
end)
script.Parent.BondInfo.BondCount.Text = tostring(any_getPlayerDataReplica_result1.Data.bonds)