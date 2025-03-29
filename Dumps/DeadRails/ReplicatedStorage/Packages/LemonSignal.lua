--[[
    Script: ReplicatedStorage.Packages.LemonSignal
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

--!native
local v0 = {};
local function v3(v1, v2, ...) --[[ Line: 25 ]] --[[ Name: runCallback ]]
    -- upvalues: v0 (copy)
    v1(...);
    table.insert(v0, v2);
end;
local function v4() --[[ Line: 30 ]] --[[ Name: yielder ]]
    -- upvalues: v3 (copy)
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
local function v10(v6) --[[ Line: 39 ]] --[[ Name: disconnect ]]
    if not v6.Connected then
        return;
    else
        v6.Connected = false;
        local l__next_0 = v6._next;
        local l__prev_0 = v6._prev;
        if l__next_0 then
            l__next_0._prev = l__prev_0;
        end;
        if l__prev_0 then
            l__prev_0._next = l__next_0;
        end;
        local l__signal_0 = v6._signal;
        if l__signal_0._head == v6 then
            l__signal_0._head = l__next_0;
        end;
        return;
    end;
end;
local function v14(v11) --[[ Line: 61 ]] --[[ Name: reconnect ]]
    if v11.Connected then
        return;
    else
        v11.Connected = true;
        local l__signal_1 = v11._signal;
        local l__head_0 = l__signal_1._head;
        if l__head_0 then
            l__head_0._prev = v11;
        end;
        l__signal_1._head = v11;
        v11._next = l__head_0;
        v11._prev = false;
        return;
    end;
end;
v5.Disconnect = v10;
v5.Reconnect = v14;
local v15 = {};
v15.__index = v15;
local v16 = nil;
local v17 = nil;
if task then
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v16 = l_BindableEvent_0.Event.Connect;
    v17 = l_BindableEvent_0.Event:Connect(function() --[[ Line: 90 ]]

    end).Disconnect;
    l_BindableEvent_0:Destroy();
end;
local function v23(v19, v20, ...) --[[ Line: 95 ]] --[[ Name: connect ]]
    -- upvalues: v5 (copy)
    local l__head_1 = v19._head;
    local v22 = setmetatable({
        Connected = true, 
        _signal = v19, 
        _fn = v20, 
        _varargs = not not ... and {
            ...
        }, 
        _next = l__head_1, 
        _prev = false
    }, v5);
    if l__head_1 then
        l__head_1._prev = v22;
    end;
    v19._head = v22;
    return v22;
end;
local function v31(v24, v25, ...) --[[ Line: 114 ]] --[[ Name: once ]]
    -- upvalues: v23 (copy)
    local v26 = nil;
    v26 = v23(v24, function(...) --[[ Line: 116 ]]
        -- upvalues: v26 (ref), v25 (copy)
        local l_v26_0 = v26;
        if l_v26_0.Connected then
            l_v26_0.Connected = false;
            local l__next_1 = l_v26_0._next;
            local l__prev_1 = l_v26_0._prev;
            if l__next_1 then
                l__next_1._prev = l__prev_1;
            end;
            if l__prev_1 then
                l__prev_1._next = l__next_1;
            end;
            local l__signal_2 = l_v26_0._signal;
            if l__signal_2._head == l_v26_0 then
                l__signal_2._head = l__next_1;
            end;
        end;
        v25(...);
    end, ...);
    return v26;
end;
local v47 = task and function(v32) --[[ Line: 124 ]]
    -- upvalues: v23 (copy)
    local v33 = coroutine.running();
    local v34 = nil;
    v34 = v23(v32, function(...) --[[ Line: 127 ]]
        -- upvalues: v34 (ref), v33 (copy)
        local l_v34_0 = v34;
        if l_v34_0.Connected then
            l_v34_0.Connected = false;
            local l__next_2 = l_v34_0._next;
            local l__prev_2 = l_v34_0._prev;
            if l__next_2 then
                l__next_2._prev = l__prev_2;
            end;
            if l__prev_2 then
                l__prev_2._next = l__next_2;
            end;
            local l__signal_3 = l_v34_0._signal;
            if l__signal_3._head == l_v34_0 then
                l__signal_3._head = l__next_2;
            end;
        end;
        task.spawn(v33, ...);
    end);
    return coroutine.yield();
end or function(v39) --[[ Line: 133 ]]
    -- upvalues: v23 (copy)
    local v40 = coroutine.running();
    local v41 = nil;
    v41 = v23(v39, function(...) --[[ Line: 136 ]]
        -- upvalues: v41 (ref), v40 (copy)
        local l_v41_0 = v41;
        if l_v41_0.Connected then
            l_v41_0.Connected = false;
            local l__next_3 = l_v41_0._next;
            local l__prev_3 = l_v41_0._prev;
            if l__next_3 then
                l__next_3._prev = l__prev_3;
            end;
            if l__prev_3 then
                l__prev_3._next = l__next_3;
            end;
            local l__signal_4 = l_v41_0._signal;
            if l__signal_4._head == l_v41_0 then
                l__signal_4._head = l__next_3;
            end;
        end;
        local v46;
        l_v41_0, v46 = coroutine.resume(v40, ...);
        if not l_v41_0 then
            error(v46, 0);
        end;
    end);
    return coroutine.yield();
end;
local v70 = task and function(v48, ...) --[[ Line: 147 ]]
    -- upvalues: v0 (copy), v4 (copy)
    local l__head_2 = v48._head;
    while l__head_2 do
        local v50 = nil;
        if #v0 > 0 then
            v50 = v0[#v0];
            v0[#v0] = nil;
        else
            v50 = coroutine.create(v4);
            coroutine.resume(v50);
        end;
        if not l__head_2._varargs then
            task.spawn(v50, l__head_2._fn, v50, ...);
        else
            local l__varargs_0 = l__head_2._varargs;
            local v52 = #l__varargs_0;
            local l_v52_0 = v52;
            for _, v55 in {
                ...
            } do
                l_v52_0 = l_v52_0 + 1;
                l__varargs_0[l_v52_0] = v55;
            end;
            task.spawn(v50, l__head_2._fn, v50, table.unpack(l__varargs_0));
            for v56 = l_v52_0, v52 + 1, -1 do
                l__varargs_0[v56] = nil;
            end;
        end;
        l__head_2 = l__head_2._next;
    end;
end or function(v57, ...) --[[ Line: 180 ]]
    -- upvalues: v0 (copy), v4 (copy)
    local l__head_3 = v57._head;
    while l__head_3 do
        local v59 = nil;
        if #v0 > 0 then
            v59 = v0[#v0];
            v0[#v0] = nil;
        else
            v59 = coroutine.create(v4);
            coroutine.resume(v59);
        end;
        if not l__head_3._varargs then
            local v60, v61 = coroutine.resume(v59, l__head_3._fn, v59, ...);
            if not v60 then
                print(string.format("%s\nstacktrace:\n%s", v61, debug.traceback()));
            end;
        else
            local l__varargs_1 = l__head_3._varargs;
            local v63 = #l__varargs_1;
            local l_v63_0 = v63;
            for _, v66 in {
                ...
            } do
                l_v63_0 = l_v63_0 + 1;
                l__varargs_1[l_v63_0] = v66;
            end;
            local v67, v68 = coroutine.resume(v59, l__head_3._fn, v59, table.unpack(l__varargs_1));
            if not v67 then
                print(string.format("%s\nstacktrace:\n%s", v68, debug.traceback()));
            end;
            for v69 = l_v63_0, v63 + 1, -1 do
                l__varargs_1[v69] = nil;
            end;
        end;
        l__head_3 = l__head_3._next;
    end;
end;
local function v77(v71) --[[ Line: 220 ]] --[[ Name: disconnectAll ]]
    local l__head_4 = v71._head;
    while l__head_4 do
        local l_l__head_4_0 = l__head_4;
        if l_l__head_4_0.Connected then
            l_l__head_4_0.Connected = false;
            local l__next_4 = l_l__head_4_0._next;
            local l__prev_4 = l_l__head_4_0._prev;
            if l__next_4 then
                l__next_4._prev = l__prev_4;
            end;
            if l__prev_4 then
                l__prev_4._next = l__next_4;
            end;
            local l__signal_5 = l_l__head_4_0._signal;
            if l__signal_5._head == l_l__head_4_0 then
                l__signal_5._head = l__next_4;
            end;
        end;
        l__head_4 = l__head_4._next;
    end;
end;
local function v84(v78) --[[ Line: 228 ]] --[[ Name: destroy ]]
    -- upvalues: v17 (ref)
    local l__head_5 = v78._head;
    while l__head_5 do
        local l_l__head_5_0 = l__head_5;
        if l_l__head_5_0.Connected then
            l_l__head_5_0.Connected = false;
            local l__next_5 = l_l__head_5_0._next;
            local l__prev_5 = l_l__head_5_0._prev;
            if l__next_5 then
                l__next_5._prev = l__prev_5;
            end;
            if l__prev_5 then
                l__prev_5._next = l__next_5;
            end;
            local l__signal_6 = l_l__head_5_0._signal;
            if l__signal_6._head == l_l__head_5_0 then
                l__signal_6._head = l__next_5;
            end;
        end;
        l__head_5 = l__head_5._next;
    end;
    l__head_5 = v78.RBXScriptConnection;
    if l__head_5 then
        v17(l__head_5);
        v78.RBXScriptConnection = nil;
    end;
end;
v15.new = function() --[[ Line: 238 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    return (setmetatable({
        _head = false
    }, v15));
end;
v15.wrap = function(v85) --[[ Line: 242 ]] --[[ Name: wrap ]]
    -- upvalues: v15 (copy), v16 (ref), v70 (copy)
    local v86 = setmetatable({
        _head = false
    }, v15);
    v86.RBXScriptConnection = v16(v85, function(...) --[[ Line: 244 ]]
        -- upvalues: v70 (ref), v86 (copy)
        v70(v86, ...);
    end);
    return v86;
end;
v15.Connect = v23;
v15.Once = v31;
v15.Wait = v47;
v15.Fire = v70;
v15.DisconnectAll = v77;
v15.Destroy = v84;
return {
    new = v15.new, 
    wrap = v15.wrap
};