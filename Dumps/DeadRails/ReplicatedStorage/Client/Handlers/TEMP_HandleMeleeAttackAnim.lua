--[[
    Script: ReplicatedStorage.Client.Handlers.TEMP_HandleMeleeAttackAnim
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
require(l_ReplicatedStorage_0.Shared.Remotes).Events.TEMP_PlayMeleeAttack.OnClientEvent:Connect(function(v1, v2) --[[ Line: 5 ]] --[[ Name: onPlayMeleeAttack ]]
    local l_Animator_0 = v1:FindFirstChildOfClass("Animator");
    if l_Animator_0 then
        l_Animator_0:LoadAnimation(v2):Play();
        return;
    else
        warn((("Cannot PlayMeleeAttack; Missing animator: %*"):format((v1:GetFullName()))));
        return;
    end;
end);