--[[
    Script: ReplicatedStorage.Shared.Utils.BadgeUtil
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_BadgeService_0 = game:GetService("BadgeService");
local l_Shared_0 = l_ReplicatedStorage_0.Shared;
local v3 = require(l_Shared_0.Utils.retryAsync);
return {
    safeGetBadgeInfoAsync = function(v4) --[[ Line: 11 ]] --[[ Name: safeGetBadgeInfoAsync ]]
        -- upvalues: v3 (copy), l_BadgeService_0 (copy)
        return v3(function() --[[ Line: 12 ]]
            -- upvalues: l_BadgeService_0 (ref), v4 (copy)
            return l_BadgeService_0:GetBadgeInfoAsync(v4);
        end, 3, 3, 2);
    end, 
    safeUserHasBadgeAsync = function(v5, v6) --[[ Line: 17 ]] --[[ Name: safeUserHasBadgeAsync ]]
        -- upvalues: v3 (copy), l_BadgeService_0 (copy)
        return v3(function() --[[ Line: 18 ]]
            -- upvalues: l_BadgeService_0 (ref), v5 (copy), v6 (copy)
            return l_BadgeService_0:UserHasBadgeAsync(v5, v6);
        end, 3, 3, 2);
    end, 
    safeAwardBadgeAsync = function(v7, v8) --[[ Line: 23 ]] --[[ Name: safeAwardBadgeAsync ]]
        -- upvalues: v3 (copy), l_BadgeService_0 (copy)
        local v9, v10 = v3(function() --[[ Line: 12 ]]
            -- upvalues: l_BadgeService_0 (ref), v8 (copy)
            return l_BadgeService_0:GetBadgeInfoAsync(v8);
        end, 3, 3, 2);
        local l_v9_0 = v9;
        local l_v10_0 = v10;
        if not l_v9_0 then
            return false, "Failed to retrieve badge information";
        elseif l_v10_0 and l_v10_0.IsEnabled ~= true then
            return false, "Badge is not awardable";
        else
            local v13, v14 = v3(function() --[[ Line: 18 ]]
                -- upvalues: l_BadgeService_0 (ref), v7 (copy), v8 (copy)
                return l_BadgeService_0:UserHasBadgeAsync(v7, v8);
            end, 3, 3, 2);
            v9 = v13;
            v10 = v14;
            if not v9 then
                return false, "Failed to check user's badge status";
            elseif v10 then
                return false, "User already owns this badge";
            else
                return (v3(function() --[[ Line: 45 ]]
                    -- upvalues: l_BadgeService_0 (ref), v7 (copy), v8 (copy)
                    return l_BadgeService_0:AwardBadge(v7, v8);
                end, 3, 3, 2));
            end;
        end;
    end
};