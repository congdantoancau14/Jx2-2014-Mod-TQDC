function on_player_login()
	yp_delitem()
end

function yp_delitem()
	local nCount = BigGetItemCount(2,95,924);
	if nCount ~= 0 then
		BigDelItem(2,95,924,nCount)
	end
end