--[[
    Script: ReplicatedFirst.LoadingScreen
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_LoadingScreenPrefab_0 = script.Parent:FindFirstChild("LoadingScreenPrefab");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = {
    _instance = l_LoadingScreenPrefab_0:Clone(), 
    _startTime = 0, 
    _spinnerConnection = nil
};
v6.enableAsync = function() --[[ Line: 29 ]] --[[ Name: enableAsync ]]
    -- upvalues: l_LocalPlayer_0 (copy), v6 (copy), l_ReplicatedFirst_0 (copy), l_RunService_0 (copy)
    local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
    v6._instance.Parent = l_PlayerGui_0;
    l_ReplicatedFirst_0:RemoveDefaultLoadingScreen();
    v6._startTime = os.clock();
    local l_SpinnerImageLabel_0 = v6._instance:FindFirstChild("SizingFrame"):FindFirstChild("ContentFrame"):FindFirstChild("SpinnerImageLabel");
    v6._spinnerConnection = l_RunService_0.Heartbeat:Connect(function(v9) --[[ Line: 44 ]]
        -- upvalues: l_SpinnerImageLabel_0 (copy)
        local l_l_SpinnerImageLabel_0_0 = l_SpinnerImageLabel_0;
        l_l_SpinnerImageLabel_0_0.Rotation = l_l_SpinnerImageLabel_0_0.Rotation + v9 * 360;
    end);
    v6._startTime = os.clock();
end;
v6.updateDetailText = function(v11) --[[ Line: 50 ]] --[[ Name: updateDetailText ]]
    -- upvalues: v6 (copy)
    v6._instance:FindFirstChild("SizingFrame"):FindFirstChild("ContentFrame"):FindFirstChild("TextContentFrame"):FindFirstChild("DetailTextLabel").Text = v11;
end;
v6.disableAsync = function() --[[ Line: 60 ]] --[[ Name: disableAsync ]]
    -- upvalues: v6 (copy), l_TweenService_0 (copy)
    local v12 = os.clock() - v6._startTime;
    task.wait((math.max(0, 2 - v12)));
    if v6._spinnerConnection then
        v6._spinnerConnection:Disconnect();
    end;
    v6._instance:FindFirstChild("SizingFrame"):FindFirstChild("ContentFrame").Visible = false;
    local v13 = l_TweenService_0:Create(v6._instance:FindFirstChild("Background"), TweenInfo.new(1), {
        BackgroundTransparency = 1
    });
    task.spawn(function() --[[ Line: 80 ]]
        -- upvalues: v13 (copy), v6 (ref)
        v13:Play();
        v13.Completed:Wait();
        v6._instance:Destroy();
    end);
end;
return v6;