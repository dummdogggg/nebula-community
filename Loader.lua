repeat
    task.wait()
until game:IsLoaded()

local ScriptData = {
    [7018190066] = "0374691aefd44c855f38a154fb427d27",
    [6931042565] = "c4db58baa788dfaafe935f3329ea6ff2"
}

local CurrentGameID = game.GameId
local CurrentScriptID = ScriptData[CurrentGameID]

makefolder("Nebula")
local key_path = "Nebula/Key.txt"
script_key = script_key or isfile(key_path) and readfile(key_path) or nil

local Cloneref = cloneref or clonereference or function(instance)
    return instance
end
local Players, HttpService = Cloneref(game:GetService("Players")), Cloneref(game:GetService("HttpService"))

local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

local success, err = pcall(function()
    local PrefabsId = `rbxassetid://{ReGui.PrefabsId}`
    ReGui:Init({
        Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
    })
end)

if not success then
    warn("ReGui initialization failed:", err)
    return
end

local apiLoader = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))
local API = apiLoader()

local Window = ReGui:Window({
    Title = "Nebula Hub",
    Size = UDim2.fromOffset(500, 400),
})

local function notify(title, description, duration)
    local Watermark = ReGui.Elements:Canvas({
        Parent = ReGui.Container.Windows,
        Position = UDim2.new(1, -320, 0, 10),
        Size = UDim2.fromOffset(300, 80),
        CornerRadius = UDim.new(0, 2),
        Border = true,
        BorderThickness = 1,
        BorderColor = Color3.fromRGB(91, 91, 91),
        BackgroundTransparency = 0.2,
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
    })
    
    Watermark:Label({
        Text = title,
        TextSize = 18,
        Font = Enum.Font.SourceSansBold
    })
    
    Watermark:Label({
        Text = description,
        TextWrapped = true
    })
    
    task.spawn(function()
        task.wait(duration or 5)
        if Watermark and Watermark.Instance then
            Watermark.Instance:Destroy()
        end
    end)
end

local function checkKey(input_key)
    if not CurrentScriptID then
        notify("Unsupported Game", "Nebula Hub does not currently support this game.", 5)
        return
    end
    
    API.script_id = CurrentScriptID
    
    local status
    local success, result = pcall(function()
        return API.check_key(input_key or script_key)
    end)
    
    if success then
        status = result
    else
        notify("API Error", "Failed to check key: " .. tostring(result), 5)
        return
    end
    
    if status and status.code == "KEY_VALID" then
        script_key = input_key or script_key
        writefile(key_path, script_key)
        notify("Verification Complete", "Valid key! Loading script...", 3)
        task.wait(1)
        
        if Window and Window.Instance then
            Window.Instance:Destroy()
        end
        
        pcall(function()
            API.load_script()
        end)
    elseif status and type(status.code) == "string" and status.code:match("KEY_") then
        local messages = {
            KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
            KEY_INCORRECT = "Incorrect key",
            KEY_INVALID = "Invalid key format",
            KEY_EXPIRED = "Your key has expired",
            KEY_BANNED = "This key has been banned"
        }
        notify("Verification Failed", messages[status.code] or "Unknown error", 8)
    else
        local errorMsg = "Unknown verification error"
        if status and status.message then
            errorMsg = status.message
        end
        notify("Verification Failed", errorMsg, 8)
    end
end

if not CurrentScriptID then
    task.spawn(function()
        notify("Unsupported Game", "Nebula Hub does not currently support this game.", 5)
    end)
else
    if script_key then
        checkKey()
    end
end

