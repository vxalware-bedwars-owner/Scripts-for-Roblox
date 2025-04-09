local passed, err = pcall(function()
    -- Complicated test: modify metatable
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldIndex = mt.__index
end)

if passed then
    print("✅ Passed the complicated loadstring test.")
else
    print("❌ Failed the complicated loadstring test.")
end
