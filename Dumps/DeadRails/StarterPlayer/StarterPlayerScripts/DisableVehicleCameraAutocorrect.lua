--[[
    Script: StarterPlayer.StarterPlayerScripts.DisableVehicleCameraAutocorrect
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

require(script.Parent:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("VehicleCamera"):WaitForChild("VehicleCameraConfig")).autocorrectResponse = 0;