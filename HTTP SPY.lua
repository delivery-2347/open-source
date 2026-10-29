local HttpService = game:GetService("HttpService")

local function err0r(txt)
    task.spawn(function() error(txt) end)
end

local function printLog(method, url, headers, body)
    if not url then return end

    local log = string.format(
        "Method: %s\nURL: %s",
        tostring(method or "REQUEST"),
        tostring(url)
    )

    if type(headers) == "table" then
        log ..= "\n\nHeaders:"

        for key, value in pairs(headers) do
            log ..= string.format(
                "\n%s: %s",
                tostring(key),
                tostring(value)
            )
        end
    end

    if body ~= nil and body ~= "" then
        if type(body) == "table" then
            local success, encoded = pcall(function()
                return HttpService:JSONEncode(body)
            end)

            body = success and encoded or tostring(body)
        end

        log ..= "\n\nBody:\n" .. tostring(body)
    end

    warn("---------------[HTTP SPY]---------------")
        err0r(log)
    warn("----------------------------------------")
end

-- HTTP GET
local oldHttpGet
oldHttpGet = hookfunction(game.HttpGet, function(self, url, ...)
    printLog("GET", url)
    return oldHttpGet(self, url, ...)
end)

-- HTTP POST
local oldHttpPost
oldHttpPost = hookfunction(game.HttpPost, function(self, url, body, ...)
    printLog("POST", url, nil, body)
    return oldHttpPost(self, url, body, ...)
end)

-- syn.request / request
if syn and syn.request then
    local oldRequest

    oldRequest = hookfunction(syn.request, function(data)
        printLog(
            data.Method or data.method or "REQUEST",
            data.Url or data.URL or data.url,
            data.Headers or data.headers,
            data.Body or data.body
        )

        return oldRequest(data)
    end)

elseif request then
    local oldRequest

    oldRequest = hookfunction(request, function(data)
        printLog(
            data.Method or data.method or "REQUEST",
            data.Url or data.URL or data.url,
            data.Headers or data.headers,
            data.Body or data.body
        )

        return oldRequest(data)
    end)

else
    error("[HTTP SPY] Request function is not supported!")
end

err0r[[
---------------[HTTP SPY STARTED]---------------
------------------by: CUCUMBER------------------
---------------[HTTP SPY STARTED]---------------
]]
