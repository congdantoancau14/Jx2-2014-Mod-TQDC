Include("\\script\\lib\\item.lua");
Include("\\script\\mod\\carriage\\carriage_head.lua");

key = {2,1,29005}
box = {2,1,29006}
hcl = {2,1,29004}
STORE_BOX_WEIGHT = 5000
TASK_BOX_ID = 3583;


tBoxKeepers = {
	[201] = "§«ng BiÖn Kinh",
	[202] = "Nam BiÖn Kinh",
	[203] = "T©y BiÖn Kinh",
	[301] = "§«ng Thµnh §«",
	[302] = "Nam Thµnh §«",
	[303] = "T©y Thµnh §«",
	[304] = "B¾c Thµnh §«",
	[350] = "Nam T­¬ng D­¬ng",
	[351] = "T©y T­¬ng D­¬ng",
	[352] = "B¾c T­¬ng D­¬ng",
	[150] = "B¾c D­¬ng Ch©u",
	[151] = "T©y D­¬ng Ch©u",
	[152] = "Nam D­¬ng Ch©u",
	[153] = "§«ng D­¬ng Ch©u",
	[100] = "B¾c TuyÒn Ch©u",
	[101] = "T©y TuyÒn Ch©u",
	[102] = "§«ng TuyÒn Ch©u",
	[501] = "§«ng Phông T­êng",
	[502] = "T©y Phông T­êng",
	[503] = "Nam Phông T­êng",
	[504] = "B¾c Phông T­êng",
	[401] = "§«ng §¹i Lý",
	[402] = "Nam §¹i Lý",
	[403] = "B¾c §¹i Lý",

}

sNpcName = ""
sPlayerName = ""

function main_store_box(nThisBoxId)
	if nThisBoxId == nil then 
		nThisBoxId = GetWorldPos();
	end
	sNpcName = format("<color=green>%s<color>: ",GetNpcName(GetTargetNpc()))
	sPlayerName = format("<color=green>%s<color>: ",GetName());
	local nBoxId = GetTask(TASK_BOX_ID);
	local isHaveKey = GetItemCount(key[1],key[2],key[3]);
	local nReturn = GetTask(TASK_RETURN_BOX);
	
	if isHaveKey == 0 then 
		if nBoxId == 0 then 
			if Pay(1000) ~= 1 then 
				Talk(1,"",sNpcName.."PhÝ göi ®å chÝ cã <color=white>10 l­îng b¹c<color> rÎ m¹t mµ ng­¬i còng kh«ng cã. §óng lµ mét tªn khè r¸ch ¸o «m!")
				return 0;
			end
			Talk(2,"",sPlayerName.."Ta muèn göi ®å ë ®©y. Nhê ng­¬i tr«ng cÈn thËn gióp ta!",
				sNpcName.."Hoan nghªnh kh¸ch quan! C¶m ¬n kh¸ch quan ®· tin t­ëng! PhÝ göi ®å lµ <color=white>10 l­îng b¹c<color>. §©y lµ ch×a khãa r­¬ng. Xin h·y gi÷ cÈn thËn!"
			)
			-- DelItem from carriage
			init(2);
			local nIndex = GetItemIndexFromFile(box[1],box[2],box[3]);
			local object = TB_ITEMS[nIndex];
			local nRemove = RemoveItemFromFile(object,nStoreId);
			local nDel = DelItem(box[1],box[2],box[3],1);
			local nAdd = AddItem(key[1],key[2],key[3],1);
			
			if nRemove == 1 or nDel == 1 then
				SetTask(TASK_BOX_ID,nThisBoxId);
			else
				Talk(1,"",sNpcName.."Ng­¬i kh«ng cã ®å ®¹c g× c¶ g× göi g× ë ®©y?");
			end
			-- return 0; -- Disable this line or change to return 1 will openbox in Thñ khè
		else
			if nBoxId == nThisBoxId then 
				Say(sNpcName.."Ng­¬i lµm mÊt ch×a khãa sao?",2,
					"Ta lì lµm mÊt råi/#lost_key(1)",
					"Ta tÝnh hái chót chuyÖn. Mµ th«i!/no_box"
				)
				return 0
			else
				Say(sNpcName.."Ng­¬i lµm mÊt ch×a khãa sao?",2,
					"Ta lì lµm mÊt råi. Vµ còng kh«ng nhí n¬i göi ®å. Xin h·y gióp t¹i h¹/#lost_key(2)",
					"Ta chØ ghÐ qua th«i!/no_box"
				)
				return 0
			end
		end
	else
		if nBoxId ~= 0 then 
			if nBoxId ~= nThisBoxId then 
				Say(sNpcName.."M· sè trªn ch×a khãa <color=red>kh«ng ph¶i ë ®©y<color>. Ng­¬i kh«ng göi ®å ë chç ta. Ng­¬i tíi nhÇm chç råi.",3,
					format("Ta muèn göi ®å ë ®©y. Nhê ng­¬i liªn l¹c víi thñ khè kh¸c chuyÓn ®å cña ta ®Õn ®©y./#move_box_confirm(%d)",nThisBoxId),
					"Ta kh«ng nhí n¬i göi ®å./lost_box",
					"§óng lµ nhÇm lÉn, xin th«ng c¶m! ;)/no_box");
				return 0;
			end
			if nReturn == 1 then
				Say(sNpcName.."Kh¸ch quan cÇn g× sao?",2,
					"Ta muèn chuyÓn ®å ®i, göi tr¶ ng­¬i ch×a khãa/get_box_confirm",
					"Kh«ng cã viÖc g×/nothing")
				return 0;
			end
		else
			Talk(1,"",sNpcName.."Ng­¬i nhÆt ®­îc ch×a khãa nµy sao? Ta kh«ng thÊy tªn cña ng­¬i trong danh s¸ch kh¸ch hµng. Ta sÏ thu l¹i v× nã thuéc tµi s¶n cña hÖ thèng Tiªu côc.");
			DelItem(key[1],key[2],key[3],1);
			return 0;
		end
	end
	return 1;
