--[[local config = "hazel-ware/Config/"..tostring(game.PlaceId)
if not isfile("hazel-ware") then
	makefolder("hazel-ware")
	makefolder("hazel-ware/Config")
end
if not isfile("hazel-ware/Config/"..game.PlaceId) then
	makefolder("hazel-ware/Config/"..game.PlaceId)
end--]]
local buttons = {}
local toMakeInvisible = {}
local saved_settings = {
	Toggles = {},
	Textboxes = {},
	Sliders = {}
}
local settings = {
	NotificationCount = 0
}

local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
local Combat = Instance.new("ScrollingFrame")
local CombatTab = Instance.new("TextLabel")
Combat.Name = "Combat"
Combat.Parent = ScreenGui
Combat.Active = true
Combat.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Combat.BorderSizePixel = 0
Combat.Position = UDim2.new(0.122174717, 0, 0.263414651, 0)
Combat.Size = UDim2.new(0, 163, 0, 387)
Combat.ScrollBarThickness = 0
CombatTab.Name = "CombatTab"
CombatTab.Parent = Combat
CombatTab.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
CombatTab.BorderSizePixel = 0
CombatTab.Size = UDim2.new(0, 163, 0, 40)
CombatTab.Font = Enum.Font.SourceSans
CombatTab.Text = "Combat"
CombatTab.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatTab.TextScaled = true
CombatTab.TextSize = 14.000
CombatTab.TextWrapped = true
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Combat
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
local Movement = Instance.new("ScrollingFrame")
local MovementTab = Instance.new("TextLabel")
local UIListLayout_3 = Instance.new("UIListLayout")
local Render = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local RenderTab = Instance.new("TextLabel")
local Utility = Instance.new("ScrollingFrame")
local UIListLayout_5 = Instance.new("UIListLayout")
local UtilityTab = Instance.new("TextLabel")
Movement.Name = "Movement"
Movement.Parent = ScreenGui
Movement.Active = true
Movement.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Movement.BorderSizePixel = 0
Movement.Position = UDim2.new(0.24434942, 0, 0.263414651, 0)
Movement.Size = UDim2.new(0, 163, 0, 387)
Movement.ScrollBarThickness = 0
MovementTab.Name = "MovementTab"
MovementTab.Parent = Movement
MovementTab.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
MovementTab.BorderSizePixel = 0
MovementTab.Size = UDim2.new(0, 163, 0, 40)
MovementTab.Font = Enum.Font.SourceSans
MovementTab.Text = "Movement"
MovementTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MovementTab.TextScaled = true
MovementTab.TextSize = 14.000
MovementTab.TextWrapped = true
UIListLayout_3.Parent = Movement
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
Render.Name = "Render"
Render.Parent = ScreenGui
Render.Active = true
Render.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Render.BorderSizePixel = 0
Render.Position = UDim2.new(0.36652413, 0, 0.263414651, 0)
Render.Size = UDim2.new(0, 163, 0, 387)
Render.ScrollBarThickness = 0
UIListLayout_4.Parent = Render
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
RenderTab.Name = "RenderTab"
RenderTab.Parent = Render
RenderTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RenderTab.BorderSizePixel = 0
RenderTab.Size = UDim2.new(0, 163, 0, 40)
RenderTab.Font = Enum.Font.SourceSans
RenderTab.Text = "Render"
RenderTab.TextColor3 = Color3.fromRGB(255, 255, 255)
RenderTab.TextScaled = true
RenderTab.TextSize = 14.000
RenderTab.TextWrapped = true
Utility.Name = "Utility"
Utility.Parent = ScreenGui
Utility.Active = true
Utility.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Utility.BorderSizePixel = 0
Utility.Position = UDim2.new(0.491142333, 0, 0.263414651, 0)
Utility.Size = UDim2.new(0, 163, 0, 387)
Utility.ScrollBarThickness = 0
UIListLayout_5.Parent = Utility
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UtilityTab.Name = "UtilityTab"
UtilityTab.Parent = Utility
UtilityTab.BackgroundColor3 = Color3.fromRGB(108, 3, 255)
UtilityTab.BorderSizePixel = 0
UtilityTab.Size = UDim2.new(0, 163, 0, 40)
UtilityTab.Font = Enum.Font.SourceSans
UtilityTab.Text = "Utility"
UtilityTab.TextColor3 = Color3.fromRGB(255, 255, 255)
UtilityTab.TextScaled = true
UtilityTab.TextSize = 14.000
UtilityTab.TextWrapped = true
local ScreenGui243 = Instance.new("ScreenGui")
local Frame243 = Instance.new("Frame")
local UIListLayout243 = Instance.new("UIListLayout")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame243.Parent = ScreenGui
Frame243.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame243.BackgroundTransparency = 1.000
Frame243.BorderSizePixel = 0
Frame243.Position = UDim2.new(0.877214432, 0, 0.121951222, 0)
Frame243.Size = UDim2.new(0, 201, 0, 594)

