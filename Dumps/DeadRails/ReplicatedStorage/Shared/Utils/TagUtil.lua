--[[
    Script: ReplicatedStorage.Shared.Utils.TagUtil
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return {
    findFirstAncestorOfClassWithTag = function(v0, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: findFirstAncestorOfClassWithTag ]]
        local v4 = v3 or 10;
        local l_v0_FirstAncestorOfClass_0 = v0:FindFirstAncestorOfClass(v1);
        local v6 = 0;
        while true do
            if l_v0_FirstAncestorOfClass_0 and v6 < v4 then
                if l_v0_FirstAncestorOfClass_0:HasTag(v2) then
                    return l_v0_FirstAncestorOfClass_0;
                else
                    l_v0_FirstAncestorOfClass_0 = l_v0_FirstAncestorOfClass_0:FindFirstAncestorOfClass(v1);
                    v6 = v6 + 1;
                end;
            else
                return nil;
            end;
        end;
    end
};