end;

function lost_box()
	Say(sNpcName.."Ng­¬i muèn ta t×m th«ng tin vÒ n¬i ng­¬i ®· göi ®å ­? §­îc th«i! Liªn l¹c rÊt tèn kÐm. LÊy ng­¬i <color=gold>5 l­îng vµng<color> th«i!",2,
		"§­îc./get_address",
		"Th«i! PhÝ cao qu¸, ®Ó ta tù ®i t×m./nothing"
	)
	
end;

function get_address()
	if Pay(50000) == 1 then 
		Talk(3,"","...",
			sNpcName.."Ta ®· ph¶i cùc khæ l¾m míi kiÕm ®­îc th«ng tin vÒ cho ng­¬i.",
			sNpcName.."§Þa chØ göi cña ng­¬i lµ: "..tBoxKeepers[GetTask(TASK_BOX_ID)]
		)
	else
		Talk(1,"",sNpcName.."Chi phÝ tèn kÐm. Kh«ng cã tiÒn th× ta kh«ng thÓ gióp ng­¬i ®­îc. 5 l­îng <color=gold>vµng<color>, chuÈn bÞ ®ñ th× ®Õn ®©y. TiÔn kh¸ch!")
	end
end;

function lost_key(nPlace)
	if GetItemCount(key[1],key[2],key[3]) > 1 then 
		Talk(1,"",sNpcName.."Ch¼ng ph¶i khãa ®ang ë trªn tay ng­¬i ®ã sao? §Õn ®ïa ta sao? BiÕn ®i chç kh¸c cho ta lµm ¨n, ta kh«ng r¶nh ®Ó ®ïa giìn víi ng­¬i.")
		return 0;
	end
	
	if nPlace == 1 then 
		Talk(2,"",sNpcName.."Cã rÊt nhiÒu ng­êi göi ®å ë ®©y. Ta kh«ng thÓ nhí ®­îc ng­¬i cã ph¶i kh¸ch hµng cña ta kh«ng. Chi phÝ x¸c nhËn nh©n d¹ng ®¾t ®á. 5 l­îng <color=gold>vµng<color> míi ®ñ.","...")
		
		if Pay(50000) == 1 then 
			AddItem(key[1],key[2],key[3],1);
			Talk(1,"",sNpcName.."Khãa míi cña ng­¬i ®©y. LÇn sau nhí cÈn thËn.")
		else
			Talk(1,"",sNpcName.."Chi phÝ nhËn d¹ng ®¾t ®á. 5 l­îng <color=gold>vµng<color> míi ®ñ. Cã tiÒn th× h·y quay l¹i!")
		end
	else
		Talk(2,"","...",sNpcName.."Ta míi kiÓm tra danh s¸ch th× kh«ng thÊy ng­¬i trong danh s¸ch göi ®å ë ®©y. Ng­¬i ®Õn nhÇm chç råi.")
		return 0;
	end
