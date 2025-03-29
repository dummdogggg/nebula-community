--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.String
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:58
-- Luau version 6, Types version 3
-- Time taken: 0.003091 seconds

local module_upvr = {
	trim = function(arg1, arg2) -- Line 15, Named "trim"
		if not arg2 then
			return arg1:match("^%s*(.-)%s*$")
		end
		return arg1:match('^'..arg2.."*(.-)"..arg2.."*$")
	end;
	toCamelCase = function(arg1) -- Line 31, Named "toCamelCase"
		return arg1:lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.upper):gsub("%p", "")
	end;
	uppercaseFirstLetter = function(arg1) -- Line 46, Named "uppercaseFirstLetter"
		return arg1:gsub("^%a", string.upper)
	end;
	toLowerCamelCase = function(arg1) -- Line 55, Named "toLowerCamelCase"
		return arg1:lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.lower):gsub("%p", "")
	end;
	toPrivateCase = function(arg1) -- Line 69, Named "toPrivateCase"
		return '_'..arg1:sub(1, 1):lower()..arg1:sub(2, #arg1)
	end;
	trimFront = function(arg1, arg2) -- Line 79, Named "trimFront"
		local var2 = arg2 or "%s"
		return arg1:gsub('^'..var2.."*(.-)"..var2..'*', "%1")
	end;
	checkNumOfCharacterInString = function(arg1, arg2) -- Line 95, Named "checkNumOfCharacterInString"
		local var5 = 0
		for _ in string.gmatch(arg1, arg2) do
			var5 += 1
		end
		return var5
	end;
}
function module_upvr.isEmptyOrWhitespaceOrNil(arg1) -- Line 108
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var10 = true
	if type(arg1) == "string" then
		var10 = true
		if arg1 ~= "" then
			var10 = module_upvr.isWhitespace(arg1)
		end
	end
	return var10
end
function module_upvr.isWhitespace(arg1) -- Line 117
	local var11
	if string.match(arg1, "[%s]+") ~= arg1 then
		var11 = false
	else
		var11 = true
	end
	return var11
end
function module_upvr.elipseLimit(arg1, arg2) -- Line 127
	local var12
	if arg2 < #arg1 then
		var12 = var12:sub(1, arg2 - 3).."..."
	end
	return var12
end
function module_upvr.removePrefix(arg1, arg2) -- Line 140
	if arg1:sub(1, #arg2) == arg2 then
		return arg1:sub(#arg2 + 1)
	end
	return arg1
end
function module_upvr.removePostfix(arg1, arg2) -- Line 154
	if arg1:sub(-(#arg2)) == arg2 then
		return arg1:sub(1, -(#arg2) - 1)
	end
	return arg1
end
function module_upvr.endsWith(arg1, arg2) -- Line 168
	local var13
	if arg1:sub(-(#arg2)) ~= arg2 then
		var13 = false
	else
		var13 = true
	end
	return var13
end
function module_upvr.startsWith(arg1, arg2) -- Line 178
	local var14
	if arg1:sub(1, #arg2) ~= arg2 then
		var14 = false
	else
		var14 = true
	end
	return var14
end
function module_upvr.addCommas(arg1) -- Line 187
	local var15
	if type(arg1) == "number" then
		var15 = tostring(var15)
	end
	while -1 ~= 0 do
		local string_gsub_result1, _ = string.gsub(var15, "^(-?%d+)(%d%d%d)", "%1,%2")
		var15 = string_gsub_result1
	end
	return var15
end
return module_upvr