pcall(function()
    notify("Nebula Hub", "Welcome to Nebula Hub!", 5)

    local KeyHeader = Window:CollapsingHeader({
        Title = "Key System",
        Collapsed = false
    })
    
    if CurrentScriptID then
        KeyHeader:Label({
            Text = "Enter your key below to access Nebula Hub.\nIf you don't have a key, use the buttons below to get one.",
            TextWrapped = true
        })

        local KeyInput = KeyHeader:InputText({
            Label = "Key",
            Value = script_key or "",
            Placeholder = "Example: JnX84B...",
            Callback = function(self, Value)
                script_key = Value
            end
        })

        KeyHeader:Button({
            Text = "Verify Key",
            Callback = function()
                checkKey(KeyInput.Value)
            end
        })

        local ButtonsRow = KeyHeader:Row({
            Spacing = 5
        })

        ButtonsRow:Button({
            Text = "Get Key (Linkvertise)",
            Callback = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub_Free_Access-LMgKfCJvLDMH")
                notify("Copied to Clipboard", "Link to get your key has been copied to your clipboard", 16)
            end
        })

        ButtonsRow:Button({
            Text = "Join Discord",
            Callback = function()
                setclipboard("https://discord.gg/WmMp3S5ZYc")
                notify("Copied to Clipboard", "Discord server link has been copied to your clipboard", 16)
            end
        })

        KeyHeader:Button({
            Text = "Get Key (Lootlabs / Workink)",
            Callback = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub__Lootlabs-cgoAGWoLWaWS")
                notify("Copied to Clipboard", "Link to get your key has been copied to your clipboard", 16)
            end
        })
    else
        KeyHeader:Label({
            Text = "Nebula Hub does not currently support this game.\nYou can close this loader manually.",
            TextWrapped = true
        })
    end
    
    local HelpHeader = Window:CollapsingHeader({
        Title = "Help & Troubleshooting",
        Collapsed = true
    })
    
    HelpHeader:Label({
        Text = "If you're experiencing issues with the key system, here are some common problems and their solutions:",
        TextWrapped = true
    })
    
    HelpHeader:Separator({
        Text = "Common Issues"
    })
    
    HelpHeader:BulletText({
        Rows = {
            "HWID LOCKED: Key linked to a different device. Please reset it using our Discord bot.",
            "KEY INCORRECT: The provided key doesn't exist. Double-check for typos.",
            "KEY INVALID: Invalid key format. Make sure to copy the entire key.",
            "KEY EXPIRED: Your key has expired. You'll need to get a new one.",
            "KEY BANNED: Your key has been banned from the system."
        }
    })
    
    HelpHeader:Separator()
    HelpHeader:Label({
        Text = "Need more help? Join our Discord server for assistance and updates.",
        TextWrapped = true
    })
    
    HelpHeader:Button({
        Text = "Join Discord Server",
        Callback = function()
            setclipboard("https://discord.gg/WmMp3S5ZYc")
            notify("Copied to Clipboard", "Discord server link has been copied to your clipboard", 16)
        end
    })
    
    local InfoHeader = Window:CollapsingHeader({
        Title = "Information",
        Collapsed = true
    })
    
    InfoHeader:Label({
        Text = "Current Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
        TextWrapped = true
    })
    
    InfoHeader:Label({
        Text = "Game ID: " .. game.GameId,
        TextWrapped = true
    })
    
    InfoHeader:Label({
        Text = "Nebula Hub Version: 1.0.0",
        TextWrapped = true
    })
    
    InfoHeader:Button({
        Text = "Copy Game ID",
        Callback = function()
            setclipboard(tostring(game.GameId))
            notify("Game ID Copied", "Game ID: " .. game.GameId .. " has been copied to clipboard", 5)
        end
    })
    
    local SettingsHeader = Window:CollapsingHeader({
        Title = "Settings",
        Collapsed = true
    })
    
    SettingsHeader:Checkbox({
        Value = true,
        Label = "Automatically Save Key",
        Callback = function(self, Value)
            print("Auto Save Key:", Value)
        end
    })
    
    local ThemeSection = SettingsHeader:TreeNode({
        Title = "Theme Options",
        Collapsed = false
    })
    
    ThemeSection:Combo({
        Selected = "DarkTheme",
        Label = "UI Theme",
        Items = ReGui.ThemeConfigs,
        Callback = function(self, Name)
            Window:SetTheme(Name)
        end
    })

    SettingsHeader:Button({
        Text = "Reset Settings",
        Callback = function()
            notify("Settings Reset", "All settings have been reset to default values", 3)
        end
    })

    notify("Nebula Hub", "Loader successfully loaded!", 5)
end)
