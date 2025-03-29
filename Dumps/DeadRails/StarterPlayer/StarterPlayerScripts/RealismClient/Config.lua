--[[
    Script: StarterPlayer.StarterPlayerScripts.RealismClient.Config
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:34
-- Luau version 6, Types version 3
-- Time taken: 0.000931 seconds

return {
	Sounds = {
		Dirt = 178054124;
		Wood = 177940988;
		Concrete = 277067660;
		Grass = 4776173570;
		Metal = 4790537991;
		Sand = 4777003964;
		Fabric = 4776951843;
		Gravel = 4776998555;
		Marble = 4776962643;
	};
	MaterialMap = {
		Mud = "Dirt";
		Pebble = "Dirt";
		Ground = "Dirt";
		Sand = "Sand";
		Snow = "Sand";
		Sandstone = "Sand";
		Rock = "Gravel";
		Basalt = "Gravel";
		Asphalt = "Gravel";
		Glacier = "Gravel";
		Slate = "Gravel";
		WoodPlanks = "Wood";
		LeafyGrass = "Grass";
		Ice = "Marble";
		Salt = "Marble";
		Marble = "Marble";
		Pavement = "Marble";
		Limestone = "Marble";
		Foil = "Metal";
		DiamondPlate = "Metal";
		CorrodedMetal = "Metal";
	};
	RotationFactors = {
		Head = {
			Pitch = 0.8;
			Yaw = 0.75;
		};
		UpperTorso = {
			Pitch = 0.5;
			Yaw = 0.5;
		};
		LeftUpperArm = {
			Pitch = 0;
			Yaw = -0.5;
		};
		RightUpperArm = {
			Pitch = 0;
			Yaw = -0.5;
		};
		Torso = {
			Pitch = 0.4;
			Yaw = 0.2;
		};
		["Left Arm"] = {
			Pitch = 0;
			Yaw = -0.5;
		};
		["Right Arm"] = {
			Pitch = 0;
			Yaw = -0.5;
		};
		["Left Leg"] = {
			Pitch = 0;
			Yaw = -0.2;
		};
		["Right Leg"] = {
			Pitch = 0;
			Yaw = -0.2;
		};
	};
}