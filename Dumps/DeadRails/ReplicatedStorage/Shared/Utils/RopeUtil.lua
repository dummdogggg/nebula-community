--[[
    Script: ReplicatedStorage.Shared.Utils.RopeUtil
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:01
-- Luau version 6, Types version 3
-- Time taken: 0.001351 seconds

function hasExistingConnection(arg1, arg2) -- Line 5
	local RopeReferences_2 = arg1:FindFirstChild("RopeReferences")
	if RopeReferences_2 then
		local Output_2 = RopeReferences_2:FindFirstChild("Output")
		if Output_2 then
			for _, v in Output_2:GetChildren() do
				if v:IsA("ObjectValue") and v.Value == arg2 then
					return true
				end
			end
		end
	end
	local RopeReferences_3 = arg2:FindFirstChild("RopeReferences")
	if RopeReferences_3 then
		local Output_3 = RopeReferences_3:FindFirstChild("Output")
		if Output_3 then
			for _, v_2 in Output_3:GetChildren() do
				if v_2:IsA("ObjectValue") and v_2.Value == arg1 then
					return true
				end
			end
		end
	end
	return false
end
return {
	hasExistingConnection = hasExistingConnection;
}