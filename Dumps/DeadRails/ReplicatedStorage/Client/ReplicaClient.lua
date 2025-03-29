--[[
    Script: ReplicatedStorage.Client.ReplicaClient
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicaShared_0 = game.ReplicatedStorage.ReplicaShared;
local v1 = require(l_ReplicaShared_0.Remote);
local v2 = require(l_ReplicaShared_0.Signal);
local v3 = require(l_ReplicaShared_0.Maid);
local v4 = {};
local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local v8 = false;
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = v1.New("ReplicaRequestData");
local v15 = v1.New("ReplicaSet");
local v16 = v1.New("ReplicaSetValues");
local v17 = v1.New("ReplicaTableInsert");
local v18 = v1.New("ReplicaTableRemove");
local v19 = v1.New("ReplicaWrite");
local v20 = v1.New("ReplicaSignal");
local v21 = v1.New("ReplicaParent");
local v22 = v1.New("ReplicaCreate");
local v23 = v1.New("ReplicaBind");
local v24 = v1.New("ReplicaDestroy");
local v25 = v1.New("ReplicaSignalUnreliable", true);
local v26 = {};
local v27 = false;
local function v39(v28) --[[ Line: 115 ]] --[[ Name: LoadWriteLib ]]
    -- upvalues: v26 (copy)
    local v29 = v26[v28];
    if v29 ~= nil then
        return v29;
    else
        local v30 = require(v28);
        local v31 = {};
        for v32, v33 in pairs(v30) do
            table.insert(v31, {
                v32, 
                v33
            });
        end;
        table.sort(v31, function(v34, v35) --[[ Line: 131 ]]
            return v34[1] < v35[1];
        end);
        v29 = {};
        for v36, v37 in ipairs(v31) do
            local v38 = {
                Name = v37[1], 
                Id = v36, 
                fn = v37[2]
            };
            v29[v37[1]] = v38;
            v29[v36] = v38;
        end;
        v26[v28] = v29;
        return v29;
    end;
end;
local v40 = {};
v40.__index = v40;
local v41 = nil;
local function v44(v42, ...) --[[ Line: 188 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v41 (ref)
    local l_v41_0 = v41;
    v41 = nil;
    v42(...);
    v41 = l_v41_0;
end;
local function v45(...) --[[ Line: 196 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v44 (copy)
    v44(...);
    while true do
        v44(coroutine.yield());
    end;
end;
ConnectionNew = function(v46, v47) --[[ Line: 203 ]] --[[ Name: ConnectionNew ]]
    -- upvalues: v40 (copy)
    local v48 = setmetatable({
        t = v46, 
        fn = v47
    }, v40);
    v46[v48] = true;
    return v48;
end;
ConnectionFire = function(v49, ...) --[[ Line: 216 ]] --[[ Name: ConnectionFire ]]
    -- upvalues: v41 (ref), v45 (copy)
    if not v41 then
        v41 = coroutine.create(v45);
    end;
    task.spawn(v41, v49.fn, ...);
end;
v40.Disconnect = function(v50) --[[ Line: 223 ]] --[[ Name: Disconnect ]]
    v50.t[v50] = nil;
end;
local v51 = {
    IsReady = false, 
    OnLocalReady = v2.New()
};
v51.__index = v51;
local function v58(v52, v53) --[[ Line: 233 ]] --[[ Name: ReplicaNew ]]
    -- upvalues: v39 (copy), v11 (copy), v10 (copy), v2 (copy), v3 (copy), v4 (copy), v51 (copy)
    local v54 = nil;
    if v53[5] ~= nil then
        v54 = v39(v53[5]);
    end;
    local v55 = v53[1];
    local v56 = v11[v53[4]] or v10[v53[4]];
    local v57 = setmetatable({
        Tags = v53[2], 
        Data = v53[3], 
        Id = v52, 
        Token = v55, 
        Parent = v56, 
        Children = {}, 
        BoundInstance = nil, 
        OnClientEvent = v2.New(), 
        Maid = v3.New(v4), 
        self_creation = v53, 
        write_lib = v54, 
        set_listeners = {}, 
        write_listeners = {}, 
        changed_listeners = {}
    }, v51);
    if v56 ~= nil then
        v56.Children[v57] = true;
    end;
    return v57;
end;
v51.RequestData = function() --[[ Line: 272 ]] --[[ Name: RequestData ]]
    -- upvalues: v8 (ref), v14 (copy), v51 (copy)
    if v8 == true then
        return;
    else
        v8 = true;
        task.spawn(function() --[[ Line: 280 ]]
            -- upvalues: v14 (ref), v51 (ref)
            v14:FireServer();
            while task.wait(2) and v51.IsReady ~= true do
                v14:FireServer();
            end;
        end);
        return;
    end;
end;
v51.OnNew = function(v59, v60) --[[ Line: 295 ]] --[[ Name: OnNew ]]
    -- upvalues: v13 (copy), v9 (copy)
    if type(v59) ~= "string" then
        error((("[%*]: \"token\" must be a string"):format(script.Name)));
    end;
    local v61 = v13[v59];
    if v61 == nil then
        v61 = {};
        v13[v59] = v61;
    end;
    local v62 = v9[v59];
    local v63 = ConnectionNew(v61, v60);
    if v62 ~= nil then
        for v64 in pairs(v62) do
            ConnectionFire(v63, v64);
        end;
    end;
    return v63;
end;
v51.FromId = function(v65) --[[ Line: 322 ]] --[[ Name: FromId ]]
    -- upvalues: v10 (copy)
    return v10[v65];
end;
v51.Test = function() --[[ Line: 326 ]] --[[ Name: Test ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    return {
        TokenReplicas = v9, 
        Replicas = v10, 
        BindReplicas = v11, 
        BindInstances = v12
    };
end;
v51.OnSet = function(v66, v67, v68) --[[ Line: 335 ]] --[[ Name: OnSet ]]
    local v69 = table.concat(v67, ".");
    local v70 = v66.set_listeners[v69];
    if v70 == nil then
        v70 = {};
        v66.set_listeners[v69] = v70;
    end;
    return ConnectionNew(v70, v68);
end;
v51.OnWrite = function(v71, v72, v73) --[[ Line: 346 ]] --[[ Name: OnWrite ]]
    local v74 = v71.write_listeners[v72];
    if v74 == nil then
        v74 = {};
        v71.write_listeners[v72] = v74;
    end;
    return ConnectionNew(v74, v73);
end;
v51.OnChange = function(v75, v76) --[[ Line: 356 ]] --[[ Name: OnChange ]]
    return ConnectionNew(v75.changed_listeners, v76);
end;
v51.GetChild = function(v77, v78) --[[ Line: 360 ]] --[[ Name: GetChild ]]
    if type(v78) ~= "string" then
        error((("[%*]: \"token\" must be a string"):format(script.Name)));
    end;
    for v79 in pairs(v77.Children) do
        if v79.Token == v78 then
            return v79;
        end;
    end;
    return nil;
end;
v51.FireServer = function(v80, ...) --[[ Line: 372 ]] --[[ Name: FireServer ]]
    -- upvalues: v20 (copy)
    v20:FireServer(v80.Id, ...);
end;
v51.UFireServer = function(v81, ...) --[[ Line: 376 ]] --[[ Name: UFireServer ]]
    -- upvalues: v25 (copy)
    v25:FireServer(v81.Id, ...);
end;
v51.Identify = function(v82) --[[ Line: 380 ]] --[[ Name: Identify ]]
    local v83 = "";
    local v84 = true;
    for v85, v86 in pairs(v82.Tags) do
        v83 = v83 .. ("%*%*=%*"):format(v84 == true and "" or ";", tostring(v85), (tostring(v86)));
        v84 = false;
    end;
    return (("[Id:%*;Token:%*;Tags:{%*}]"):format(v82.Id, v82.Token, v83));
end;
v51.IsActive = function(v87) --[[ Line: 390 ]] --[[ Name: IsActive ]]
    return v87.Maid:IsActive();
end;
v51.Set = function(v88, v89, v90) --[[ Line: 394 ]] --[[ Name: Set ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"Set()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_0 = v88.Data;
    for v92 = 1, #v89 - 1 do
        l_Data_0 = l_Data_0[v89[v92]];
    end;
    local v93 = v89[#v89];
    local v94 = l_Data_0[v93];
    l_Data_0[v93] = v90;
    if next(v88.set_listeners) ~= nil then
        local v95 = v88.set_listeners[table.concat(v89, ".")];
        if v95 ~= nil then
            for v96 in pairs(v95) do
                ConnectionFire(v96, v90, v94);
            end;
        end;
    end;
    for v97 in pairs(v88.changed_listeners) do
        ConnectionFire(v97, "Set", v89, v90, v94);
    end;
end;
v51.SetValues = function(v98, v99, v100) --[[ Line: 426 ]] --[[ Name: SetValues ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"SetValues()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_1 = v98.Data;
    for _, v103 in ipairs(v99) do
        l_Data_1 = l_Data_1[v103];
    end;
    for v104, v105 in pairs(v100) do
        l_Data_1[v104] = v105;
    end;
    for v106 in pairs(v98.changed_listeners) do
        ConnectionFire(v106, "SetValues", v99, v100);
    end;
end;
v51.TableInsert = function(v107, v108, v109, v110) --[[ Line: 450 ]] --[[ Name: TableInsert ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"TableInsert()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_2 = v107.Data;
    for _, v113 in ipairs(v108) do
        l_Data_2 = l_Data_2[v113];
    end;
    if v110 ~= nil then
        table.insert(l_Data_2, v110, v109);
    else
        table.insert(l_Data_2, v109);
        v110 = #l_Data_2;
    end;
    for v114 in pairs(v107.changed_listeners) do
        ConnectionFire(v114, "TableInsert", v108, v109, v110);
    end;
    return v110;
end;
v51.TableRemove = function(v115, v116, v117) --[[ Line: 479 ]] --[[ Name: TableRemove ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"TableRemove()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_3 = v115.Data;
    for _, v120 in ipairs(v116) do
        l_Data_3 = l_Data_3[v120];
    end;
    local v121 = table.remove(l_Data_3, v117);
    for v122 in pairs(v115.changed_listeners) do
        ConnectionFire(v122, "TableRemove", v116, v121, v117);
    end;
    return v121;
end;
v51.Write = function(v123, v124, ...) --[[ Line: 503 ]] --[[ Name: Write ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"Write()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local v125 = v123.write_lib[v124];
    local v126 = table.pack(v125.fn(v123, ...));
    local v127 = v123.write_listeners[v124];
    if v127 ~= nil then
        for v128 in pairs(v127) do
            ConnectionFire(v128, ...);
        end;
    end;
    return table.unpack(v126);
end;
local function v129(v130, v131) --[[ Line: 527 ]] --[[ Name: DestroyReplica ]]
    -- upvalues: v129 (copy), v9 (copy), v10 (copy), v11 (copy), v4 (copy)
    for _, v133 in ipairs(v130.Children) do
        v129(v133, true);
    end;
    if v131 ~= true and v130.Parent ~= nil then
        v130.Parent.Children[v130] = nil;
    end;
    local l_Id_0 = v130.Id;
    local v135 = v9[v130.Token];
    if v135 ~= nil then
        v135[v130] = nil;
    end;
    if v10[l_Id_0] == v130 then
        v10[l_Id_0] = nil;
    end;
    if v11[l_Id_0] == v130 then
        v11[l_Id_0] = nil;
    end;
    v130.Maid:Unlock(v4);
    v130.Maid:Cleanup();
    v130.BoundInstance = nil;
end;
local function v136(v137, v138) --[[ Line: 559 ]] --[[ Name: ReplicaToBindBuffer ]]
    -- upvalues: v58 (copy), v11 (copy), v136 (copy), v129 (copy)
    local v139 = v58(v137.Id, v137.self_creation);
    v11[v137.Id] = v139;
    for v140 in pairs(v137.Children) do
        v136(v140, true);
    end;
    if v138 ~= true then
        v129(v137);
    end;
    return v139;
end;
local function v141(v142, v143) --[[ Line: 580 ]] --[[ Name: ReplicaFromBindBuffer ]]
    -- upvalues: v11 (copy), v9 (copy), v10 (copy), v141 (copy), v13 (copy)
    local v144 = false;
    if v143 == nil then
        v144 = true;
        v143 = {};
    end;
    v11[v142.Id] = nil;
    local l_Token_0 = v142.Token;
    local v146 = v9[l_Token_0];
    if v146 == nil then
        v146 = {};
        v9[l_Token_0] = v146;
    end;
    v146[v142] = true;
    v10[v142.Id] = v142;
    table.insert(v143, v142);
    for v147 in pairs(v142.Children) do
        v141(v147, v143);
    end;
    if v144 == true then
        for _, v149 in ipairs(v143) do
            local v150 = v13[v149.Token];
            if v150 ~= nil then
                for v151 in pairs(v150) do
                    ConnectionFire(v151, v149);
                end;
            end;
        end;
    end;
end;
local function v152(v153, v154, v155) --[[ Line: 621 ]] --[[ Name: CreationScan ]]
    -- upvalues: v152 (copy)
    local v156 = v153[v155];
    if v156 ~= nil then
        table.sort(v156, function(v157, v158) --[[ Line: 625 ]]
            return v157.Id < v158.Id;
        end);
        for _, v160 in ipairs(v156) do
            v154(v160.Id, v160.SelfCreation);
            v152(v153, v154, v160.Id);
        end;
    end;
end;
local function v192(v161, v162, v163) --[[ Line: 637 ]] --[[ Name: BreadthCreationSort ]]
    -- upvalues: v152 (copy)
    local v164 = {};
    local v165 = {};
    local v166 = {};
    if type(v161[1]) == "table" then
        for _, v168 in ipairs(v161) do
            for v169, v170 in pairs(v168) do
                local v171 = {
                    Id = tonumber(v169), 
                    SelfCreation = v170
                };
                local v172 = v170[4];
                if v172 == 0 or v171.Id == v162 then
                    table.insert(v164, v171);
                elseif v168[tostring(v172)] ~= nil then
                    local v173 = v165[v172];
                    if v173 == nil then
                        v173 = {};
                        v165[v172] = v173;
                    end;
                    table.insert(v173, v171);
                else
                    table.insert(v166, v171);
                end;
            end;
        end;
    else
        for v174, v175 in pairs(v161) do
            local v176 = {
                Id = tonumber(v174), 
                SelfCreation = v175
            };
            local v177 = v175[4];
            if v177 == 0 or v176.Id == v162 then
                table.insert(v164, v176);
            elseif v161[tostring(v177)] ~= nil then
                local v178 = v165[v177];
                if v178 == nil then
                    v178 = {};
                    v165[v177] = v178;
                end;
                table.insert(v178, v176);
            else
                table.insert(v166, v176);
            end;
        end;
    end;
    table.sort(v164, function(v179, v180) --[[ Line: 688 ]]
        return v179.Id < v180.Id;
    end);
    local v181 = {};
    for _, v183 in ipairs(v164) do
        v163(v183.Id, v183.SelfCreation);
        v152(v165, v163, v183.Id);
    end;
    if #v166 ~= 0 then
        local v184 = ("[%*]: GROUP REPLICATION ERROR - Missing parents for:\n"):format(script.Name);
        for v185 = 1, math.min(#v166, 50) do
            local v186 = v166[v185];
            local l_SelfCreation_0 = v186.SelfCreation;
            local v188 = "";
            local v189 = true;
            for v190, v191 in pairs(l_SelfCreation_0[2]) do
                v188 = v188 .. ("%*%*=%*"):format(v189 == true and "" or ";", tostring(v190), (tostring(v191)));
                v189 = false;
            end;
            v184 = v184 .. ("[Id:%*;ParentId:%*;Token:%*;Tags:{%*}]\n"):format(v186.Id, l_SelfCreation_0[4], l_SelfCreation_0[1], v188);
        end;
        if #v166 > 50 then
            v184 = v184 .. ("(hiding %* more)\n"):format(50 - #v166);
        end;
        v184 = v184 .. "Traceback:\n" .. debug.traceback();
        warn(v184);
    end;
    return v181;
end;
local function _(v193) --[[ Line: 729 ]] --[[ Name: GetInternalReplica ]]
    -- upvalues: v10 (copy), v11 (copy)
    local v194 = v10[v193] or v11[v193];
    if v194 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v193)));
    end;
    return v194;
end;
v14.OnClientEvent:Connect(function() --[[ Line: 739 ]]
    -- upvalues: v51 (copy)
    if v51.IsReady == true then
        return;
    else
        v51.IsReady = true;
        print((("[%*]: Initial data received"):format(script.Name)));
        v51.OnLocalReady:Fire();
        return;
    end;
end);
v15.OnClientEvent:Connect(function(v196, v197, v198) --[[ Line: 751 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v199 = v10[v196] or v11[v196];
    if v199 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v196)));
    end;
    local l_v199_0 = v199;
    v27 = true;
    local v201;
    v199, v201 = pcall(l_v199_0.Set, l_v199_0, v197, v198);
    v27 = false;
    if v199 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v199_0:Identify())) .. v201);
    end;
end);
v16.OnClientEvent:Connect(function(v202, v203, v204) --[[ Line: 761 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v205 = v10[v202] or v11[v202];
    if v205 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v202)));
    end;
    local l_v205_0 = v205;
    v27 = true;
    local v207;
    v205, v207 = pcall(l_v205_0.SetValues, l_v205_0, v203, v204);
    v27 = false;
    if v205 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v205_0:Identify())) .. v207);
    end;
end);
v17.OnClientEvent:Connect(function(v208, v209, v210, v211) --[[ Line: 771 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v212 = v10[v208] or v11[v208];
    if v212 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v208)));
    end;
    local l_v212_0 = v212;
    v27 = true;
    local v214;
    v212, v214 = pcall(l_v212_0.TableInsert, l_v212_0, v209, v210, v211);
    v27 = false;
    if v212 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v212_0:Identify())) .. v214);
    end;
end);
v18.OnClientEvent:Connect(function(v215, v216, v217) --[[ Line: 781 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v218 = v10[v215] or v11[v215];
    if v218 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v215)));
    end;
    local l_v218_0 = v218;
    v27 = true;
    local v220;
    v218, v220 = pcall(l_v218_0.TableRemove, l_v218_0, v216, v217);
    v27 = false;
    if v218 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v218_0:Identify())) .. v220);
    end;
end);
v19.OnClientEvent:Connect(function(v221, v222, ...) --[[ Line: 791 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v223 = v10[v221] or v11[v221];
    if v223 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v221)));
    end;
    local l_v223_0 = v223;
    v223 = l_v223_0.write_lib[v222].Name;
    v27 = true;
    local l_status_0, l_result_0 = pcall(l_v223_0.Write, l_v223_0, v223, ...);
    v27 = false;
    if l_status_0 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v223_0:Identify())) .. l_result_0);
    end;
