--[[
    Script: ReplicatedStorage.Packages.CharacterLoadedWrapper
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_Workspace_0 = game:GetService("Workspace");
local v1 = require("./Signal");
local function _(v2) --[[ Line: 29 ]] --[[ Name: isPrimaryPartSet ]]
    if v2.PrimaryPart then
        return true;
    else
        return false;
    end;
end;
local function _(v4) --[[ Line: 33 ]] --[[ Name: isHumanoidRootPartSet ]]
    if v4.RootPart then
        return true;
    else
        return false;
    end;
end;
local function _(v6) --[[ Line: 37 ]] --[[ Name: getHumanoid ]]
    return v6:FindFirstChildOfClass("Humanoid");
end;
local function _(v8) --[[ Line: 41 ]] --[[ Name: isHumanoidAlive ]]
    local l_Humanoid_0 = v8:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 then
        return false;
    else
        return (l_Humanoid_0.RootPart and true or false) and l_Humanoid_0.Health > 0;
    end;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v11 (copy)
    local v13 = {
        loaded = v1.new(), 
        died = v1.new(), 
        _player = v12, 
        _destroyed = false, 
        _connections = {}
    };
    setmetatable(v13, v11);
    v13:_listenForCharacterAdded();
    return v13;
end;
v11.isLoaded = function(v14, v15) --[[ Line: 80 ]] --[[ Name: isLoaded ]]
    -- upvalues: l_Workspace_0 (copy)
    local v16 = v15 or v14._player.Character;
    if not v16 then
        return false;
    else
        local v17 = v16.PrimaryPart and true or false;
        if v17 then
            local l_Humanoid_1 = v16:FindFirstChildOfClass("Humanoid");
            v17 = not not l_Humanoid_1 and (l_Humanoid_1.RootPart and true or false) and l_Humanoid_1.Health > 0 and v16:IsDescendantOf(l_Workspace_0);
        end;
        return v17;
    end;
end;
v11._listenForCharacterAdded = function(v19) --[[ Line: 95 ]] --[[ Name: _listenForCharacterAdded ]]
    task.spawn(function() --[[ Line: 96 ]]
        -- upvalues: v19 (copy)
        local l_Character_0 = v19._player.Character;
        if l_Character_0 then
            if v19:isLoaded() then
                v19:_listenForDeath(l_Character_0);
            else
                v19:_waitForLoadedAsync(l_Character_0);
            end;
        end;
        local v22 = v19._player.CharacterAdded:Connect(function(v21) --[[ Line: 108 ]]
            -- upvalues: v19 (ref)
            v19:_waitForLoadedAsync(v21);
        end);
        table.insert(v19._connections, v22);
    end);
end;
v11._waitForLoadedAsync = function(v23, v24) --[[ Line: 118 ]] --[[ Name: _waitForLoadedAsync ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v23:isLoaded() then
        if not v24:IsDescendantOf(l_Workspace_0) then
            v24.AncestryChanged:Wait();
        end;
        if v24.Parent then
            if not (v24.PrimaryPart and true or false) then
                v24:GetPropertyChangedSignal("PrimaryPart"):Wait();
            end;
            local l_Humanoid_2 = v24:FindFirstChildOfClass("Humanoid");
            if not l_Humanoid_2 then
                l_Humanoid_2 = v24:FindFirstChildOfClass("Humanoid");
                while not l_Humanoid_2 do
                    v24.ChildAdded:Wait();
                    l_Humanoid_2 = v24:FindFirstChildOfClass("Humanoid");
                end;
            end;
            local l_l_Humanoid_2_0 = l_Humanoid_2;
            while not (l_l_Humanoid_2_0.RootPart and true or false) do
                l_l_Humanoid_2_0.Changed:Wait();
            end;
        end;
        if not v23:isLoaded(v24) then
            return;
        end;
    end;
    if v23._destroyed then
        return;
    else
        v23:_listenForDeath(v24);
        v23.loaded:Fire(v24);
        return;
    end;
end;
v11._listenForDeath = function(v27, v28) --[[ Line: 169 ]] --[[ Name: _listenForDeath ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_Humanoid_3 = v28:FindFirstChildOfClass("Humanoid");
    local v30 = false;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local function v34() --[[ Line: 179 ]] --[[ Name: onDied ]]
        -- upvalues: v30 (ref), v31 (ref), v32 (ref), v33 (ref), v27 (copy), v28 (copy)
        if v30 then
            return;
        else
            v30 = true;
            v31:Disconnect();
            v32:Disconnect();
            v33:Disconnect();
            v27.died:Fire(v28);
            return;
        end;
    end;
    v31 = l_Humanoid_3.Died:Connect(v34);
    v33 = l_Humanoid_3.HealthChanged:Connect(function(v35) --[[ Line: 193 ]]
        -- upvalues: v30 (ref), v31 (ref), v32 (ref), v33 (ref), v27 (copy), v28 (copy)
        if v35 <= 0 then
            if v30 then
                return;
            else
                v30 = true;
                v31:Disconnect();
                v32:Disconnect();
                v33:Disconnect();
                v27.died:Fire(v28);
            end;
        end;
    end);
    v32 = v28.AncestryChanged:Connect(function() --[[ Line: 202 ]]
        -- upvalues: v28 (copy), l_Workspace_0 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v27 (copy)
        if not v28:IsDescendantOf(l_Workspace_0) then
            if v30 then
                return;
            else
                v30 = true;
                v31:Disconnect();
                v32:Disconnect();
                v33:Disconnect();
                v27.died:Fire(v28);
            end;
        end;
    end);
    table.insert(v27._connections, v31);
    table.insert(v27._connections, v32);
    table.insert(v27._connections, v33);
end;
v11.destroy = function(v36) --[[ Line: 213 ]] --[[ Name: destroy ]]
    v36.loaded:DisconnectAll();
    v36.died:DisconnectAll();
    v36._destroyed = true;
    for _, v38 in pairs(v36._connections) do
        v38:Disconnect();
    end;
end;
return v11;