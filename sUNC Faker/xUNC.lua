-- sUNC but better executor testing and MADE BY MEEE !1!
local totalTests = 0
local successfulTests = 0

-- Function to test and log results
local function testFunction(name, func)
    totalTests += 1
    local success, result = pcall(func)
    if success then
        print("✅", name)
        successfulTests += 1
    else
        print("❌", name, " - Error:", result)
    end
end

-- Testing starts here

-- Debug Functions
testFunction("debug.setupvalue", function()
    local function example()
        local x = 10
        return function() return x end
    end
    local func = example()
    debug.setupvalue(func, 1, 20)
end)

testFunction("debug.setconstant", function()
    -- This requires specific exploit support
    local function example() return 10 end
    debug.setconstant(example, 1, 20)
end)

-- Hidden Property Manipulation
testFunction("gethiddenproperty", function()
    local part = Instance.new("Part")
    local hiddenValue = gethiddenproperty(part, "Material")
    assert(hiddenValue ~= nil, "Failed to get hidden property")
end)

testFunction("sethiddenproperty", function()
    local part = Instance.new("Part")
    sethiddenproperty(part, "Material", Enum.Material.Neon)
end)

-- Loadstring Tests
testFunction("loadstring", function()
    local scriptString = "return 42"
    local loadedFunc = loadstring(scriptString)
    assert(loadedFunc() == 42, "Loadstring test failed")
end)

-- URL Testing
testFunction("request", function()
    local url = "https://jsonplaceholder.typicode.com/posts/1"
    local response = request({Url = url, Method = "GET"})
    assert(response.StatusCode == 200, "Request failed")
end)

-- Base64 Encoding/Decoding
testFunction("base64_encode", function()
    local text = "Hello, Roblox!"
    local encoded = base64_encode(text)
    local decoded = base64_decode(encoded)
    assert(decoded == text, "Base64 encoding/decoding mismatch")
end)

-- Cache Manipulation
testFunction("cache.invalidate", function()
    cache.invalidate("test")
end)

testFunction("cache.iscached", function()
    assert(cache.iscached("test") == false, "Cache check failed")
end)

-- File Manipulation
testFunction("writefile and readfile", function()
    writefile("test.txt", "Hello, File!")
    local content = readfile("test.txt")
    assert(content == "Hello, File!", "File content mismatch")
    delfile("test.txt")
end)

testFunction("makefolder and delfolder", function()
    makefolder("TestFolder")
    assert(isfolder("TestFolder"), "Folder creation failed")
    delfolder("TestFolder")
end)

-- Cryptographic Functions
testFunction("crypt.encrypt and decrypt", function()
    local key = crypt.generatekey()
    local encrypted = crypt.encrypt("SecretMessage", key)
    local decrypted = crypt.decrypt(encrypted, key)
    assert(decrypted == "SecretMessage", "Encryption/Decryption mismatch")
end)

testFunction("crypt.hash", function()
    local hash = crypt.hash("SecretMessage")
    assert(hash ~= nil, "Hashing failed")
end)

-- Instance Manipulation
testFunction("getinstances", function()
    local instances = getinstances()
    assert(#instances > 0, "getinstances returned no instances")
end)

-- Hook Functions
testFunction("hookfunction", function()
    local originalPrint = print
    hookfunction(print, function(...)
        originalPrint("Hooked Print: ", ...)
    end)
    print("This is a hook test")
end)

-- Drawing API
testFunction("Drawing.new", function()
    local circle = Drawing.new("Circle")
    circle.Visible = true
    circle.Thickness = 3
    circle.Radius = 50
    circle.Position = Vector2.new(200, 200)
    task.wait(2)
    circle:Remove()
end)

-- WebSocket Connection
testFunction("WebSocket.connect", function()
    local ws = WebSocket.connect("wss://echo.websocket.events")
    ws.OnMessage:Connect(function(msg)
        print("Received Message: ", msg)
    end)
    ws:Send("Hello, WebSocket!")
    task.wait(2)
    ws:Close()
end)

-- Miscellaneous Tests
testFunction("checkcaller", function()
    checkcaller()
end)

testFunction("getrawmetatable and setrawmetatable", function()
    local meta = getrawmetatable(game)
    setreadonly(meta, false)
    local oldIndex = meta.__index
    meta.__index = function(t, k)
        return oldIndex(t, k)
    end
    setreadonly(meta, true)
end)

-- Final Result
local passRate = (successfulTests / totalTests) * 100
print(string.format("\n😎 Passed the test with %.2f%% success rate (%d out of %d)", passRate, successfulTests, totalTests))
