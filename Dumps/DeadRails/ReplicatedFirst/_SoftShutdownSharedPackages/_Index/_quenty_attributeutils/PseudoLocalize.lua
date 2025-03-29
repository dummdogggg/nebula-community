--[[
    Script: ReplicatedFirst._SoftShutdownSharedPackages._Index.@quenty/attributeutils.PseudoLocalize
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:28
-- Luau version 6, Types version 3
-- Time taken: 0.001757 seconds

local module_upvr = {}
function module_upvr.pseudoLocalize(arg1) -- Line 15
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local PSEUDO_CHARACTER_MAP = module_upvr.PSEUDO_CHARACTER_MAP
	local var10
	for i, v in utf8.graphemes(arg1) do
		local any_sub_result1 = arg1:sub(i, v)
		if any_sub_result1 == '{' or any_sub_result1 == '[' then
			var10 = var10..any_sub_result1
		elseif any_sub_result1 == '}' or any_sub_result1 == ']' then
			var10 = var10..any_sub_result1
		elseif not false and PSEUDO_CHARACTER_MAP[any_sub_result1] then
			var10 = var10..PSEUDO_CHARACTER_MAP[any_sub_result1]
		else
			var10 = var10..any_sub_result1
		end
	end
	return var10
end
function module_upvr.addToLocalizationTable(arg1, arg2, arg3) -- Line 46
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local var14 = arg2 or "qlp-pls"
	local var15 = arg3 or "en"
	local any_GetEntries_result1 = arg1:GetEntries()
	for _, v_2 in pairs(any_GetEntries_result1) do
		if not v_2.Values[var14] then
			local var20 = v_2.Values[var15]
			if var20 then
				v_2.Values[var14] = module_upvr.pseudoLocalize(var20)
			else
				warn("[PseudoLocalize.addToLocalizationTable] - No entry in key %q for locale %q":format(v_2.Key, var15))
			end
		end
	end
	arg1:SetEntries(any_GetEntries_result1)
end
module_upvr.PSEUDO_CHARACTER_MAP = {
	a = "\xE1";
	b = "β";
	c = "\xE7";
	d = "δ";
	e = "\xE8";
	f = "ƒ";
	g = "ϱ";
	h = "λ";
	i = "\xEF";
	j = 'J';
	k = "ƙ";
	l = "ℓ";
	m = "₥";
	n = "\xF1";
	o = "\xF4";
	p = "ƥ";
	q = '9';
	r = "ř";
	s = "ƨ";
	t = "ƭ";
	u = "\xFA";
	v = "Ʋ";
	w = "ω";
	x = "ж";
	y = "\xA5";
	z = "ƺ";
	A = "\xC2";
	B = "\xDF";
	C = "\xC7";
	D = "\xD0";
	E = "\xC9";
	F = 'F';
	G = 'G';
	H = 'H';
	I = "\xCC";
	J = 'J';
	K = 'K';
	L = "\xA3";
	M = 'M';
	N = 'N';
	O = "\xD3";
	P = "\xDE";
	Q = 'Q';
	R = 'R';
	S = "\xA7";
	T = 'T';
	U = "\xDB";
	V = 'V';
	W = 'W';
	X = 'X';
	Y = "\xDD";
	Z = 'Z';
}
return module_upvr