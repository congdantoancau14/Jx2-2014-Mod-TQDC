function OnUse(nItemIndex)
	if DelItemByIndex(nItemIndex,1) ~= 0 then
		CastState("state_p_attack_percent_add",20,120*60*18,1,1009);
		CastState("state_m_attack_percent_add",20,120*60*18,1,1010);	--120分钟提高内外攻20％
		CastState("state_move_speed_percent_add",10,120*60*18,1,1001);	--120分钟提高移动速度10%
		Msg2Player("L鵦 nh t╪g 20%, t鑓  di chuy觧 t╪g 10% duy tr� 2h")
		Msg2_LeiTai("B竛h 輙 nng");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d鬾g 1	"..szItemName);
end;
