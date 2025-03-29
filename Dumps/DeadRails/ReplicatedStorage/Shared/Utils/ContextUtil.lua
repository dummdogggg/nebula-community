--[[
    Script: ReplicatedStorage.Shared.Utils.ContextUtil
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_RunService_0 = game:GetService("RunService");
local v1 = {
    isStudio = function() --[[ Line: 12 ]] --[[ Name: isStudio ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0:IsStudio();
    end, 
    isClient = function() --[[ Line: 16 ]] --[[ Name: isClient ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0:IsClient();
    end, 
    isServer = function() --[[ Line: 20 ]] --[[ Name: isServer ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0:IsServer();
    end, 
    isRunning = function() --[[ Line: 24 ]] --[[ Name: isRunning ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0:IsRunning();
    end, 
    isRunMode = function() --[[ Line: 28 ]] --[[ Name: isRunMode ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0:IsRunMode();
    end
};
v1.isLivePlayer = function() --[[ Line: 32 ]] --[[ Name: isLivePlayer ]]
    -- upvalues: v1 (copy)
    return not v1.isStudio() and v1.isClient() and not v1.isServer();
end;
v1.isLiveServer = function() --[[ Line: 36 ]] --[[ Name: isLiveServer ]]
    -- upvalues: v1 (copy)
    return not v1.isStudio() and not v1.isClient() and v1.isServer();
end;
v1.isStudioPlayClient = function() --[[ Line: 40 ]] --[[ Name: isStudioPlayClient ]]
    -- upvalues: v1 (copy)
    return v1.isStudio() and v1.isClient() and not v1.isServer() and v1.isRunning() and not v1.isRunMode();
end;
v1.isStudioPlayServer = function() --[[ Line: 46 ]] --[[ Name: isStudioPlayServer ]]
    -- upvalues: v1 (copy)
    return v1.isStudio() and not v1.isClient() and v1.isServer() and v1.isRunning() and v1.isRunMode();
end;
v1.getCurrentContext = function() --[[ Line: 52 ]] --[[ Name: getCurrentContext ]]
    -- upvalues: v1 (copy)
    if v1.isStudioPlayClient() then
        return "Studio Play Client";
    elseif v1.isStudioPlayServer() then
        return "Studio Play Server";
    elseif v1.isLivePlayer() then
        return "Live Client";
    elseif v1.isLiveServer() then
        return "Live Server";
    elseif v1.isRunMode() then
        return "Run Mode";
    else
        return "Unknown Context";
    end;
end;
v1.getContextTable = function() --[[ Line: 68 ]] --[[ Name: getContextTable ]]
    -- upvalues: v1 (copy)
    return {
        isStudio = v1.isStudio(), 
        isClient = v1.isClient(), 
        isServer = v1.isServer(), 
        isRunning = v1.isRunning(), 
        isRunMode = v1.isRunMode(), 
        isLivePlayer = v1.isLivePlayer(), 
        isLiveServer = v1.isLiveServer(), 
        isStudioPlayClient = v1.isStudioPlayClient(), 
        isStudioPlayServer = v1.isStudioPlayServer()
    };
end;
return v1;