local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local MainWindow = Rayfield:CreateWindow({
   Name = "Sentry",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Sentry Interface",
   LoadingSubtitle = "Shaan",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "q", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SentryInterface", -- Create a custom folder for your hub/game
      FileName = "SentryHub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sentry Key System",
      Subtitle = "Key System",
      Note = "Wait until released", -- Use this to tell the user how to get a key
      FileName = "SentryKeySystem", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Rip_SpikeGamer","Aayu1120"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local PlayerTab = MainWindow:CreateTab("Player", 4483362458) -- Title, Image

local PlayerSection = PlayerTab:CreateSection("Movement")

local Slider = PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 100},
    Increment = 1,
    Suffix = "WS",
    CurrentValue = 16,
    Flag = "WSslider",
    Callback = function(a)
      game.workspace.live.localPlayer.humanoid.walkSpeed = a