UIListLayout243.Parent = Frame243
local function addtoArray(name)
	local TextLabel243 = Instance.new("TextLabel")
	TextLabel243.Parent = Frame243
	TextLabel243.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel243.BackgroundTransparency = 1.000
	TextLabel243.Size = UDim2.new(0, 200, 0, 26)
	TextLabel243.Font = Enum.Font.SourceSans
	TextLabel243.Text = name
	TextLabel243.Name = name
	TextLabel243.TextColor3 = Color3.fromRGB(102, 0, 255)
	TextLabel243.TextScaled = true
	TextLabel243.TextSize = 28.000
	TextLabel243.TextWrapped = true
end
local function removefromArray(name)
	if Frame243:FindFirstChild(name) then
		Frame243:FindFirstChild(name):Remove()
	end
end
game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
	if not chatting and input.KeyCode == Enum.KeyCode.RightShift then
		Combat.Visible = not Combat.Visible
		Movement.Visible = not Movement.Visible
		Render.Visible = not Render.Visible
		Utility.Visible = not Utility.Visible
	end
end)
local function Notify(text,time)
	local function wrap()
		settings.NotificationCount += 1
		local ScreenGui = Instance.new("ScreenGui")
		local TextLabel = Instance.new("TextLabel")

		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		TextLabel.Parent = ScreenGui
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0.277947456, 0, 0.0378048792, 0) - UDim2.new(0,0,-settings.NotificationCount/20,0)
		TextLabel.Size = UDim2.new(0, 727, 0, 50)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = tostring(text)
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		task.wait(time)
		ScreenGui:Remove()
		task.wait(0.6)
		settings.NotificationCount -= 1
	end
	coroutine.wrap(wrap)()
end
local function newTextBox(options)
	local TextBox = Instance.new("TextBox")
	TextBox.Parent = buttons[options["Button"]]
	TextBox.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TextBox.BorderSizePixel = 0
	TextBox.Size = UDim2.new(0, 163, 0, 24)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.Text = options["Name"]
	local orig_text = options["Name"]
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextScaled = true
	TextBox.TextSize = 14.000
	TextBox.TextWrapped = true
	TextBox.FocusLost:Connect(function()
		saved_settings["Textboxes"][options["Name"]] = TextBox.Text
		TextBox.Text = orig_text.." : "..TextBox.Text
	end)
	local textBoxFunctions = {}
	function textBoxFunctions:SetText(text)
		TextBox.Text = orig_text.." : "..text
		saved_settings["Textboxes"][options["Name"]] = TextBox.Text
	end
	return textBoxFunctions
