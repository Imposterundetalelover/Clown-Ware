local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Funny Hack", "Ocean")
local Exploit = Window:NewTab("Exploit")
local Movement = Window:NewTab("Movement")
local Gui = Window:NewTab("Gui")
local ExploitSection = Exploit:NewSection("Exploits")
local MovementSection = Movement:NewSection("Movement")
local GuiSection = Gui:NewSection("Movement")
local whitelist = {4304562300}
local function isWhitelisted(UUID_SYSTEM_LOCK)
	for i,v in pairs(whitelist) do
		if v == UUID_SYSTEM_LOCK then
			return true
		end
	end
	return false
end

local lplr = game.Players.LocalPlayer
local function punch(target)
	game:GetService("ReplicatedStorage").meleeEvent:FireServer(target)
end
local BigGuysExploitToggled = false
local function BigGuysExploitToggle()
	BigGuysExploitToggled = not BigGuysExploitToggled
	repeat task.wait()
		pcall(function()
			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= lplr then
					if (v.Character) and (lplr.Character) then
						if v.Character.Humanoid.Health > 1 then
							if (v.Character.PrimaryPart.Position - lplr.Character.PrimaryPart.Position).Magnitude < 20 then
								if not isWhitelisted(v.UserId) then
									punch(v)
								end
							end
						end
					end
				end
			end
		end)
	until not BigGuysExploitToggled
end
ExploitSection:NewToggle("4BigGuysExploit", "Kill Everyone Around You", function(state)
	if state then
		BigGuysExploitToggle()
	else
		BigGuysExploitToggle()
	end
end)

GuiSection:NewButton("RemoveDarkScreen", "", function()
	game:GetService("Players")[lplr.Name].PlayerGui.Home.fadeFrame:Remove()
end)
