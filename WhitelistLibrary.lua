local whitelistfuncs = {}
whitelistTable = {
	["Hazel"] = {hash = 2964}
}
function whitelistfuncs:Hash(id)
	local h = 0
	id = tostring(id)
	for i = 1, #id do
		h = h + string.byte(id, i) * i
	end
	return h % 2^32
end
function whitelistfuncs:isWhitelisted(id)
	for i,v in pairs(whitelistTable) do
		for i2,v2 in pairs(v) do
			if v2.hash == whitelistfuncs:Hash(id) then
				return true
			end
		end
	end
	return false
end
shared.whitelist = whitelistfuncs
