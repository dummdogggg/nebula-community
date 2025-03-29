--[[
    Script: ReplicatedStorage.Shared.Remotes
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.RemotePromise);
local function v6(v3, v4) --[[ Line: 6 ]] --[[ Name: createOrGetEventAsync ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsServer() then
        local v5 = if v4 then Instance.new("UnreliableRemoteEvent") else Instance.new("RemoteEvent");
        v5.Name = v3;
        v5.Parent = script;
        return v5;
    else
        return (script:WaitForChild(v3));
    end;
end;
return {
    Events = {
        RequestStartDrag = v6("RequestStartDrag"), 
        UpdateDrag = v6("UpdateDrag", true), 
        RequestStopDrag = v6("RequestStopDrag"), 
        RequestWeld = v6("RequestWeld"), 
        RequestUnweld = v6("RequestUnweld"), 
        AttachRope = v6("AttachRope"), 
        RagdollFlop = v6("RagdollFlop"), 
        EatCorpse = v6("EatCorpse")
    }, 
    Promises = {
        InteractWithObject = v2.new("InteractWithObject")
    }
};