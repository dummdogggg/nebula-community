--[[
    Script: StarterPlayer.StarterCharacterScripts.MusicControl
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_TweenService_0 = game:GetService("TweenService");
local v1 = TweenInfo.new(3, Enum.EasingStyle.Linear);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent;
local l_Battle_0 = game.SoundService.Battle;
l_Battle_0:Stop();
l_Battle_0.Volume = 0.5;
local function v9() --[[ Line: 11 ]] --[[ Name: getDangerScore ]]
    -- upvalues: l_CollectionService_0 (copy), l_Parent_0 (copy)
    local v5 = 0;
    for _, v7 in pairs(l_CollectionService_0:GetTagged("Enemy")) do
        if v7 and v7:FindFirstChild("HumanoidRootPart") and v7:IsDescendantOf(workspace) and (v7.HumanoidRootPart.Position - l_Parent_0.HumanoidRootPart.Position).magnitude < 250 then
            local l_v7_Attribute_0 = v7:GetAttribute("DangerScore");
            if l_v7_Attribute_0 then
                v5 = v5 + l_v7_Attribute_0;
            end;
        end;
    end;
    return v5;
end;
local function _() --[[ Line: 25 ]] --[[ Name: playBattleSong ]]
    -- upvalues: l_Battle_0 (copy), l_TweenService_0 (copy), v1 (copy)
    l_Battle_0.Volume = 0;
    l_Battle_0:Play();
    l_TweenService_0:Create(l_Battle_0, v1, {
        Volume = 0.5
    }):Play();
end;
local function v11() --[[ Line: 32 ]] --[[ Name: stopBattleSong ]]
    -- upvalues: l_TweenService_0 (copy), l_Battle_0 (copy), v1 (copy)
    l_TweenService_0:Create(l_Battle_0, v1, {
        Volume = 0
    }):Play();
    task.wait(3);
    l_Battle_0:Stop();
    l_Battle_0.Volume = 0.5;
end;
while true do
    task.wait(5);
    local v12 = v9();
    if game.SoundService.Battle:GetAttribute("Muted") ~= true then
        if v12 >= 100 then
            if not l_Battle_0.IsPlaying then
                l_Battle_0.Volume = 0;
                l_Battle_0:Play();
                l_TweenService_0:Create(l_Battle_0, v1, {
                    Volume = 0.5
                }):Play();
            end;
        elseif l_Battle_0.IsPlaying then
            v11();
        end;
    end;
end;