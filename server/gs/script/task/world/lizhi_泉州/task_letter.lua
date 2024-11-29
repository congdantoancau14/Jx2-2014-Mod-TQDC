--  ÎÄ¼þËµÃ÷
--  Ê¹ÓÃÕÂÎ°¸ÕµÄÃØº¯ÒÔºó´¥·¢µÄ½Å±¾ÎÄ¼þ
--  Created by lizhi
--  2005-8-4 21:13

Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

    local szMsg = {
        "NhËn nhiÖm vô: Th«ng b¸o cho H¹ HÇu CÇm",
        "Trong mËt hµm ghi {§· chuyÓn ®Õn n¬i an toµn! H¹ HÇu CÇm ë D­¬ng Ch©u lµ mét trong 4 ng­êi CÇm, Kú, Thi, Häa cña Tr­êng Ca M«n, phô tr¸ch vïng Giang Nam, ph¶i trõ khö nhanh!}. Ch­¬ng VÜ C­¬ng tr×nh.",
        "Nghe nãi Tr­êng Ca M«n cã tõ thêi nhµ Tèng do nhiÒu m«n ph¸i hîp l¹i ®Ó chèng ngo¹i téc x©m chiÕm. Mau ®em bøc th­ ®Õn {D­¬ng Ch©u} giao cho {H¹ HÇu CÇm}."
    };
    local nStep;
    
    nStep = GetTask(TASK_THREE);
    if (nStep == 0) then
        Msg2Player("§em mËt hµm giao cho H¹ HÇu CÇm");
        TaskTip("§em mËt hµm giao cho H¹ HÇu CÇm");
        SetTask(TASK_THREE, 1);
        TalkEx("", szMsg);
    elseif nStep == 1 then
        Msg2Player("§em mËt hµm giao cho H¹ HÇu CÇm");
        TaskTip("§em mËt hµm giao cho H¹ HÇu CÇm");
    end;

end;