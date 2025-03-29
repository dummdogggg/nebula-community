--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.BasicPane
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:20
-- Luau version 6, Types version 3
-- Time taken: 0.004938 seconds

local any_load_result1 = require(script.Parent.loader).load(script)
local var1_result1_upvr = any_load_result1("Signal")
local any_load_result1_result1_upvr = any_load_result1("Maid")
local module_upvr = {}
module_upvr.__index = module_upvr
module_upvr.ClassName = "BasicPane"
function module_upvr.isBasicPane(arg1) -- Line 36
	--[[ Upvalues[2]:
		[1]: any_load_result1_result1_upvr (readonly)
		[2]: var1_result1_upvr (readonly)
	]]
	local var12 = false
	if type(arg1) == "table" then
		var12 = any_load_result1_result1_upvr.isMaid(arg1._maid)
		if var12 then
			var12 = var1_result1_upvr.isSignal(arg1.VisibleChanged)
			if var12 then
				var12 = false
				if type(arg1.SetVisible) == "function" then
					var12 = false
					if type(arg1.IsVisible) == "function" then
						var12 = false
						if type(arg1.Show) == "function" then
							var12 = false
							if type(arg1.Hide) == "function" then
								var12 = false
								if type(arg1.Toggle) == "function" then
									if type(arg1.Destroy) ~= "function" then
										var12 = false
									else
										var12 = true
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return var12
end
function module_upvr.new(arg1) -- Line 72
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: any_load_result1_result1_upvr (readonly)
		[3]: var1_result1_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1._maid = any_load_result1_result1_upvr.new()
	setmetatable_result1.Maid = setmetatable_result1._maid
	setmetatable_result1._visible = false
	setmetatable_result1.VisibleChanged = var1_result1_upvr.new()
	setmetatable_result1._maid:GiveTask(setmetatable_result1.VisibleChanged)
	if arg1 then
		setmetatable_result1._gui = arg1
		setmetatable_result1.Gui = arg1
		setmetatable_result1._maid:GiveTask(arg1)
	end
	return setmetatable_result1
end
function module_upvr.SetVisible(arg1, arg2, arg3) -- Line 98
	--[[ Upvalues[1]:
		[1]: any_load_result1_result1_upvr (readonly)
	]]
	local var14
	if type(arg2) ~= "boolean" then
		var14 = false
	else
		var14 = true
	end
	assert(var14, "Bad isVisible")
	if arg1._visible ~= arg2 then
		arg1._visible = arg2
		var14 = any_load_result1_result1_upvr
		local any_new_result1 = var14.new()
		var14 = arg1._maid
		var14._paneVisibleMaid = any_new_result1
		var14 = arg1.VisibleChanged:Fire
		var14(arg1._visible, arg3, any_new_result1)
	end
end
function module_upvr.Show(arg1, arg2) -- Line 114
	arg1:SetVisible(true, arg2)
end
function module_upvr.Hide(arg1, arg2) -- Line 122
	arg1:SetVisible(false, arg2)
end
function module_upvr.Toggle(arg1, arg2) -- Line 130
	arg1:SetVisible(not arg1._visible, arg2)
end
function module_upvr.IsVisible(arg1) -- Line 138
	return arg1._visible
end
function module_upvr.Destroy(arg1) -- Line 146
	arg1._maid:DoCleaning()
	arg1._maid = nil
	setmetatable(arg1, nil)
end
return module_upvr