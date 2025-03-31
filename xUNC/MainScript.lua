print("🔃 Loading...")
task.wait(5)
print("🚀 Starting xUNC Test!")
print("❗ Make sure to join our Discord if you want: https://dsc.gg/vxalware")
task.wait(5)
warn("🚀 Testing all functions of the executor...")
task.wait(3.5)
print("\n\n\n")

-- Table to store test results
local tests = {
    { "identifyexecutor", function() return identifyexecutor ~= nil end },
    { "gethui", function() return gethui ~= nil end },
    { "getgenv", function() return getgenv ~= nil end },
    { "getrenv", function() return getrenv ~= nil end },
    { "getreg", function() return getreg ~= nil end },
    { "debug library", function() return debug ~= nil end },
    { "setreadonly", function() return setreadonly ~= nil end },
    { "isreadonly", function() return isreadonly ~= nil end },
    { "hookfunction", function() return hookfunction ~= nil end },
    { "getrawmetatable", function() return getrawmetatable ~= nil end },
    { "checkcaller", function() return checkcaller ~= nil end },
    { "newcclosure", function() return newcclosure ~= nil end },
    { "setclipboard", function() return setclipboard ~= nil end },
    { "firesignal", function() return firesignal ~= nil end },
    { "request/http.request", function() return request ~= nil or (http and http.request) ~= nil end },
    { "syn functions", function() return syn ~= nil end }
}

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