end);
local function v229(v227, ...) --[[ Line: 802 ]] --[[ Name: RemoteSignalHandle ]]
    -- upvalues: v10 (copy), v11 (copy)
    local v228 = v10[v227] or v11[v227];
    if v228 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v227)));
    end;
    v228.OnClientEvent:Fire(...);
end;
v20.OnClientEvent:Connect(v229);
v25.OnClientEvent:Connect(v229);
v21.OnClientEvent:Connect(function(v230, v231) --[[ Line: 810 ]]
    -- upvalues: v10 (copy), v11 (copy), v141 (copy), v136 (copy)
    local v232 = v10[v230] or v11[v230];
    if v232 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v230)));
    end;
    local l_v232_0 = v232;
    v232 = l_v232_0.Parent;
    local v234 = v10[v231] or v11[v231];
    if v234 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v231)));
    end;
    local l_v234_0 = v234;
    v232.Children[l_v232_0] = nil;
    l_v234_0.Children[l_v232_0] = true;
    l_v232_0.Parent = l_v234_0;
    l_v232_0.self_creation[4] = v231;
    if v11[v232.Id] ~= nil and v10[v231] ~= nil then
        v141(l_v232_0);
        return;
    else
        if v10[v232.Id] ~= nil and v11[v231] ~= nil then
            v136(l_v232_0);
        end;
        return;
    end;
