--[[
    Script: ReplicatedStorage.Packages.Conch.roblox_packages..pesde.centau_vide@0.3.1.vide
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:34
-- Luau version 6, Types version 3
-- Time taken: 0.002392 seconds

if not game then
	script = require("test/relative-string") -- Setting global
end
local var2, var3 = require(script.maps)()
local var4, var5_upvr = require(script.spring)()
local throw_upvr = require(script.throw)
local flags_upvr = require(script.flags)
local function step(arg1) -- Line 35
	--[[ Upvalues[1]:
		[1]: var5_upvr (readonly)
	]]
	if game then
		debug.profilebegin("VIDE STEP")
		debug.profilebegin("VIDE SPRING")
	end
	var5_upvr(arg1)
	if game then
		debug.profileend()
		debug.profileend()
	end
end
local game_upvw = game
if game_upvw then
	game_upvw = game:GetService("RunService").Heartbeat
	game_upvw = game_upvw:Connect(function(arg1) -- Line 49
		--[[ Upvalues[1]:
			[1]: step (readonly)
		]]
		task.defer(step, arg1)
	end)
end
local module = {
	version = {
		major = 0;
		minor = 3;
		patch = 1;
	};
	root = require(script.root);
	mount = require(script.mount);
	create = require(script.create);
	source = require(script.source);
	effect = require(script.effect);
	derive = require(script.derive);
	switch = require(script.switch);
	show = require(script.show);
	indexes = var2;
	values = var3;
	cleanup = require(script.cleanup);
	untrack = require(script.untrack);
	read = require(script.read);
	batch = require(script.batch);
	context = require(script.context);
	spring = var4;
	action = require(script.action)();
	changed = require(script.changed);
	strict = nil;
}
local apply_2_upvr = require(script.apply)
function module.apply(arg1) -- Line 86
	--[[ Upvalues[1]:
		[1]: apply_2_upvr (readonly)
	]]
	return function(arg1_2) -- Line 87
		--[[ Upvalues[2]:
			[1]: apply_2_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		apply_2_upvr(arg1, arg1_2)
		return arg1
	end
end
function module.step(arg1) -- Line 94
	--[[ Upvalues[2]:
		[1]: game_upvw (read and write)
		[2]: step (readonly)
	]]
	if game_upvw then
		game_upvw:Disconnect()
		game_upvw = nil
	end
	step(arg1)
end
setmetatable(module, {
	__index = function(arg1, arg2) -- Line 104, Named "__index"
		--[[ Upvalues[2]:
			[1]: flags_upvr (readonly)
			[2]: throw_upvr (readonly)
		]]
		if arg2 == "strict" then
			return flags_upvr.strict
		end
		throw_upvr(`{tostring(arg2)} is not a valid member of vide`)
	end;
	__newindex = function(arg1, arg2, arg3) -- Line 112, Named "__newindex"
		--[[ Upvalues[2]:
			[1]: flags_upvr (readonly)
			[2]: throw_upvr (readonly)
		]]
		if arg2 == "strict" then
			flags_upvr.strict = arg3
		else
			throw_upvr(`{tostring(arg2)} is not a valid member of vide`)
		end
	end;
})
return module