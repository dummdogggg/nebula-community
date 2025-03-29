--[[
    Script: StarterGui.TutorialGui.TutorialTextChange
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = {
    [1] = "Drag gold bar to the table to sell it (0/1)", 
    [2] = "Buy coal from the general store (0/1)", 
    [3] = "Use the coal to refuel the train (0/1)"
};
local v1 = {
    [1] = Vector3.new(128.52699279785156, 28.25, 29924.873046875, 0), 
    [2] = Vector3.new(128.52699279785156, 28.25, 29800, 0), 
    [3] = Vector3.new(56.527000427246094, 28.25, 29886.873046875, 0)
};
if require(game.ReplicatedStorage.Client.Controllers.ActionController.InputCategorizer).getLastInputCategory() == "KeyboardAndMouse" then
    script.Parent.MouseUnlockText.Visible = true;
end;
local v2 = game.ReplicatedStorage.Assets.ObjectiveMarker:Clone();
v2.Parent = game.Workspace;
local l_TutorialStep_0 = game.ReplicatedStorage.TutorialStep;
if l_TutorialStep_0.Value == 4 then
    script.Parent.TutorialText.Visible = false;
    v2:Destroy();
    script.Parent.MouseUnlockText.Visible = false;
end;
v2.Position = v1[l_TutorialStep_0.Value];
script.Parent.TutorialText.Text = v0[l_TutorialStep_0.Value];
l_TutorialStep_0.Changed:Connect(function(v4) --[[ Line: 34 ]]
    -- upvalues: v2 (copy), v1 (copy), v0 (copy)
    if v4 == 4 then
        script.Parent.TutorialText.Visible = false;
        v2:Destroy();
        script.Parent.MouseUnlockText.Visible = false;
        return;
    else
        v2.Position = v1[v4];
        script.Parent.TutorialText.Text = v0[v4];
        return;
    end;
end);