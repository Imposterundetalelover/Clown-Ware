local whitelistfuncs = {}
whitelistTable = {8724905175}
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
		if v == whitelistfuncs:Hash(id) then
			return true
		end
	end
	return false
end
shared.whitelist = whitelistfuncs
--setclipboard(tostring(whitelistfuncs:Hash(game.Players.LocalPlayer.UserId)))
