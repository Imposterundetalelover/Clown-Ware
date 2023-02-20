local function runfunc(function2)
	local function torun()
		pcall(function()
			function2()
		end)
	end
	coroutine.wrap(torun)()
end

local function betterShared(var)
	if var == nil then return false end
	if var == false then return false end
	if var == true then return true end
end
if not betterShared(shared.Hazel_wareLoaded) then
	shared.Hazel_wareLoaded = true
	local config = "hazel-ware/Config/"..tostring(game.PlaceId)
	if not isfile("hazel-ware") then
		makefolder("hazel-ware")
		makefolder("hazel-ware/Config")
	end
	if not isfile("hazel-ware/Config/"..game.PlaceId) then
		makefolder("hazel-ware/Config/"..game.PlaceId)
	end
	repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer.Character -- allows you to put it in autoexecute without it breaking
	repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hazel-roblox/Hazel-Ware/main/WhitelistLibrary.lua", true))()
	local whitelist = shared.whitelist
	repeat task.wait() until whitelist ~= nil
	local saved = {}
	local modules = {}
	local buttons = {}
	local toMakeInvisible = {}
	local saved_settings = {
		Toggles = {},
		Textboxes = {}
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
	UtilityTab.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
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
	local tabColors = {Combat = Color3.fromRGB(255, 0, 255),Movement = Color3.fromRGB(0, 4, 255), Render = Color3.fromRGB(255, 0, 0), Utility = Color3.fromRGB(128, 0, 255)}
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
	if not game:GetService("UserInputService").KeyboardEnabled then
		local buttoninterface = Instance.new("ScreenGui")
		local toggleui = Instance.new("TextButton")
		local UICornerfortoggle = Instance.new("UICorner")

		buttoninterface.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		buttoninterface.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		buttoninterface.ResetOnSpawn = false

		toggleui.Parent = buttoninterface
		toggleui.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
		toggleui.BorderSizePixel = 0
		toggleui.Position = UDim2.new(0.438875318, 0, 0.0573170744, 0)
		toggleui.Size = UDim2.new(0, 200, 0, 50)
		toggleui.Font = Enum.Font.SourceSans
		toggleui.Text = "Toggle UI"
		toggleui.TextColor3 = Color3.fromRGB(255, 255, 255)
		toggleui.TextScaled = true
		toggleui.TextSize = 14.000
		toggleui.TextWrapped = true
		toggleui.MouseButton1Down:Connect(function()
			Combat.Visible = not Combat.Visible
			Movement.Visible = not Movement.Visible
			Render.Visible = not Render.Visible
			Utility.Visible = not Utility.Visible
		end)
		UICornerfortoggle.Parent = toggleui
	end
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
		if not isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
			writefile(config.."/"..options["Button"].."/"..options["Name"]..".txt","")
		end
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
		if options["Default"] and readfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") == "" then
			TextBox.Text = orig_text.." : "..options["Default"]
			saved_settings["Textboxes"][options["Name"]] = options["Default"]
		end
		TextBox.FocusLost:Connect(function()
			saved_settings["Textboxes"][options["Name"]] = TextBox.Text
			if isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
				delfile(config.."/"..options["Button"].."/"..options["Name"]..".txt")
			end
			writefile(config.."/"..options["Button"].."/"..options["Name"]..".txt",TextBox.Text)
			TextBox.Text = orig_text.." : "..TextBox.Text
		end)
		local textBoxFunctions = {}
		function textBoxFunctions:SetText(text)
			saved_settings["Textboxes"][options["Name"]] = TextBox.Text
			TextBox.Text = orig_text.." : "..text
			if isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
				delfile(config.."/"..options["Button"].."/"..options["Name"]..".txt")
			end
			writefile(config.."/"..options["Button"].."/"..options["Name"]..".txt",text)
		end
		if isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
			textBoxFunctions:SetText(readfile(config.."/"..options["Button"].."/"..options["Name"]..".txt"))
		end
		saved_settings["Textboxes"][options["Name"]] = readfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") or "aaa"
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

	local CurrentHoverText = nil
	local function drawHoverText(text)
		local HoverTextUI = Instance.new("ScreenGui")
		local HoverText = Instance.new("TextLabel")


		HoverTextUI.Name = "HoverTextUI"
		HoverTextUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		HoverText.Name = "HoverText"
		HoverText.Parent = HoverTextUI
		HoverText.Text = text
		HoverText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		HoverText.BackgroundTransparency = 0.550
		HoverText.BorderSizePixel = 0
		HoverText.Position = UDim2.new(0.290342331, 0, 0.0439024419, 0)
		HoverText.Size = UDim2.new(0, 685, 0, 50)
		HoverText.Font = Enum.Font.SourceSans
		HoverText.TextColor3 = Color3.fromRGB(255, 255, 255)
		HoverText.TextScaled = true
		HoverText.TextSize = 14.000
		HoverText.ZIndex = 99999e99999
		HoverText.TextWrapped = true
		CurrentHoverText = HoverTextUI
	end
	local function removeHoverText()
		if CurrentHoverText ~= nil then
			CurrentHoverText:Remove()
			CurrentHoverText = nil
		end
	end
	local function NewButton(options)
		local keybind
		local color
		if not isfile(config.."/"..options["Name"]) then
			makefolder(config.."/"..options["Name"])
		end
		local TextButton = Instance.new("TextButton")
		local Frame = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		if options["Tab"] == "Combat" then
			TextButton.Parent = Combat
			color = tabColors.Combat
		elseif options["Tab"] == "Movement" then
			TextButton.Parent = Movement
			color = tabColors.Movement
		elseif options["Tab"] == "Render" then
			TextButton.Parent = Render
			color = tabColors.Render
		elseif options["Tab"] == "Utility" then
			TextButton.Parent = Utility
			color = tabColors.Utility
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
				bind = tostring(saved_settings["Textboxes"][options["Name"].." Bind"]) or "nil"
			until false
		end
		coroutine.wrap(checkKeybind)()
		mouse.KeyDown:connect(function(key)
			if key == bind then
				if TextButton.BackgroundColor3 == Color3.fromRGB(119, 0, 255) then
					TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				else
					TextButton.BackgroundColor3 = color
				end
				if toggled then
					if isfile(config.."/"..options["Name"].."/Toggled.txt") then
						delfile(config.."/"..options["Name"].."/Toggled.txt")
					end
					toggled = not toggled
					removefromArray(options["Name"])
					Notify(options["Name"].." has been disabled!",0.6)
					runfunc(function()	options["Function"](false) end)
				else
					if not isfile(config.."/"..options["Name"].."/Toggled.txt") then
						writefile(config.."/"..options["Name"].."/Toggled.txt","")
					end
					addtoArray(options["Name"])
					toggled = not toggled
					Notify(options["Name"].." has been enabled!",0.6)
					runfunc(function()	options["Function"](true) end)
				end
			end
		end)

		TextButton.MouseButton1Down:Connect(function()
			if TextButton.BackgroundColor3 == Color3.fromRGB(119, 0, 255) then
				TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			else
				TextButton.BackgroundColor3 = color
			end
			if toggled then
				if isfile(config.."/"..options["Name"].."/Toggled.txt") then
					delfile(config.."/"..options["Name"].."/Toggled.txt")
				end
				toggled = not toggled
				removefromArray(options["Name"])
				Notify(options["Name"].." has been disabled!",0.6)
				runfunc(function() options["Function"](false) end)
			else
				if not isfile(config.."/"..options["Name"].."/Toggled.txt") then
					writefile(config.."/"..options["Name"].."/Toggled.txt","")
				end
				toggled = not toggled
				addtoArray(options["Name"])
				Notify(options["Name"].." has been enabled!",0.6)
				runfunc(function() options["Function"](true) end)
			end
		end)
		TextButton.MouseButton2Down:Connect(function()
			for i,v in pairs(toMakeInvisible) do
				v.Visible = not v.Visible
			end
			TextButton.Visible = true
			Frame.Visible = not Frame.Visible
		end)
		if options["HoverText"] ~= nil then
			TextButton.MouseEnter:Connect(function()
				drawHoverText(options["HoverText"])
			end)
			TextButton.MouseLeave:Connect(function()
				removeHoverText()
			end)
		end
		local ButtonFunctions = {}
		function ButtonFunctions:ToggleModule(val)
			if val == false then
				if isfile(config.."/"..options["Name"].."/Toggled.txt") then
					delfile(config.."/"..options["Name"].."/Toggled.txt")
				end
				toggled = false
				removefromArray(options["Name"])
				Notify(options["Name"].." has been disabled!",0.6)
				options["Function"](false)
				TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			else
				if not isfile(config.."/"..options["Name"].."/Toggled.txt") then
					writefile(config.."/"..options["Name"].."/Toggled.txt","")
				end
				toggled = true
				addtoArray(options["Name"])
				Notify(options["Name"].." has been enabled!",0.6)
				options["Function"](true)
				TextButton.BackgroundColor3 = color
			end
		end
		function ButtonFunctions:setKeybind(key)
			bind = key
			saved_settings["Textboxes"][options["Name"].." Bind"] = key
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
		saved[options["Name"]] = isfile(config.."/"..options["Name"].."/Toggled.txt")
		if saved[options["Name"]] == true then
			ButtonFunctions:ToggleModule(true)
		end
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
