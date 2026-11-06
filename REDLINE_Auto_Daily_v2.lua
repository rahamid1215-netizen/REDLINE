-- REDLINE by REDLINEALI | Automatic Bayview Skip + Daily Login Rewards
-- Standalone PC / Delta build. Tutorial, daily rewards, and presents are always enabled.
-- Verified against the client-visible WANTED UPDATE(6) export; server acceptance is authoritative.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local environment = _G
pcall(function()
    if type(getgenv) == "function" then environment = getgenv() end
end)
if environment.REDLINE_AUTO_DAILY_RUNNING then
    return -- Re-execution must never create duplicate loops or remote requests.
end
environment.REDLINE_AUTO_DAILY_RUNNING = true

local function loadModule(name)
    local ok, result = pcall(function()
        local devv = ReplicatedStorage:WaitForChild("Devv", 20)
        if not devv then return nil end
        local loader = require(devv)
        if type(loader) ~= "table" or type(loader.load) ~= "function" then return nil end
        return loader.load(name)
    end)
    if ok and type(result) == "table" then return result end
    return nil
end

local ClientData, ClientTasks, TimeUtil, Network, ClientTools
local function refreshModules()
    ClientData = ClientData or loadModule("ClientData")
    ClientTasks = ClientTasks or loadModule("ClientTasks")
    TimeUtil = TimeUtil or loadModule("TimeUtil")
    Network = Network or loadModule("Network")
    ClientTools = ClientTools or loadModule("ClientTools")
    return ClientData and ClientTasks and TimeUtil and Network
end

local function call(object, method, ...)
    if type(object) ~= "table" or type(object[method]) ~= "function" then return false, nil end
    return pcall(object[method], ...)
end

-- Compact, read-only status display. No toggles, no extra navigation.
local gui = Instance.new("ScreenGui")
gui.Name = "REDLINE_AutoDaily"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local parent = player:WaitForChild("PlayerGui", 20)
if not parent then
    environment.REDLINE_AUTO_DAILY_RUNNING = nil
    return
end
gui.Parent = parent

local panel = Instance.new("Frame")
panel.Name = "Status"
panel.Size = UDim2.fromOffset(282, 143)
panel.Position = UDim2.new(0.5, -141, 0.10, 0)
panel.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
panel.BorderSizePixel = 0
panel.Parent = gui
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = panel
local outline = Instance.new("UIStroke")
outline.Color = Color3.fromRGB(65, 42, 49)
outline.Thickness = 1
outline.Parent = panel

local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, 0, 0, 3)
bar.BorderSizePixel = 0
bar.BackgroundColor3 = Color3.fromRGB(156, 53, 74)
bar.Parent = panel
local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 3)
barCorner.Parent = bar

local function label(name, y, text, size, color, bold)
    local item = Instance.new("TextLabel")
    item.Name = name
    item.BackgroundTransparency = 1
    item.Position = UDim2.fromOffset(14, y)
    item.Size = UDim2.new(1, -28, 0, size + 7)
    item.TextXAlignment = Enum.TextXAlignment.Left
    item.TextTruncate = Enum.TextTruncate.AtEnd
    item.Text = text
    item.TextColor3 = color
    item.TextSize = size
    item.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    item.Parent = panel
    return item
end

label("Title", 10, "REDLINE  /  AUTO DAILY", 13, Color3.fromRGB(241, 238, 240), true)
local tutorialLabel = label("Bayview", 43, "BAYVIEW   Checking...", 12, Color3.fromRGB(206, 205, 210), false)
local dailyLabel = label("Daily", 70, "REWARDS   Checking...", 12, Color3.fromRGB(206, 205, 210), false)
local presentsLabel = label("Presents", 97, "PRESENTS   Checking...", 12, Color3.fromRGB(206, 205, 210), false)
local note = label("Note", 122, "Automatic  •  Always enabled", 10, Color3.fromRGB(139, 136, 143), false)
note.Size = UDim2.new(1, -28, 0, 15)

-- Drag by touching/clicking the panel; no controls that disable automation.
do
    local dragging, dragStart, startPos, dragInput = false, nil, nil, nil
    panel.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
        dragging = true
        dragStart = input.Position
        startPos = panel.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end)
    panel.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not dragging or input ~= dragInput or not dragStart then return end
        local delta = input.Position - dragStart
        panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end)
end

local tutorialDone = false
local lastSkipAttempt = -math.huge
local skipAttempts = 0
local lastClaimAttempt = -math.huge
local claimPending = false
local claimDay = nil
local claimAttempts = 0
local claimInFlight = false
local nextModuleAttempt = 0

