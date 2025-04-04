print("🔃 Loading...")
task.wait(5)
print("🚀 Starting xUNC Test!")
print("❗ Make sure to join our Discord if you want: https://dsc.gg/vxalware")
task.wait(5)
warn("🚀 Fetching test functions from GitHub...")
task.wait(3.5)
print("\n")

-- Fetch test functions from the provided GitHub link
local success, testScript = pcall(game.HttpGet, game, "https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Functions.lua")

if not success then
    warn("❌ Failed to load test functions from GitHub!")
    return
end

-- Execute the fetched script
local success, err = pcall(function()
    loadstring(testScript)()
end)

if not success then
    warn("❌ Error while executing test functions: " .. err)
    return
end

-- Test execution and result calculation
local totalTests = #tests
local passedTests = 0

for _, test in ipairs(tests) do
    local name, func = unpack(test)
    local success, result = pcall(func)

    if success and result then
        print("✅ " .. name .. " is supported!")
        passedTests = passedTests + 1
    else
        warn("❌ " .. name .. " is NOT supported!")
    end
    task.wait(0.1)
end

-- Success rate calculation
local successRate = math.floor((passedTests / totalTests) * 100)

print("\n")
-- Final results
print("😎 Finished the xUNC Test with a " .. successRate .. "% success rate (" .. passedTests .. " out of " .. totalTests .. ")")
warn("❗ Total tests failed: " .. (totalTests - passedTests))
print("😏 This test was made by SynthX, with help from A Nerd, and Vxalware")
print("xUNC Test Version: Beta 1.0")
