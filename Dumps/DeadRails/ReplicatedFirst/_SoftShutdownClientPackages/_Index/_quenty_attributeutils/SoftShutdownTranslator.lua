--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.SoftShutdownTranslator
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:19
-- Luau version 6, Types version 3
-- Time taken: 0.000462 seconds

return require(script.Parent.loader).load(script)("JSONTranslator").new("en", {
	shutdown = {
		lobby = {
			title = "Rebooting servers for update.";
			subtitle = "Teleporting back in a moment...";
		};
		restart = {
			title = "Rebooting servers for update.";
			subtitle = "Please wait...";
		};
		complete = {
			title = "Rebooting servers for update.";
			subtitle = "Update complete...";
		};
	};
})