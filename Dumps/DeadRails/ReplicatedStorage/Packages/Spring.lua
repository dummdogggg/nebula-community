--[[
    Script: ReplicatedStorage.Packages.Spring
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

--!native
local v0 = {
    _type = "Spring"
};
v0.new = function(v1, v2, v3, v4) --[[ Line: 108 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v5 = v2 or 1;
    local v6 = v3 or 1;
    local v7 = v4 or os.clock;
    return (setmetatable({
        _clock = v7, 
        _time = v7(), 
        _position = v1, 
        _velocity = v1 * 0, 
        _target = v1, 
        _damping = v5, 
        _speed = v6, 
        _initial = v1
    }, v0));
end;
v0.Reset = function(v8, v9) --[[ Line: 132 ]] --[[ Name: Reset ]]
    local v10 = v8._clock();
    local v11 = v9 or v8._initial;
    v8._position = v11;
    v8._target = v11;
    v8._velocity = 0 * v11;
    v8._time = v10;
end;
v0.Impulse = function(v12, v13) --[[ Line: 148 ]] --[[ Name: Impulse ]]
    v12.Velocity = v12.Velocity + v13;
end;
local function v36(v14, v15) --[[ Line: 152 ]] --[[ Name: _positionVelocity ]]
    local l__position_0 = v14._position;
    local l__velocity_0 = v14._velocity;
    local l__target_0 = v14._target;
    local l__damping_0 = v14._damping;
    local l__speed_0 = v14._speed;
    local v21 = l__speed_0 * (v15 - v14._time);
    local v22 = l__damping_0 * l__damping_0;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if v22 < 1 then
        v23 = math.sqrt(1 - v22);
        local v26 = math.exp(-l__damping_0 * v21) / v23;
        v25 = v26 * math.cos(v23 * v21);
        v24 = v26 * math.sin(v23 * v21);
    elseif v22 == 1 then
        v23 = 1;
        local v27 = math.exp(-l__damping_0 * v21) / v23;
        v25 = v27;
        v24 = v27 * v21;
    else
        v23 = math.sqrt(v22 - 1);
        local v28 = 2 * v23;
        local v29 = math.exp((-l__damping_0 + v23) * v21) / v28;
        local v30 = math.exp((-l__damping_0 - v23) * v21) / v28;
        v25 = v29 + v30;
        v24 = v29 - v30;
    end;
    local v31 = 1 - (v23 * v25 + l__damping_0 * v24);
    local v32 = v24 / l__speed_0;
    local v33 = l__speed_0 * v24;
    local v34 = v23 * v25 - l__damping_0 * v24;
    local v35 = l__target_0 - l__position_0;
    return l__position_0 + v35 * v31 + l__velocity_0 * v32, v35 * v33 + l__velocity_0 * v34;
end;
v0.TimeSkip = function(v37, v38) --[[ Line: 196 ]] --[[ Name: TimeSkip ]]
    -- upvalues: v36 (copy)
    local v39 = v37._clock();
    local v40, v41 = v36(v37, v39 + v38);
    v37._position = v40;
    v37._velocity = v41;
    v37._time = v39;
end;
v0.__index = function(v42, v43) --[[ Line: 204 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy), v36 (copy)
    if v0[v43] then
        return v0[v43];
    elseif v43 == "Position" or v43 == "p" then
        local v44, _ = v36(v42, v42._clock());
        return v44;
    elseif v43 == "Velocity" or v43 == "v" then
        local _, v47 = v36(v42, v42._clock());
        return v47;
    elseif v43 == "Target" or v43 == "t" then
        return v42._target;
    elseif v43 == "Damping" or v43 == "d" then
        return v42._damping;
    elseif v43 == "Speed" or v43 == "s" then
        return v42._speed;
    elseif v43 == "Clock" then
        return v42._clock;
    else
        error(string.format("%q is not a valid member of Spring.", (tostring(v43))), 2);
        return;
    end;
end;
v0.__newindex = function(v48, v49, v50) --[[ Line: 224 ]] --[[ Name: __newindex ]]
    -- upvalues: v36 (copy)
    local v51 = v48._clock();
    if v49 == "Position" or v49 == "p" then
        local _, v53 = v36(v48, v51);
        v48._position = v50;
        v48._velocity = v53;
        v48._time = v51;
        return;
    elseif v49 == "Velocity" or v49 == "v" then
        local v54, _ = v36(v48, v51);
        v48._position = v54;
        v48._velocity = v50;
        v48._time = v51;
        return;
    elseif v49 == "Target" or v49 == "t" then
        local v56, v57 = v36(v48, v51);
        v48._position = v56;
        v48._velocity = v57;
        v48._target = v50;
        v48._time = v51;
        return;
    elseif v49 == "Damping" or v49 == "d" then
        local v58, v59 = v36(v48, v51);
        v48._position = v58;
        v48._velocity = v59;
        v48._damping = v50;
        v48._time = v51;
        return;
    elseif v49 == "Speed" or v49 == "s" then
        local v60, v61 = v36(v48, v51);
        v48._position = v60;
        v48._velocity = v61;
        v48._speed = v50 < 0 and 0 or v50;
        v48._time = v51;
        return;
    elseif v49 == "Clock" then
        local v62, v63 = v36(v48, v51);
        v48._position = v62;
        v48._velocity = v63;
        v48._clock = v50;
        v48._time = v50();
        return;
    else
        error(string.format("%q is not a valid member of Spring.", (tostring(v49))), 2);
        return;
    end;
end;
return v0;