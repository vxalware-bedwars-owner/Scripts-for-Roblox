-- Prevents errors from stopping the script
local function safeTest(func)
    local success, result = pcall(func)
    return success and result
end

-- Table to store test results
tests = {
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
    { "getcallbackvalue", function() return getcallbackvalue ~= nil end },
    { "decompile", function() return decompile ~= nil end },
    { "debug.setupvalue", function() return debug and debug.setupvalue ~= nil end },
    { "debug.setconstant", function() return debug and debug.setconstant ~= nil end },
    { "gethiddenproperty", function() return gethiddenproperty ~= nil end },
    { "sethiddenproperty", function() return sethiddenproperty ~= nil end },
    { "Drawing.Fonts", function() return Drawing and Drawing.Fonts ~= nil end },
    { "Drawing.new", function() return Drawing and Drawing.new ~= nil end },
    { "WebSocket.connect", function() return WebSocket and WebSocket.connect ~= nil end },
    { "appendfile", function() return appendfile ~= nil end },
    { "base64_decode", function() return base64_decode ~= nil end },
    { "base64_encode", function() return base64_encode ~= nil end },
    { "cache.invalidate", function() return cache and cache.invalidate ~= nil end },
    { "cache.iscached", function() return cache and cache.iscached ~= nil end },
    { "cache.replace", function() return cache and cache.replace ~= nil end },
    { "cleardrawcache", function() return cleardrawcache ~= nil end },
    { "clonefunction", function() return clonefunction ~= nil end },
    { "cloneref", function() return cloneref ~= nil end },
    { "compareinstances", function() return compareinstances ~= nil end },
    { "crypt.decrypt", function() return crypt and crypt.decrypt ~= nil end },
    { "crypt.encrypt", function() return crypt and crypt.encrypt ~= nil end },
    { "crypt.generatebytes", function() return crypt and crypt.generatebytes ~= nil end },
    { "crypt.generatekey", function() return crypt and crypt.generatekey ~= nil end },
    { "crypt.hash", function() return crypt and crypt.hash ~= nil end },
    { "debug.getconstant", function() return debug and debug.getconstant ~= nil end },
    { "debug.getconstants", function() return debug and debug.getconstants ~= nil end },
    { "debug.getinfo", function() return debug and debug.getinfo ~= nil end },
    { "debug.getproto", function() return debug and debug.getproto ~= nil end },
    { "debug.getprotos", function() return debug and debug.getprotos ~= nil end },
    { "debug.getupvalue", function() return debug and debug.getupvalue ~= nil end },
    { "debug.getupvalues", function() return debug and debug.getupvalues ~= nil end },
    { "debug.setstack", function() return debug and debug.setstack ~= nil end },
    { "delfile", function() return delfile ~= nil end },
    { "delfolder", function() return delfolder ~= nil end },
    { "fireclickdetector", function() return fireclickdetector ~= nil end },
    { "fireproximityprompt", function() return fireproximityprompt ~= nil end },
    { "firetouchinterest", function() return firetouchinterest ~= nil end },
    { "getcallingscript", function() return getcallingscript ~= nil end },
    { "getconnections", function() return getconnections ~= nil end },
    { "getcustomasset", function() return getcustomasset ~= nil end },
    { "getgc", function() return getgc ~= nil end },
    { "getinstances", function() return getinstances ~= nil end },
    { "getloadedmodules", function() return getloadedmodules ~= nil end },
    { "getnamecallmethod", function() return getnamecallmethod ~= nil end },
    { "getnilinstances", function() return getnilinstances ~= nil end },
    { "getscriptbytecode", function() return getscriptbytecode ~= nil end },
    { "getscriptclosure", function() return getscriptclosure ~= nil end },
    { "getscripts", function() return getscripts ~= nil end },
    { "setrawmetatable", function() return setrawmetatable ~= nil end },
    { "setrenderproperty", function() return setrenderproperty ~= nil end },
    { "setscriptable", function() return setscriptable ~= nil end },
    { "setthreadidentity", function() return setthreadidentity ~= nil end },
    { "writefile", function() return writefile ~= nil end },
    -- Loadstring Tests
    { "Full loadstring", function()
        local basicPass = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Loadstrings/Basic.lua"))()
        end)
        
        local simplePass = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Loadstrings/Simple.lua"))()
        end)
        
        local complicatedPass = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Scripts-for-Roblox/refs/heads/main/xUNC/.tests/Loadstrings/Complicated.lua"))()
        end)
        
        return basicPass and simplePass and complicatedPass
    end}
}