end);
v22.OnClientEvent:Connect(function(v236, v237) --[[ Line: 831 ]]
    -- upvalues: v192 (copy), v58 (copy), v12 (copy), v11 (copy), v9 (copy), v10 (copy), v13 (copy)
    local v238 = {};
    v192(v236, v237, function(v239, v240) --[[ Line: 835 ]]
        -- upvalues: v58 (ref), v12 (ref), v11 (ref), v9 (ref), v10 (ref), v238 (copy)
        local v241 = v240[4];
        local v242 = v58(v239, v240);
        local v243 = false;
        if v241 == 0 then
            if v242.Tags.Bind == true then
                local v244 = v12[v239];
                v242.BoundInstance = v244;
                if v244 == nil then
                    v243 = true;
                end;
            end;
        elseif v11[v241] ~= nil then
            v243 = true;
        end;
        if v243 == true then
            v11[v239] = v242;
            return;
        else
            local l_Token_1 = v242.Token;
            local v246 = v9[l_Token_1];
            if v246 == nil then
                v246 = {};
                v9[l_Token_1] = v246;
            end;
            v246[v242] = true;
            v10[v239] = v242;
            table.insert(v238, v242);
            return;
        end;
    end);
    for _, v248 in ipairs(v238) do
        local v249 = v13[v248.Token];
        if v249 ~= nil then
            for v250 in pairs(v249) do
                ConnectionFire(v250, v248);
            end;
        end;
    end;
end);
v23.OnClientEvent:Connect(function(v251) --[[ Line: 892 ]]
    -- upvalues: v10 (copy), v11 (copy), v12 (copy), v136 (copy)
    local v252 = v10[v251] or v11[v251];
    if v252 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v251)));
    end;
    local l_v252_0 = v252;
    l_v252_0.Tags.Bind = true;
    v252 = v12[v251];
    l_v252_0.BoundInstance = v252;
    if v252 == nil then
        v136(l_v252_0);
    end;
