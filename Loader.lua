-- ⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⢀⣾⡿⠋⠀⠿⠇⠉⠻⣿⣄⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⢠⣿⠏⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⢠⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣆⠀⠀⠀⠀
-- ⠀⠀⠀⠀⢸⣿⡄⠀⠀⠀⢀⣤⣀⠀⠀⠀⠀⣿⡿⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠻⣿⣶⣶⣾⡿⠟⢿⣷⣶⣶⣿⡟⠁⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡏⠉⠁⠀⠀⠀⠀⠉⠉⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⣸⣿⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⣿⡇⢀⣴⣿⠇⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀
-- ⠀⠀⠀⢀⣠⣴⣿⣷⣿⠟⠁⠀⠀⠀⠀⠀⣿⣧⣄⡀⠀⠀⠀
-- ⠀⢀⣴⡿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⢿⣷⣄⠀
-- ⢠⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆
-- ⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿
-- ⣿⣇⠀⠀⠀⠀⠀⠀⢸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿
-- ⢹⣿⡄⠀⠀⠀⠀⠀⠀⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿
-- ⠀⠻⣿⣦⣀⠀⠀⠀⠀⠈⣿⣷⣄⡀⠀⠀⠀⠀⣀⣤⣾⡟⠁
-- ⠀⠀⠈⠛⠿⣿⣷⣶⣾⡿⠿⠛⠻⢿⣿⣶⣾⣿⠿⠛⠉⠀⠀
-- Hello, look at this beautiful ASCII art! It's a Nebula logo! But relax, this is just a loader, not the actual script, youll not find anything here, u dumb bitch.

if getgenv().NebulaLoaderActive then
    return
end
getgenv().NebulaLoaderActive = true

repeat
    task.wait()
until game:IsLoaded()

local ScriptData = {
    [7018190066] = "0374691aefd44c855f38a154fb427d27"
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
local Request = http_request or request or syn.request or http

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nebula Hub",
    SubTitle = "by Nebula Team",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Main = Window:AddTab({ Title = "Key System", Icon = "key" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local function checkKey(input_key)
    if not CurrentScriptID then
        Fluent:Notify({
            Title = "Unsupported Game",
            Content = "Nebula Hub does not currently support this game.",
            Duration = 5
        })
        return
    end
    
    API.script_id = CurrentScriptID
    local status = API.check_key(input_key or script_key)
    
    if status.code == "KEY_VALID" then
        script_key = input_key or script_key
        writefile(key_path, script_key)
        Fluent:Notify({
            Title = "Verification Complete",
            Content = "Valid key! Loading script...",
            Duration = 3
        })
        task.wait(1)
        Window:Destroy()
        API.load_script()
    elseif status.code:find("KEY_") then
        local messages = {
            KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
            KEY_INCORRECT = "Incorrect key",
            KEY_INVALID = "Invalid key format",
            KEY_EXPIRED = "Your key has expired",
            KEY_BANNED = "This key has been banned"
        }
        Fluent:Notify({
            Title = "Verification Failed",
            Content = messages[status.code] or "Unknown error",
            Duration = 8
        })
    else
        Players.LocalPlayer:Kick("Verification failed: " .. status.message .. " Code: " .. status.code)
    end
end

if not CurrentScriptID then
    task.spawn(function()
        task.wait(1)
        Fluent:Notify({
            Title = "Unsupported Game",
            Content = "Nebula Hub does not currently support this game.",
            Duration = 5
        })
    end)
else
    if script_key then
        checkKey()
    end
end

do
    Fluent:Notify({
        Title = "Nebula Hub",
        Content = "Welcome to Nebula Hub!",
        Duration = 5
    })

    if CurrentScriptID then
        Tabs.Main:AddParagraph({
            Title = "Key System",
            Content = "Enter your key below to access Nebula Hub.\nIf you don't have a key, use the button to get one."
        })

        local Input = Tabs.Main:AddInput("Key", {
            Title = "Enter Your Key",
            Default = script_key or "",
            Placeholder = "Example: JnX84B...",
            Numeric = false,
            Finished = false,
            Callback = function(Value)
                script_key = Value
            end
        })

        Tabs.Main:AddButton({
            Title = "Verify Key",
            Description = "Check if the entered key is valid",
            Callback = function()
                checkKey(Input.Value)
            end
        })

        Tabs.Main:AddButton({
            Title = "Get Key",
            Description = "Get a key through ads",
            Callback = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub_Free_Access-LMgKfCJvLDMH")
                Fluent:Notify({
                    Title = "Copied to Clipboard",
                    Content = "Link to get your key has been copied to your clipboard",
                    Duration = 16
                })
            end
        })

        Tabs.Main:AddButton({
            Title = "Join Discord",
            Description = "Join our Discord server for support",
            Callback = function()
                setclipboard("https://discord.gg/WmMp3S5ZYc")
                Fluent:Notify({
                    Title = "Copied to Clipboard",
                    Content = "Discord server link has been copied to your clipboard",
                    Duration = 16
                })
            end
        })

        Tabs.Main:AddParagraph({
            Title = "Common Issues",
            Content = "• HWID LOCKED: Your key is linked to another device\n• KEY INCORRECT: The provided key doesn't exist\n• KEY INVALID: Invalid key format\n• KEY EXPIRED: Your key has expired\n• KEY BANNED: Key banned from the system"
        })
    else
        Tabs.Main:AddParagraph({
            Title = "Unsupported Game",
            Content = "Nebula Hub does not currently support this game.\nYou can close this loader manually."
        })
    end
    
    Tabs.Settings:AddParagraph({
        Title = "Information",
        Content = "Current Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. 
                 "\nGame ID: " .. game.GameId .. 
                 "\nVersion: 1.0.0\nDeveloped by Nebula Team"
    })
    
    Tabs.Settings:AddButton({
        Title = "Copy Game ID",
        Description = "Copy the current Game ID to clipboard",
        Callback = function()
            setclipboard(tostring(game.GameId))
            Fluent:Notify({
                Title = "Game ID Copied",
                Content = "Game ID: " .. game.GameId .. " has been copied to clipboard",
                Duration = 5
            })
        end
    })
    
    local Toggle = Tabs.Settings:AddToggle("AutoSaveKey", {
        Title = "Automatically Save Key", 
        Default = true 
    })

    Toggle:OnChanged(function()
        print("Auto Save Key:", Options.AutoSaveKey.Value)
    end)
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"Key"})
InterfaceManager:SetFolder("NebulaLoader")
SaveManager:SetFolder("NebulaLoader/configs")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(1)

task.spawn(function()
    while task.wait(1) do
        if Fluent.Unloaded then
            getgenv().NebulaLoaderActive = false
            break
        end
    end
end)

Fluent:Notify({
    Title = "Nebula Hub",
    Content = "Loader successfully loaded!",
    Duration = 5
})