local function taskIsComplete(name)
    local ok, result = call(ClientTasks, "IsTaskComplete", name)
    return ok and result == true
end

local function bayviewComplete()
    if taskIsComplete("BayviewTutorial") or taskIsComplete("BankTutorial") then return true end
    -- Bank tutorial being active/unlocked also confirms the Bayview transition.
    local ok, taskObject = call(ClientTasks, "GetTask", "BankTutorial")
    if ok and taskObject ~= nil then return true end
    local available, yes = call(ClientTasks, "IsTaskAvailable", "BankTutorial")
    return available and yes == true
end

local function checkTutorial()
    if tutorialDone then return end
    if not ClientTasks or not Network then
        tutorialLabel.Text = "BAYVIEW   Waiting for game..."
        return
    end
    local ready, completed = pcall(bayviewComplete)
    if ready and completed then
        tutorialDone = true
        tutorialLabel.Text = "BAYVIEW   Completed"
        return
    end
    local ok, taskObject = call(ClientTasks, "GetTask", "BayviewTutorial")
    if not ok or not taskObject then
        tutorialLabel.Text = "BAYVIEW   Waiting for tutorial..."
        return
    end
    local now = os.clock()
    if now - lastSkipAttempt < math.min(60, 8 + skipAttempts * 8) then
        tutorialLabel.Text = "BAYVIEW   Awaiting confirmation..."
        return
    end
    lastSkipAttempt = now
    skipAttempts = skipAttempts + 1
    local sent = false
    if skipAttempts == 1 and type(taskObject.CancelTutorial) == "function" then
        sent = pcall(function() taskObject:CancelTutorial() end)
    else
        -- The game's CancelTutorial sets isTutorialCancelled locally before the server
        -- acknowledges. Retry the same documented task event if confirmation was lost.
        sent = pcall(function() Network.FireServer("taskEvent", "BayviewTutorial", "cancelTutorial") end)
    end
    tutorialLabel.Text = sent and "BAYVIEW   Skip requested..." or "BAYVIEW   Retrying when ready..."
end

local function currentDay()
    local ok, day = call(TimeUtil, "GetDay")
    if ok and type(day) == "number" then return day end
    return math.floor(os.time() / 86400)
end

local function dailyState()
    local ok, value = call(ClientData, "Get", "dailyTask")
    if not ok or type(value) ~= "table" then return nil end
    return value
end

local function checkDaily()
    if not ClientData or not TimeUtil or not Network then
        dailyLabel.Text = "REWARDS   Waiting for game..."
        return
    end
    local day = currentDay()
    local state = dailyState()
    if not state then
        dailyLabel.Text = "REWARDS   Waiting for account..."
        return
    end
    if state.lastDay == day then
        claimPending = false
        dailyLabel.Text = "REWARDS   Claimed today"
        return
    end
    if claimDay ~= day then
        claimDay = day
        claimAttempts = 0
        lastClaimAttempt = -math.huge
        claimPending = false
    end
    if claimPending then
        dailyLabel.Text = "REWARDS   Verifying claim..."
        if os.clock() - lastClaimAttempt < 8 then return end
        claimPending = false
    end
    if claimInFlight or os.clock() - lastClaimAttempt < math.min(120, 20 + claimAttempts * 10) then
        dailyLabel.Text = "REWARDS   Waiting to retry..."
        return
    end
    lastClaimAttempt = os.clock()
    claimAttempts = claimAttempts + 1
    claimPending = true
    claimInFlight = true
    dailyLabel.Text = "REWARDS   Claiming..."
    task.spawn(function()
        local ok, accepted = pcall(function() return Network.InvokeServer("claimDailyReward") end)
        claimInFlight = false
        if not ok or accepted ~= true then
            claimPending = false
            -- Even a rejected request may race a valid game-owned claim: the next
            -- data check is authoritative, not this local return value.
            dailyLabel.Text = "REWARDS   Awaiting availability..."
        end
    end)
end


-- Present automation: game inventory is authoritative; never drop unrelated tools.
-- The export identifies Large Present, Medium Present, Small Present and Mystery Gift
-- as isPresent droppables, and the ordinary drop endpoint as dropItem(toolId, CFrame).
local PRESENT_NAMES = {
    ["Large Present"] = true,
    ["Medium Present"] = true,
    ["Small Present"] = true,
    ["Mystery Gift"] = true,
}
local PRESENT_SCAN_SECONDS = 3
local DROP_INTERVAL_SECONDS = 4.25 -- conservative allowance for the observed 3-4s server cooldown
local DROP_VERIFY_SECONDS = 2.5
local lastPresentScan = -math.huge
local lastDropRequest = -math.huge
local pendingPresent = nil
local presentBusy = false

