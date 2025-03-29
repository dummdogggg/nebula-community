--[[
    Script: ReplicatedStorage.Client.Handlers.ClientCommandHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:04
-- Luau version 6, Types version 3
-- Time taken: 0.000485 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local module = {}
local Conch_upvr = require(ReplicatedStorage.Packages.Conch)
local ui_upvr = require(ReplicatedStorage.Packages.Conch.roblox_packages.ui)
function module.start() -- Line 9
	--[[ Upvalues[2]:
		[1]: Conch_upvr (readonly)
		[2]: ui_upvr (readonly)
	]]
	Conch_upvr.initiate_default_lifecycle()
	ui_upvr.bind_to(Enum.KeyCode.F10)
end
return module