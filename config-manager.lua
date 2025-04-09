local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nebula Config manager",
    SubTitle = "by dumm_dogg",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local MainTab = Window:AddTab({ Title = "Configs", Icon = "download" })

local function showNotification(title, content)
    Fluent:Notify({
        Title = title,
        Content = content,
        Duration = 5
    })
end

local function installConfig(config)
    if not config or not config.url or not config.path then return end
    
    showNotification("Downloading", config.name)
    
    local pathParts = string.split(config.path, "\\")
    local currentPath = ""
    for i = 1, #pathParts - 1 do
        currentPath = currentPath .. (i > 1 and "\\" or "") .. pathParts[i]
        if not isfolder(currentPath) then
            pcall(makefolder, currentPath)
        end
    end
    
    local success, content = pcall(game.HttpGet, game, config.url, true)
    if success and content then
        pcall(writefile, config.path, content)
        showNotification("Installed", config.name)
    else
        showNotification("Failed", config.name)
    end
end

local function loadConfigs()
    local success, response = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/getthreadcontext/nebula-community/main/configs/list.json", true)
    end)
    
    if not success then return end
    
    local success2, configData = pcall(function()
        return game:GetService("HttpService"):JSONDecode(response)
    end)
    
    if not success2 or not configData.configs then return end
    
    for _, config in ipairs(configData.configs) do
        if config.name and config.url and config.path then
            MainTab:AddButton({
                Title = config.name,
                Description = config.description or "",
                Callback = function()
                    pcall(installConfig, config)
                end
            })
        end
    end
end

spawn(loadConfigs)

showNotification("Ready", "Configs loaded")
