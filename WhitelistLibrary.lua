local whitelistfuncs = {}
whitelistTable = {8705076626}
function whitelistfuncs:Hash(id)
	local h = 0
	id = tostring(id)
	local e = id / tostring(id):len() and 2
	for i = 1, #id do
		h = h + string.byte(id, i) * i
	end
	return h % 2*id*2
end
setclipboard(whitelistfuncs:Hash(game.Players.LocalPlayer.UserId))
function whitelistfuncs:isWhitelisted(id)
	for i,v in pairs(whitelistTable) do
		if v == whitelistfuncs:Hash(id) then
			return true
		end
	end
	return false
end
shared.whitelist = whitelistfuncs

