
function showKX()
	local tSay = {
		g_szTitle.."Lùa chän",
		"NhËn Th«n NguyÖt lÖnh (KX6)/Get_KimXa",
		"Trang bÞ Kim xµ 4 (ngÉu nhiªn)/showKX4",
		"Trang bÞ Kim xµ 5 (ngÉu nhiªn)/showKX5",
		"Trang bÞ Kim xµ 6 (ngÉu nhiªn)/showKX6",
		"Trang bÞ Kim xµ 7 (ngÉu nhiªn)/showKX7",
		"Trang bÞ Kim xµ 3 vÞ d­ìng/getKX3",
		"Trang bÞ Kim xµ 4 vÞ d­ìng/getKX4",
		"Trang bÞ Kim xµ theo hÖ ph¸i/Get_JinShe",
		"Trang bÞ Kim xµ thuéc tÝnh/getKXNormalAttr",
		-- "Trang bÞ Kim xµ thuéc tÝnh ®Æc biÖt/getKXSpecialAttr",
	}
	tinsert(tSay,"Ra khái/nothing");
	SelectSay(tSay);	
end;

tbAttributes = { -- id	name	line

	{147,"Ph¸t triÓn nhãm ®iÒn vµo B",0},
	{148,"Hao mßn vò khÝ gi¶m 1% ",1},
	{149,"Søc lùc+1",1},
	{150,"T¨ng giíi h¹n träng l­îng1%",1},
	{151,"ThÓ lùc",1},
	{152,"ThÓ lùc 1%",1},
	{153,"§iÓm kinh nghiÖm nhËn ®­îc t¨ng 1% ",1},
	{154,"Täa thiÒn mçi 10 gi©y håi phôc sinh lùc1",1},
	{155,"Täa thiÒn mçi 10 gi©y håi phôc néi lùc1",1},
	{156,"Täa thiÒn mçi 10 gi©y håi phôc thÓ lùc1",1},
	{157,"HiÖu qu¶ d­îc phÈm håi néi1%",1},
	{158,"yªu cÇu ®¼ng cÊp gi¶m 1",1},
	{159,"Tiªu diÖt ®Þch nh©n kh«i phôc sinh lùc",1},
	{160,"Tiªu diÖt ®Þch nh©n kh«i phôc néi lùc",1},
	{161,"Ph¸t triÓn thuéc tÝnh chÝnh B",0},
	{162,"Søc m¹nh",2},
	{163,"Th©n ph¸p",2},
	{164,"Néi c«ng ",2},
	{165,"Linh ho¹t",2},
	{166,"G©n cèt",2},
	{167,"Néi lùc ",2},
	{168,"Néi lùc %",2},
	{169,"§iÓm sinh lùc",2},
	{170,"Sinh mÖnh %",2},
	{171,"Ph¸t triÓn nhãm c«ng kÝch B",0},
	{172,"Ngäai c«ng lín nhÊt trªn vò khÝ t¨ng 1",3},
	{173,"Ngo¹i c«ng nhá nhÊt trªn vò khÝ t¨ng 1",3},
	{174,"Néi c«ng lín nhÊt trªn vò khÝ t¨ng 1",3},
	{175,"Néi c«ng nhá nhÊt trªn vò khÝ t¨ng 1",3},
	{176,"T¨ng ®iÓm sè tæng lùc c«ng kÝch ngo¹i c«ng",3},
	{177,"T¨ng ®iÓm sè tæng lùc c«ng kÝch néi c«ng",3},
	{178,"S¸t th­¬ng t¨ng 1",3},
	{179,"S¸t th­¬ng ®éc",3},
	{180,"§éc s¸t t¨ng 1",3},
	{181,"Ngo¹i c«ng t¨ng 1% ",3},
	{182,"Néi c«ng t¨ng 1% ",3},
	{183,"Søc m¹nh B",3},
	{184,"Th©n ph¸p B",3},
	{185,"Néi lùc B",3},
	{186,"Linh ho¹t B",3},
	{187,"G©n cèt B",3},
	{188,"Sinh mÖnh % B",3},
	{395,"Nhãm më khãa B",0},
	{396,"Hao mßn vò khÝ gi¶m 1% ",4},
	{397,"Søc lùc+1",4},
	{398,"T¨ng giíi h¹n träng l­îng1%",4},
	{399,"ThÓ lùc",4},
	{400,"ThÓ lùc 1%",4},
	{401,"§iÓm kinh nghiÖm nhËn ®­îc t¨ng 1% ",4},
	{402,"Täa thiÒn mçi 10 gi©y håi phôc sinh lùc1",4},
	{403,"Täa thiÒn mçi 10 gi©y håi phôc néi lùc1",4},
	{404,"Täa thiÒn mçi 10 gi©y håi phôc thÓ lùc1",4},
	{405,"HiÖu qu¶ d­îc phÈm håi néi1%",4},
	{406,"yªu cÇu ®¼ng cÊp gi¶m 1",4},
	{407,"Néi c«ng nhá nhÊt trªn vò khÝ t¨ng 1",4},
	{408,"Néi c«ng lín nhÊt trªn vò khÝ t¨ng 1",4},
	{409,"Ngo¹i c«ng nhá nhÊt trªn vò khÝ t¨ng 1",4},
	{410,"Ngäai c«ng lín nhÊt trªn vò khÝ t¨ng 1",4},
	{411,"T¨ng ®iÓm sè néi c«ng",4},
	{412,"T¨ng ®iÓm sè ngo¹i c«ng",4},
	{413,"S¸t th­¬ng t¨ng 1",4},
	{414,"T¨ng s¸t th­¬ng ®éc",4},
	{415,"§éc s¸t t¨ng 1",4},
	{416,"Søc m¹nh",4},
	{417,"Th©n ph¸p",4},
	{418,"Néi c«ng ",4},
	{419,"Linh ho¹t",4},
	{420,"G©n cèt",4},
	{421,"§iÓm sè triÖt tiªu s¸t th­¬ng ngo¹i c«ng",4},
	{422,"§iÓm sè triÖt tiªu s¸t th­¬ng néi c«ng",4},
	{423,"Gi¶m ®éc s¸t 1",4},
	{424,"Thêi gian hç trî tÊn c«ng t¨ng 1% ",4},
	{425,"Thêi gian hç trî phßng thñ t¨ng 1% ",4},
	{426,"D­îc hiÖu kÐo dµi",4},
	{427,"Tiªu diÖt ®Þch nh©n kh«i phôc sinh lùc",4},
	{428,"Tiªu diÖt ®Þch nh©n kh«i phôc néi lùc",4},
	{429,"Ngo¹i c«ng t¨ng 1% ",4},
	{430,"Néi c«ng t¨ng 1% ",4},
	{431,"Tû lÖ s¸t th­¬ng tuyÖt ®èi 1%",4},
	{432,"Néi lùc ",4},
	{433,"Néi lùc %",4},
	{434,"§iÓm sinh lùc",4},
	{435,"§iÓm sè ph¶n ®ßn s¸t th­¬ng ngo¹i c«ng",4},
	{436,"§iÓm sè ph¶n ®ßn s¸t th­¬ng néi c«ng",4},
	{437,"Sinh mÖnh %",4},
	{438,"Hoµn toµn bá qua tû lÖ tiªu hao kü n¨ng1%",4},
	{439,"Tèc ®é ®¸nh t¨ng 1% ",4},
	{440,"X¸c suÊt tÊn c«ng trong ph¹m vi 1% ",4},
	{441,"X¸c suÊt tÇn c«ng chÝ m¹ng 1% ",4},
	{442,"Dïng kü n¨ng kh«ng tÝnh tû lÖ gi¶n c¸ch1%",4},
	{443,"Ph¶n ®ßn s¸t th­¬ng ®éc",4},
	{444,"TØ lÖ ph¶n ®ßn s¸t th­¬ng ngo¹i th­¬ng",4},
	{445,"TØ lÖ ph¶n ®ßn s¸t th­¬ng néi th­¬ng",4},
	{446,"Më khãa + Huy ch­¬ng ®Æc tr­ng D-B",0},
	{447,"Nhãm më khãa D",0},
	{498,"Nhãm më khãa C",0},
	{549,"Nhãm më khãa B",0},
	{550,"Hao mßn vò khÝ gi¶m 1% ",51},
	{551,"Søc lùc+1",51},
	{552,"T¨ng giíi h¹n träng l­îng1%",51},
	{553,"ThÓ lùc",51},
	{554,"ThÓ lùc 1%",51},
	{555,"§iÓm kinh nghiÖm nhËn ®­îc t¨ng 1% ",51},
	{556,"Täa thiÒn mçi 10 gi©y håi phôc sinh lùc1",51},
	{557,"Täa thiÒn mçi 10 gi©y håi phôc néi lùc1",51},
	{558,"Täa thiÒn mçi 10 gi©y håi phôc thÓ lùc1",51},
	{559,"HiÖu qu¶ d­îc phÈm håi néi1%",51},
	{560,"yªu cÇu ®¼ng cÊp gi¶m 1",51},
	{561,"Néi c«ng nhá nhÊt trªn vò khÝ t¨ng 1",51},
	{562,"Néi c«ng lín nhÊt trªn vò khÝ t¨ng 1",51},
	{563,"Ngo¹i c«ng nhá nhÊt trªn vò khÝ t¨ng 1",51},
	{564,"Ngäai c«ng lín nhÊt trªn vò khÝ t¨ng 1",51},
	{565,"T¨ng ®iÓm sè néi c«ng",51},
	{566,"T¨ng ®iÓm sè ngo¹i c«ng",51},
	{567,"S¸t th­¬ng t¨ng 1",51},
	{568,"T¨ng s¸t th­¬ng ®éc",51},
	{569,"§éc s¸t t¨ng 1",51},
	{570,"Søc m¹nh",51},
	{571,"Th©n ph¸p",51},
	{572,"Néi c«ng ",51},
	{573,"Linh ho¹t",51},
	{574,"G©n cèt",51},
	{575,"§iÓm sè triÖt tiªu s¸t th­¬ng ngo¹i c«ng",51},
	{576,"§iÓm sè triÖt tiªu s¸t th­¬ng néi c«ng",51},
	{577,"Gi¶m ®éc s¸t 1",51},
	{578,"Thêi gian hç trî tÊn c«ng t¨ng 1% ",51},
	{579,"Thêi gian hç trî phßng thñ t¨ng 1% ",51},
	{580,"D­îc hiÖu kÐo dµi",51},
	{581,"Tiªu diÖt ®Þch nh©n kh«i phôc sinh lùc",51},
	{582,"Tiªu diÖt ®Þch nh©n kh«i phôc néi lùc",51},
	{583,"Ngo¹i c«ng t¨ng 1% ",51},
	{584,"Néi c«ng t¨ng 1% ",51},
	{585,"Tû lÖ s¸t th­¬ng tuyÖt ®èi 1%",51},
	{586,"Néi lùc ",51},
	{587,"Néi lùc %",51},
	{588,"§iÓm sinh lùc",51},
	{589,"§iÓm sè ph¶n ®ßn s¸t th­¬ng ngo¹i c«ng",51},
	{590,"§iÓm sè ph¶n ®ßn s¸t th­¬ng néi c«ng",51},
	{591,"Sinh mÖnh %",51},
	{592,"Hoµn toµn bá qua tû lÖ tiªu hao kü n¨ng1%",51},
	{593,"Tèc ®é ®¸nh t¨ng 1% ",51},
	{594,"X¸c suÊt tÊn c«ng trong ph¹m vi 1% ",51},
	{595,"X¸c suÊt tÇn c«ng chÝ m¹ng 1% ",51},
	{596,"Dïng kü n¨ng kh«ng tÝnh tû lÖ gi¶n c¸ch1%",51},
	{597,"Ph¶n ®ßn s¸t th­¬ng ®éc",51},
	{598,"TØ lÖ ph¶n ®ßn s¸t th­¬ng ngo¹i th­¬ng",51},
	{599,"TØ lÖ ph¶n ®ßn s¸t th­¬ng néi th­¬ng",51},
	{600,"Nhãm huy ch­¬ng ®Æc tr­ng D",0},
	{611,"Nhãm huy ch­¬ng ®Æc tr­ng C",0},
	{622,"Nhãm huy ch­¬ng ®Æc tr­ng B",0},
	{623,"Hót thÓ lùc1",61},
	{624,"Hót Néi lùc 1",61},
	{625,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n gi¶m tèc2 gi©y",61},
	{626,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n chËm2 gi©y",61},
	{627,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n ®Þnh th©n2 gi©y",61},
	{628,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n tª liÖt2 gi©y",61},
	{629,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n ngñ2 gi©y",61},
	{630,"Hót Sinh lùc 1",61},
	{631,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n cho¸ng2 gi©y",61},
	{632,"Khi c«ng kÝch cã tØ lÖ 3% khiÕn cho ®Þch nh©n lo¹n2 gi©y",61},
	{633,"Më khãa + nhãm ¸o choµng ®Æc s¾c D-B",0},
	{634,"Nhãm më khãa D",0},
	{685,"Nhãm më khãa C",0},
	{736,"Nhãm më khãa B",0},
	{737,"Hao mßn vò khÝ gi¶m 1% ",52},
	{738,"Søc lùc+1",52},
	{739,"T¨ng giíi h¹n träng l­îng1%",52},
	{740,"ThÓ lùc",52},
	{741,"ThÓ lùc 1%",52},
	{742,"§iÓm kinh nghiÖm nhËn ®­îc t¨ng 1% ",52},
	{743,"Täa thiÒn mçi 10 gi©y håi phôc sinh lùc1",52},
	{744,"Täa thiÒn mçi 10 gi©y håi phôc néi lùc1",52},
	{745,"Täa thiÒn mçi 10 gi©y håi phôc thÓ lùc1",52},
	{746,"HiÖu qu¶ d­îc phÈm håi néi1%",52},
	{747,"yªu cÇu ®¼ng cÊp gi¶m 1",52},
	{748,"Néi c«ng nhá nhÊt trªn vò khÝ t¨ng 1",52},
	{749,"Néi c«ng lín nhÊt trªn vò khÝ t¨ng 1",52},
	{750,"Ngo¹i c«ng nhá nhÊt trªn vò khÝ t¨ng 1",52},
	{751,"Ngäai c«ng lín nhÊt trªn vò khÝ t¨ng 1",52},
	{752,"T¨ng ®iÓm sè néi c«ng",52},
	{753,"T¨ng ®iÓm sè ngo¹i c«ng",52},
	{754,"S¸t th­¬ng t¨ng 1",52},
	{755,"T¨ng s¸t th­¬ng ®éc",52},
	{756,"§éc s¸t t¨ng 1",52},
	{757,"Søc m¹nh",52},
	{758,"Th©n ph¸p",52},
	{759,"Néi c«ng ",52},
	{760,"Linh ho¹t",52},
	{761,"G©n cèt",52},
	{762,"§iÓm sè triÖt tiªu s¸t th­¬ng ngo¹i c«ng",52},
	{763,"§iÓm sè triÖt tiªu s¸t th­¬ng néi c«ng",52},
	{764,"Gi¶m ®éc s¸t 1",52},
	{765,"Thêi gian hç trî tÊn c«ng t¨ng 1% ",52},
	{766,"Thêi gian hç trî phßng thñ t¨ng 1% ",52},
	{767,"D­îc hiÖu kÐo dµi",52},
	{768,"Tiªu diÖt ®Þch nh©n kh«i phôc sinh lùc",52},
	{769,"Tiªu diÖt ®Þch nh©n kh«i phôc néi lùc",52},
	{770,"Ngo¹i c«ng t¨ng 1% ",52},
	{771,"Néi c«ng t¨ng 1% ",52},
	{772,"Tû lÖ s¸t th­¬ng tuyÖt ®èi 1%",52},
	{773,"Néi lùc ",52},
	{774,"Néi lùc %",52},
	{775,"§iÓm sinh lùc",52},
	{776,"§iÓm sè ph¶n ®ßn s¸t th­¬ng ngo¹i c«ng",52},
	{777,"§iÓm sè ph¶n ®ßn s¸t th­¬ng néi c«ng",52},
	{778,"Sinh mÖnh %",52},
	{779,"Hoµn toµn bá qua tû lÖ tiªu hao kü n¨ng1%",52},
	{780,"Tèc ®é ®¸nh t¨ng 1% ",52},
	{781,"X¸c suÊt tÊn c«ng trong ph¹m vi 1% ",52},
	{782,"X¸c suÊt tÇn c«ng chÝ m¹ng 1% ",52},
	{783,"Dïng kü n¨ng kh«ng tÝnh tû lÖ gi¶n c¸ch1%",52},
	{784,"Ph¶n ®ßn s¸t th­¬ng ®éc",52},
	{785,"TØ lÖ ph¶n ®ßn s¸t th­¬ng ngo¹i th­¬ng",52},
	{786,"TØ lÖ ph¶n ®ßn s¸t th­¬ng néi th­¬ng",52},
	{787,"Nhãm ¸o Choµng ®Æc s¾c D",0},
	{800,"Nhãm ¸o Choµng ®Æc s¾c C",0},
	{813,"Nhãm ¸o Choµng ®Æc s¾c B",0},
	{814,"Kh¸ng ®éc1%",62},
	{815,"X¸c suÊt chèng chËm1%",62},
	{816,"X¸c suÊt chèng lµm chËm1%",62},
	{817,"Ph¸ phßng thñ cña ®èi ph­¬ng1%",62},
	{818,"X¸c suÊt chèng tª liÖt1%",62},
	{819,"X¸c suÊt chèng ®Þnh th©n1%",62},
	{820,"X¸c suÊt chèng ngñ mª1%",62},
	{821,"X¸c suÊt chèng ®¸nh lïi1%",62},
	{822,"X¸c suÊt chèng ®¸nh ng·1%",62},
	{823,"X¸c suÊt chèng cho¸ng1%",62},
	{824,"X¸c suÊt chèng hçn lo¹n1%",62},
	{825,"Tr¸nh mäi tr¹ng th¸i phô1%",62},
	{826,"Më khãa + nhãm giµy ®Æc tr­ng D-B",0},
	{827,"Nhãm më khãa D",0},
	{878,"Nhãm më khãa C",0},
	{929,"Nhãm më khãa B",0},
	{930,"Hao mßn vò khÝ gi¶m 1% ",53},
	{931,"Søc lùc+1",53},
	{932,"T¨ng giíi h¹n träng l­îng1%",53},
	{933,"ThÓ lùc",53},
	{934,"ThÓ lùc 1%",53},
	{935,"§iÓm kinh nghiÖm nhËn ®­îc t¨ng 1% ",53},
	{936,"Täa thiÒn mçi 10 gi©y håi phôc sinh lùc1",53},
	{937,"Täa thiÒn mçi 10 gi©y håi phôc néi lùc1",53},
	{938,"Täa thiÒn mçi 10 gi©y håi phôc thÓ lùc1",53},
	{939,"HiÖu qu¶ d­îc phÈm håi néi1%",53},
	{940,"yªu cÇu ®¼ng cÊp gi¶m 1",53},
	{941,"Néi c«ng nhá nhÊt trªn vò khÝ t¨ng 1",53},
	{942,"Néi c«ng lín nhÊt trªn vò khÝ t¨ng 1",53},
	{943,"Ngo¹i c«ng nhá nhÊt trªn vò khÝ t¨ng 1",53},
	{944,"Ngäai c«ng lín nhÊt trªn vò khÝ t¨ng 1",53},
	{945,"T¨ng ®iÓm sè néi c«ng",53},
	{946,"T¨ng ®iÓm sè ngo¹i c«ng",53},
	{947,"S¸t th­¬ng t¨ng 1",53},
	{948,"T¨ng s¸t th­¬ng ®éc",53},
	{949,"§éc s¸t t¨ng 1",53},
	{950,"Søc m¹nh",53},
	{951,"Th©n ph¸p",53},
	{952,"Néi c«ng ",53},
	{953,"Linh ho¹t",53},
	{954,"G©n cèt",53},
	{955,"§iÓm sè triÖt tiªu s¸t th­¬ng ngo¹i c«ng",53},
	{956,"§iÓm sè triÖt tiªu s¸t th­¬ng néi c«ng",53},
	{957,"Gi¶m ®éc s¸t 1",53},
	{958,"Thêi gian hç trî tÊn c«ng t¨ng 1% ",53},
	{959,"Thêi gian hç trî phßng thñ t¨ng 1% ",53},
	{960,"D­îc hiÖu kÐo dµi",53},
	{961,"Tiªu diÖt ®Þch nh©n kh«i phôc sinh lùc",53},
	{962,"Tiªu diÖt ®Þch nh©n kh«i phôc néi lùc",53},
	{963,"Ngo¹i c«ng t¨ng 1% ",53},
	{964,"Néi c«ng t¨ng 1% ",53},
	{965,"Tû lÖ s¸t th­¬ng tuyÖt ®èi 1%",53},
	{966,"Néi lùc ",53},
	{967,"Néi lùc %",53},
	{968,"§iÓm sinh lùc",53},
	{969,"§iÓm sè ph¶n ®ßn s¸t th­¬ng ngo¹i c«ng",53},
	{970,"§iÓm sè ph¶n ®ßn s¸t th­¬ng néi c«ng",53},
	{971,"Sinh mÖnh %",53},
	{972,"Hoµn toµn bá qua tû lÖ tiªu hao kü n¨ng1%",53},
	{973,"Tèc ®é ®¸nh t¨ng 1% ",53},
	{974,"X¸c suÊt tÊn c«ng trong ph¹m vi 1% ",53},
	{975,"X¸c suÊt tÇn c«ng chÝ m¹ng 1% ",53},
	{976,"Dïng kü n¨ng kh«ng tÝnh tû lÖ gi¶n c¸ch1%",53},
	{977,"Ph¶n ®ßn s¸t th­¬ng ®éc",53},
	{978,"TØ lÖ ph¶n ®ßn s¸t th­¬ng ngo¹i th­¬ng",53},
	{979,"TØ lÖ ph¶n ®ßn s¸t th­¬ng néi th­¬ng",53},
	{980,"Nhãm giµy ®Æc tr­ng D",0},
	{991,"Nhãm giµy ®Æc tr­ng C",0},
	{1002,"Nhãm giµy ®Æc tr­ng B",0},
	{1003,"T¨ng tèc ®é lªn ngùa",63},
	{1004,"Tèc ®é di chuyÓn ",63},
	{1005,"T¨ng tØ lÖ tèc ®é thu håi vµ triÖu håi",63},
	{1006,"Rót ng¾n thêi gian tª liÖt %",63},
	{1007,"Rót ng¾n thêi gian cho¸ng %",63},
	{1008,"Rót ng¾n thêi gian ®Þnh th©n %",63},
	{1009,"Rót ng¾n thêi gian lo¹n %",63},
	{1010,"Rót ng¾n thêi gian ngñ %",63},
	{1011,"Rót ng¾n thêi gian lµm chËm %",63},
	{1012,"Rót ng¾n thêi gian gi¶m tèc %",63},

}

function getKXNormalAttr()
	local tbSay = {
		"Huy ch­¬ng/#showListKXAttr(1)",
		"¸o choµng/#showListKXAttr(2)",
		"ChiÕn hµi/#showListKXAttr(3)",
		"Hñy/nothing",
	}
	Say("",getn(tbSay),tbSay)
end;

function showListKXAttr(nPos,nLine)
	if nLine == nil or nLine == 0 then nLine = 1 end
	local tbSay = {}
	-- print(nLine);
	local nLineSend = 0;
	if nLine > 4 then 
		nLineSend = floor(nLine / 10);
	else
		nLineSend = nLine;
	end
	for i=1,getn(tbAttributes) do 
		if tbAttributes[i][3] == nLine then
			tinsert(tbSay,format("Thuéc tÝnh %s/#chooseAttr(%d,%d,%d)",tbAttributes[i][2],nPos,nLineSend,tbAttributes[i][1]))
		end
	end
	print("getn(tbSay)",getn(tbSay))
	tinsert(tbSay,"Tho¸t/nothing")
	Say(format("Chän thuéc tÝnh %d",nLine),getn(tbSay),tbSay);
end;

tbChoosenAttr = {}

function chooseAttr(nPos,nLine,nAttr)
	tbChoosenAttr[nLine] = nAttr;
	local nLineSend = 0;
	if nLine < 4 then 
		nLineSend = nLine + 1;
	else
		nLineSend = (nLine+1) * 10 + nPos;
	end
	-- print("nLine,nLineSend",nLine,nLineSend)
	if nLine < 6 then 
		showListKXAttr(nPos,nLineSend)
	else
		addKXAttrFinal(nPos)
	end
end;

function addKXAttrFinal(nPos)
	local tPos = {
		[1] = 153,
		[2] = 152,
		[3] = 154,
	}
	local nResult,nItemIndex	=AddItem(0,tPos[nPos],9,1,1,-1,-1,-1,-1,-1,-1,0,15)
	local t = tbChoosenAttr;
	-- local nIndex5 = 50 + nPos;
	-- local nIndex6 = 60 + nPos;
	SetItemFeedUpAttrs(nItemIndex,t[1],t[2],t[3],t[4],t[5],t[6])
	FeedItem(nItemIndex,1000000)
end;

function addKXAttr(nAttr)
	local nLevel  = 10;
	
	local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(pIndex,nAttr,nAttr,nAttr,nAttr,nAttr,nAttr)
	FeedItem(pIndex,1000000)
	local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(pIndex,nAttr,nAttr,nAttr,nAttr,nAttr,nAttr)
	FeedItem(hIndex,1000000)
	local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
	SetItemFeedUpAttrs(pIndex,nAttr,nAttr,nAttr,nAttr,nAttr,nAttr)
	FeedItem(xIndex,1000000)
end;

function getKX3()
	AddItem(2,1,30544,3);
	AddItem(2,1,30599,3);
end;

function getKX4()
	AddItem(2,1,31231,3);
end;

function getRandomKX4(nSet)
	KXDH = {
		[1] = {
			[1056] = "Linh ho¹t B",
			[1057] = "Th©n ph¸p B",
		},
		[2] = {
			[1069] = "Søc m¹nh B",
			[1070] = "G©n cèt B",
			[1071] = "Néi c«ng B",
			[1072] = "Sinh lùc B",
			[1073] = "Tû lÖ sinh lùc B",
		},
		[3] = {
			[1079] = "Linh ho¹t B",
			[1080] = "Th©n ph¸p B",
		},
		[4] = {
			[1] = {
				[1092] = "Ph¶n ®ßn ngo¹i c«ng/1%B",
				[1093] = "Ph¶n ®ßn néi c«ng/1%B",
				[1094] = "T¨ng s¸t th­¬ng/1B",
				[1095] = "KÌm theo ®éc s¸t/1B",
				[1096] = "T¨ng s¸t th­¬ng cæ ®éc/1B",
			},
			[2] = {
				[1108] = "Ph¶n ®ßn ngo¹i c«ng/1%B",
				[1109] = "Ph¶n ®ßn néi c«ng/1%B",
				[1110] = "T¨ng s¸t th­¬ng/1B",
				[1111] = "KÌm theo ®éc s¸t/1B",
				[1112] = "T¨ng s¸t th­¬ng cæ ®éc/1B",
			},
			[3] = {
				[1123] = "T¨ng tèc ®é xuÊt chiªu/1%B",
				[1124] = "Kh¸ng tÊt c¶ B",
				[1125] = "T¨ng chÝ mÖnh/1%B",
			}
		}
	}
	
	KXTH = {
		[1] = {
			[1129] = "Søc m¹nh B",
		},
		[2] = {
			[1143] = "Linh ho¹t B",
			[1144] = "Th©n ph¸p B",
			[1145] = "G©n cèt B",
			[1146] = "Néi c«ng B",
			[1147] = "Sinh lùc B",
			[1148] = "Tû lÖ sinh lùc B",
		},
		[3] = {
			[1156] = "Søc m¹nh B",
			[1157] = "G©n cèt B",
			[1158] = "Sinh lùc %B",
		},
		[4] = {
			[1] = {
				[1168] = "Ph¶n ®ßn ngo¹i c«ng/1B",
				[1169] = "Ph¶n ®ßn néi c«ng/1B",
				[1170] = "T¨ng ngo¹i c«ng/1%B",
				[1171] = "Tæng c«ng kÝch ngo¹i c«ng/1B",
			},
			[2] = {
				[1181] = "Ph¶n ®ßn ngo¹i c«ng/1B",
				[1182] = "Ph¶n ®ßn néi c«ng/1B",
				[1183] = "T¨ng ngo¹i c«ng/1%B",
				[1184] = "Tæng c«ng kÝch ngo¹i c«ng/1B",
			},
			[3] = {
				[1194] = "Tèc ®é di chuyÓn/1%B",
				[1195] = "T¨ng tèc ®é xuÊt chiªu/1%B",
				[1196] = "Hót sinh lùc B",
				[1197] = "Gi¶m thä th­¬ng/1%B",
			}
		}
	}
	
	KXVD = {
		[1] = {
			[1201] = "Néi c«ng B",
		},
		[2] = {
			[1213] = "Linh ho¹t B",
			[1214] = "Th©n ph¸p B",
			[1215] = "G©n cèt B",
			[1216] = "Sinh lùc B",
			[1217] = "Tû lÖ sinh lùc B",
		},
		[3] = {
			[1225] = "Linh ho¹t B",
			[1226] = "Th©n ph¸p B",
			[1227] = "Néi c«ng B",
		},
		[4] = {
			[1] = {
				[1237] = "T¨ng néi c«ng/1%B",
				[1238] = "Tæng c«ng kÝch néi c«ng/1B",
				[1239] = "Néi c«ng lín nhÊt trªn vò khÝ t¨ng/1B",
				[1240] = "Néi c«ng nhá nhÊt trªn vò khÝ t¨ng/1B",
			},
			[2] = {
				[1250] = "T¨ng néi c«ng/1%B",
				[1251] = "Tæng c«ng kÝch néi c«ng/1B",
				[1252] = "Néi c«ng lín nhÊt trªn vò khÝ t¨ng/1B",
				[1253] = "Néi c«ng nhá nhÊt trªn vò khÝ t¨ng/1B",
			},
			[3] = {
				[1263] = "Tèc ®é di chuyÓn/1%B",
				[1264] = "T¨ng tèc ®é xuÊt chiªu/1%B",
				[1265] = "Gi¶m thä th­¬ng/1%B",
				[1266] = "T¨ng chÝ mÖnh/1%B",
			}
		}
	}
	
	local tSet = {};
	if nSet == 26 then tSet = KXDH
	elseif nSet == 27 then tSet = KXTH
	elseif nSet == 28 then tSet = KXVD end;
	
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end;

function getRandomKX5(nSet)
	KXHC = {
		[1] = {
			[1955] = "Linh ho¹t - Vµng",
			[1956] = "Th©n ph¸p - Vµng",
		},
		[2] = {
			[1973] = "Néi c«ng - Vµng",
			[1974] = "Søc m¹nh - Vµng",
			[1975] = "C¨n cèt - Vµng",
			[1976] = "T¨ng ®iÓm sinh lùc - Vµng",
			[1977] = "T¨ng tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[3] = {
			[1997] = "B¹o kÝch - Vµng",
			[1999] = "T¨ng ®iÓm sè ngo¹i c«ng - Vµng",
			[2000] = "T¨ng ®iÓm sè néi c«ng - Vµng",
			[2001] = "T¨ng ®iÓm sè néi ngo¹i - Vµng",
			[2002] = "Toµn thuéc tÝnh - Vµng",
		},
		[4] = {
			[2022] = "Phßng béc - Vµng",
			[2023] = "Gi¶m béc - Vµng",
			[2024] = "Hé gi¸p ngo¹i phßng - Vµng",
			[2025] = "Hé gi¸p néi phßng - Vµng",
			[2026] = "Hé gi¸p néi ngo¹i phßng - Vµng",
			[2027] = "§iÓm sinh lùc - Vµng",
		},
		[5] = {
			[2035] = "Linh ho¹t - Vµng",
			[2036] = "Th©n ph¸p - Vµng",
		},
		[6] = {
			[1] = {
				[2055] = "T¨ng s¸t th­¬ng - Vµng",
				[2056] = "C«ng kÝch kÌm ®éc - Vµng",
				[2057] = "S¸t th­¬ng ®éc trïng - Vµng",
			},
			[2] = {
				[2074] = "Tèc ®é ch¹y - Vµng",
				[2075] = "Ph¸t huy Vâ c«ng - Vµng",
				[2076] = "Gi¶m nöa chÞu th­¬ng - Vµng",
				[2077] = "X¸c suÊt chuÈn x¸c - Vµng",
				[2078] = "Toµn thuéc tÝnh - Vµng",
			}
		}
	}
	
	KXQP = {
		[1] = {
			[2086] = "Søc m¹nh - Vµng",
			[2087] = "C¨n cèt - Vµng",
		},
		[2] = {
			[2104] = "Néi c«ng - Vµng",
			[2105] = "Th©n ph¸p - Vµng",
			[2106] = "Linh ho¹t - Vµng",
			[2107] = "§iÓm sinh lùc - Vµng",
			[2108] = "Tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[3] = {
			[2128] = "B¹o kÝch - Vµng",
			[2130] = "§iÓm ngo¹i c«ng - Vµng",
			[2131] = "§iÓm néi c«ng - Vµng",
			[2132] = "§iÓm néi ngo¹i c«ng - Vµng",
			[2133] = "T¨ng ®iÓm sinh lùc - Vµng",
		},
		[4] = {
			[2153] = "Phßng béc - Vµng",
			[2154] = "Gi¶m béc - Vµng",
			[2155] = "Hé gi¸p ngo¹i phßng - Vµng",
			[2156] = "Hé gi¸p néi phßng - Vµng",
			[2157] = "Hé gi¸p néi ngo¹i phßng - Vµng",
			[2158] = "§iÓm sinh lùc - Vµng",
		},
		[5] = {
			[2169] = "Søc m¹nh - Vµng",
			[2170] = "C¨n cèt - Vµng",
			[2171] = "T¨ng tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[6] = {
			[1] = {
				[2193] = "Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ - vµng ",
				[2194] = "Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ - Vµng",
				[2195] = "Tû lÖ ngo¹i c«ng - Vµng",
				[2196] = "§iÓm tæng c«ng kÝch ngo¹i c«ng - Vµng",
			},
			[2] = {
				[2213] = "Tèc ®é ch¹y - Vµng",
				[2214] = "Ph¸t huy Vâ c«ng - Vµng",
				[2215] = "Gi¶m nöa chÞu th­¬ng - Vµng",
				[2216] = "X¸c suÊt chuÈn x¸c - Vµng",
			}
		}
	}
	
	KXDV = {
		[1] = {
			[2225] = "Néi c«ng - Vµng",
			[2226] = "C¨n cèt - Vµng",
		},
		[2] = {
			[2243] = "Søc m¹nh - Vµng",
			[2244] = "Th©n ph¸p - Vµng",
			[2245] = "Linh ho¹t - Vµng",
			[2246] = "§iÓm sinh lùc - Vµng",
			[2247] = "Tû lÖ ®iÓm sinh lùc - Vµng",
		},
		[3] = {
			[2267] = "B¹o kÝch - Vµng",
			[2269] = "§iÓm ngo¹i c«ng - Vµng",
			[2270] = "§iÓm néi c«ng - Vµng",
			[2271] = "§iÓm néi ngo¹i c«ng - Vµng",
			[2272] = "T¨ng ®iÓm sinh lùc - Vµng",
		},
		[4] = {
			[2292] = "Phßng béc - Vµng",
			[2293] = "Gi¶m béc - Vµng",
			[2294] = "Hé gi¸p ngo¹i phßng - Vµng",
			[2295] = "Hé gi¸p néi phßng - Vµng",
			[2296] = "Hé gi¸p néi ngo¹i phßng - Vµng",
			[2297] = "§iÓm sinh lùc - Vµng",
		},
		[5] = {
			[2308] = "Néi c«ng - Vµng",
			[2309] = "Th©n ph¸p - Vµng",
			[2310] = "Linh ho¹t - Vµng",
		},
		[6] = {
			[1] = {
				[2332] = "Giíi h¹n cao nhÊt néi c«ng vò khÝ - Vµng",
				[2333] = "Giíi h¹n thÊp nhÊt néi c«ng vò khÝ - Vµng",
				[2334] = "Tû lÖ néi c«ng-vµng",
				[2335] = "§iÓm tæng c«ng kÝch néi c«ng- vµng",
			},
			[2] = {
				[2352] = "Tèc ®é ch¹y - Vµng",
				[2353] = "Ph¸t huy Vâ c«ng - Vµng",
				[2354] = "Gi¶m nöa chÞu th­¬ng - Vµng",
				[2355] = "X¸c suÊt chuÈn x¸c - Vµng",
				[2356] = "Rót ng¾n ®éng t¸c bÞ th­¬ng- Vµng",
			}
		}
	}

	local tSet = {};
	if nSet == 29 then tSet = KXHC
	elseif nSet == 30 then tSet = KXQP
	elseif nSet == 31 then tSet = KXDV end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;

end;

function getRandomKX6(nSet)
	KXDG = {
		[1] = {
			[2618] = {"Søc m¹nh"},
			[2619] = {"G©n cèt"},
		},
		[2] = {
			[2631] = {"Néi c«ng"},
			[2632] = {"Th©n ph¸p"},
			[2633] = {"Linh ho¹t"},
			[2634] = {"§iÓm sinh lùc"},
			[2635] = {"Tû lÖ ®iÓm sinh lùc"},
		},
		[3] = {
			[2647] = {"B¹o kÝch"},
			[2648] = {"§iÓm ngo¹i c«ng"},
			[2649] = {"§iÓm néi c«ng"},
			[2650] = {"§iÓm néi ngo¹i c«ng"},
			[2651] = {"T¨ng ®iÓm sinh lùc"},
		},
		[4] = {
			[2665] = {"Phßng béc"},
			[2666] = {"Gi¶m béc"},
			[2667] = {"Hé gi¸p ngo¹i phßng"},
			[2668] = {"Hé gi¸p néi phßng"},
			[2669] = {"Hé gi¸p néi ngo¹i phßng"},
			[2670] = {"§iÓm sinh lùc"},
		},
		[5] =  {
			[2678] = {"Søc m¹nh"},
			[2679] = {"G©n cèt"},
			[2680] = {"T¨ng tû lÖ ®iÓm sinh lùc"},
		},
		[6] = {
			[1] = { -- ¸o choµng vµ huy ch­¬ng
				[2690] = {"Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ"},
				[2691] = {"Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ"},
				[2692] = {"Tû lÖ ngo¹i c«ng"},
				[2693] = {"§iÓm tæng c«ng kÝch ngo¹i c«ng"},
			},
			[2] = { -- Giµy (154)
				[2703] = {"Tèc ®é ch¹y"},
				[2704] = {"Ph¸t huy vâ c«ng"},
				[2705] = {"Gi¶m nöa thä th­¬ng"},
				[2706] = {"X¸c suÊt chuÈn x¸c"},
			}
		}
	}
	
	KXHL = {
		[1] = {
			[2514] = {"Linh ho¹t"},
			[2515] = {"Th©n Ph¸p"},
		},
		[2] = {
			[2527] = {"Néi c«ng"},
			[2528] = {"Søc m¹nh"},
			[2529] = {"G©n cèt"},
			[2530] = {"§iÓm sinh lùc"},
			[2531] = {"Tû lÖ ®iÓm sinh lùc"},
		},
		[3] = {
			[2543] = {"B¹o kÝch"},
			[2544] = {"§iÓm ngo¹i c«ng"},
			[2545] = {"§iÓm néi c«ng"},
			[2546] = {"§iÓm néi ngo¹i c«ng"},
			[2547] = {"T¨ng ®iÓm sinh lùc"},
		},
		[4] = {
			[2561] = {"Phßng béc"},
			[2562] = {"Gi¶m béc"},
			[2563] = {"Hé gi¸p ngo¹i phßng"},
			[2564] = {"Hé gi¸p néi phßng"},
			[2565] = {"Hé gi¸p néi ngo¹i phßng"},
			[2566] = {"§iÓm sinh mÖnh"},
		},
		[5] = {
			[2572] = {"Linh ho¹t"},
			[2573] = {"Th©n ph¸p"},
		},
		[6] = {
			[1] = {
				[2583] = {"T¨ng s¸t th­¬ng"},
				[2584] = {"C«ng kÝch kÌm ®éc"},
				[2585] = {"S¸t th­¬ng ®éc trïng"},
				[2586] = {"Tû lÖ kh¸ng tr¹ng th¸i bÊt th­êng"},
			},
			[2] = {
				[2608] = {"Tèc ®é ch¹y"},
				[2609] = {"Ph¸t huy Vâ c«ng"},
				[2610] = {"Gi¶m nöa chÞu th­¬ng"},
				[2611] = {"X¸c suÊt chuÈn x¸c"},
				[2612] = {"Toµn thuéc tÝnh"},
			}
		}
	}
	
	KXKP = {
		[1] = {
			[2712] = {"Néi c«ng"},
			[2713] = {"G©n cèt"},
		},
		[2] = {
			[2725] = {"Søc m¹nh"},
			[2726] = {"Th©n ph¸p"},
			[2727] = {"Linh ho¹t"},
			[2728] = {"§iÓm sinh lùc"},
			[2729] =  {"Tû lÖ ®iÓm sinh lùc"},
		},
		[3] = {
			[2741] = {"B¹o kÝch"},
			[2742] = {"§iÓm ngo¹i c«ng"},
			[2743] = {"§iÓm néi c«ng"},
			[2744] = {"§iÓm néi ngo¹i c«ng"},
			[2745] = {"T¨ng ®iÓm sinh lùc"},
		},
		[4] = {
			[2759] = {"Phßng béc"},
			[2760] = {"Gi¶m béc"},
			[2761] = {"Hé gi¸p ngo¹i phßng"},
			[2762] = {"Hé gi¸p néi phßng"},
			[2763] = {"Hé gi¸p néi ngo¹i phßng"},
			[2764] = {"§iÓm sinh lùc"},
		},
		[5] = {
			[2772] = {"Néi c«ng"},
			[2773] = {"Th©n ph¸p"},
			[2774] = {"Linh ho¹t"},
		},
		[6] = {
			[1] = {
				[2784] = {"Giíi h¹n cao nhÊt néi c«ng vò khÝ"},
				[2785] = {"Giíi h¹n thÊp nhÊt néi c«ng vò khÝ"},
				[2786] = {"T¨ng néi c«ng"},
				[2787] = {"§iÓm c«ng kÝch néi c«ng"},
			},
			[2] = {
				[2803] = {"Rót ng¾n thêi gian thä th­¬ng"},
				[2799] = {"Tèc ®é ch¹y"},
				[2800] = {"Ph¸t huy vâ c«ng"},
				[2801] = {"Gi¶m nöa thä th­¬ng"},
				[2802] = {"X¸c suÊt chuÈn x¸c"},
			}
		}
	}

	local tSet = {};
	if nSet == 32 then tSet = KXHL
	elseif nSet == 33 then tSet = KXDG
	elseif nSet == 34 then tSet = KXKP end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end


function getRandomKX7(nSet)
	
	KXSL = {
		[1] = {
			[3388]="Linh ho¹t",
			[3389]="Th©n ph¸p",
		},
		[2] = {
			[3401] = "Néi c«ng",
			[3402] = "Søc m¹nh",
			[3403] = "C¨n cèt",
			[3404] = "T¨ng ®iÓm sinh lùc",
			[3405] = "T¨ng tû lÖ ®iÓm sinh lùc",
		},
		[3] = {
			[3417] = "B¹o kÝch",
			[3418] = "T¨ng ®iÓm sè ngo¹i c«ng",
			[3419] = "T¨ng ®iÓm sè néi c«ng",
			[3420] = "T¨ng ®iÓm sè néi ngo¹i",
			[3421] = "Toµn thuéc tÝnh",
		},
		[4] = {
			[3435] = "Phßng béc",
			[3436] = "Gi¶m béc",
			[3437] = "Hé gi¸p ngo¹i phßng",
			[3438] = "Hé gi¸p néi phßng",
			[3439] = "Hé gi¸p néi ngo¹i phßng",
			[3440] = "§iÓm sinh lùc",
		},
		[5] = {
			[3446] = "Linh ho¹t",
			[3447] = "Th©n ph¸p",
		},
		[6] = {
			[1] = {
				[3457] = "T¨ng s¸t th­¬ng",
				[3458] = "C«ng kÝch kÌm ®éc",
				[3459] = "S¸t th­¬ng ®éc trïng",
			},
			[2] = {
				[3468] = "T¨ng s¸t th­¬ng",
				[3469] = "C«ng kÝch kÌm ®éc",
				[3470] = "S¸t th­¬ng ®éc trïng",
			},
			[3] = {
				[3482] = "Tèc ®é ch¹y",
				[3483] = "Ph¸t huy Vâ c«ng",
				[3484] = "Gi¶m nöa chÞu th­¬ng",
				[3485] = "X¸c suÊt chuÈn x¸c",
				[3486] = "Toµn thuéc tÝnh",
			}
		}
	}

	KXNN = {
		[1] = {
			[3492] = "Søc m¹nh",
			[3493] = "C¨n cèt",
		},
		[2] = {
			[3505] = "Néi c«ng",
			[3506] = "Th©n ph¸p",
			[3507] = "Linh ho¹t",
			[3508] = "§iÓm sinh lùc",
			[3509] = "Tû lÖ ®iÓm sinh lùc",
		},
		[3] = {
			[3521] = "B¹o kÝch",
			[3522] = "§iÓm ngo¹i c«ng",
			[3523] = "§iÓm néi c«ng",
			[3524] = "§iÓm néi ngo¹i c«ng",
			[3525] = "T¨ng ®iÓm sinh lùc",
		},
		[4] = {
			[3539] = "Phßng béc",
			[3540] = "Gi¶m béc",
			[3541] = "Hé gi¸p ngo¹i phßng",
			[3542] = "Hé gi¸p néi phßng",
			[3543] = "Hé gi¸p néi ngo¹i phßng",
			[3544] = "§iÓm sinh lùc",
		},
		[5] = {
			[3552] = "Søc m¹nh",
			[3553] = "C¨n cèt",
			[3554] = "T¨ng tû lÖ ®iÓm sinh lùc",
		},
		[6] = {
			[1] = {
				[3564] = "Giíi h¹n cao nhÊt ngo¹i c«ng vò khÝ ",
				[3565] = "Giíi h¹n thÊp nhÊt ngo¹i c«ng vò khÝ",
				[3566] = "Tû lÖ ngo¹i c«ng",
				[3567] = "§iÓm tæng c«ng kÝch ngo¹i c«ng",
			},
			[2] = {
				[3577] = "Tèc ®é ch¹y",
				[3578] = "Ph¸t huy Vâ c«ng",
				[3579] = "Gi¶m nöa chÞu th­¬ng",
				[3580] = "X¸c suÊt chuÈn x¸c",
			}
		}
	}
			
	KXMS = {
		[1] = {
			[3586] = "Néi c«ng",
			[3587] = "C¨n cèt",
		},
		[2] = {
			[3599] = "Søc m¹nh",
			[3600] = "Th©n ph¸p",
			[3601] = "Linh ho¹t",
			[3602] = "§iÓm sinh lùc",
			[3603] = "Tû lÖ ®iÓm sinh lùc",
		},
		[3] = {
			[3615] = "B¹o kÝch",
			[3616] = "§iÓm ngo¹i c«ng",
			[3617] = "§iÓm néi c«ng",
			[3618] = "§iÓm néi ngo¹i c«ng",
			[3619] = "T¨ng ®iÓm sinh lùc",
		},
		[4] = {
			[3633] = "Phßng béc",
			[3634] = "Gi¶m béc",
			[3635] = "Hé gi¸p ngo¹i phßng",
			[3636] = "Hé gi¸p néi phßng",
			[3637] = "Hé gi¸p néi ngo¹i phßng",
			[3638] = "§iÓm sinh lùc",
		},
		[5] = {
			[3646] = "Néi c«ng",
			[3647] = "Th©n ph¸p",
			[3648] = "Linh ho¹t",
		},
		[6] = {
			[1] = {
				[3658] = "Giíi h¹n cao nhÊt néi c«ng vò khÝ",
				[3659] = "Giíi h¹n thÊp nhÊt néi c«ng vò khÝ",
				[3660] = "Tû lÖ néi c«ng-vµng",
				[3661] = "§iÓm tæng c«ng kÝch néi c«ng- vµng",
			},
			[2] = {
				[3673] = "Tèc ®é ch¹y",
				[3674] = "Ph¸t huy Vâ c«ng",
				[3675] = "Gi¶m nöa chÞu th­¬ng",
				[3676] = "X¸c suÊt chuÈn x¸c",
				[3677] = "Rót ng¾n ®éng t¸c bÞ th­¬ng- Vµng",
			}
		}
	}
	local tSet = {};
	if nSet == 35 then tSet = KXSL
	elseif nSet == 36 then tSet = KXNN
	elseif nSet == 37 then tSet = KXMS end;
	if addSetofKX(tSet, nSet) == 1 then 
		Msg2Player("NhËn kim xµ thµnh c«ng!");
	end;
end;



function showKX7()
	tSay = {
		"S¸t Lang/#getRandomKX7(35)",
		"NhuÖ Nha/#getRandomKX7(36)",
		"Méng S¸t/#getRandomKX7(37)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function showKX6()
	tSay = {
		"Hoan L¨ng/#getRandomKX6(32)",
		"§»ng Giao/#getRandomKX6(33)",
		"Khëi Ph­îng/#getRandomKX6(34)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function showKX5()
	tSay = {
		"HiÖp cèt/#getRandomKX5(29)",
		"Quû phï/#getRandomKX5(30)",
		"§»ng v©n/#getRandomKX5(31)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;


function showKX4()
	tSay = {
		"Du hiÖp/#getRandomKX4(26)",
		"ThiÕt huyÕt/#getRandomKX4(27)",
		"V©n du/#getRandomKX4(28)",
	}
	tinsert(tSay,"Ch­a muèn nhËn/nothing");
	Say("Chän lo¹i kim xµ",getn(tSay),tSay);
end;

function addSetofKX(tSet, nSet)
	local r1,r2,r3,r4,r5,r6;
	-- Add Phi phong
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,1);
	AddKX(152,nSet,r1,r2,r3,r4,r5,r6);
	-- Add Huy ch­¬ng
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,2);
	AddKX(153,nSet,r1,r2,r3,r4,r5,r6);
	-- Add ChiÕn hµi
	r1,r2,r3,r4,r5,r6 = getIndexs(tSet,3);
	AddKX(154,nSet,r1,r2,r3,r4,r5,r6);
	return 1;
end

function getIndexs(tList,nPos)
	local tSubList = {}
	local nListLen = getn(tList);
	
	if nPos == 1 then
		tSubList = tList[nListLen][1];
	elseif nPos == 2 then
		if getn(tList[nListLen]) == 3 then
			tSubList = tList[nListLen][2];
		else
			tSubList = tList[nListLen][1];
		end
	elseif nPos == 3 then
		if getn(tList[nListLen]) == 3 then 
			tSubList = tList[nListLen][3];
		else
			tSubList = tList[nListLen][2];
		end
	end
	
	local r1,r2,r3,r4,r5,r6;
	if nListLen == 6 then 			
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tList[4]);
		r5 = getRandomIndex(tList[5]);
		r6 = getRandomIndex(tSubList);
		-- print(r1,r2,r3,r4,r5,r6);
	elseif nListLen == 4 then 
		r1 = getRandomIndex(tList[1]);
		r2 = getRandomIndex(tList[2]);
		r3 = getRandomIndex(tList[3]);
		r4 = getRandomIndex(tSubList);
	end
		
	return r1,r2,r3,r4,r5,r6;
end;

function getRandomIndex(tList)
	local nIndexResult = -1;
	if tList == nil then 
		return 0
	end
	local nRandNum = random(tlen(tList));
	local i = 0;
	for k,v in tList do 
		i = i+1;
		if i == nRandNum then
			nIndexResult = k;
			break
		end
	end
	return nIndexResult;
end;

function tlen(tList)
	local i = 0;
	for k,v in tList do 
		i = i+1;
	end
	return i;
end;

function AddKX(nType,nSet,ID1,ID2,ID3,ID4,ID5,ID6)
	local nResult,nItemIndex = AddItem(0,nType,nSet,1,4,-1,-1,-1,-1,-1,-1,0,15)
    FeedItem(nItemIndex,1000000)
	if ID5 ~= nil and ID6 ~= nil then 
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,ID3,ID4,ID5,ID6);
	else
		SetItemFeedUpAttrs(nItemIndex,ID1,ID2,0,ID3,0,ID4);
	end
end


function Get_JinShe()
		if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 10;
		if nRoute == 2 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,186,164,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,186,164,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,186,164,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 3 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 4 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		
		if nRoute == 6 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 8 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		

		if nRoute == 9 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 11 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 12 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,178,758,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,178,758,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,178,758,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 14 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 15 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 17 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,183,181,757,770,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,183,181,757,770,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,183,181,757,770,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 18 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 20 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,163,179,758,755,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,163,179,758,755,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,163,179,758,755,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 21 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,180,760,756,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,180,760,756,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,180,760,756,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 23 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,165,182,759,771,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,165,182,759,771,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,165,182,759,771,1004)
				FeedItem(xIndex,1000000)
		end
		
		if nRoute == 29 then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,162,178,757,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,162,178,757,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,162,178,757,754,1004)
				FeedItem(xIndex,1000000)
		end

		if nRoute == 30	then 
				local pifeng,pIndex	=AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(pIndex,188,164,178,760,754,825)
				FeedItem(pIndex,1000000)
				local huizhang,hIndex	=AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(hIndex,188,164,178,760,754,630)
				FeedItem(hIndex,1000000)
				local xie,xIndex	=AddItem(0,154,9,1,1,-1,-1,-1,-1,-1,-1,0,nLevel)
				SetItemFeedUpAttrs(xIndex,188,164,178,760,754,1004)
				FeedItem(xIndex,1000000)
		end
	
end