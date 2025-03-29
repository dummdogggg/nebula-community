--[[
    Script: ReplicatedStorage.ReplicaShared.Signal
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = nil;
local function v3(v1, ...) --[[ Line: 44 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 52 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
local v6 = {};
v6.__index = v6;
v5.Disconnect = function(v7) --[[ Line: 80 ]] --[[ Name: Disconnect ]]
    if v7.is_connected == false then
        return;
    else
        local l_signal_0 = v7.signal;
        v7.is_connected = false;
        l_signal_0.listener_count = l_signal_0.listener_count - 1;
        if l_signal_0.head == v7 then
            l_signal_0.head = v7.next;
            return;
        else
            local l_head_0 = l_signal_0.head;
            while l_head_0 ~= nil and l_head_0.next ~= v7 do
                l_head_0 = l_head_0.next;
            end;
            if l_head_0 ~= nil then
                l_head_0.next = v7.next;
            end;
            return;
        end;
    end;
end;
v6.New = function() --[[ Line: 104 ]] --[[ Name: New ]]
    -- upvalues: v6 (copy)
    local v10 = {
        head = nil, 
        listener_count = 0
    };
    setmetatable(v10, v6);
    return v10;
end;
v6.Connect = function(v11, v12) --[[ Line: 116 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    if type(v12) ~= "function" then
        error((("[%*]: \"listener\" must be a function; Received %*"):format(script.Name, (typeof(v12)))));
    end;
    local v13 = {
        listener = v12, 
        signal = v11, 
        next = v11.head, 
        is_connected = true
    };
    setmetatable(v13, v5);
    v11.head = v13;
    v11.listener_count = v11.listener_count + 1;
    return v13;
end;
v6.GetListenerCount = function(v14) --[[ Line: 137 ]] --[[ Name: GetListenerCount ]]
    return v14.listener_count;
end;
v6.Fire = function(v15, ...) --[[ Line: 141 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l_head_1 = v15.head;
    while l_head_1 ~= nil do
        if l_head_1.is_connected == true then
            if not v0 then
                v0 = coroutine.create(v4);
            end;
            task.spawn(v0, l_head_1.listener, ...);
        end;
        l_head_1 = l_head_1.next;
    end;
end;
v6.Wait = function(v17) --[[ Line: 154 ]] --[[ Name: Wait ]]
    local v18 = coroutine.running();
    local v19 = nil;
    v19 = v17:Connect(function(...) --[[ Line: 157 ]]
        -- upvalues: v19 (ref), v18 (copy)
        v19:Disconnect();
        task.spawn(v18, ...);
    end);
    return coroutine.yield();
end;
v6.FireUntil = function(v20, v21, ...) --[[ Line: 164 ]] --[[ Name: FireUntil ]]
    if type(v21) ~= "function" then
        error((("[%*]: \"continue_callback\" must be a function; Received %*"):format(script.Name, (typeof(v21)))));
    end;
    local v22 = {};
    local v23 = table.pack(...);
    local l_head_2 = v20.head;
    while l_head_2 ~= nil do
        table.insert(v22, l_head_2);
        l_head_2 = l_head_2.next;
    end;
    task.spawn(function() --[[ Line: 179 ]]
        -- upvalues: v22 (copy), v23 (copy), v21 (copy)
        for _, v26 in ipairs(v22) do
            if v26.is_connected == true then
                v26.listener(table.unpack(v23));
                if v21() ~= true then
                    return;
                end;
            end;
        end;
    end);
end;
return table.freeze({
    New = v6.New
});