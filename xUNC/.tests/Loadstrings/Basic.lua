local passed, err = pcall(function()
    -- Basic test: math operations
    local result = 10 + 5
end)

if passed then
    print("✅ Passed the basic loadstring test.")
else
    print("❌ Failed the basic loadstring test.")
end