end
local function newToggle(options)
	local TextButton_2 = Instance.new("TextButton")
	TextButton_2.Parent = buttons[options["Button"]]
	TextButton_2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TextButton_2.BorderSizePixel = 0
	TextButton_2.Size = UDim2.new(0, 163, 0, 24)
	TextButton_2.Font = Enum.Font.SourceSans
	TextButton_2.Text = options["Name"]
	TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_2.TextScaled = true
	TextButton_2.TextSize = 14.000
	TextButton_2.TextWrapped = true
	TextButton_2.MouseButton1Down:Connect(function()
		if TextButton_2.BackgroundColor3 == Color3.fromRGB(119, 0, 255) then
			TextButton_2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
		else
			TextButton_2.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
		end
		if TextButton_2.BackgroundColor3 == Color3.fromRGB(119, 0, 255) then
			saved_settings["Toggles"][options["Name"]] = true
		else
			saved_settings["Toggles"][options["Name"]] = false
		end
		if options["Function"] ~= nil then
			options["Function"](TextButton_2.BackgroundColor3 == Color3.fromRGB(119, 0, 255))
		end
	end)
	local ToggleFunctions = {}
	function ToggleFunctions:Toggle(val)
		pcall(function()
			if val == false then
				TextButton_2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				options["Function"](false)
				saved_settings["Toggles"][options["Name"]] = false
			else
				TextButton_2.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
				options["Function"](true)
				saved_settings["Toggles"][options["Name"]] = true
			end
		end)
	end
	local function updateToggled()
		repeat task.wait()
			ToggleFunctions["Toggled"] = (TextButton_2.BackgroundColor3 == Color3.fromRGB(119, 0, 255))
		until false
	end
	coroutine.wrap(updateToggled)()
	ToggleFunctions["Toggled"] = (TextButton_2.BackgroundColor3 == Color3.fromRGB(119, 0, 255))
	return ToggleFunctions
end
local function NewButton(options)
	local keybind
	--[[if not isfile(config.."/"..options["Name"]) then
		makefolder(config.."/"..options["Name"])
	end--]]
	local TextButton = Instance.new("TextButton")
	local Frame = Instance.new("Frame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	if options["Tab"] == "Combat" then
		TextButton.Parent = Combat
	elseif options["Tab"] == "Movement" then
		TextButton.Parent = Movement
	elseif options["Tab"] == "Render" then
		TextButton.Parent = Render
	elseif options["Tab"] == "Utility" then
		TextButton.Parent = Utility
	end
	TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0, 0, 0.10335917, 0)
	TextButton.Size = UDim2.new(0, 163, 0, 35)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true
	TextButton.ZIndex = 1
	TextButton.Text = options["Name"]
	Frame.Parent = TextButton
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.Position = TextButton.Position - UDim2.new(0,0,-0.9,0)
	Frame.Size = UDim2.new(0, 163, 0, 312)
	Frame.Visible = false
	UIListLayout_2.Parent = Frame
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	buttons[options["Name"]] = Frame
	toMakeInvisible[options["Name"]] = TextButton
	keybind = newTextBox({
		["Name"] = options["Name"].." Bind",
		["Button"] = options["Name"]
	})
	local toggled = false
	local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local bind = saved_settings["Textboxes"][options["Name"].." Bind"]
	local function checkKeybind()
		repeat task.wait()
			bind = saved_settings["Textboxes"][options["Name"].." Bind"]
		until false
	end
	coroutine.wrap(checkKeybind)()
	mouse.KeyDown:connect(function(key)
		if key == bind then
			if TextButton.BackgroundColor3 == Color3.fromRGB(119, 0, 255) then
				TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			else
				TextButton.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
			end
			if toggled then
				toggled = not toggled
				removefromArray(options["Name"])
				Notify(options["Name"].." has been disabled!",0.6)
				options["Function"](false)
			else
				addtoArray(options["Name"])
				toggled = not toggled
				Notify(options["Name"].." has been enabled!",0.6)
				options["Function"](true)
			end
		end
	end)

	TextButton.MouseButton1Down:Connect(function()
		if TextButton.BackgroundColor3 == Color3.fromRGB(119, 0, 255) then
			TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
		else
			TextButton.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
		end
		if toggled then

			toggled = not toggled
			removefromArray(options["Name"])
			Notify(options["Name"].." has been disabled!",0.6)
			options["Function"](false)
		else

			toggled = not toggled
			addtoArray(options["Name"])
			Notify(options["Name"].." has been enabled!",0.6)
			options["Function"](true)
		end
	end)
	TextButton.MouseButton2Down:Connect(function()
		for i,v in pairs(toMakeInvisible) do
			v.Visible = not v.Visible
		end
		TextButton.Visible = true
		Frame.Visible = not Frame.Visible
	end)
	local ButtonFunctions = {}
	function ButtonFunctions:ToggleModule(val)
		if val == false then
			toggled = false
			removefromArray(options["Name"])
			Notify(options["Name"].." has been disabled!",0.6)
			options["Function"](false)
			TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
		else
			toggled = true
			addtoArray(options["Name"])
			Notify(options["Name"].." has been enabled!",0.6)
			options["Function"](true)
			TextButton.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
		end
	end
	function ButtonFunctions:NewTextBox(args)
		ButtonFunctions[args["Name"]] = newTextBox({
			["Name"] = args["Name"],
			["Button"] = options["Name"]
		})
		return ButtonFunctions[args["Name"]]
	end
	function ButtonFunctions:NewToggle(args)
		ButtonFunctions[args["Name"]] = newToggle({
			["Name"] = args["Name"],
			["Button"] = options["Name"],
			["Function"] = args["Function"]
		})
		return ButtonFunctions[args["Name"]]
	end
	local function updateIsToggled()
		repeat task.wait()
			ButtonFunctions["Toggled"] = toggled
		until false
	end
	coroutine.wrap(updateIsToggled)()
	return ButtonFunctions
