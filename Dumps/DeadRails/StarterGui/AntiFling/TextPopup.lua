--[[
    Script: StarterGui.AntiFling.TextPopup
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

game.ReplicatedStorage.Remotes.FlingText.OnClientEvent:Connect(function(v0, v1) --[[ Line: 1 ]]
    v1 = math.floor(v1);
    local v2 = "Elevation = ";
    if v0 then
        v2 = "Speed = ";
    end;
    script.Parent.Reason.Text = v2 .. v1;
    script.Parent.Enabled = true;
    task.wait(5);
    script.Parent.Enabled = false;
end);