end);
v24.OnClientEvent:Connect(function(v254) --[[ Line: 906 ]]
    -- upvalues: v10 (copy), v11 (copy), v129 (copy)
    local v255 = v10[v254] or v11[v254];
    if v255 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v254)));
    end;
    v129(v255);
end);
local function _(v256) --[[ Line: 913 ]] --[[ Name: OnBindInstanceAdded ]]
    -- upvalues: v12 (copy), v11 (copy), v141 (copy)
    local l_Value_0 = v256.Value;
    local l_Parent_0 = v256.Parent;
    v12[l_Value_0] = l_Parent_0;
    local v259 = v11[l_Value_0];
    if v259 ~= nil then
        v259.BoundInstance = l_Parent_0;
        v141(v259);
    end;
end;
local function _(v261) --[[ Line: 928 ]] --[[ Name: OnBindInstanceRemoved ]]
    -- upvalues: v12 (copy), v10 (copy), v136 (copy)
    local l_Value_1 = v261.Value;
    v12[l_Value_1] = nil;
    local v263 = v10[l_Value_1];
    if v263 ~= nil then
        v136(v263);
    end;
end;
l_CollectionService_0:GetInstanceAddedSignal("REPLICA"):Connect(function(v265) --[[ Line: 941 ]]
    -- upvalues: v12 (copy), v11 (copy), v141 (copy)
    if v265:IsA("NumberValue") == true then
        local l_Value_2 = v265.Value;
        local l_Parent_1 = v265.Parent;
        v12[l_Value_2] = l_Parent_1;
        local v268 = v11[l_Value_2];
        if v268 ~= nil then
            v268.BoundInstance = l_Parent_1;
            v141(v268);
        end;
    end;
end);
l_CollectionService_0:GetInstanceRemovedSignal("REPLICA"):Connect(function(v269) --[[ Line: 947 ]]
    -- upvalues: v12 (copy), v10 (copy), v136 (copy)
    if v269:IsA("NumberValue") == true then
        local l_Value_3 = v269.Value;
        v12[l_Value_3] = nil;
        local v271 = v10[l_Value_3];
        if v271 ~= nil then
            v136(v271);
        end;
    end;
end);
for _, v273 in pairs(l_CollectionService_0:GetTagged("REPLICA")) do
    if v273:IsA("NumberValue") == true then
        local l_Value_4 = v273.Value;
        local l_Parent_2 = v273.Parent;
        v12[l_Value_4] = l_Parent_2;
        local v276 = v11[l_Value_4];
        if v276 ~= nil then
            v276.BoundInstance = l_Parent_2;
            v141(v276);
        end;
    end;
end;
return v51;