--[[
    Script: ReplicatedStorage.Shared.Utils.RopeUtil
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

hasExistingConnection = function(v0, v1) --[[ Line: 5 ]] --[[ Name: hasExistingConnection ]]
    local l_RopeReferences_0 = v0:FindFirstChild("RopeReferences");
    if l_RopeReferences_0 then
        local l_Output_0 = l_RopeReferences_0:FindFirstChild("Output");
        if l_Output_0 then
            for _, v5 in l_Output_0:GetChildren() do
                if v5:IsA("ObjectValue") and v5.Value == v1 then
                    return true;
                end;
            end;
        end;
    end;
    local l_RopeReferences_1 = v1:FindFirstChild("RopeReferences");
    if l_RopeReferences_1 then
        local l_Output_1 = l_RopeReferences_1:FindFirstChild("Output");
        if l_Output_1 then
            for _, v9 in l_Output_1:GetChildren() do
                if v9:IsA("ObjectValue") and v9.Value == v0 then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
return {
    hasExistingConnection = hasExistingConnection
};