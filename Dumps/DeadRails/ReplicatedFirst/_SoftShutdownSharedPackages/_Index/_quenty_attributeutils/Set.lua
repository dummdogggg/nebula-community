--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.Set
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:44
-- Luau version 6, Types version 3
-- Time taken: 0.001841 seconds

local module_6 = {
	union = function(arg1, arg2) -- Line 15, Named "union"
		local module_2 = {}
		for i, _ in pairs(arg1) do
			module_2[i] = true
		end
		for i_2, _ in pairs(arg2) do
			module_2[i_2] = true
		end
		return module_2
	end;
	unionUpdate = function(arg1, arg2) -- Line 32, Named "unionUpdate"
		for i_3, _ in pairs(arg2) do
			arg1[i_3] = true
		end
	end;
	intersection = function(arg1, arg2) -- Line 44, Named "intersection"
		for i_4, _ in pairs(arg1) do
			if arg2[i_4] ~= nil then
				({})[i_4] = true
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return {}
	end;
	copy = function(arg1) -- Line 59, Named "copy"
		local module_3 = {}
		for i_5, _ in pairs(arg1) do
			module_3[i_5] = true
		end
		return module_3
	end;
	fromTableValue = function(arg1) -- Line 72, Named "fromTableValue"
		local module_5 = {}
		for _, v_6 in pairs(arg1) do
			module_5[v_6] = true
		end
		return module_5
	end;
	fromList = module_6.fromTableValue;
	toList = function(arg1) -- Line 96, Named "toList"
		local module = {}
		for i_7, _ in pairs(arg1) do
			table.insert(module, i_7)
		end
		return module
	end;
	differenceUpdate = function(arg1, arg2) -- Line 112, Named "differenceUpdate"
		for i_8, _ in pairs(arg2) do
			arg1[i_8] = nil
		end
	end;
	difference = function(arg1, arg2) -- Line 124, Named "difference"
		local module_4 = {}
		for i_9, _ in pairs(arg1) do
			module_4[i_9] = true
		end
		for i_10, _ in pairs(arg2) do
			module_4[i_10] = nil
		end
		return module_4
	end;
}
return module_6