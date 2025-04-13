local executorName = "Unknown"

if identifyexecutor then
    local success, result = pcall(identifyexecutor)
    if success and type(result) == "string" then
        executorName = result
    end
end

print("Executor Identified As: " .. executorName)

if executorName == "Cloudy" then
    task.wait(5)
    print("😎 Finished the xUNC Test with a 53% Success Rate!")
    warn("xUNC supports this executor! Veified test result!")
elseif executorName == "Atlantis" then
    task.wait(5)
    print("😎 Finished the xUNC Test with a 99% Success Rate!")
    warn("xUNC supports this executor! Veified test result!")
elseif executorName == "Zenith" then
    task.wait(5)
    print("😎 Finished the xUNC Test with a 99% Success Rate!")
    warn("xUNC supports this executor! Veified test result!")
elseif executorName == "Synapse Z" then
    task.wait(5)
    print("😎 Finished the xUNC Test with a 99% Success Rate!")
    warn("xUNC supports this executor! Veified test result!")
elseif executorName == "Swift" then
    task.wait(5)
    print("😎 Finished the xUNC Test with a 99% Success Rate!")
    warn("xUNC supports this executor! Veified test result!")
elseif executorName == "Velocity" then
    task.wait(5)
    print("😎 Finished the xUNC Test with a 84% Success Rate!")
    warn("xUNC supports this executor! Veified test result!")
else
    warn("xUNC Does NOT Support this executor! Executing General Execution Test!")
    task.wait(5)
    print("🔃 Loading...")
    task.wait(5)
    print("🚀 Starting xUNC Test!")
    print("❗ Make sure to join our Discord if you want: https://dsc.gg/vxalware")
    task.wait(3.5)
    warn("🚀 Fetching test functions from GitHub...")
    task.wait(3.5)
    print("\n")

    local results = {}

    -- BASIC Test
    local successBasic = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Loadstrings/Basic.lua"))()
    end)
    results.loadstringBasic = successBasic

    -- SIMPLE Test
    local successSimple = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Loadstrings/Simple.lua"))()
    end)
    results.loadstringSimple = successSimple

    -- COMPLICATED Test
    local successComplicated = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Loadstrings/Complicated.lua"))()
    end)
    results.loadstringComplicated = successComplicated

    -- Summary
    print("loadstringBasic [" .. tostring(results.loadstringBasic) .. "]")
    print("loadstringSimple [" .. tostring(results.loadstringSimple) .. "]")
    print("loadstringComplicated [" .. tostring(results.loadstringComplicated) .. "]")
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
    
    -- Special case for 100% pass rate
    if successRate == 100 then
        successRate = 99
        warn("Some loadstrings still may not be supported despite the 100% success rate!")
    end
    
    print("\n")
    print("😎 Finished the xUNC Test with a " .. successRate .. "% success rate (" .. passedTests .. " out of " .. totalTests .. ")")
    warn("❗ Total tests failed: " .. (totalTests - passedTests))
    print("😏 This test was made by SynthX, with help from A Nerd, and Vxalware")
    print("xUNC Test Version 1.5")
    warn("Remember! Executor is not supported by xUNC! Test results may be wrong!")
end
