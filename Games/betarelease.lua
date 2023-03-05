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
	local NotificationSettings = {
		NotificationCount = 0,
		MinWidth = 352,
		MaxWidth = 600,
		Height = 50,
		VerticalSpacing = 10,
		HorizontalSpacing = 10,
	}
	local theme = Color3.fromRGB(140, 0, 255) -- change if you want, it isnt very useful
	local function Notify(text, time,long)
		NotificationSettings.NotificationCount += 1

		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		local Frame = Instance.new("Frame")
		Frame.BackgroundColor3 = Color3.new(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(0, NotificationSettings.MinWidth, 0, NotificationSettings.Height)
		Frame.Position = UDim2.new(1, -NotificationSettings.MinWidth - NotificationSettings.HorizontalSpacing, 1, -NotificationSettings.NotificationCount * (NotificationSettings.Height + NotificationSettings.VerticalSpacing))
		Frame.Parent = ScreenGui
		Frame.BackgroundTransparency = 0.67

		local TextLabel = Instance.new("TextLabel")
		TextLabel.BackgroundTransparency = 1
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = tostring(text)
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextSize = 30
		TextLabel.TextWrapped = true
		TextLabel.Size = UDim2.new(0, NotificationSettings.MinWidth - NotificationSettings.HorizontalSpacing * 2, 0, 0)
		TextLabel.Position = UDim2.new(0, NotificationSettings.HorizontalSpacing, 0, (NotificationSettings.Height - TextLabel.TextBounds.Y) / 2)
		TextLabel.Parent = Frame

		local rainbowColors = {
			Color3.fromRGB(255, 0, 0),
			Color3.fromRGB(255, 127, 0),
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(0, 255, 0),
			Color3.fromRGB(0, 0, 255),
			Color3.fromRGB(75, 0, 130),
			Color3.fromRGB(148, 0, 211),
		}
		local fullSize = UDim2.new(1, 0, 0, NotificationSettings.Height/25)

		local Bar = Instance.new("Frame")
		Bar.Size = UDim2.new(0, 0, 0, NotificationSettings.Height/25)
		Bar.BackgroundColor3 = theme
		Bar.BorderSizePixel = 0
		Bar.Parent = Frame
		local indexVal = 1
		local currentColor = rainbowColors[indexVal]
		local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
		local tween = game:GetService("TweenService"):Create(Bar, tweenInfo, {Size = fullSize})
		tween:Play()


		local textSize = TextLabel.TextBounds.X

		if textSize > NotificationSettings.MinWidth - NotificationSettings.HorizontalSpacing * 2 then
			TextLabel.Size = UDim2.new(0, NotificationSettings.MaxWidth - NotificationSettings.HorizontalSpacing * 2, 0, TextLabel.TextBounds.Y)
			Frame.Size = UDim2.new(0, NotificationSettings.MaxWidth, 0, NotificationSettings.Height)
			Frame.Position = UDim2.new(1, -NotificationSettings.MaxWidth - NotificationSettings.HorizontalSpacing, 1, -NotificationSettings.NotificationCount * (NotificationSettings.Height + NotificationSettings.VerticalSpacing))
		end
		if long then
			Frame.Size = UDim2.new(0, NotificationSettings.MaxWidth+5, 0, NotificationSettings.Height)
			Frame.Position = UDim2.new(1, -NotificationSettings.MaxWidth-5 - NotificationSettings.HorizontalSpacing, 1, -NotificationSettings.NotificationCount * (NotificationSettings.Height + NotificationSettings.VerticalSpacing))
			TextLabel.Position = UDim2.new(0, NotificationSettings.HorizontalSpacing+5, 0, (NotificationSettings.Height - TextLabel.TextBounds.Y) + 0.08 / 2)
		end
		task.spawn(function()
			wait(time)

			local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
			local tween = game:GetService("TweenService"):Create(Frame, tweenInfo, {Position = UDim2.new(1, Frame.AbsoluteSize.X + NotificationSettings.HorizontalSpacing, 1, Frame.Position.Y.Offset)})
			tween:Play()

			tween.Completed:Connect(function()
				ScreenGui:Destroy()
				NotificationSettings.NotificationCount -= 1
			end)
		end)
	end
	shared.HazelWareFullyLoaded = false
	shared.Hazel_wareLoaded = true


	local canSave = true
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

	local saved = {}
	local modules = {}
	local killSay = {}
	local deathSay = {}
	local buttons = {}
	local toMakeInvisible = {}
	local saved_NotificationSettings = {
		Toggles = {},
		Textboxes = {}
	}
	local TweenService = game:GetService("TweenService")

	local NotificationSettings = {
		NotificationCount = 0,
		MinWidth = 352,
		MaxWidth = 600,
		Height = 50,
		VerticalSpacing = 10,
		HorizontalSpacing = 10,
	}
	local rainbowColors = {
		Color3.fromRGB(255, 0, 0), -- red
		Color3.fromRGB(255, 165, 0), -- orange
		Color3.fromRGB(255, 255, 0), -- yellow
		Color3.fromRGB(0, 255, 0), -- green
		Color3.fromRGB(0, 0, 255), -- blue
		Color3.fromRGB(75, 0, 130), -- indigo
		Color3.fromRGB(238, 130, 238), -- violet
	}
	local libraries = {Whitelist = "https://raw.githubusercontent.com/Hazel-roblox/Hazel-Ware/main/WhitelistLibrary.lua"}
	local librariesLoaded = 0
	local libraryCount = 0
	for i,v in pairs(libraries) do
		libraryCount += 1
	end
	for i,v in pairs(libraries) do
		loadstring(game:HttpGet(v, true))()
		librariesLoaded += 1
		Notify("Loaded "..tostring(i).." library "..librariesLoaded.."/"..libraryCount,5)
	end
	local whitelist = shared.whitelist
	repeat task.wait() until whitelist ~= nil
	local TweenService = game:GetService("TweenService")

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = false
	local TextButton = Instance.new("TextButton")
	TextButton.Parent = ScreenGui
	TextButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.438607216, 0, 0.815121932, 0)
	TextButton.Size = UDim2.new(0, 200, 0, 50)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = "Uninject"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true

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

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	Frame243.Parent = ScreenGui
	Frame243.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame243.BackgroundTransparency = 1.000
	Frame243.BorderSizePixel = 0
	Frame243.Position = UDim2.new(0.877214432, 0, 0.121951222, 0)
	Frame243.Size = UDim2.new(0, 201, 0, 594)

	UIListLayout243.Parent = Frame243
	local tabColors = {Combat = Color3.fromRGB(255, 0, 255),Movement = Color3.fromRGB(0, 4, 255), Render = Color3.fromRGB(255, 0, 0), Utility = Color3.fromRGB(128, 0, 255)}
	local arrayItems = {}
	local function removefromArray(name)
		if Frame243:FindFirstChild(name) then
			if table.find(arrayItems, name) then
				table.remove(arrayItems, table.find(arrayItems, name))
			end
			Frame243:FindFirstChild(name):Remove()
		end
	end
	TextButton.MouseButton1Down:Connect(function()
		canSave = false
		for z,zz in pairs(modules) do
			pcall(function()
				if zz.Toggled == true then
					zz:ToggleModule(false)
				end
			end)
		end
		Combat:Remove()
		Movement:Remove()
		Render:Remove()
		Utility:Remove()
		TextButton:Remove()
		for i,v in pairs(ScreenGui243:GetDescendants()) do v:Destroy() end
		for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			if v:IsA("Textlabel") then
				if v.Text == "Nametags" then
					v:Remove()
				end
			end
		end
		shared.Hazel_wareLoaded = false
	end)
	local function addtoArray(name)
		table.insert(arrayItems, name)
		table.sort(arrayItems, function(a, b)
			return #a > #b
		end)
		for i, v in ipairs(arrayItems) do
			removefromArray(v)
			local TextLabel243 = Instance.new("TextLabel")
			TextLabel243.Parent = Frame243
			TextLabel243.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel243.BackgroundTransparency = 1.000
			TextLabel243.Size = UDim2.new(0, 200, 0, 26)
			TextLabel243.Font = Enum.Font.SourceSans
			TextLabel243.Text = v
			TextLabel243.Name = v
			TextLabel243.TextColor3 = theme
			TextLabel243.TextScaled = true
			TextLabel243.TextSize = 28.000
			TextLabel243.TextWrapped = true
		end
	end
	local uiToggled = true
	game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
		if not chatting and input.KeyCode == Enum.KeyCode.RightShift then
			if uiToggled then
				runfunc(function()
					for i = 1,15 do task.wait()
						Combat.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Movement.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Render.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Utility.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
			else
				runfunc(function()
					for i = 1,15 do task.wait()
						Combat.Position += UDim2.new(0,0,0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Movement.Position += UDim2.new(0,0,0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Render.Position += UDim2.new(0,0,0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Utility.Position += UDim2.new(0,0,0.2,0)
					end
				end)
			end
			TextButton.Visible = not TextButton.Visible
			uiToggled = not uiToggled
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
			if uiToggled then
				runfunc(function()
					for i = 1,15 do task.wait()
						Combat.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Movement.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Render.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Utility.Position += UDim2.new(0,0,-0.2,0)
					end
				end)
			else
				runfunc(function()
					for i = 1,15 do task.wait()
						Combat.Position += UDim2.new(0,0,0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Movement.Position += UDim2.new(0,0,0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Render.Position += UDim2.new(0,0,0.2,0)
					end
				end)
				runfunc(function()
					for i = 1,15 do task.wait()
						Utility.Position += UDim2.new(0,0,0.2,0)
					end
				end)
			end

			uiToggled = not uiToggled
		end)
		UICornerfortoggle.Parent = toggleui
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
			saved_NotificationSettings["Textboxes"][options["Name"]] = options["Default"]
		end
		TextBox.FocusLost:Connect(function()
			saved_NotificationSettings["Textboxes"][options["Name"]] = TextBox.Text
			if canSave then
				if isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
					delfile(config.."/"..options["Button"].."/"..options["Name"]..".txt")
				end
				writefile(config.."/"..options["Button"].."/"..options["Name"]..".txt",TextBox.Text)
			end
			TextBox.Text = orig_text.." : "..TextBox.Text
		end)
		local textBoxFunctions = {}
		function textBoxFunctions:SetText(text)
			saved_NotificationSettings["Textboxes"][options["Name"]] = TextBox.Text
			TextBox.Text = orig_text.." : "..text
			if canSave then
				if isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
					delfile(config.."/"..options["Button"].."/"..options["Name"]..".txt")
				end
				writefile(config.."/"..options["Button"].."/"..options["Name"]..".txt",text)
			end
		end
		if isfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") then
			textBoxFunctions:SetText(readfile(config.."/"..options["Button"].."/"..options["Name"]..".txt"))
		end
		saved_NotificationSettings["Textboxes"][options["Name"]] = readfile(config.."/"..options["Button"].."/"..options["Name"]..".txt") or "aaa"
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
			if TextButton_2.BackgroundColor3 == theme then
				TextButton_2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			else
				TextButton_2.BackgroundColor3 = theme
			end
			if TextButton_2.BackgroundColor3 == theme then
				saved_NotificationSettings["Toggles"][options["Name"]] = true
			else
				saved_NotificationSettings["Toggles"][options["Name"]] = false
			end
			if options["Function"] ~= nil then
				options["Function"](TextButton_2.BackgroundColor3 == theme)
			end
		end)
		local ToggleFunctions = {}
		function ToggleFunctions:Toggle(val)
			pcall(function()
				if val == false then
					TextButton_2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
					options["Function"](false)
					saved_NotificationSettings["Toggles"][options["Name"]] = false
				else
					TextButton_2.BackgroundColor3 = Color3.fromRGB(119, 0, 255)
					options["Function"](true)
					saved_NotificationSettings["Toggles"][options["Name"]] = true
				end
			end)
		end
		local function updateToggled()
			repeat task.wait()
				ToggleFunctions["Toggled"] = (TextButton_2.BackgroundColor3 == theme)
			until false
		end
		coroutine.wrap(updateToggled)()
		ToggleFunctions["Toggled"] = (TextButton_2.BackgroundColor3 == theme)
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
		local bind = saved_NotificationSettings["Textboxes"][options["Name"].." Bind"]
		local function checkKeybind()
			repeat task.wait()
				bind = tostring(saved_NotificationSettings["Textboxes"][options["Name"].." Bind"]) or "nil"
			until false
		end
		coroutine.wrap(checkKeybind)()
		mouse.KeyDown:connect(function(key)
			if key == bind then
				if TextButton.BackgroundColor3 == color then
					TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				else
					TextButton.BackgroundColor3 = color
				end
				if toggled then
					if canSave then
						if isfile(config.."/"..options["Name"].."/Toggled.txt") then
							delfile(config.."/"..options["Name"].."/Toggled.txt")
						end
					end
					toggled = not toggled
					removefromArray(options["Name"])
					Notify(options["Name"].." has been disabled!",0.6)
					runfunc(function()	options["Function"](false) end)
				else
					if canSave then
						if not isfile(config.."/"..options["Name"].."/Toggled.txt") then
							writefile(config.."/"..options["Name"].."/Toggled.txt","")
						end
					end
					addtoArray(options["Name"])
					toggled = not toggled
					Notify(options["Name"].." has been enabled!",0.6)
					runfunc(function()	options["Function"](true) end)
				end
			end
		end)

		TextButton.MouseButton1Down:Connect(function()
			if TextButton.BackgroundColor3 == color then
				TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			else
				TextButton.BackgroundColor3 = color
			end
			if toggled then
				if canSave then
					if isfile(config.."/"..options["Name"].."/Toggled.txt") then
						delfile(config.."/"..options["Name"].."/Toggled.txt")
					end
				end
				toggled = not toggled
				removefromArray(options["Name"])
				Notify(options["Name"].." has been disabled!",0.6)
				runfunc(function() options["Function"](false) end)
			else
				if canSave then
					if not isfile(config.."/"..options["Name"].."/Toggled.txt") then
						writefile(config.."/"..options["Name"].."/Toggled.txt","")
					end
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
				if canSave then
					if isfile(config.."/"..options["Name"].."/Toggled.txt") then
						delfile(config.."/"..options["Name"].."/Toggled.txt")
					end
				end
				toggled = false
				removefromArray(options["Name"])
				Notify(options["Name"].." has been disabled!",0.6)
				options["Function"](false)
				TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
			else
				if canSave then
					if not isfile(config.."/"..options["Name"].."/Toggled.txt") then
						writefile(config.."/"..options["Name"].."/Toggled.txt","")
					end
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
			saved_NotificationSettings["Textboxes"][options["Name"].." Bind"] = key
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
	-- the example I used for ChatEvents : https://v3rmillion.net/showthread.php?tid=1181450
	local function getSpacesInHalf(num)
		local e = ""
		for i = 1,num/2 do
			e = e.." "
		end
		return e
	end
	local users = {}
	local ranks = {
		OWNER = 100,
		PRIVATE = 50,
		USER = 1
	}
	local function getPriority(id)
		id = whitelist:getChatTag(id)
		return ranks[id]
	end

	local function PrintToChat(msg,e,clr)
		if e ~= 2 then
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = msg;
				Color = clr;
				Font = Enum.Font.SourceSans;
				TextSize = 20
			})
			return
		end
		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[Hazel-Ware-Private] "..msg;
			Color = clr;
			Font = Enum.Font.SourceSans;
			TextSize = 20
		})
	end

	local function makeCmdAlert(cmd,use)
		PrintToChat(cmd.." used on "..#users.." user(s)!",2,Color3.fromRGB(0, 208, 255))
	end

	local ChatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
	local messageDoneFiltering = ChatEvents:WaitForChild("OnMessageDoneFiltering")
	local players = game:GetService("Players")
	local currentplr
	local usersFiltered = {}
	local doneMessages = {}
	local chatFrame = game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller
	local ChatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
	local messageDoneFiltering = ChatEvents:WaitForChild("OnMessageDoneFiltering")
	local players = game:GetService("Players")
	local currentplr
	local usersFiltered = {}
	local doneMessages = {}
	local chatFrame = game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller

	messageDoneFiltering.OnClientEvent:Connect(function(msg)
		currentplr = game.Players:FindFirstChild(msg.FromSpeaker)
		if currentplr == game.Players.LocalPlayer then
			if msg.Message == ";kill" then
				makeCmdAlert("kill")
			elseif msg.Message == ";void" then
				makeCmdAlert("void")
			elseif msg.Message == ";float" then
				makeCmdAlert("float")
			elseif msg.Message == ";kick" then
				makeCmdAlert("kick")
			elseif msg.Message == ";lagback" then
				makeCmdAlert("lagback")
			elseif msg.Message == ";crash" then
				makeCmdAlert("crash")
			elseif msg.Message == ";clear" then
				makeCmdAlert("clear")
			elseif msg.Message == ";freeze" then
				makeCmdAlert("freeze")
			elseif msg.Message == ";unfreeze" then
				makeCmdAlert("unfreeze")
			elseif msg.Message == ";error" then
				makeCmdAlert("error")
			elseif msg.Message == ";void" then
				makeCmdAlert("void")
			elseif msg.Message == ";smallhrp" then
				makeCmdAlert("smallhrp")
			elseif msg.Message == ";amplify" then
				makeCmdAlert("amplify")
			elseif msg.Message == ";disco" then
				makeCmdAlert("disco")
			elseif msg.Message == ";rickroll" then
				makeCmdAlert("rickroll")
			end
		end
		task.wait(0.3)
		for i,v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat:GetDescendants()) do
			if v:IsA("TextLabel") then
				if (tostring(msg):find("AbyyFwnDD") or tostring(msg) == "/w "..game.Players.LocalPlayer.Name.." AbyyFwnDD") and currentplr ~= game.Players.LocalPlayer and not whitelist:isWhitelisted(currentplr.UserId) and whitelist:isWhitelisted(game.Players.LocalPlayer.UserId) then
					PrintToChat(currentplr.Name.." Is Using Hazel-Ware!",2,Color3.fromRGB(0, 200, 255))
					table.insert(users,currentplr)
				end
				for i2,v2 in pairs(users) do
					if tostring(v.Text):find("AbyyFwnDD") or tostring(v.Text):find(v2.DisplayName) and not table.find(usersFiltered,v2.DisplayName) or tostring(v.Text):find("You are now") then
						v.Size = UDim2.new(0,0,0,0)
						table.insert(usersFiltered,v2.DisplayName)
					end
				end
			end
		end
		local chattag
		msg = msg.Message
		if msg == nil then
			msg = ""
		end
		local rickrolling = false
		local disco = false
		if currentplr then
			if (tostring(msg):find("AbyyFwnDD") or tostring(msg) == "/w "..game.Players.LocalPlayer.Name.." AbyyFwnDD") and currentplr ~= game.Players.LocalPlayer and not whitelist:isWhitelisted(currentplr.UserId) and whitelist:isWhitelisted(game.Players.LocalPlayer.UserId) then
				PrintToChat(currentplr.Name.." Is Using Hazel-Ware!",2)
				table.insert(users,currentplr)
			end
			for i,v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat:GetDescendants()) do
				if v:IsA("TextLabel") then
					for i2,v2 in pairs(users) do
						if tostring(v.Text):find("AbyyFwnDD") or tostring(v.Text):find(v2.DisplayName) or tostring(v.Text):find("You are now") then
							v.Size = UDim2.new(0,0,0,0)
						end
					end
				end
			end
			if ranks[whitelist:getChatTag(currentplr.UserId)] > ranks[whitelist:getChatTag(game.Players.LocalPlayer.UserId)] then
				if msg == ";kill" or msg == ";kill "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
				elseif msg == ";void" or msg == ";void "..game.Players.LocalPlayer.DisplayName then
					repeat task.wait()
						game.Players.LocalPlayer.Character.PrimaryPart.CFrame -= Vector3.new(0,4,0)
					until game.Players.LocalPlayer.Character == nil or game.Players.LocalPlayer.Character.Humanoid.Health == 0
				elseif msg == ";float" or msg == ";float "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
					task.wait(0.1)
					workspace.Gravity = 0
					task.wait(3)
					workspace.Gravity = 196.2
				elseif msg == ";kick" or msg == ";kick "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer:Kick("")
				elseif msg == ";lagback" or msg == ";lagback "..game.Players.LocalPlayer.DisplayName  then
					game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(999e999,10,99e3)
				elseif msg == ";crash" or msg == ";crash "..game.Players.LocalPlayer.DisplayName  then
					pcall(function() game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true end)
					repeat
						print("")
					until false
				elseif msg == ";clear" or msg == ";clear "..game.Players.LocalPlayer.DisplayName then
					game.ReplicatedStorage.Inventories:Remove()
				elseif msg == ";freeze" or msg == ";freeze "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer.Character.PrimaryPart.Anchored = true
				elseif msg == ";unfreeze" or msg == ";unfreeze "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer.Character.PrimaryPart.Anchored = false
				elseif msg == ";error" or msg == ";error "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer.Character.LeftFoot:Remove()
				elseif msg == ";smallhrp" or msg == ";smallhrp "..game.Players.LocalPlayer.DisplayName then
					game.Players.LocalPlayer.Character.PrimaryPart.Size = Vector3.new(0.6,0.6,0.6)
				elseif msg == ";amplify" or msg == ";amplify "..game.Players.LocalPlayer.DisplayName then
					for i,v in pairs(game:GetDescendants()) do
						if v:IsA("TextButton") or v:IsA("TextLabel") then
							v.TextSize = 60
						end
					end
				elseif msg == ";disco" then
					local function fastloop()
						disco = true
						rickrolling = false
						repeat task.wait(0.3)
							for i,v in pairs(game:GetDescendants()) do
								if v:IsA("TextButton") or v:IsA("TextLabel") then
									v.TextColor3 = Color3.fromRGB(math.random(10,200),math.random(10,200),math.random(10,200))
									v.BackgroundColor3 = Color3.fromRGB(math.random(10,200),math.random(10,200),math.random(10,200))
								end
								if v:IsA("ImageLabel") then
									v.BackgroundColor3 = Color3.fromRGB(math.random(10,200),math.random(10,200),math.random(10,200))
								end
								if v:IsA("Decal") then
									v.Transparency = 1
									v.Parent.BrickColor = BrickColor.random()
								end
								if v:IsA("Part") or v:IsA("BasePart") then
									v.BrickColor = BrickColor.random()
								end
								if v:IsA("Frame") then
									v.BackgroundColor3 = Color3.fromRGB(math.random(10,200),math.random(10,200),math.random(10,200))
								end
							end
						until not disco
					end
					coroutine.wrap(fastloop)()
				elseif msg == ";disconnect" or msg == ";disconnect "..game.Players.LocalPlayer.DisplayName then
					disconnect = game.DescendantAdded:Connect(function(v22)
						v22:Remove()
					end)
				elseif msg == ";rickroll" or msg == ";rickroll "..currentplr.game.Players.LocalPlayer.DisplayName then
					local ScreenGui = Instance.new("ScreenGui")
					local ImageLabel = Instance.new("ImageLabel")
					local TextLabel = Instance.new("TextLabel")

					ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
					ScreenGui.ResetOnSpawn = false
					ScreenGui.IgnoreGuiInset = true
					ImageLabel.Parent = ScreenGui
					ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000
					ImageLabel.Size = UDim2.new(0, 2000, 0, 2000)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=3617100"
					ImageLabel.ImageTransparency = 0.7

					TextLabel.Parent = ScreenGui
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0.272672653, 0, 0.0340243866, 0)
					TextLabel.Size = UDim2.new(0, 757, 0, 50)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.Text = "NEVER GONNA GIVE YOU UP"
					TextLabel.TextColor3 = Color3.fromRGB(0, 255, 81)
					TextLabel.TextScaled = true
					TextLabel.TextSize = 14.000
					TextLabel.TextWrapped = true
					local function fastloop()
						disco = false
						rickrolling = true
						repeat task.wait(0.3)
							TextLabel.TextColor3 = Color3.fromRGB(math.random(10,200),math.random(10,200),math.random(10,200))
							for i,v in pairs(game:GetDescendants()) do
								if v:IsA("TextButton") or v:IsA("TextLabel") then
									if v.Text ~= "NEVER GONNA GIVE YOU UP" then
										v.Text = "NEVER GONNA GIVE YOU UP"
									end
									v.TextColor3 = Color3.fromRGB(math.random(10,200),math.random(10,200),math.random(10,200))
								end
								if v:IsA("ImageButton") or v:IsA("ImageLabel") then
									if v.Image ~= "http://www.roblox.com/asset/?id=3617100" then
										v.Image = "http://www.roblox.com/asset/?id=3617100"
									end
								end
								if v:IsA("Decal") then
									v.Transparency = 0
									if v.Texture ~= "http://www.roblox.com/asset/?id=3617100" then
										v.Texture = "http://www.roblox.com/asset/?id=3617100"
									end
								end
							end
						until not rickrolling
					end
					coroutine.wrap(fastloop)()
				end
			end
		end
		pcall(function()
			--[[for i,v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat:GetDescendants()) do
				if v:IsA("TextButton") then
					if tostring(v.Text):find(currentplr.DisplayName or currentplr.Name) and not tostring(v.Text):find("To chat") then
						if whitelist:isWhitelisted(currentplr.UserId) and not table.find(doneMessages,v) then
							-- parent = label
							-- v = button
							local txt = v.Text
							v.Text = "[HAZEL-WARE "..whitelist:getChatTag(currentplr.UserId).."] "..txt
							v.TextColor3 = Color3.fromRGB(0, 4, 255)
							local txt2 = v.Parent.Text
							local e = ""
							for x = 1,game.Players.LocalPlayer.DisplayName:len() do
								e = e.." "
							end
							v.Parent.Text = e..txt2
							if whitelist:getChatTag(currentplr.UserId) == "OWNER" then
								local e = ""
								for x = 1,game.Players.LocalPlayer.DisplayName:len() do
									e = e.." "
								end
								v.Parent.Text = e..txt2
								v.TextColor3 = Color3.fromRGB(255, 136, 0)
							end
							table.insert(doneMessages,v)
						elseif table.find(users,currentplr) and not table.find(doneMessages,v) then
							local txt = v.Text
							v.Text = "[HAZEL-WARE "..whitelist:getChatTag(currentplr.UserId).."] "..txt
							v.TextColor3 = Color3.fromRGB(0, 255, 21)
							local txt2 = v.Parent.Text
							local e = ""
							for x = 1,game.Players.LocalPlayer.DisplayName:len() do
								e = e.." "
							end
							v.Parent.Text = e..txt2
							table.insert(doneMessages,v)
						end
					end
				end
			end--]]
		end)
	end)
	local name_string = ""
	for i,v in pairs(game.Players:GetPlayers()) do
		if whitelist:isWhitelisted(v.UserId) == true then
			if not whitelist:isWhitelisted(game.Players.LocalPlayer.UserId) then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..v.Name.." AbyyFwnDD","All")
				PrintToChat(v.Name.." Is Whitelisted with "..whitelist:getChatTag(v.UserId).."!",2,Color3.fromRGB(0, 123, 255))
			else
				PrintToChat("You Are Whitelisted with "..whitelist:getChatTag(game.Players.LocalPlayer.UserId).."!",2,Color3.fromRGB(0, 123, 255))
				name_string = "Private"
				break
			end
		end
	end
	Notify("Hazel-Ware "..name_string.." Loaded",5)


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
		GroundHit = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.GroundHit,
		Reach = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]),
		Knockback = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),  -- this took me forever for to figure out :(
		report = knit.Controllers["report-controller"],
		PlacementCPS = require(game.ReplicatedStorage.TS["shared-constants"]).CpsConstants
	}
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

	local function getMaxValue(val,val2)
		return val / val2
	end

	function binds:RepeatForTime(time,delay,func,afterfunc)
		local currentTime = 0
		repeat task.wait(delay)
			currentTime += getMaxValue(time,delay)
			func()
		until currentTime == time
		afterfunc()
	end

	local function getInv()
		for i,v in pairs(game.ReplicatedStorage.Inventories:GetChildren()) do
			if v.Name == lplr.Name then
				for i2,v2 in pairs(v:GetChildren()) do
					if tostring(v2.Name):find("pickaxe") then
						return v
					end
				end
			end
		end
		return Instance.new("Folder")
	end

	local function hasItem(item)
		if getInv():FindFirstChild(item) then
			return true, 1
		end
		return false
	end

	local weaponMeta = {
		{"rageblade", 100},
		{"emerald_sword", 99},
		{"glitch_void_sword", 98},
		{"diamond_sword", 97},
		{"iron_sword", 96},
		{"stone_sword", 95},
		{"wood_sword", 94},
		{"emerald_dao", 93},
		{"diamond_dao", 99},
		{"iron_dao", 97},
		{"stone_dao", 96},
		{"wood_dao", 95},
		{"frosty_hammer", 1},
	}

	local function getBestWeapon()
		local bestSword
		local bestSwordMeta = 0
		for i, sword in ipairs(weaponMeta) do
			local name = sword[1]
			local meta = sword[2]
			if meta > bestSwordMeta and hasItem(name) then
				bestSword = name
				bestSwordMeta = meta
			end
		end
		return getInv():FindFirstChild(bestSword)
	end

	local function spoofHand(item)
		if hasItem(item) then
			game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.SetInvItem:InvokeServer({
				["hand"] = getInv()[item]
			})
		end
	end
	spoofHand("wooden_sword")
	local anim = {val = CFrame.new(1, -2, 1) * CFrame.Angles(math.rad(310), math.rad(60), math.rad(270))}
	local viewmodel = workspace.Camera.Viewmodel.RightHand.RightWrist
	local weld = viewmodel.C0
	local oldweld = viewmodel.C0
	local function CFrameAnimate(cframe)
		for i,v in pairs(cframe) do
			TweenService:Create(viewmodel,TweenInfo.new(0.3),{C0 = oldweld * v}):Play()
		end
	end
	local function CFrameAnimate2(cframe)
		TweenService:Create(viewmodel,TweenInfo.new(0.3),{C0 = oldweld}):Play()
	end
	runfunc(function()
		modules.AuraAnimations = NewButton({
			["Name"] = "AuraAnimations",
			["Tab"] = "Render",
			["Function"] = function(enabled) end,
		})
		modules.TargetInfo = NewButton({
			["Name"] = "TargetInfo",
			["Tab"] = "Render",
			["Function"] = function(enabled) end,
		})
		local joinalertconnection
		modules.JoinAlerts = NewButton({
			["Name"] = "JoinAlerts",
			["Tab"] = "Utility",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						joinalertconnection = game.Players.PlayerAdded:Connect(function(plr)
							Notify(plr.DisplayName.." has joined",5)
						end)
					end)
				else
					joinalertconnection:Disconnect()
				end
			end,
		})
		local dead = {}
		modules.AutoToxic = NewButton({
			["Name"] = "AutoToxic",
			["Tab"] = "Utility",
			["Function"] = function(enabled)
				runfunc(function()
					repeat task.wait()
						pcall(function()
							local nearest = nearestUser2(18)
							if nearest and not table.find(dead,nearest) and getPriority(nearest.UserId) <= getPriority(lplr.UserId) then
								if nearest.Character.Humanoid.Health == 0 then
									game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(killSay[math.random(1,#killSay)].." | "..nearest.DisplayName,"All")
									table.insert(dead,nearest)
								end
							end
							if game.Players.LocalPlayer.Character.Humanoid.Health == 0 and not table.find(dead,lplr) then
								game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(deathSay[math.random(1,#deathSay)],"All")
								table.insert(dead,lplr)
							end
							for i,v in pairs(dead) do
								if v.Character.Humanoid.Health > 0 then
									table.remove(dead,v)
								end
							end
						end)
					until not modules.AutoToxic.Toggled
				end)
			end,
		})
	end)
	local function alive(plr)
		if plr == nil then plr = lplr end
		if not plr.Character then return false end
		if not plr.Character.Head then return false end
		if not plr.Character.Humanoid then return false end
		if plr.Character.Humanoid.Health < 0.1 then return false end
		return true
	end
	function nearestUser(max)
		if max == nil then max = math.huge end
		local closestDistance = math.huge
		local closestPlayer = nil
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= lplr and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local distance = (player.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude
				if distance < closestDistance and distance < max and player.Character.Humanoid.Health > 0.1 and player.Team ~= lplr.Team then
					closestDistance = distance
					closestPlayer = player
				end
			end
		end
		return closestPlayer
	end
	function nearestUser2(max)
		if max == nil then max = math.huge end
		local closestDistance = math.huge
		local closestPlayer = nil
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= lplr and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local distance = (player.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude
				if distance < closestDistance and distance < max and player.Team ~= lplr.Team then
					closestDistance = distance
					closestPlayer = player
				end
			end
		end
		return closestPlayer
	end
	local aurabind
	runfunc(function()
		local AuraToggle = false
		local animrunning = false
		local lasthit = 0
		local function starthittimer()
			runfunc(function()
				for i = 1,5 do task.wait(0.025)
					lasthit -= 1
				end
			end)
		end

		local function createTargetInfo(target)
			local targetinfocurrent
			local MainFrame
			if target then
				targetinfocurrent = Instance.new("ScreenGui")
				MainFrame = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TargetLabel = Instance.new("TextLabel")
				local HealthLabel = Instance.new("TextLabel")
				targetinfocurrent.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				MainFrame.Name = "MainFrame"
				MainFrame.Parent = targetinfocurrent
				MainFrame.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
				MainFrame.BorderSizePixel = 0
				MainFrame.Position = UDim2.new(0.524740398, 0, 0.480487794, 0)
				MainFrame.Size = UDim2.new(0, 191, 0, 72)
				UICorner.Parent = MainFrame
				TargetLabel.Name = "TargetLabel"
				TargetLabel.Parent = MainFrame
				TargetLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TargetLabel.BackgroundTransparency = 1.000
				TargetLabel.Position = UDim2.new(0.0575916246, 0, 0.152777776, 0)
				TargetLabel.Size = UDim2.new(0, 179, 0, 20)
				TargetLabel.Font = Enum.Font.SourceSans
				TargetLabel.Text = "Target : "..target.DisplayName
				TargetLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TargetLabel.TextScaled = true
				TargetLabel.TextSize = 14.000
				TargetLabel.TextWrapped = true
				TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
				HealthLabel.Name = "HealthLabel"
				HealthLabel.Parent = MainFrame
				HealthLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HealthLabel.BackgroundTransparency = 1.000
				HealthLabel.Position = UDim2.new(0.0575916246, 0, 0.430555552, 0)
				HealthLabel.Size = UDim2.new(0, 179, 0, 30)
				HealthLabel.Font = Enum.Font.SourceSans
				HealthLabel.Text = "Health : "..math.round(target.Character.Humanoid.Health)
				HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				HealthLabel.TextScaled = true
				HealthLabel.TextSize = 14.000
				HealthLabel.TextWrapped = true
				HealthLabel.TextXAlignment = Enum.TextXAlignment.Left
			end
			return {
				remove = function()
					pcall(function()
						MainFrame.Visible = false
						targetinfocurrent:Remove()
					end)
				end,
			}
		end
		local function IsFirstPerson()
			return (lplr.Character:WaitForChild("Head").CFrame.p - workspace.CurrentCamera.CFrame.p).Magnitude < 2
		end
		killSay = {"You got destroyed by Hazel-Ware","Hazel-Ware on top","Looks like you forgot Hazel-Ware","L","Ouch (rekt by Hazel-Ware)"}
		deathSay = {"I was lagging | Hazel-Ware on top","Bad, you just got lucky | Hazel-Ware","L legits"}
		local tagged = {}
		modules.Aura = NewButton({
			["Name"] = "Aura",
			["Tab"] = "Combat",
			["HoverText"] = "Hits Players Around You",
			["Function"] = function(enabled)
				if enabled then
					AuraToggle = true

					local function StartAura()
						if not AuraToggle then return end
						runfunc(function()
							aurabind = game:GetService("RunService").Stepped:Connect(function()
								local nearest = nearestUser(20)
								if nearest and nearest.Character and nearest.Character.Humanoid.Health > 0 then
									if getPriority(nearest.UserId) <= getPriority(lplr.UserId) then
										runfunc(function()
											if modules.AuraAnimations.Toggled and IsFirstPerson() then
												if not animrunning then
													animrunning = true
													CFrameAnimate(anim)
													task.wait(0.29)
													animrunning = false
													CFrameAnimate2()
												end
											else
												events["SwordController"]:swingSwordAtMouse()
											end
										end)
										runfunc(function()
											if modules.TargetInfo.Toggled then
												createTargetInfo(nearest)
											else
												createTargetInfo(nearest).remove()
											end
										end)
										runfunc(function()
											local sword = getBestWeapon()

											game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.SwordHit:FireServer({
												["chargedAttack"] = {
													["chargeRatio"] = 0.8
												},
												["entityInstance"] = nearest.Character,
												["validate"] = {
													["targetPosition"] = {
														["value"] = nearest.Character.PrimaryPart.Position
													},
													["selfPosition"] = {
														["value"] = lplr.Character.PrimaryPart.Position
													}
												},
												["weapon"] = sword
											})
											if nearest.Character.Humanoid.Health < 1 or (lplr.Character.PrimaryPart.Position - nearest.Character.PrimaryPart.Position).Magnitude > 22 then
												createTargetInfo(nearest).remove()
											end
										end)
									end
								else
									createTargetInfo(nearest).remove()
								end
							end)
						end)
					end

					StartAura()

				else
					AuraToggle = false
					pcall(function()
						aurabind:Disconnect()
					end)
				end
			end,
		})
	end)
	runfunc(function()
		local sprinting = false
		modules.sprint = NewButton({
			["Name"] = "Sprint",
			["Tab"] = "Combat",
			["Function"] = function(enabled)
				if enabled then
					sprinting = true
					local function BeginSprinting()
						repeat 
							events["SprintController"]:startSprinting()
							task.wait(0.5)
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
	end)
	runfunc(function()
		modules.AntiKnockback = NewButton({
			["Name"] = "AntiKnockback",
			["Tab"] = "Combat",
			["Function"] = function(enabled)
				if enabled then
					events.Knockback.kbUpwardStrength = 0
					events.Knockback.kbDirectionStrength = 0
				else
					events.Knockback.kbUpwardStrength = 11000
					events.Knockback.kbDirectionStrength = 11000
				end
			end,
		})
	end)
	local removeNameConnection
	modules.RemoveNameTag = NewButton({
		["Name"] = "RemoveNameTag",
		["Tab"] = "Utility",
		["Function"] = function(enabled)
			if enabled then
				pcall(function() lplr.Character.Head.Nametag:Destroy() end)
				removeNameConnection = lplr.CharacterAdded:Connect(function()
					task.wait(1)
					lplr.Character.Head.Nametag:Destroy()
				end)
			else
				removeNameConnection:Disconnect()
			end
		end,
	})

	runfunc(function()
		local speeding = false
		local canSpeed = true
		modules.speed = NewButton({ -- boost on speed bot dosen't work yet
			["Name"] = "Speed",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					speeding = true
					local function BeginSpeeding()
						repeat task.wait()
							if lplr.Character then
								if lplr.Character.Humanoid.WalkSpeed < 23.4 then
									if canSpeed then
										lplr.Character.Humanoid.WalkSpeed = 23.35
									end
								end
								task.wait(0.1)
							end
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
	end)

	runfunc(function()
		modules.Clip = NewButton({
			["Name"] = "Clip",
			["HoverText"] = "Teleports forward to clip walls",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					local a = 3
					lplr.Character.PrimaryPart.CFrame += lplr.Character.PrimaryPart.CFrame.LookVector * a
					modules.Clip:ToggleModule(false)
				end
			end,
		})
	end)

	runfunc(function()
		modules.NoFall = NewButton({
			["Name"] = "NoFall",
			["Tab"] = "Utility",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						repeat task.wait(0.2)
							events["GroundHit"]:FireServer()
						until not modules.NoFall["Toggled"]
					end)
				else

				end
			end,
		})
	end)

	runfunc(function()
		modules.Vclip = NewButton({
			["Name"] = "Vclip",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					lplr.Character.PrimaryPart.CFrame += Vector3.new(0,saved_NotificationSettings.Textboxes.Height_Vclip or 3,0)
					modules.Vclip:ToggleModule(false)
				end
			end,
		})
		modules.Height_Vclip = modules.Vclip:NewTextBox({
			["Name"] = "Height_Vclip",
			["Default"] = 3,
		})
	end)

	runfunc(function()
		modules.NameTags = NewButton({
			["Name"] = "Nametags",
			["Tab"] = "Render",
			["Function"] = function(enabled)
				if enabled then
					repeat task.wait()
						for i,v in pairs(game.Players:GetPlayers()) do
							if not v.Character.Head:FindFirstChild("Nametags") then
								local Nametags = Instance.new("BillboardGui")
								local TextLabel = Instance.new("TextLabel")
								Nametags.Name = "Nametags"
								Nametags.Parent = v.Character.Head
								Nametags.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
								Nametags.Active = true
								Nametags.AlwaysOnTop = true
								Nametags.ExtentsOffset = Vector3.new(0, 6, 0)
								Nametags.LightInfluence = 1.000
								Nametags.Size = UDim2.new(0, 200, 0, 50)
								TextLabel.Parent = Nametags
								TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000
								TextLabel.Size = UDim2.new(0, 200, 0, 50)
								TextLabel.Font = Enum.Font.SourceSans
								TextLabel.Text = v.DisplayName
								TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
								TextLabel.TextSize = 28.000
							end
						end
					until not modules.NameTags.Toggled
				else
					for i,v in pairs(game.Players:GetPlayers()) do
						if v.Character:WaitForChild("Head"):FindFirstChild("Nametags") then
							v.Character:WaitForChild("Head"):FindFirstChild("Nametags"):Remove()
						end
					end
				end
			end,
		})
		for i,v in pairs(game.Players:GetPlayers()) do
			v.CharacterAdded:Connect(function(char)
				task.wait(2)
				if modules.NameTags.Toggled then
					local Nametags = Instance.new("BillboardGui")
					local TextLabel = Instance.new("TextLabel")
					Nametags.Name = "Nametags"
					Nametags.Parent = char.Head
					Nametags.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					Nametags.Active = true
					Nametags.AlwaysOnTop = true
					Nametags.ExtentsOffset = Vector3.new(0, 6, 0)
					Nametags.LightInfluence = 1.000
					Nametags.Size = UDim2.new(0, 200, 0, 50)
					TextLabel.Parent = Nametags
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Size = UDim2.new(0, 200, 0, 50)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.Text = v.DisplayName
					TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
					TextLabel.TextSize = 28.000
				end
			end)
		end
		game.Players.PlayerAdded:Connect(function(plr)
			plr.CharacterAdded:Connect(function(char)
				if modules.NameTags.Toggled then
					task.wait(2)
					local Nametags = Instance.new("BillboardGui")
					local TextLabel = Instance.new("TextLabel")
					Nametags.Name = "Nametags"
					Nametags.Parent = char.Head
					Nametags.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					Nametags.Active = true
					Nametags.AlwaysOnTop = true
					Nametags.ExtentsOffset = Vector3.new(0, 6, 0)
					Nametags.LightInfluence = 1.000
					Nametags.Size = UDim2.new(0, 200, 0, 50)
					TextLabel.Parent = Nametags
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Size = UDim2.new(0, 200, 0, 50)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.Text = plr.DisplayName
					TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
					TextLabel.TextSize = 28.000
				end
			end)
			if modules.NameTags.Toggled then
				task.wait(2)
				local Nametags = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				Nametags.Name = "Nametags"
				Nametags.Parent = plr.Character.Head
				Nametags.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				Nametags.Active = true
				Nametags.AlwaysOnTop = true
				Nametags.ExtentsOffset = Vector3.new(0, 6, 0)
				Nametags.LightInfluence = 1.000
				Nametags.Size = UDim2.new(0, 200, 0, 50)
				TextLabel.Parent = Nametags
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Size = UDim2.new(0, 200, 0, 50)
				TextLabel.Font = Enum.Font.SourceSans
				TextLabel.Text = plr.DisplayName
				TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
				TextLabel.TextSize = 28.000
			end
		end)
	end)

	runfunc(function()
		local void
		modules.Antivoid = NewButton({
			["Name"] = "Antivoid",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					void = Instance.new("Part",workspace)
					void.Size = Vector3.new(9999,0.1,9999)
					void.Position = Vector3.new(0,20,0)
					void.Name = "void"
					void.Transparency = 0.5
					void.CanCollide = false
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
						until not modules.Antivoid["Toggled"]
					end
					coroutine.wrap(getnewpos)()
					binds:BindPartToTouch(void,true,function()
						if pos ~= nil then
							workspace.Gravity = 0
							local tween = game:GetService("TweenService"):Create(lplr.Character.PrimaryPart,TweenInfo.new(0.5,Enum.EasingStyle.Exponential),{CFrame = pos})
							tween:Play()
							task.wait(0.3)
							tween:Cancel()
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
	end)

	runfunc(function()
		local jumpinglj = 0
		modules.LongJump = NewButton({
			["Name"] = "LongJump",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						jumpinglj += 1
						local current = jumpinglj
						workspace.Gravity = 7
						task.wait(0.05)
						lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(2.3)
						if modules.LongJump["Toggled"] and current == jumpinglj then
							workspace.Gravity = 196.2
							modules.LongJump:ToggleModule(false)
						end
					end)
				else
					workspace.Gravity = 196.2
					jumpinglj -= 1
				end
			end,
		})
	end)
	local function getWool()
		for i,v in pairs(getInv():GetChildren()) do
			if tostring(v.Name):find("wool") then
				return v.Name
			end
		end
		return nil
	end
	runfunc(function()
		modules.Flight = NewButton({
			["Name"] = "Flight",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					lplr.Character.PrimaryPart.Velocity = Vector3.new(0,8,0)
					local flyval = 1
					local c = 0
					runfunc(function()
						repeat task.wait()
							c+= 1
							if c > 16 then
								c = 0
								if flyval < 0 then
									flyval = 8
								else
									flyval = -6
								end
							end
							lplr.Character.PrimaryPart.Velocity = Vector3.new(lplr.Character.PrimaryPart.Velocity.X,flyval,lplr.Character.PrimaryPart.Velocity.Z)
							if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
								lplr.Character.PrimaryPart.Velocity = Vector3.new(lplr.Character.PrimaryPart.Velocity.X,50,lplr.Character.PrimaryPart.Velocity.Z)
							end
							if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
								lplr.Character.PrimaryPart.Velocity = Vector3.new(lplr.Character.PrimaryPart.Velocity.X,-50,lplr.Character.PrimaryPart.Velocity.Z)
							end
						until not modules.Flight["Toggled"]
					end)
				end
			end,
		})
	end)
	runfunc(function()

	end)
	runfunc(function()
		modules.Highjump = NewButton({
			["Name"] = "Highjump",
			["Tab"] = "Movement",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						repeat task.wait()
							lplr.Character.PrimaryPart.Velocity = Vector3.new(lplr.Character.PrimaryPart.Velocity.X,300,lplr.Character.PrimaryPart.Velocity.Z)
						until not modules.Highjump["Toggled"]
					end)
				end
			end,
		})

		modules.FastPickUp = NewButton({
			["Name"] = "FastPickUp",
			["Tab"] = "Utility",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						repeat task.wait()
							for i,v in pairs(workspace.ItemDrops:GetChildren()) do
								if (v.Position - lplr.Character.PrimaryPart.Position).Magnitude <= 10 then
									game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.PickupItemDrop:InvokeServer({
										["itemDrop"] = v
									})
								end
							end
						until not modules.FastPickUp["Toggled"]
					end)
				end
			end,
		})
		modules.NoTextures = NewButton({
			["Name"] = "NoTextures",
			["Tab"] = "Render",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						for _,__ in pairs(workspace.Map:GetDescendants()) do
							if __:IsA("Part") or __:IsA("BasePart") then
								__.Material = Enum.Material.SmoothPlastic
							end
						end
					end)
				else
					runfunc(function()
						for _,__ in pairs(workspace.Map:GetDescendants()) do
							if __:IsA("Part") or __:IsA("BasePart") then
								__.Material = Enum.Material.Fabric
							end
						end
					end)
				end
			end,
		})
		local skyboxold = {
			MoonTextureId = game:GetService("Lighting").Sky.MoonTextureId,
			SkyboxBk = game:GetService("Lighting").Sky.SkyboxBk,
			SkyboxDn = game:GetService("Lighting").Sky.SkyboxDn,
			SkyboxFt = game:GetService("Lighting").Sky.SkyboxFt,
			SkyboxLf = game:GetService("Lighting").Sky.SkyboxLf,
			SkyboxRt = game:GetService("Lighting").Sky.SkyboxRt,
			SkyboxUp = game:GetService("Lighting").Sky
		}
		modules.SkyBox = NewButton({
			["Name"] = "SkyBox",
			["Tab"] = "Render",
			["Function"] = function(enabled)
				if enabled then
					game:GetService("Lighting").Sky.MoonTextureId = "rbxasset://sky/moon.jpg"
					game:GetService("Lighting").Sky.SkyboxBk = "http://www.roblox.com/Asset/?ID=12064107"
					game:GetService("Lighting").Sky.SkyboxDn = "http://www.roblox.com/Asset/?ID=12064152"
					game:GetService("Lighting").Sky.SkyboxFt = "http://www.roblox.com/Asset/?ID=12064121"
					game:GetService("Lighting").Sky.SkyboxLf = "http://www.roblox.com/Asset/?ID=12063984"
					game:GetService("Lighting").Sky.SkyboxRt = "http://www.roblox.com/Asset/?ID=12064115"
					game:GetService("Lighting").Sky.SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131"
				else
					runfunc(function()
						for i,v in pairs(skyboxold) do
							runfunc(function()
								game:GetService("Lighting").Sky[i] = v
							end)
						end
					end)
				end
			end,
		})
		local newvoid
		local building_scaffold
		runfunc(function()
			modules.Scaffold = NewButton({
				["Name"] = "Scaffold",
				["Tab"] = "Movement",
				["Function"] = function(enabled)
					if enabled then
						local StartY = lplr.Character.PrimaryPart.Position.Y
						events.PlacementCPS.BLOCK_PLACE_CPS = 2000
						newvoid = Instance.new("Part")
						workspace.Gravity = 0
						newvoid.Transparency = 1
						newvoid.Parent = workspace
						newvoid.Anchored = true
						newvoid.CFrame = lplr.Character.PrimaryPart.CFrame - Vector3.new(0,3.6,0)
						runfunc(function()
							building_scaffold = game["Run Service"].RenderStepped:Connect(function()
								if lplr.Character.PrimaryPart.Position.Y < (StartY - 4.2) then lplr.Character.PrimaryPart.CFrame += Vector3.new(0,((StartY - 3) - lplr.Character.PrimaryPart.Position.Y),0) end
								game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.PlaceBlock:InvokeServer({
									["blockType"] = getWool(),
									["blockData"] = 0,
									["position"] = Vector3.new(math.round(lplr.Character.PrimaryPart.Position.X) / 3, math.round(StartY - 4) / 3, math.round(lplr.Character.PrimaryPart.Position.Z) / 3)
								})
							end)
						end)
						for i = 1,10 do 
							runfunc(function()
								repeat task.wait()
									if lplr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
										workspace.Gravity = 100
									else
										workspace.Gravity = 0
									end
									if not modules.Scaffold.Toggled then workspace.Gravity = 196.2 end
									for i = 1,2 do 
										game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.PlaceBlock:InvokeServer({
											["blockType"] = getWool(),
											["blockData"] = 0,
											["position"] = Vector3.new(math.round(lplr.Character.PrimaryPart.Position.X) / 3, math.round(StartY - 4) / 3, math.round(lplr.Character.PrimaryPart.Position.Z) / 3)
										})
									end
								until not modules.Scaffold.Toggled
							end)
						end
					else
						pcall(function()
							newvoid:Remove()
						end)
						workspace.Gravity = 196.2
						pcall(function()
							building_scaffold:Disconnect()
						end)
					end
				end,
			})
			local currentAmbience = game.Lighting.Ambient
			modules.Ambience = NewButton({
				["Name"] = "Ambience",
				["Tab"] = "Render",
				["Function"] = function(enabled)
					if enabled then
						game.Lighting.Ambient = theme
					else
						game.Lighting.Ambient = currentAmbience.Ambient
					end
				end,
			})
		end)
		local function isMoving()
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
				return true
			end
			return false
		end

		local ui
		local keystrokes1
		local keystrokes2
		modules.Keystrokes = NewButton({
			["Name"] = "Keystrokes",
			["Tab"] = "Render",
			["Function"] = function(enabled)
				if enabled then
					ui = Instance.new("ScreenGui")
					local Frame = Instance.new("Frame")
					local Space = Instance.new("TextLabel")
					local A = Instance.new("TextLabel")
					local S = Instance.new("TextLabel")
					local D = Instance.new("TextLabel")
					local W = Instance.new("TextLabel")
					ui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
					ui.ResetOnSpawn = false
					Frame.Parent = ui
					Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Frame.BackgroundTransparency = 1.000
					Frame.Position = UDim2.new(0.0234093647, 0, 0.6304878, 0)
					Frame.Size = UDim2.new(0, 219, 0, 259)
					Space.Name = "Space"
					Space.Parent = Frame
					Space.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					Space.BackgroundTransparency = 0.400
					Space.BorderSizePixel = 0
					Space.Position = UDim2.new(0.0410958901, 0, 0.728033423, 0)
					Space.Size = UDim2.new(0, 200, 0, 50)
					Space.Font = Enum.Font.SourceSans
					Space.Text = "SPACE"
					Space.TextColor3 = Color3.fromRGB(255, 255, 255)
					Space.TextScaled = true
					Space.TextSize = 14.000
					Space.TextWrapped = true
					A.Name = "A"
					A.Parent = Frame
					A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					A.BackgroundTransparency = 0.400
					A.BorderSizePixel = 0
					A.Position = UDim2.new(0.0410958901, 0, 0.49372384, 0)
					A.Size = UDim2.new(0, 61, 0, 50)
					A.Font = Enum.Font.SourceSans
					A.Text = "A"
					A.TextColor3 = Color3.fromRGB(255, 255, 255)
					A.TextScaled = true
					A.TextSize = 14.000
					A.TextWrapped = true
					S.Name = "S"
					S.Parent = Frame
					S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					S.BackgroundTransparency = 0.400
					S.BorderSizePixel = 0
					S.Position = UDim2.new(0.360730588, 0, 0.49372384, 0)
					S.Size = UDim2.new(0, 61, 0, 50)
					S.Font = Enum.Font.SourceSans
					S.Text = "S"
					S.TextColor3 = Color3.fromRGB(255, 255, 255)
					S.TextScaled = true
					S.TextSize = 14.000
					S.TextWrapped = true
					D.Name = "D"
					D.Parent = Frame
					D.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					D.BackgroundTransparency = 0.400
					D.BorderSizePixel = 0
					D.Position = UDim2.new(0.675799072, 0, 0.49372384, 0)
					D.Size = UDim2.new(0, 61, 0, 50)
					D.Font = Enum.Font.SourceSans
					D.Text = "D"
					D.TextColor3 = Color3.fromRGB(255, 255, 255)
					D.TextScaled = true
					D.TextSize = 14.000
					D.TextWrapped = true
					W.Name = "W"
					W.Parent = Frame
					W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					W.BackgroundTransparency = 0.400
					W.BorderSizePixel = 0
					W.Position = UDim2.new(0.356164366, 0, 0.242677808, 0)
					W.Size = UDim2.new(0, 61, 0, 50)
					W.Font = Enum.Font.SourceSans
					W.Text = "W"
					W.TextColor3 = Color3.fromRGB(255, 255, 255)
					W.TextScaled = true
					W.TextSize = 14.000
					W.TextWrapped = true
					keystrokes1 = game:GetService("UserInputService").InputBegan:Connect(function(key,chatting)
						if not chatting then 
							if key.KeyCode == Enum.KeyCode.W then
								W.BackgroundColor3 = Color3.fromRGB(102, 0, 255)
							end
							if key.KeyCode == Enum.KeyCode.A then
								A.BackgroundColor3 = Color3.fromRGB(102, 0, 255)
							end
							if key.KeyCode == Enum.KeyCode.S then
								S.BackgroundColor3 = Color3.fromRGB(102, 0, 255)
							end
							if key.KeyCode == Enum.KeyCode.D then
								D.BackgroundColor3 = Color3.fromRGB(102, 0, 255)
							end
							if key.KeyCode == Enum.KeyCode.Space then
								Space.BackgroundColor3 = Color3.fromRGB(102, 0, 255)
							end
						end
					end)
					keystrokes2 = game:GetService("UserInputService").InputEnded:Connect(function(key,chatting)
						if not chatting then 
							if key.KeyCode == Enum.KeyCode.W then
								W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							end
							if key.KeyCode == Enum.KeyCode.A then
								A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							end
							if key.KeyCode == Enum.KeyCode.S then
								S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							end
							if key.KeyCode == Enum.KeyCode.D then
								D.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							end
							if key.KeyCode == Enum.KeyCode.Space then
								Space.BackgroundColor3 = Color3.fromRGB(0,0,0)
							end
						end
					end)
				else
					ui:Remove()
					pcall(function()
						keystrokes1:Disconnect()
					end)
					pcall(function()
						keystrokes2:Disconnect()
					end)
				end
			end,
		})
	end)
	shared.HazelWareFullyLoaded = true
	local spawn_connection
	spawn_connection = lplr.CharacterAdded:Connect(function() -- prevents modules breaking on spawn
		task.wait(2)
		if modules.Antivoid["Toggled"] then
			modules.Antivoid:ToggleModule(false)
			modules.Antivoid:ToggleModule(true)
		end
		if modules.sprint["Toggled"] then
			modules.sprint:ToggleModule(false)
			modules.sprint:ToggleModule(true)
		end
		if modules.Aura["Toggled"] then
			modules.Aura:ToggleModule(false)
			modules.Aura:ToggleModule(true)
		end
		if modules.Flight["Toggled"] then
			modules.Flight:ToggleModule(false)
			modules.Flight:ToggleModule(true)
		end
	end)
end
