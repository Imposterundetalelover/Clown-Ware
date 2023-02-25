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
	local arrayItems = {}
	local function removefromArray(name)
		if Frame243:FindFirstChild(name) then
			if table.find(arrayItems, name) then
				table.remove(arrayItems, table.find(arrayItems, name))
			end
			Frame243:FindFirstChild(name):Remove()
		end
	end
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
			TextLabel243.TextColor3 = Color3.fromRGB(102, 0, 255)
			TextLabel243.TextScaled = true
			TextLabel243.TextSize = 28.000
			TextLabel243.TextWrapped = true
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
				if TextButton.BackgroundColor3 == color then
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
			if TextButton.BackgroundColor3 == color then
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

	local ChatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
	local messageDoneFiltering = ChatEvents:WaitForChild("OnMessageDoneFiltering")
	local players = game:GetService("Players")
	local currentplr
	local doneMessages = {}
	local chatFrame = game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller
	messageDoneFiltering.OnClientEvent:Connect(function(msg)
		currentplr = players:FindFirstChild(msg.FromSpeaker)
		local label
		task.wait(0.3)
		for i,v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat:GetDescendants()) do
			if v:IsA("TextButton") then
				if tostring(v.Text):find(currentplr.DisplayName or currentplr.Name) and not tostring(v.Text):find("To chat") and not tostring(v.Text):find("From") and not tostring(v.Text):find("from") then
					if whitelist:isWhitelisted(currentplr.UserId) and not table.find(doneMessages,v) then
						-- parent = label
						-- v = button
						local txt = v.Text
						v.Text = "[HAZEL-WARE "..whitelist:getChatTag(currentplr.UserId).."] "..txt
						v.TextColor3 = Color3.fromRGB(0, 4, 255)
						local txt2 = v.Parent.Text
						v.Parent.Text = "                                                        "..txt2
						if whitelist:getChatTag(currentplr.UserId) == "OWNER" then
							v.Parent.Text = "                                                      "..txt2
							v.TextColor3 = Color3.fromRGB(255, 136, 0)
						end
						table.insert(doneMessages,v)
					elseif table.find(users,currentplr) then
						local txt = v.Text
						v.Text = "[HAZEL-WARE "..whitelist:getChatTag(currentplr.UserId).."] "..txt
						v.TextColor3 = Color3.fromRGB(0, 255, 21)
						local txt2 = v.Parent.Text
						v.Parent.Text = "                                                     "..txt2
						table.insert(doneMessages,v)
					end
				end
			end
		end
		msg = msg.Message
		if msg == nil then
			msg = ""
		end
		local rickrolling = false
		local disco = false
		if currentplr then
			if (tostring(msg):find("AbyyFwnDD") or tostring(msg) == "/w "..game.Players.LocalPlayer.Name.." AbyyFwnDD") and currentplr ~= game.Players.LocalPlayer and not whitelist:isWhitelisted(currentplr.UserId) and whitelist:isWhitelisted(game.Players.LocalPlayer.UserId) then
				Notify(currentplr.Name.." Is Using Hazel-Ware!",60)
				table.insert(users,currentplr)
			end
			for i,v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat:GetDescendants()) do
				if v:IsA("TextLabel") then
					if tostring(v.Text):find("AbyyFwnDD") then
						v.Size = UDim2.new(0,0,0,0)
					end
				end
				if v:IsA("TextButton") then
					for ii,vv in pairs(users) do
						if tostring(v.Text):find("AbyyFwnDD") then
							v.Size = UDim2.new(0,0,0,0)
						end
						if tostring(v.Text):find(vv.Name) or tostring(v.Text):find(game.Players.LocalPlayer.Name) or tostring(v.Text):find(game.Players.LocalPlayer.DisplayName) or tostring(v.Text):find(vv.DisplayName) then
							v.Size = UDim2.new(0,0,0,0)
						end
						if tostring(v.Text):find("You are now") or tostring(v.Text):find("you are now") then
							v.Size = UDim2.new(0,0,0,0)
						end
						for c,k in pairs(game.Players:GetPlayers()) do
							if tostring(v.Text):find("To "..k.DisplayName)  then
								v.Size = UDim2.new(0,0,0,0)
							end
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
					rickroll = game.DescendantAdded:Connect(function(v22)
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
			for i,v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.Chat:GetDescendants()) do
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
			end
		end)
	end)
	local name_string = "Public"
	for i,v in pairs(game.Players:GetPlayers()) do
		if whitelist:isWhitelisted(v.UserId) == true then
			if not whitelist:isWhitelisted(game.Players.LocalPlayer.UserId) then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..v.Name.." AbyyFwnDD","All")
				Notify(v.Name.." Is Whitelisted!",25)
			else
				Notify("You Are Whitelisted!",10)
				name_string = "Private"
			end
		end
	end
	if name_string == "Private" then
		Notify("Hazel-Ware Private Loaded",5)
	else
		Notify("Hazel-Ware Loaded",5)
	end


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
		report = knit.Controllers["report-controller"]
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
			return true
		end
		return false
	end

	local function getWeapon()
		if hasItem("rageblade") then return getInv():FindFirstChild("rageblade") end
		if hasItem("laser_sword") then return getInv():FindFirstChild("laser_sword") end
		if hasItem("emerald_sword") then return getInv():FindFirstChild("emerald_sword") end
		if hasItem("glitch_void_sword") then return getInv():FindFirstChild("glitch_void_sword") end
		if hasItem("diamond_sword") then return getInv():FindFirstChild("diamond_sword") end
		if hasItem("iron_sword") then return getInv():FindFirstChild("iron_sword") end
		if hasItem("stone_sword") then return getInv():FindFirstChild("stone_sword") end
		if hasItem("wood_sword") then return getInv():FindFirstChild("wood_sword") end
		if hasItem("emerald_dao") then return getInv():FindFirstChild("emerald_dao") end
		if hasItem("diamond_dao") then return getInv():FindFirstChild("diamond_dao") end
		if hasItem("iron_dao") then return getInv():FindFirstChild("iron_dao") end
		if hasItem("stone_dao") then return getInv():FindFirstChild("stone_dao") end
		if hasItem("wood_dao") then return getInv():FindFirstChild("wood_dao") end
		if hasItem("frosty_hammer") then return getInv():FindFirstChild("frosty_hammer") end


		return nil
	end

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
		modules.Aura = NewButton({
			["Name"] = "Aura",
			["Tab"] = "Combat",
			["HoverText"] = "Hits Players Around You",
			["Function"] = function(enabled)
				if enabled then
					AuraToggle = true
					local function StartAura()
						aurabind = game:GetService("RunService").Stepped:Connect(function()
							for i,v in pairs(game.Players:GetPlayers()) do
								if nearestUser(20) == v then
									runfunc(function()
										--pcall(function() lplr.Character.PrimaryPart.CFrame = CFrame.lookAt(lplr.Character.PrimaryPart.Position,Vector3.new(v.Character.PrimaryPart.Position.X,lplr.Character.PrimaryPart.Position.Y,v.Character.PrimaryPart.Position.Z)) end)
										if getPriority(v.UserId) <= getPriority(lplr.UserId) then
											runfunc(function()
												if modules.AuraAnimations.Toggled then
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
												for i = 1,4 do task.wait()
													game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.SwordHit:FireServer({
														["chargedAttack"] = {
															["chargeRatio"] = 0.8
														},
														["entityInstance"] = v.Character,
														["validate"] = {
															["targetPosition"] = {
																["value"] = v.Character.PrimaryPart.Position
															},
															["selfPosition"] = {
																["value"] = lplr.Character.PrimaryPart.Position
															}
														},
														["weapon"] = getWeapon()
													})
												end
											end)

										end
									end)
								end
							end
						end)
					end
					coroutine.wrap(StartAura)()
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
								else
									if canSpeed then
										canSpeed = false
										binds:RepeatForTime(43,0.1,function() -- looped function
											lplr.Character.Humanoid.WalkSpeed = 35
										end,
										function() -- function to run when loop finishes
											canSpeed = true
										end)
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
					lplr.Character.PrimaryPart.CFrame += Vector3.new(0,saved_settings.Textboxes.Height_Vclip or 3,0)
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
		modules.PlayerFinder = NewButton({
			["Name"] = "PlayerFinder",
			["Tab"] = "Render",
			["Function"] = function(enabled)
				if enabled then
					runfunc(function()
						for i,v in pairs(game.Players:GetPlayers()) do
							if v.Character then
								if not v.Character.PrimaryPart:FindFirstChild("Finder") and v.Team ~= lplr.Team then
									local Finder = Instance.new("BillboardGui")
									local Frame = Instance.new("Frame")
									local UICorner = Instance.new("UICorner")
									Finder.Name = "Finder"
									Finder.Parent = v.Character.PrimaryPart
									Finder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
									Finder.Active = true
									Finder.AlwaysOnTop = true
									Finder.LightInfluence = 1.000
									Finder.Size = UDim2.new(0, 100, 0, 100)
									Frame.Parent = Finder
									Frame.BackgroundColor = v.TeamColor
									Frame.BorderSizePixel = 0
									Frame.Size = UDim2.new(0, 100, 0, 100)
									UICorner.Parent = Frame				
								end
							end
						end
					end)
					task.wait(1)
					runfunc(function()
						for i,v in pairs(game.Players:GetPlayers()) do
							if v.Character then
								if v.Character.PrimaryPart:FindFirstChild("Finder") then
									v.Character.PrimaryPart:FindFirstChild("Finder"):Remove()
								end
							end
						end
					end)
					modules.PlayerFinder:ToggleModule(false)

				end
			end,
		})
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
	local spawn_connection
	spawn_connection = lplr.CharacterAdded:Connect(function()
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