end;

function move_box_confirm(nThisBoxId)
	Say(sNpcName.."Chi phÝ liªn l¹c c¸c ®¬n vÞ kh¸c céng thªm vËn chuyÓn lµ <color=gold>10 l­îng vµng<color>. Ng­¬i thùc sù muèn chuyÓn ®å ®Õn chç ta chø?",2,
		format("§óng vËy, ng­¬i nãi nhiÒu qu¸!/#move_box_here(%d)",nThisBoxId),
		"Th«i! §Ó ta suy tÝnh ®·./nothing"
	)
end;

function move_box_here(nThisBoxId)
	if Pay(100000) ~= 1 then 
		Talk(1,"",sNpcName.."Thø nhÊt lµ chi phÝ liªn l¹c c¸c ®¬n vÞ kh¸c ®· tèn mÊt <color=gold>5 l­îng vµng<color>. Thø hai lµ ta kh«ng biÕt ng­¬i ®Ó g× trong r­¬ng nh­ng r­¬ng hµng cång kÒnh, c«ng vËn chuyÓn hµng hãa rÊt cùc khæ. Tæng chi phÝ vËn chuyÓn lµ 10 l­îng vµng. Ng­¬i muèn tiÖn th× ph¶i chi ra.");
		return 0;
	else
		Talk(1,"",sNpcName.."§­îc th«i! Kh¸ch hµng lµ th­îng ®Õ. Cã tiÒn th× viÖc g× còng gi¶i quyÕt ®­îc. §©y lµ ch×a khãa míi cña ng­¬i. LÇn sau ng­¬i tíi ®©y lµ sÏ cã r­¬ng ®å råi!");
		DelItem(key[1],key[2],key[3],1)
		AddItem(key[1],key[2],key[3],1)
		SetTask(TASK_BOX_ID,nThisBoxId);
		return 1;
	end;
end;

function get_box_confirm()
	local nNpcIdx = BIAOCHE_TASKGROUP:GetTask(BIAOCHE_TASKGROUP.BIAOCHE_INDEX);
	if (nNpcIdx == 0 or GetItemCount(hcl[1],hcl[2],hcl[3]) == 0) and GetFreeItemWeight() < STORE_BOX_WEIGHT then 
		Talk(1,"",sNpcName.."Søc ng­¬i kh«ng thÓ nhÊc næi r­¬ng ®å nµy ®©u. Ph¶i biÕt tù l­îng søc m×nh.");
	else
		get_store_box();
	end
end;

function get_store_box()
	Talk(1,"",sNpcName.."C¶m ¬n ®· sö dông dÞch vô ë chç ta. HÑn gÆp l¹i! R­¬ng ®å cña ng­¬i ®©y...")
	SetTask(TASK_BOX_ID,0);
	SetTask(TASK_RETURN_BOX,0);
	DelItem(key[1],key[2],key[3],1);
	AddItem(box[1],box[2],box[3],1);
	Msg2Player("§· göi tr¶ thñ khè ch×a khãa vµ nhËn r­¬ng ®å!");
end;

function return_key()
	SetTask(TASK_RETURN_BOX,1);
	TaskTip("Mang ch×a khãa ®Õn n¬i göi ®å ®Ó tr¶ thñ khè.");
end;

function on_key_use()
	local tbSay = {
		-- "LÊy ®Þa chØ/getAddress",
		"Göi tr¶ ch×a khãa cho thñ khè, chuyÓn ®å ®i/return_key",
		"Tho¸t/nothing"
	}
	Say("",getn(tbSay),tbSay)
end;

function getAddress()
	Talk(1,"",format("§Þa chØ göi: %s",tBoxKeepers[GetTask(TASK_BOX_ID)]))
end;

function nothing() end;