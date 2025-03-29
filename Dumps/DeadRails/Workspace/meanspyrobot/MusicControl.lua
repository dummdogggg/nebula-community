--[[
    Script: Workspace.meanspyrobot.MusicControl
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_TweenService_0 = game:GetService("TweenService");
local v1 = TweenInfo.new(3, Enum.EasingStyle.Linear);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent;
local function v12() --[[ Line: 7 ]] --[[ Name: getDangerScore ]]
    -- upvalues: l_CollectionService_0 (copy), l_Parent_0 (copy)
    local v4 = 0;
    local v5 = 0;
    local v6 = 0;
    local v7 = 0;
    for _, v9 in pairs(l_CollectionService_0:GetTagged("Enemy")) do
        if v9 and v9:FindFirstChild("HumanoidRootPart") and v9:IsDescendantOf(workspace) and (v9.HumanoidRootPart.Position - l_Parent_0.HumanoidRootPart.Position).magnitude < 300 then
            local l_v9_Attribute_0 = v9:GetAttribute("DangerScore");
            if l_v9_Attribute_0 then
                v4 = v4 + l_v9_Attribute_0;
                if v9:HasTag("Outlaw") then
                    v5 = v5 + l_v9_Attribute_0;
                elseif v9:HasTag("Zombie") then
                    v6 = v6 + l_v9_Attribute_0;
                elseif v9:HasTag("Supernatural") then
                    v7 = v7 + l_v9_Attribute_0;
                end;
            end;
        end;
    end;
    local v11 = "Unknown";
    if v6 <= v5 and v7 <= v5 then
        v11 = "Outlaw";
    elseif v5 <= v6 and v7 <= v6 then
        v11 = "Zombie";
    elseif v5 <= v7 and v6 <= v7 then
        v11 = "Supernatural";
    end;
    return v4, v11;
end;
local v13 = {
    Outlaw = game.SoundService.BattleSongs.BanditBattle, 
    Zombie = game.SoundService.BattleSongs.ZombieBattle, 
    Supernatural = game.SoundService.BattleSongs.SupernaturalBattle, 
    Unknown = game.SoundService.BattleSongs.ZombieBattle
};
local function v17(v14) --[[ Line: 49 ]] --[[ Name: stopBattleSongs ]]
    -- upvalues: l_TweenService_0 (copy), v1 (copy)
    for _, v16 in pairs(game.SoundService.BattleSongs:GetChildren()) do
        if v16 ~= v14 and v16.IsPlaying then
            l_TweenService_0:Create(v16, v1, {
                Volume = 0
            }):Play();
            task.wait(3);
            v16:Stop();
            v16.Volume = 0.5;
        end;
    end;
end;
local function v19(v18) --[[ Line: 67 ]] --[[ Name: playBattleSong ]]
    -- upvalues: v17 (copy), l_TweenService_0 (copy), v1 (copy)
    task.spawn(v17, v18);
    v18.Volume = 0;
    v18:Play();
    l_TweenService_0:Create(v18, v1, {
        Volume = 0.5
    }):Play();
end;
while true do
    task.wait(5);
    local v20, v21 = v12();
    if game.SoundService.Battle:GetAttribute("Muted") ~= true then
        local v22 = v13[v21];
        if v20 >= 75 then
            if not v22.IsPlaying then
                v19(v22);
            end;
        else
            v17();
        end;
    end;
end;