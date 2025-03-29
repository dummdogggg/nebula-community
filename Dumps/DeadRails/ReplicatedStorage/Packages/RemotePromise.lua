--[[
    Script: ReplicatedStorage.Packages.RemotePromise
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.TypedPromise);
local _ = require(script.Trove);
local function v4() --[[ Line: 14 ]]

end;
local l_Remotes_0 = script:WaitForChild("Remotes");
local v6 = {
    Error = v2.Error
};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), l_Remotes_0 (copy), v6 (copy), v4 (copy)
    assert(typeof(v7) == "string", "First argument must be a string");
    local v8 = {
        OnServerInvoke = nil, 
        OnClientInvoke = nil, 
        _connections = {}, 
        _instances = {}
    };
    if l_RunService_0:IsServer() then
        v8._serverToClientEvent = l_Remotes_0:FindFirstChild((("S_%*"):format(v7)));
        v8._clientToServerEvent = l_Remotes_0:FindFirstChild((("C_%*"):format(v7)));
        if not v8._serverToClientEvent then
            v8._serverToClientEvent = Instance.new("RemoteEvent");
            v8._serverToClientEvent.Name = ("S_%*"):format(v7);
            v8._serverToClientEvent.Parent = l_Remotes_0;
            table.insert(v8._instances, v8._serverToClientEvent);
        end;
        if not v8._clientToServerEvent then
            v8._clientToServerEvent = Instance.new("RemoteEvent");
            v8._clientToServerEvent.Name = ("C_%*"):format(v7);
            v8._clientToServerEvent.Parent = l_Remotes_0;
            table.insert(v8._instances, v8._clientToServerEvent);
        end;
    else
        v8._serverToClientEvent = l_Remotes_0:WaitForChild((("S_%*"):format(v7)));
        v8._clientToServerEvent = l_Remotes_0:WaitForChild((("C_%*"):format(v7)));
    end;
    setmetatable(v8, v6);
    if l_RunService_0:IsServer() then
        local v11 = v8._clientToServerEvent.OnServerEvent:Connect(function(v9, ...) --[[ Line: 82 ]]
            -- upvalues: v8 (copy), v4 (ref)
            local v10 = if v8.OnServerInvoke then v8.OnServerInvoke else v4;
            v8._clientToServerEvent:FireClient(v9, v10(v9, ...));
        end);
        table.insert(v8._connections, v11);
        return v8;
    else
        if l_RunService_0:IsClient() then
            local v14 = v8._serverToClientEvent.OnClientEvent:Connect(function(v12, ...) --[[ Line: 90 ]]
                -- upvalues: v8 (copy), v4 (ref)
                local v13 = if v8.OnClientInvoke then v8.OnClientInvoke else v4;
                v8._serverToClientEvent:FireServer(v12, v13(...));
            end);
            table.insert(v8._connections, v14);
        end;
        return v8;
    end;
end;
v6.InvokeServer = function(v15, ...) --[[ Line: 102 ]] --[[ Name: InvokeServer ]]
    -- upvalues: l_RunService_0 (copy), v2 (copy)
    assert(l_RunService_0:IsClient(), "InvokeServer can only be called from a client!");
    v15._clientToServerEvent:FireServer(...);
    return v2.fromEvent(v15._clientToServerEvent.OnClientEvent, function() --[[ Line: 109 ]]
        return true;
    end);
end;
v6.InvokeClient = function(v16, v17, ...) --[[ Line: 115 ]] --[[ Name: InvokeClient ]]
    -- upvalues: l_RunService_0 (copy), l_HttpService_0 (copy), v2 (copy)
    assert(l_RunService_0:IsServer(), "InvokeClient can only be called from the server!");
    assert(v17 and v17:IsA("Player"), "Invalid player argument");
    local v18 = l_HttpService_0:GenerateGUID(false);
    v16._serverToClientEvent:FireClient(v17, v18, ...);
    local function v19(...) --[[ Line: 122 ]]
        return true;
    end;
    return v2.new(function(v20, _, v22) --[[ Line: 126 ]]
        -- upvalues: v16 (copy), v19 (copy)
        local v23 = nil;
        local v24 = false;
        local function v25() --[[ Line: 130 ]] --[[ Name: disconnect ]]
            -- upvalues: v23 (ref)
            if v23 then
                v23:Disconnect();
            end;
            v23 = nil;
        end;
        v23 = v16._serverToClientEvent.OnServerEvent:Connect(function(...) --[[ Line: 142 ]]
            -- upvalues: v19 (ref), v20 (copy), v23 (ref), v24 (ref)
            local v26 = v19(...);
            if v26 == true then
                v20(select(3, ...));
                if v23 then
                    if v23 then
                        v23:Disconnect();
                    end;
                    v23 = nil;
                    return;
                else
                    v24 = true;
                    return;
                end;
            else
                if type(v26) ~= "boolean" then
                    error("Predicate should always return a boolean");
                end;
                return;
            end;
        end);
        if v24 and v23 then
            return v25();
        else
            v22(v25);
            return;
        end;
    end);
end;
v6.Destroy = function(v27) --[[ Line: 166 ]] --[[ Name: Destroy ]]
    for _, v29 in v27._connections do
        v29:Disconnect();
    end;
    for _, v31 in v27._instances do
        v31:Destroy();
    end;
end;
return v6;