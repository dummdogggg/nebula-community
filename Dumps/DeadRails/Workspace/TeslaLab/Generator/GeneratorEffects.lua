--[[
    Script: Workspace.TeslaLab.Generator.GeneratorEffects
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = false;
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v3 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v4 = 1;
local function v5() --[[ Line: 10 ]] --[[ Name: moveWheel ]]
    -- upvalues: l_RunService_0 (copy), v4 (ref)
    l_RunService_0.Heartbeat:Connect(function() --[[ Line: 11 ]]
        -- upvalues: v4 (ref)
        script.Parent.Wheel:PivotTo(script.Parent.Wheel:GetPivot() * CFrame.Angles(math.rad(v4), 0, 0));
    end);
end;
script.Parent.BasePart.PowerPrompt.Triggered:Connect(function() --[[ Line: 16 ]]
    -- upvalues: v0 (ref), l_TweenService_0 (copy), v3 (copy), v5 (copy), v4 (ref)
    if v0 then
        return;
    else
        v0 = true;
        l_TweenService_0:Create(script.Parent.PowerSwitch.Pivot, v3, {
            CFrame = script.Parent.PowerSwitch.Pivot.CFrame * CFrame.Angles(2.0943951023931953, 0, 0)
        }):Play();
        task.spawn(v5);
        script.Parent.Parent.Dohiggy.Ball.Electricity.Enabled = true;
        for v6 = 100, 500 do
            v4 = v6 / 100;
            task.wait(0.3);
            script.Parent.Parent.Dohiggy.Ball.Electricity.Size = NumberSequence.new(v6 / 100);
            script.Parent.PowerIndicator.Spedometer.SurfaceGui.ImageLabel.Gauge.Rotation = 120 + (v6 - 100) / 1.3333333333333333;
        end;
        return;
    end;
end);