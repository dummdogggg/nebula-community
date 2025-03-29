--[[
    Script: ReplicatedStorage.Packages.Signal
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = nil;
local function v3(v1, ...) --[[ Line: 39 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 50 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 71 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v8 = {
        _connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = nil
    };
    setmetatable(v8, v5);
    return v8;
end;
v5.Disconnect = function(v9) --[[ Line: 84 ]] --[[ Name: Disconnect ]]
    assert(v9._connected, "Can't disconnect a connection twice.");
    v9._connected = false;
    if v9._signal._handlerListHead and v9._signal._handlerListHead == v9 then
        v9._signal._handlerListHead = v9._next;
        return;
    else
        local l__handlerListHead_0 = v9._signal._handlerListHead;
        while l__handlerListHead_0 and l__handlerListHead_0._next ~= v9 do
            l__handlerListHead_0 = l__handlerListHead_0._next;
        end;
        if l__handlerListHead_0 then
            l__handlerListHead_0._next = v9._next;
        end;
        return;
    end;
end;
local v11 = {};
v11.__index = v11;
v11.new = function() --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    return (setmetatable({
        _handlerListHead = nil
    }, v11));
end;
v11.Connect = function(v12, v13) --[[ Line: 122 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v14 = v5.new(v12, v13);
    if v12._handlerListHead then
        v14._next = v12._handlerListHead;
        v12._handlerListHead = v14;
        return v14;
    else
        v12._handlerListHead = v14;
        return v14;
    end;
end;
v11.DisconnectAll = function(v15) --[[ Line: 136 ]] --[[ Name: DisconnectAll ]]
    v15._handlerListHead = nil;
end;
v11.Fire = function(v16, ...) --[[ Line: 144 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l__handlerListHead_1 = v16._handlerListHead;
    while l__handlerListHead_1 do
        if l__handlerListHead_1._connected then
            if not v0 then
                v0 = coroutine.create(v4);
            end;
            task.spawn(v0, l__handlerListHead_1._fn, ...);
        end;
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
end;
v11.Wait = function(v18) --[[ Line: 159 ]] --[[ Name: Wait ]]
    local v19 = coroutine.running();
    local v20 = nil;
    v20 = v18:Connect(function(...) --[[ Line: 162 ]]
        -- upvalues: v20 (ref), v19 (copy)
        v20:Disconnect();
        task.spawn(v19, ...);
    end);
    return coroutine.yield();
end;
return v11;