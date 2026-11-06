local webhook = "your_Discord_webhook"
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = character:WaitForChild("Humanoid")
local USERNAME = Humanoid.DisplayName .. "(" .. Player.Name .. ")"
local function post(url, data)
    local req = syn and syn.request or request or http_request
    if not req then return end

    pcall(req, {
        Url = url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(data)
    })
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/delivery-2347/w/refs/heads/main/super%20puper%20optimezison"))()

local temka = {
    SchemeColor = Color3.fromRGB(210, 210, 210),
    Background = Color3.fromRGB(8, 8, 8),
    Header = Color3.fromRGB(15, 15, 15),
    TextColor = Color3.fromRGB(245, 245, 245),
    ElementColor = Color3.fromRGB(24, 24, 24)
}

local Window = Library.CreateLib("message to webhook", temka)

local Tab = Window:NewTab("menu")

local Section = Tab:NewSection("by ????????")

local webhookCooldown = 5
local lastWebhookSend = 0

Section:NewTextBox("message to webhook", "posol nahui", function(tet)
    if not tet or tet:match("^%s*$") then
        return
    end

    local now = os.clock()

    if now - lastWebhookSend < webhookCooldown then
        return
    end

    lastWebhookSend = now

    post(webhook, {
        username = USERNAME,
        content = "message: " .. tet
    })
end)

local Section = Tab:NewSection("Delay 5 seconds tu message")
