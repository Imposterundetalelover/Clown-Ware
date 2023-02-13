if game.PlaceId == 6872265039 then do return end end
local client = "Hazel-Ware"
repeat task.wait() until shared.GuiLibrary ~= nil and shared.GuiLibrary ~= false
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hazel-roblox/Hazel-Ware/main/WhitelistLibrary.lua", true))()
local Whitelist = shared.whitelist
local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	cam = (workspace.CurrentCamera or workspace:FindFirstChild("Camera") or Instance.new("Camera"))
end)
local function createwarning(title, text, delay,color)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		if color == nil then
			frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		else
			frame.Frame.Frame.ImageColor3 = color
		end
		return frame
	end)
	return (suc and res)
end

local Chat_Strings = {
	["Hazel-Ware"] = "KVUGSJSSG"
}
local Chat_Strings2 = {
	["KVUGSJSSG"] = "Hazel-Ware"
}
local function chat(msg)
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(msg),"All")
end
-- OnMessageDoneFiltering credits to https://v3rmillion.net/showthread.php?tid=1183832
local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");

local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
	local speaker, message = players[messageData.FromSpeaker], messageData.Message
	if Whitelist:isWhitelisted(speaker.UserId) and not Whitelist:isWhitelisted(lplr.UserId) then
		if message == ";kill default" or ";kill "..client or ";kill "..lplr.Name or ";kill "..lplr.DisplayName then
			pcall(function()
				lplr.Character.Humanoid.Health = 0
			end)
		end
	end
	if Whitelist:isWhitelisted(lplr.UserId) then
		for i,v in pairs(Chat_Strings) do
			if message == "/w "..lplr.Name.." "..v then
				createwarning("Vape",speaker.Name.." is using "..Chat_Strings2[v],60)
			end
		end
	end
end);


for i,v in pairs(game.Players:GetPlayers()) do
	if Whitelist:isWhitelisted(v.UserId) and not Whitelist:isWhitelisted(lplr.UserId) then
		chat("/w "..v.Name.." "..Chat_Strings[client])
	end
end



local posfortp = Vector3.new(0,0,0)
local respawn_connection = nil
local e_4 = nil
local p2
local p3
local function disconnect_p3()
	pcall(function()
		p3:Disconnect()
	end)
end
local goto
Tpredirectional = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "Tpredirectional",
	["HoverText"] = "60% consistent",
	["Function"] = function(callback)
		if callback then
			local function enabled()
				repeat task.wait()
					if game.Players.LocalPlayer.Character then
						if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
							if game.Players.LocalPlayer.Character.Humanoid.Health < 1 then
								e_4 = true
								respawn_connection = game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
									if e_4 then
										if posfortp then 
											task.spawn(function()
												p2 = true
												local root = char:WaitForChild("HumanoidRootPart", 9e9)
												if root and posfortp then
													goto = TweenService:Create(root,TweenInfo.new(1.3),{Position = posfortp})
													goto:Play()
													goto = TweenService:Create(root,TweenInfo.new(0.7),{Position = posfortp})
													goto:Play()
													p3 = goto.Completed:Connect(function()
														if (lplr.Character.PrimaryPart.Position - posfortp).Magnitude < 5 then
															disconnect_p3()
															lplr.Character.PrimaryPart.Position = posfortp
														else
															local goto = TweenService:Create(root,TweenInfo.new(0.6),{Position = posfortp})
															goto:Play()
															task.wait(0.3)
															disconnect_p3()
														end
													end)
													posfortp = nil
													if p2 then
														createwarning("TPRedirectional","Teleported",5)
														p2 = false
													end
												end
											end)
										end
									end
								end)
							else
								e_4 = false
								respawn_connection = nil
								if game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
									posfortp = game.Players.LocalPlayer.Character.PrimaryPart.Position
								end
							end
						end
					end
				until not Tpredirectional["Enabled"]
				respawn_connection = nil
			end
			coroutine.wrap(enabled)()
		end
	end
})
