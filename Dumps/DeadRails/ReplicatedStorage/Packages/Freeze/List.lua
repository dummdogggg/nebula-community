--[[
    Script: ReplicatedStorage.Packages.Freeze.List
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:56
-- Luau version 6, Types version 3
-- Time taken: 0.001180 seconds

return {
	append = require(script.compat.append);
	butLast = require(script.butLast);
	concat = require(script.concat);
	count = require(script.count);
	create = require(script.compat.create);
	equals = require(script.equals);
	every = require(script.every);
	filter = require(script.filter);
	filterNot = require(script.filterNot);
	find = require(script.find);
	findIndex = require(script.findIndex);
	findPair = require(script.findPair);
	findWhere = require(script.compat.findWhere);
	findWhereLast = require(script.compat.findWhereLast);
	first = require(script.first);
	flatten = require(script.flatten);
	forEach = require(script.forEach);
	get = require(script.get);
	has = require(script.has);
	includes = require(script.includes);
	indexOf = require(script.indexOf);
	insert = require(script.insert);
	join = require(script.compat.join);
	joinAsString = require(script.joinAsString);
	last = require(script.last);
	map = require(script.map);
	max = require(script.max);
	merge = require(script.merge);
	min = require(script.min);
	pop = require(script.pop);
	push = require(script.push);
	reduce = require(script.reduce);
	reduceRight = require(script.reduceRight);
	remove = require(script:FindFirstChild("remove"));
	removeIndex = require(script.compat.removeIndex);
	removeIndices = require(script.compat.removeIndices);
	removeValue = require(script.removeValue);
	removeValues = require(script.compat.removeValues);
	rest = require(script.rest);
	reverse = require(script.reverse);
	set = require(script.set);
	shift = require(script.shift);
	skip = require(script.skip);
	slice = require(script.slice);
	some = require(script.some);
	sort = require(script.sort);
	take = require(script.take);
	takeLast = require(script.takeLast);
	toSet = require(script.toSet);
	unshift = require(script.unshift);
	update = require(script.update);
	zip = require(script.zip);
}