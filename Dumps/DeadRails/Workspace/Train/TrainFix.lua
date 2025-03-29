--[[
    Script: Workspace.Train.TrainFix
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return {
    GetClosestRailToPlayer = function() --[[ Line: 5 ]] --[[ Name: GetClosestRailToPlayer ]]
        local v0 = 1e999;
        local v1 = nil;
        for _, v3 in pairs(game.Players:GetPlayers()) do
            local l_Character_0 = v3.Character;
            if l_Character_0 then
                for _, v6 in pairs(game.Workspace.RailSegments:GetChildren()) do
                    local l_Magnitude_0 = (v6:GetPivot().Position - l_Character_0.HumanoidRootPart.Position).Magnitude;
                    if l_Magnitude_0 < v0 then
                        v0 = l_Magnitude_0;
                        v1 = v6;
                        if l_Magnitude_0 < 50 then
                            return v6;
                        end;
                    end;
                end;
            end;
        end;
        return v1;
    end
};