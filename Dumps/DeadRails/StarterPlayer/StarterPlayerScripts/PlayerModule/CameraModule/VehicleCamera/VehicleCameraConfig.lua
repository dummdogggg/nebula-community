--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraConfig
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:47
-- Luau version 6, Types version 3
-- Time taken: 0.000492 seconds

return {
	pitchStiffness = 0.5;
	yawStiffness = 2.5;
	autocorrectDelay = 1;
	autocorrectMinCarSpeed = 16;
	autocorrectMaxCarSpeed = 32;
	autocorrectResponse = 0.5;
	cutoffMinAngularVelYaw = 60;
	cutoffMaxAngularVelYaw = 180;
	cutoffMinAngularVelPitch = 15;
	cutoffMaxAngularVelPitch = 60;
	pitchBaseAngle = 18;
	pitchDeadzoneAngle = 12;
	firstPersonResponseMul = 10;
	yawReponseDampingRising = 1;
	yawResponseDampingFalling = 3;
	pitchReponseDampingRising = 1;
	pitchResponseDampingFalling = 3;
	verticalCenterOffset = 0.33;
}