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
