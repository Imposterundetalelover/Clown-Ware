local whitelistfuncs = {}
whitelistTable = { -- just put 1 for type 2 is different type of wl
	[1] = {hash = 8756355969, type = 2},
	[2] = {hash = 8709468779, type = 1}
}
function whitelistfuncs:Hash(id)
	local h = 0
	id = tostring(id)
	local e = id / tostring(id):len()
	for i = 1, #id do
		h = h + string.byte(id, i) * i
	end
	return h + math.round(e*h^0.1) % 2*id*2
end

function whitelistfuncs:isWhitelisted(id)
	for i,v in pairs(whitelistTable) do
		if v.hash == whitelistfuncs:Hash(id) then
			return true, v.type
		end
	end
	return false
end
function whitelistfuncs:getChatTag(id)
	local state, type = whitelistfuncs:isWhitelisted(id)
	if state then
		if type ~= nil then
			if type > 1 then
				return "OWNER"
			elseif type < 2 then
				return "PRIVATE"
			end
		end
	end
	return "USER"
end
shared.whitelist = whitelistfuncs
--setclipboard(tostring(whitelistfuncs:Hash(game.Players.LocalPlayer.UserId)))