end
Notify("Hazel-Ware Loaded",5)

local knitRecieved, knit
knitRecieved, knit = pcall(function()
	repeat task.wait()
		return debug.getupvalue(require(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerScripts.TS.knit).setup, 6)
	until knitRecieved
end)

-- my brain is dead
-- how to use : knit.Controllers["HangGliderController"]:openHangGlider()
local lplr = game.Players.LocalPlayer -- I added this late so I didn't use it for the first few modules
local events = {
	HangGliderController = knit.Controllers["HangGliderController"],
	SprintController = knit.Controllers["SprintController"],
	JadeHammerController = knit.Controllers["JadeHammerController"],
	PictureModeController = knit.Controllers["PictureModeController"],
	SwordController = knit.Controllers["SwordController"],
	GroundHit = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.GroundHit
}


local function runfunc(function2)
	local function torun()
		pcall(function()
			function2()
		end)
	end
	coroutine.wrap(torun)()
end

local AuraToggle = false
Aura = NewButton({
	["Name"] = "Aura",
	["Tab"] = "Combat",
	["Function"] = function(enabled)
		if enabled then
			AuraToggle = true
			local function StartAura()
				repeat task.wait(saved_settings["Textboxes"].AuraDelay or 0)
					for i,v in pairs(game.Players:GetPlayers()) do
						if (v.Character) and (game.Players.LocalPlayer.Character) and v ~= game.Players.LocalPlayer then
							runfunc(function()
								if (v.Character.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude < 15 and v.Character.Humanoid.health > 1 and game.Players.LocalPlayer.Character.Humanoid.Health > 1 and v.Team ~= game.Players.LocalPlayer.Team then
									events["SwordController"]:swingSwordAtMouse()
								end
							end)
						end
					end
				until not AuraToggle
			end
			coroutine.wrap(StartAura)()
		else
			AuraToggle = false
		end
	end,
})
AuraDelay = Aura:NewTextBox({
	["Name"] = "AuraDelay"
})

local sprinting = false
sprint = NewButton({
	["Name"] = "Sprint",
	["Tab"] = "Combat",
	["Function"] = function(enabled)
		if enabled then
			sprinting = true
			local function BeginSprinting()
				repeat task.wait()
					if lplr.Character.Humanoid.WalkSpeed < 20 and lplr.Character.Humanoid.WalkSpeed ~= 12 then
						events["SprintController"]:startSprinting()
					end
				until not sprinting
			end
			coroutine.wrap(BeginSprinting)()
		else
			sprinting = false
			for i = 1,25 do task.wait()
				events["SprintController"]:stopSprinting()
			end
		end
	end,
})

local speeding = false
speed = NewButton({
	["Name"] = "Speed",
	["Tab"] = "Movement",
	["Function"] = function(enabled)
		if enabled then
			speeding = true
			local function BeginSpeeding()
				repeat task.wait()
					lplr.Character.Humanoid.WalkSpeed = 23.35
					task.wait(0.1)
				until not speeding
			end
			coroutine.wrap(BeginSpeeding)()
		else
			speeding = false
			for i = 1,25 do task.wait()
				lplr.Character.Humanoid.WalkSpeed = 16
			end
		end
	end,
})

Clip = NewButton({
	["Name"] = "Clip",
	["Tab"] = "Movement",
	["Function"] = function(enabled)
		if enabled then
			local Lenght = 3
			lplr.Character.PrimaryPart.CFrame += lplr.Character.PrimaryPart.CFrame.LookVector * Lenght
			Clip:ToggleModule(false)
		end
	end,
})

local binds = {}
local boundParts = {}

function binds:BindPartToTouch(part,whitelisted,func)
	boundParts[part.Name] = part.Touched:Connect(function(hit)
		local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
		if whitelisted and plr == lplr or not whitelisted then
			func()
		end
	end)
end

function binds:UnBindPartFromTouch(part)
	pcall(function() boundParts[part.Name]:Disconnect() end)
	boundParts[part.Name] = nil
end
NoFall = NewButton({
	["Name"] = "NoFall",
	["Tab"] = "Utility",
	["Function"] = function(enabled)
		if enabled then
			runfunc(function()
				repeat task.wait(0.2)
					events["GroundHit"]:FireServer()
				until not NoFall["Toggled"]
			end)
		else

		end
	end,
})
Vclip = NewButton({
	["Name"] = "Vclip",
	["Tab"] = "Movement",
	["Function"] = function(enabled)
		if enabled then
			lplr.Character.PrimaryPart.CFrame += Vector3.new(0,saved_settings.Textboxes.Height_Vclip or 3,0)
			Vclip:ToggleModule(false)
		end
	end,
})
vclip_val = Vclip:NewTextBox({
	["Name"] = "Height_Vclip"
})

local VFlyOn = nil
VClipFly = NewButton({
	["Name"] = "VClipFly",
	["Tab"] = "Movement",
	["Function"] = function(enabled)
		if enabled then
			VFlyOn = true
			game.Workspace.Gravity = saved_settings.Textboxes.VFlyGrav
			repeat task.wait(saved_settings.Textboxes.VClipTime or 0.5)
				lplr.Character.PrimaryPart.CFrame += Vector3.new(0,saved_settings.Textboxes.VFlyVal or 300,0)
			until not VFlyOn
		else
			VFlyOn = false
			game.Workspace.Gravity = 500
			wait(1.5)
			game.Workspace.Gravity = 196.2
		end
	end,
})
VFlyVal = VClipFly:NewTextBox({
	["Name"] = "TpHeight"
})
VFlyGrav = VClipFly:NewTextBox({
	["Name"] = "Gravity"
})
VClipTime = VClipFly:NewTextBox({
	["Name"] = "WaitTime"
})

local void
Antivoid = NewButton({
	["Name"] = "Antivoid",
	["Tab"] = "Utility",
	["Function"] = function(enabled)
		if enabled then
			void = Instance.new("Part",workspace)
			void.Size = Vector3.new(9999,0.1,9999)
			void.Position = Vector3.new(0,20,0)
			void.Name = "void"
			void.Transparency = 0.5
			void.CanCollide = true
			void.Anchored = true
			void.Material = Enum.Material.Neon
			void.BrickColor = BrickColor.new("Royal purple")
			local pos
			local function getnewpos()
				repeat task.wait(0.2)
					if lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air and lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Neon then
						pos = lplr.Character.PrimaryPart.CFrame
						pos += Vector3.new(0,6,0)
					end
				until not Antivoid["Toggled"]
			end
			coroutine.wrap(getnewpos)()
			binds:BindPartToTouch(void,true,function()
				if pos ~= nil then
					workspace.Gravity = 0
					game:GetService("TweenService"):Create(lplr.Character.PrimaryPart,TweenInfo.new(0.5,Enum.EasingStyle.Linear),{CFrame = pos}):Play()
					task.wait(0.5)
					workspace.Gravity = 196.2
				end
			end)
		else
			binds:UnBindPartFromTouch(void or Instance.new("Part"))
			pcall(function() void:Remove() end)
			workspace.Gravity = 196.2
		end
	end,
})