local function getPresent()
    if not ClientTools then return nil end
    local okInv, inventory = call(ClientTools, "GetInventory")
    local okItems, items = call(ClientTools, "GetItems")
    if not okInv or type(inventory) ~= "table"
        or not okItems or type(items) ~= "table" or type(items.Tool) ~= "table" then
        return nil, false
    end
    for _, id in pairs(inventory) do
        local item = items.Tool[id]
        if item and PRESENT_NAMES[item.name] and (type(item.ammo) ~= "number" or item.ammo > 0) then
            return {id = id, name = item.name, ammo = item.ammo}, true
        end
    end
    return nil, true
end

local function presentChanged(before)
    local found, ready = getPresent()
    if not ready then return false end
    if not found or found.id ~= before.id then return true end
    if type(before.ammo) == "number" and type(found.ammo) == "number" then
        return found.ammo < before.ammo
    end
    return false
end

local function checkPresents()
    if presentBusy then return end
    if not ClientTools or not Network then
        presentsLabel.Text = "PRESENTS   Waiting for game..."
        return
    end
    local now = os.clock()
    if pendingPresent then
        if presentChanged(pendingPresent) then
            pendingPresent = nil
            presentsLabel.Text = "PRESENTS   Drop confirmed"
        elseif now - lastDropRequest < DROP_VERIFY_SECONDS then
            presentsLabel.Text = "PRESENTS   Verifying drop..."
            return
        else
            pendingPresent = nil
            presentsLabel.Text = "PRESENTS   Retry after cooldown..."
        end
    end
    if now - lastPresentScan < PRESENT_SCAN_SECONDS then return end
    lastPresentScan = now
    local present, ready = getPresent()
    if not ready then
        presentsLabel.Text = "PRESENTS   Waiting for inventory..."
        return
    end
    if not present then
        presentsLabel.Text = "PRESENTS   None in inventory"
        return
    end
    if now - lastDropRequest < DROP_INTERVAL_SECONDS then
        presentsLabel.Text = "PRESENTS   Waiting for cooldown..."
        return
    end
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid or humanoid.Health <= 0 then
        presentsLabel.Text = "PRESENTS   Waiting for character..."
        return
    end

    presentBusy = true
    presentsLabel.Text = "PRESENTS   Dropping " .. present.name .. "..."
    task.spawn(function()
        local ok, err = pcall(function()
            local equippedOk, equipped = call(ClientTools, "GetLocalEquippedTool")
            if not equippedOk or not equipped or equipped.toolId ~= present.id then
                local equipOk, equipResult = call(ClientTools, "ToggleEquip", present.id)
                if not equipOk or equipResult ~= true then
                    error("Could not equip present")
                end
                task.wait(0.45)
            end
            local current, readyNow = getPresent()
            if not readyNow or not current or current.id ~= present.id then
                error("Present no longer in inventory")
            end
            local currentRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not currentRoot then error("Character unavailable") end
            local dropAt = currentRoot.CFrame * CFrame.new(0, 0, -3)
            lastDropRequest = os.clock()
            pendingPresent = present
            local requestOk, accepted = pcall(function()
                return Network.InvokeServer("dropItem", present.id, dropAt)
            end)
            if not requestOk or accepted ~= true then
                -- Do not assume a failed/ambiguous response means a successful drop.
                presentsLabel.Text = "PRESENTS   Awaiting verification..."
            end
        end)
        if not ok then
            presentsLabel.Text = "PRESENTS   Waiting to retry..."
        end
        presentBusy = false
    end)
end

-- Always-on. Polling also handles delayed replication, respawns, and UTC rollover.
task.spawn(function()
    while environment.REDLINE_AUTO_DAILY_RUNNING == true and gui.Parent do
        if (not ClientData or not ClientTasks or not TimeUtil or not Network) and os.clock() >= nextModuleAttempt then
            nextModuleAttempt = os.clock() + 5
            refreshModules()
        end
        pcall(checkTutorial)
        pcall(checkDaily)
        pcall(checkPresents)
        task.wait(0.75)
    end
    environment.REDLINE_AUTO_DAILY_RUNNING = nil
end)
