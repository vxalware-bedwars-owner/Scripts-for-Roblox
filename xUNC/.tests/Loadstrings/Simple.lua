local passed, err = pcall(function()
    -- Slightly advanced test: getrawmetatable
    local mt = getrawmetatable(game)
end)

if passed then
    print("✅ Passed the simple loadstring test.")
else
    print("❌ Failed the simple loadstring test.")
end
