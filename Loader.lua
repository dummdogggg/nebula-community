-- [ ----------------------------------------------------------------- ] 
-- ███╗░░██╗  ███████╗  ██████╗░  ██╗░░░██╗  ██╗░░░░░  ░█████╗░ 
-- ████╗░██║  ██╔════╝  ██╔══██╗  ██║░░░██║  ██║░░░░░  ██╔══██╗
-- ██╔██╗██║  █████╗░░  ██████╦╝  ██║░░░██║  ██║░░░░░  ███████║
-- ██║╚████║  ██╔══╝░░  ██╔══██╗  ██║░░░██║  ██║░░░░░  ██╔══██║
-- ██║░╚███║  ███████╗  ██████╦╝  ╚██████╔╝  ███████╗  ██║░░██║
-- ╚═╝░░╚══╝  ╚══════╝  ╚═════╝░  ░╚═════╝░  ╚══════╝  ╚═╝░░╚═╝
--                     I hope you enjoy our scripts.
-- Nebula Hub is developed by a passionate team of beginners who are 
-- studying and learning about exploits and script development. 
-- We appreciate your support as we continue to grow and improve! 
-- ~> https://discord.gg/nebulascripts
-- [ ----------------------------------------------------------------- ]

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
local Players, _ = Cloneref(game:GetService("Players")), Cloneref(game:GetService("HttpService"))

local libraryLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))
local apiLoader = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))
local Library = libraryLoader()
local API = apiLoader()

local Window = Library:CreateWindow({
    Title = "Nebula Hub",
    Footer = "by Nebula Team",
    Size = UDim2.fromOffset(580, 460),
    Center = true,
    AutoShow = true,
    ToggleKeybind = Enum.KeyCode.End
})

local MainTab = Window:AddTab("Key System", "key")
local SettingsTab = Window:AddTab("Settings", "settings")

local function checkKey(input_key)
    if not CurrentScriptID then
        Library:Notify({
            Title = "Unsupported Game",
            Description = "Nebula Hub does not currently support this game.",
            Time = 5
        })
        return
    end
    
    API.script_id = CurrentScriptID
    local status = API.check_key(input_key or script_key)
    
    if status.code == "KEY_VALID" then
        script_key = input_key or script_key
        writefile(key_path, script_key)
        Library:Notify({
            Title = "Verification Complete",
            Description = "Valid key! Loading script...",
            Time = 3
        })
        task.wait(1)
        Library:Unload()
        API.load_script()
    elseif status.code:find("KEY_") then
        local messages = {
            KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
            KEY_INCORRECT = "Incorrect key",
            KEY_INVALID = "Invalid key format",
            KEY_EXPIRED = "Your key has expired",
            KEY_BANNED = "This key has been banned"
        }
        Library:Notify({
            Title = "Verification Failed",
            Description = messages[status.code] or "Unknown error",
            Time = 8
        })
    else
        Players.LocalPlayer:Kick("Verification failed: " .. status.message .. " Code: " .. status.code)
    end
end

if not CurrentScriptID then
    task.spawn(function()
        task.wait(1)
        Library:Notify({
            Title = "Unsupported Game",
            Description = "Nebula Hub does not currently support this game.",
            Time = 5
        })
    end)
else
    if script_key then
        checkKey()
    end
end

do
    Library:Notify({
        Title = "Nebula Hub",
        Description = "Welcome to Nebula Hub!",
        Time = 5
    })

    if CurrentScriptID then
        local KeyGroupbox = MainTab:AddLeftGroupbox("Key System")
        local InfoGroupbox = MainTab:AddRightGroupbox("Information")
        
        KeyGroupbox:AddLabel({
            Text = "Enter your key below to access Nebula Hub.\nIf you don't have a key, use the button to get one.",
            DoesWrap = true
        })

        local KeyInput = KeyGroupbox:AddInput("Key", {
            Text = "Enter Your Key",
            Default = script_key or "",
            Placeholder = "Example: JnX84B...",
            Numeric = false,
            Finished = false,
            Callback = function(Value)
                script_key = Value
            end
        })

        KeyGroupbox:AddButton({
            Text = "Verify Key",
            Func = function()
                checkKey(KeyInput.Value)
            end
        })

        KeyGroupbox:AddButton({
            Text = "Get Key ~> Linkvertise",
            Func = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub_Free_Access-LMgKfCJvLDMH")
                Library:Notify({
                    Title = "Copied to Clipboard",
                    Description = "Link to get your key has been copied to your clipboard",
                    Time = 16
                })
            end
        })

        KeyGroupbox:AddButton({
            Text = "Get Key ~> Lootlabs / Workink",
            Func = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub__Lootlabs-cgoAGWoLWaWS")
                Library:Notify({
                    Title = "Copied to Clipboard",
                    Description = "Link to get your key has been copied to your clipboard",
                    Time = 16
                })
            end
        })

        KeyGroupbox:AddButton({
            Text = "Join Discord",
            Func = function()
                setclipboard("https://discord.gg/WmMp3S5ZYc")
                Library:Notify({
                    Title = "Copied to Clipboard",
                    Description = "Discord server link has been copied to your clipboard",
                    Time = 16
                })
            end
        })

        InfoGroupbox:AddLabel({
            Text = "Common Issues:\n• HWID LOCKED: Your key is linked to another device\n• KEY INCORRECT: The provided key doesn't exist\n• KEY INVALID: Invalid key format\n• KEY EXPIRED: Your key has expired\n• KEY BANNED: Key banned from the system",
            DoesWrap = true
        })
    else
        local InfoGroupbox = MainTab:AddLeftGroupbox("Unsupported Game")
        
        InfoGroupbox:AddLabel({
            Text = "Nebula Hub does not currently support this game.\nYou can close this loader manually.",
            DoesWrap = true
        })
    end
    
    local InfoGroupbox = SettingsTab:AddLeftGroupbox("Information")
    local ConfigGroupbox = SettingsTab:AddRightGroupbox("Configuration")
    
    InfoGroupbox:AddLabel({
        Text = "Current Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. 
               "\nGame ID: " .. game.GameId .. 
               "\nVersion: 1.0.0\nDeveloped by Nebula Team",
        DoesWrap = true
    })
    
    InfoGroupbox:AddButton({
        Text = "Copy Game ID",
        Func = function()
            setclipboard(tostring(game.GameId))
            Library:Notify({
                Title = "Game ID Copied",
                Description = "Game ID: " .. game.GameId .. " has been copied to clipboard",
                Time = 5
            })
        end
    })
    
    local AutoSaveToggle = ConfigGroupbox:AddToggle("AutoSaveKey", {
        Text = "Automatically Save Key", 
        Default = true,
        Callback = function(Value)
            print("Auto Save Key:", Value)
        end
    })
end

Library:Notify({
    Title = "Nebula Hub",
    Description = "Loader successfully loaded!",
    Time = 5
})
