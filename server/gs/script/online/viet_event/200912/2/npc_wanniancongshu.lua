--=============================================
--create by baiyun 2009.11.18
--describe:Խ�ϰ�12�·ݻ �����NPC�ű��ļ�
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function main()
    	local tbDialog = {
            "Th�c hi�n 1 �i�u ��c (c�n 10 B�nh Kem Vani)/give_xiangcaodangao_get_award",
    	};
    	local nDate = tonumber(date("%y%m%d"));
		tinsert(tbDialog,"Th�ng Gi�ng Sinh th�t ��p!/nothing");
	if nDate >= 091225 and nDate < 400125 then
 		Say("Th�ng Gi�ng Sinh V�n Ni�n s�ng l�p l�nh. H�y mau th�c hi�n �i�u ��c.", getn(tbDialog), tbDialog);
 	else
 		Say("Th�ng Gi�ng Sinh V�n Ni�n s�ng l�p l�nh",0);
 	end
end



function nothing()

end
