--ÉñÐÐ·û£ºÁ÷Ë®Îå·ÖÖÓ
Include("\\script\\lib\\string.lua");

tMaps = {
	{100,"tc"},
	{200,"bk"},
	{300,"td"},
	{150,"dc"},
	{425,"vlm"},
	{100,"Tuyen Chau"},
	{101,"Hai ngoai co dao"},
	{102,"Dao Hoa dao"},
	{103,"Dong Hai Hai Tan 1"},
	{104,"Dong Hai Hai Tan 2"},
	{105,"Tay Tuyen Chau"},
	{106,"Long Tuyen Thon"},
	{107,"Vu Di son"},
	{108,"Bac Tuyen Chau"},
	{109,"Thanh Am dong_1"},
	{110,"Thanh Am dong_2"},
	{111,"Thanh Khe dong"},
	{112,"Luong Thuy dong_1"},
	{113,"Luong Thuy dong_2"},
	{114,"Vuong Mau dong_1"},
	{115,"Vuong Mau dong_2"},
	{116,"Vuong Mau dong-3"},
	{117,"Co dao"},
	{118,"Dao Tien dong"},
	{150,"Duong Chau"},
	{151,"Van Mong Trach"},
	{152,"Minh giao"},
	{200,"Bien Kinh"},
	{201,"Nam Bien Kinh"},
	{202,"Hanh Hoa thon"},
	{203,"Tay Bien Kinh"},
	{204,"Thieu Lam"},
	{205,"Dong Bien Kinh"},
	{206,"Nhan Mon quan phe"},
	{207,"Nhi Long son"},
	{208,"Luong Son Bac"},
	{209,"Cai Bang"},
	{210,"Duong Trung dong-1"},
	{211,"Duong Trung dong-2"},
	{212,"Duong Trung dong-3"},
	{213,"Thieu Lam mat that-1"},
	{214,"Thieu Lam mat that-2"},
	{215,"Hac Phong dong"},
	{216,"Tuong Van dong"},
	{217,"Da Tru lam"},
	{218,"Linh Bao son"},
	{219,"Thien Ba Duong phu"},
	{300,"Thanh Do"},
	{301,"Tay Thanh Do"},
	{302,"Thanh Thanh son"},
	{303,"Nga My"},
	{304,"Nam Thanh Do"},
	{305,"Duong Mon"},
	{306,"Giang Tan Thon"},
	{307,"Phong Do"},
	{308,"Bac Thanh Do"},
	{309,"Kiem Cac Thuc dao"},
	{310,"Kiem Mon quan"},
	{311,"Phuc Nguu son"},
	{312,"Vo Dang"},
	{313,"Thien Su dong-1"},
	{314,"Thien Su dong-2"},
	{315,"Bang Tam dong_1"},
	{316,"Bang Tam dong_2"},
	{317,"Truc Ty dong_1"},
	{318,"Truc Ty dong-2"},
	{319,"Phong Ma dong-1"},
	{320,"Phong Ma dong-2"},
	{321,"Kim Quang dong"},
	{322,"Long Ho dong-1"},
	{323,"Long Ho dong-2"},
	{324,"That Tinh dong-1"},
	{325,"That Tinh dong-2"},
	{350,"Tuong Duong"},
	{326,"Mo Tuyet son trang"},
	{327,"O Mong Bo"},
	{328,"Quy Mon Hoi Lang"},
	{329,"Thien su bi canh"},
	{400,"Dai Ly phu"},
	{401,"Diem Thuong son"},
	{402,"Tay Song Ban Nap bac"},
	{403,"Tay Song Ban Nap nam"},
	{404,"Thuy Yen"},
	{405,"Chan nui Vu Lang"},
	{406,"Vu Lang son"},
	{407,"Ngu Doc Giao"},
	{408,"Mieu Linh"},
	{409,"Thien Tam thap_1"},
	{410,"Thien Tam thap_2"},
	{411,"Thien Tam thap_3"},
	{412,"Long Nhan dong-1"},
	{413,"Long Nhan dong-2"},
	{414,"Phung Nhan dong"},
	{415,"Phung Nhan dong-2"},
	{416,"Bach Thuy dong-1"},
	{417,"Bach Thuy dong-2"},
	{418,"Ngu Doc me cung tang 1"},
	{419,"Ngu Doc me cung 2"},
	{420,"Yen Tu dong-1"},
	{421,"Yen Tu dong-2"},
	{422,"Van Doc trai"},
	{425,"Vo Lam Minh"},
	{426,"Ngoc Dung Phong"},
	{427,"Dia Huyen Cung"},
	{428,"Ngung Nguyet Cung"},
	{429,"Suong Phong Nhai"},
	{500,"Phung Tuong phu"},
	{501,"Nam Phung Tuong"},
	{502,"Hoa Son"},
	{503,"Tan Lang"},
	{504,"Bac Phung Tuong"},
	{505,"Duoc Vuong coc"},
	{506,"Me cung sa mac"},
	{507,"Long Mon tran"},
	{508,"Quang Minh dinh"},
	{509,"Con Lon"},
	{510,"Duoc Vuong dong"},
	{511,"Co Duong dong_1"},
	{512,"Co Duong dong_2"},
	{513,"Hoang Lang mo that tang 1"},
	{514,"Hoang Lang mo that tang 2"},
	{600,"Bo lac Vuong Ky"},
	{601,"Dai Thao Nguyen 1"},
	{602,"Dai Thao Nguyen 2"},
	{603,"Nhan Mon quan ngoai"},
	{604,"Nhan Mon quan"},
	{605,"Thien Mon tran ngoai"},
	{606,"Thien Mon tran noi"},
	{607,"Thien Mon tran chinh"},
	{701,"Dai lao"},
	{702,"Thien lao"},
	{703,"ai thien lao"},
	{704,"Canh dong"},
	{705,"Mo khoang"},
	{706,"Bui cay"},
	{707,"Tham son"},
	{708,"ac nhan coc"},
	{709,"Tang Kiem son trang"},
	{710,"Hung An linh"},
	{711,"Thach Mon dong"},
	{712,"Khong Tang son"},
	{713,"Thanh Thuy thon"},
	{714,"Nam Hoe coc"},
	{715,"Hoi Tien linh"},
	{716,"Linh Nham dong"},
	{717,"Con Ngo son"},
	{718,"Doanh Dan Thon"},
	{719,"Ham U coc"},
	{720,"Thuong Long linh"},
	{721,"Huyen Tinh dong"},
	{722,"Tu Tang son"},
	{723,"Lam Nhac Thon"},
	{724,"Hien Vien coc"},
	{730,"Nha lao thanh thi 1"},
	{731,"Nha lao thanh thi 2"},
	{732,"Nha lao thanh thi 3"},
	{733,"Nha lao thanh thi 4"},
	{734,"Nha lao thanh thi 5"},
	{801,"Thong Thien Dai Loi"},
	{802,"Loi Chan Bat Phuong"},
	{803,"Cuoc diem khach san"},
	{804,"Lang Nha dong phu"},
	{805,"Son gian sach kieu"},
	{806,"Diem bao danh Ngoc Mon quan"},
	{807,"Chien truong Nhan Mon quan"},
	{808,"Diem bao danh Nhan Mon quan"},
	{809,"Chien truong Nhan Mon quan"},
	{810,"Khe luu boc bo"},
	{811,"Thien ngoai phi tien"},
	{812,"Lang Hu nhai"},
	{813,"Thien Co Lau"},
	{814,"Tang Kinh Cac"},
	{815,"Nghiet Long dong"},
	{816,"Vo Sac Trai"},
	{817,"Luyen binh truong"},
	{818,"Mo Cu Hiep"},
	{819,"Mo Cu Hiep"},
	{820,"Mo Cu Hiep"},
	{821,"Nhieu nguoi Thong thien dai loi"},
	{822,"Nhieu nguoi Loi chan bat phuong"},
	{823,"Nhieu nguoi Cuoc diem khach san"},
	{824,"Nhieu nguoi Khe luu boc bo"},
	{825,"Nhieu nguoi Thien ngoai phi tien"},
	{826,"Nhieu nguoi Son gian sach kieu"},
	{827,"To doi hon chien Thong thien dai loi"},
	{828,"To doi hon chien Loi chan bat phuong"},
	{829,"To doi Thong thien dai loi"},
	{830,"To doi Loi chan bat phuong"},
	{831,"To doi Cuoc diem khach san"},
	{832,"To doi Khe luu boc bo"},
	{833,"To doi Thien ngoai phi tien"},
	{834,"To doi Son gian sach kieu"},
	{835,"Vo Lam dai Loi dai"},
	{836,"Vo Song dai Loi dai"},
	{837,"Anh hung dai Loi dai"},
	{838,"Than binh Loi dai"},
	{839,"Loi dai Cong thanh chien"},
	{840,"Loi dai Cong thanh chien"},
	{841,"Loi dai Cong thanh chien"},
	{842,"Loi dai Cong thanh chien"},
	{851,"Yet chi tieu truc"},
	{852,"Co dao"},
	{853,"Dong phong hoa chuc"},
	{854,"Van Son dinh"},
	{855,"Yet chi tieu truc"},
	{856,"Co dao"},
	{857,"Dong phong hoa chuc"},
	{858,"Van Son dinh"},
	{881,"Chien truong Thon trang-Nhan Mon Quan"},
	{882,"Chien truong Thao coc-Nhan Mon Quan"},
	{883,"Chien truong phao dai-Nhan Mon Quan"},
	{884,"Chien truong chinh-Nhan Mon Quan"},
	{885,"Sat Thu duong phan da"},
	{886,"Tuyen Chau Cong thanh chien"},
	{887,"Thanh Do Cong thanh chien"},
	{888,"Tuong Duong Cong thanh chien"},
	{889,"Hoi Phong trai"},
	{900,"Chien truong Ngoc Mon quan"},
	{901,"Son mon"},
	{902,"Dai vien"},
	{903,"Hau hoa vien"},
	{904,"Lien Hoan Sao"},
	{905,"Tang Kiem cac"},
	{908,"Tu Truc lam"},
	{909,"Kiem Chung"},
	{911,"Son mon"},
	{912,"Dai vien"},
	{913,"Hau hoa vien"},
	{914,"Lien Hoan Sao"},
	{915,"Tang Kiem cac"},
	{918,"Tu Truc lam"},
	{919,"Kiem Chung"},
	{920,"Tu Quang Cac"},
	{921,"Tu Quang Cac"},
	{922,"Tu Quang Cac"},
	{923,"Tu Quang Cac"},
	{924,"Tu Quang Cac"},
	{925,"Tu Quang Cac"},
	{926,"Tu Quang Cac"},
	{927,"Tu Quang Cac"},
	{928,"Tu Quang Cac"},
	{929,"Tu Quang Cac"},
	{930,"Tu Quang Cac"},
	{931,"Tu Quang Cac"},
	{932,"Tu Quang Cac"},
	{933,"Tu Quang Cac"},
	{934,"Tu Quang Cac"},
	{935,"Tu Quang Cac"},
	{936,"Tu Quang Cac"},
	{937,"Tu Quang Cac"},
	{938,"Tu Quang Cac"},
	{939,"Tu Quang Cac"},
	{940,"Tu Quang Cac"},
	{941,"Tu Quang Cac"},
	{942,"Tu Quang Cac"},
	{943,"Tu Quang Cac"},
	{944,"Tu Quang Cac"},
	{945,"Tu Quang Cac"},
	{946,"Tu Quang Cac"},
	{947,"Tu Quang Cac"},
	{948,"Tu Quang Cac"},
	{949,"Tu Quang Cac"},
	{951,"Diem Oa Khau do bo 1"},
	{952,"Diem Oa Khau do bo 2"},
	{953,"Diem Oa Khau do bo 3"},
	{954,"Diem Oa Khau do bo 4"},
	{955,"Diem Oa Khau do bo 5"},
	{956,"Diem Oa Khau do bo 6"},
	{957,"Diem Oa Khau do bo 7"},
	{958,"Diem Oa Khau do bo 8"},
	{959,"Diem Oa Khau do bo 9"},
	{960,"Diem Oa Khau do bo 10"},
	{961,"Khu vuc nem tuyet 1"},
	{962,"Khu vuc nem tuyet 2"},
	{963,"Khu vuc nem tuyet 3"},
	{964,"Khu vuc nem tuyet 4"},
	{965,"Khu vuc nem tuyet 5"},
	{966,"Ngan ha"},
	{967,"Ngan ha"},
	{968,"Ngan ha"},
	{969,"Hoa Son"},
	{971,"Ty vo loi dai"},
	{972,"Ty vo loi dai"},
	{973,"Ty vo loi dai"},
	{974,"Ben ngoai Dai hoi ty vo"},
	{975,"Ben ngoai Dai hoi ty vo"},
	{976,"Ben ngoai Dai hoi ty vo"},
	{977,"Diem dang dai"},
	{1010,"Thai Hu Huyen Canh"},
	{1011,"Son mon"},
	{1012,"Dai vien"},
	{1013,"Hau hoa vien"},
	{1014,"Lien Hoan Sao"},
	{1015,"Tang Kiem cac"},
	{1018,"Tu Truc lam"},
	{1019,"Kiem Chung"},
	{1021,"Son mon"},
	{1022,"Dai vien"},
	{1023,"Hau hoa vien"},
	{1024,"Lien Hoan Sao"},
	{1025,"Tang Kiem cac"},
	{1028,"Tu Truc lam"},
	{1029,"Kiem Chung"},
	{1031,"Son mon"},
	{1032,"Dai vien"},
	{1033,"Hau hoa vien"},
	{1034,"Lien Hoan Sao"},
	{1035,"Tang Kiem cac"},
	{1038,"Tu Truc lam"},
	{1039,"Kiem Chung"},
	{1041,"Son mon"},
	{1042,"Dai vien"},
	{1043,"Hau hoa vien"},
	{1044,"Lien Hoan Sao"},
	{1045,"Tang Kiem cac"},
	{1048,"Tu Truc lam"},
	{1049,"Kiem Chung"},
	{1051,"Son mon"},
	{1052,"Dai vien"},
	{1053,"Hau hoa vien"},
	{1054,"Lien Hoan Sao"},
	{1055,"Tang Kiem cac"},
	{1058,"Tu Truc lam"},
	{1059,"Kiem Chung"},
	{1070,"Dau thuyen rong"},
	{1071,"Dau thuyen rong"},
	{1072,"Dau thuyen rong"},
	{1073,"Dau thuyen rong"},
	{1074,"Dau thuyen rong"},
	{1075,"Dau thuyen rong"},
	{1076,"Dau thuyen rong"},
	{1077,"Dau thuyen rong"},
	{1100,"Co Duong Mat dong"},
	{1101,"Hoang Lang Mat dao"},
	{1102,"Hoang Lang mat that"},
	{1103,"Luyen don dong"},
	{1104,"Ngu hanh tran"},
	{1105,"Cuoi Sa mac"},
	{1106,"Quan tro Long mon"},
	{1200,"Co Duong Mat dong"},
	{1201,"Hoang Lang Mat dao"},
	{1202,"Hoang Lang mat that"},
	{1203,"Luyen don dong"},
	{1204,"Ngu hanh tran"},
	{1205,"Cuoi Sa mac"},
	{1206,"Quan tro Long mon"},
	{1300,"Co Duong Mat dong"},
	{1301,"Hoang Lang Mat dao"},
	{1302,"Hoang Lang mat that"},
	{1303,"Luyen don dong"},
	{1304,"Ngu hanh tran"},
	{1305,"Cuoi Sa mac"},
	{1306,"Quan tro Long mon"},
	{1400,"Co Duong Mat dong"},
	{1401,"Hoang Lang Mat dao"},
	{1402,"Hoang Lang mat that"},
	{1403,"Luyen don dong"},
	{1404,"Ngu hanh tran"},
	{1405,"Cuoi Sa mac"},
	{1406,"Quan tro Long mon"},
	{1500,"Co Duong Mat dong"},
	{1501,"Hoang Lang Mat dao"},
	{1502,"Hoang Lang mat that"},
	{1503,"Luyen don dong"},
	{1504,"Ngu hanh tran"},
	{1505,"Cuoi Sa mac"},
	{1506,"Quan tro Long mon"},
	{2010,"Thai Hu Huyen Canh"},
	{2011,"Son mon"},
	{2012,"Dai vien"},
	{2013,"Hau hoa vien"},
	{2014,"Lien Hoan Sao"},
	{2015,"Tang Kiem cac"},
	{2018,"Tu Truc lam"},
	{2019,"Kiem Chung"},
	{2021,"Son mon"},
	{2022,"Dai vien"},
	{2023,"Hau hoa vien"},
	{2024,"Lien Hoan Sao"},
	{2025,"Tang Kiem cac"},
	{2028,"Tu Truc lam"},
	{2029,"Kiem Chung"},
	{2031,"Son mon"},
	{2032,"Dai vien"},
	{2033,"Hau hoa vien"},
	{2034,"Lien Hoan Sao"},
	{2035,"Tang Kiem cac"},
	{2038,"Tu Truc lam"},
	{2039,"Kiem Chung"},
	{2041,"Son mon"},
	{2042,"Dai vien"},
	{2043,"Hau hoa vien"},
	{2044,"Lien Hoan Sao"},
	{2045,"Tang Kiem cac"},
	{2048,"Tu Truc lam"},
	{2049,"Kiem Chung"},
	{2051,"Son mon"},
	{2052,"Dai vien"},
	{2053,"Hau hoa vien"},
	{2054,"Lien Hoan Sao"},
	{2055,"Tang Kiem cac"},
	{2058,"Tu Truc lam"},
	{2059,"Kiem Chung"},
	{2070,"Dau thuyen rong"},
	{2071,"Dau thuyen rong"},
	{2072,"Dau thuyen rong"},
	{2073,"Dau thuyen rong"},
	{2074,"Dau thuyen rong"},
	{2075,"Dau thuyen rong"},
	{2076,"Dau thuyen rong"},
	{2077,"Dau thuyen rong"},
	{3010,"Thai Hu Huyen Canh"},
	{3011,"Son mon"},
	{3012,"Dai vien"},
	{3013,"Hau hoa vien"},
	{3014,"Lien Hoan Sao"},
	{3015,"Tang Kiem cac"},
	{3018,"Tu Truc lam"},
	{3019,"Kiem Chung"},
	{3021,"Son mon"},
	{3022,"Dai vien"},
	{3023,"Hau hoa vien"},
	{3024,"Lien Hoan Sao"},
	{3025,"Tang Kiem cac"},
	{3028,"Tu Truc lam"},
	{3029,"Kiem Chung"},
	{3031,"Son mon"},
	{3032,"Dai vien"},
	{3033,"Hau hoa vien"},
	{3034,"Lien Hoan Sao"},
	{3035,"Tang Kiem cac"},
	{3038,"Tu Truc lam"},
	{3039,"Kiem Chung"},
	{3041,"Son mon"},
	{3042,"Dai vien"},
	{3043,"Hau hoa vien"},
	{3044,"Lien Hoan Sao"},
	{3045,"Tang Kiem cac"},
	{3048,"Tu Truc lam"},
	{3049,"Kiem Chung"},
	{3051,"Son mon"},
	{3052,"Dai vien"},
	{3053,"Hau hoa vien"},
	{3054,"Lien Hoan Sao"},
	{3055,"Tang Kiem cac"},
	{3058,"Tu Truc lam"},
	{3059,"Kiem Chung"},
	{3070,"Dau thuyen rong"},
	{3071,"Dau thuyen rong"},
	{3072,"Dau thuyen rong"},
	{3073,"Dau thuyen rong"},
	{3074,"Dau thuyen rong"},
	{3075,"Dau thuyen rong"},
	{3076,"Dau thuyen rong"},
	{3077,"Dau thuyen rong"},
	{3101,"Moc nhan hang"},
	{3102,"Huyen Vu Phong"},
	{3103,"Vo Tuong Gian"},
	{3104,"Hao Tung Coc"},
	{3105,"Truc Hai"},
	{3106,"Trung Vo Hieu Truong"},
	{3107,"U Nan Quat"},
	{3108,"Thai Chan Phong"},
	{3109,"Quang Minh Thanh Dan"},
	{3110,"Hoa Hai"},
	{4010,"Thai Hu Huyen Canh"},
	{4011,"Son mon"},
	{4012,"Dai vien"},
	{4013,"Hau hoa vien"},
	{4014,"Lien Hoan Sao"},
	{4015,"Tang Kiem cac"},
	{4018,"Tu Truc lam"},
	{4019,"Kiem Chung"},
	{4021,"Son mon"},
	{4022,"Dai vien"},
	{4023,"Hau hoa vien"},
	{4024,"Lien Hoan Sao"},
	{4025,"Tang Kiem cac"},
	{4028,"Tu Truc lam"},
	{4029,"Kiem Chung"},
	{4031,"Son mon"},
	{4032,"Dai vien"},
	{4033,"Hau hoa vien"},
	{4034,"Lien Hoan Sao"},
	{4035,"Tang Kiem cac"},
	{4038,"Tu Truc lam"},
	{4039,"Kiem Chung"},
	{4041,"Son mon"},
	{4042,"Dai vien"},
	{4043,"Hau hoa vien"},
	{4044,"Lien Hoan Sao"},
	{4045,"Tang Kiem cac"},
	{4048,"Tu Truc lam"},
	{4049,"Kiem Chung"},
	{4051,"Son mon"},
	{4052,"Dai vien"},
	{4053,"Hau hoa vien"},
	{4054,"Lien Hoan Sao"},
	{4055,"Tang Kiem cac"},
	{4058,"Tu Truc lam"},
	{4059,"Kiem Chung"},
	{5010,"Thai Hu Huyen Canh"},
	{5011,"Son mon"},
	{5012,"Dai vien"},
	{5013,"Hau hoa vien"},
	{5014,"Lien Hoan Sao"},
	{5015,"Tang Kiem cac"},
	{5018,"Tu Truc lam"},
	{5019,"Kiem Chung"},
	{5021,"Son mon"},
	{5022,"Dai vien"},
	{5023,"Hau hoa vien"},
	{5024,"Lien Hoan Sao"},
	{5025,"Tang Kiem cac"},
	{5028,"Tu Truc lam"},
	{5029,"Kiem Chung"},
	{5031,"Son mon"},
	{5032,"Dai vien"},
	{5033,"Hau hoa vien"},
	{5034,"Lien Hoan Sao"},
	{5035,"Tang Kiem cac"},
	{5038,"Tu Truc lam"},
	{5039,"Kiem Chung"},
	{5041,"Son mon"},
	{5042,"Dai vien"},
	{5043,"Hau hoa vien"},
	{5044,"Lien Hoan Sao"},
	{5045,"Tang Kiem cac"},
	{5048,"Tu Truc lam"},
	{5049,"Kiem Chung"},
	{5051,"Son mon"},
	{5052,"Dai vien"},
	{5053,"Hau hoa vien"},
	{5054,"Lien Hoan Sao"},
	{5055,"Tang Kiem cac"},
	{5058,"Tu Truc lam"},
	{5059,"Kiem Chung"},
	{5060,"Chien truong Thon trang-Nhan Mon Quan"},
	{5061,"Chien truong Thon trang-Nhan Mon Quan"},
	{5062,"Chien truong Thon trang-Nhan Mon Quan"},
	{5063,"Chien truong Thon trang-Nhan Mon Quan"},
	{5064,"Chien truong phao dai-Nhan Mon Quan"},
	{5065,"Chien truong phao dai-Nhan Mon Quan"},
	{5066,"Chien truong phao dai-Nhan Mon Quan"},
	{5067,"Chien truong phao dai-Nhan Mon Quan"},
	{6000,"Thien Long Tu"},
	{6001,"Ban do Tu Linh"},
	{6002,"Ban do Tu Linh"},
	{6003,"Ban do Tu Linh"},
	{6004,"Ban do Tu Linh"},
	{6005,"Ban do Tu Linh"},
	{6006,"Thien Mon tran"},
	{6007,"Luong Son"},
	{6008,"Ho Duyet Hiep"},
	{6009,"#Dao Hoa Tieu San"},
	{6010,"#Dao Hoa Tieu San"},
	{6011,"#Dao Hoa Tieu San"},
	{6012,"Thieu Lam Nghi Su Duong"},
	{6013,"Mai Trang dai lao"},
	{6014,"Tay Dao"},
	{6015,"Hac Moc Nhai"},
	{6016,"Mai Trang"},
	{6017,"Hac Moc Nhai"},
	{6018,"Hac Moc Nhai"},
	{6019,"Thong Thien Huyen Canh"},
	{6020,"Van Kiem Trung"},
	{6021,"Thien Tam Huyen Canh tang 1"},
	{6022,"Thien Tam Huyen Canh tang 2"},
	{6023,"Thien Tam Huyen Canh tang 3"},
	{6024,"Thiet Chuong Son Trang"},
	{6025,"Than dien"},
	{6026,"Chan Ma Thien Mon Tran"},
	{6027,"Chien truong lien dau"},
	{6028,"Vo Truong Lien Server"},
	{6029,"Chien truong Thon trang-Nhan Mon Quan"},
	{6030,"Chien truong Thao coc-Nhan Mon Quan"},
	{6031,"Chien truong phao dai-Nhan Mon Quan"},
	{6032,"Chien truong chinh-Nhan Mon Quan"},
	{6066,"Bich Hoang Thanh"},
	{6067,"Hoa Son Dien"},
	{6068,"Hoang Cung Giao Truong"},
	{6069,"Uy Vu Dai Loi"},
	{6070,"Ha Luu Thanh Tuyen"},
	{6071,"Tu Cam Dien"},
	{6072,"Thong Thien Tac Dao"},
	{6073,"Tran Yeu That"},
	{6074,"Ban do chien dau bang hoi"},
	{6075,"Thai Nhat Thap"},
	{6076,"An Oan Dai"},
	{6100,"Quynh Ket"},
	{6200,"Hung Khanh"},
	{6300,"That Lac Nhai"},
	{6400,"Thien Am Thanh Dia"},
	{7100,"Khu vuc ty thi lien server "},
	{7101,"Noi bao danh Thien Mon Tran "},
	{7102,"Hoang Thanh dich tram"},
	{7103,"Khu an toan Van Trung "},
	{7104,"Khu an toan Dai Ly "},
	{7105,"Khu an toan Thanh Do "},
	{7106,"Khu an toan Tuyen Chau "},
	{7107,"Khu an toan Phuong Tuong "},
	{7108,"Khu an toan Bien Kinh"},
	{7109,"Khu an toan Duong Chau "},
	{7110,"Khu an toan Hang Duong "},
	{7111,"That Lac Nhai Mat Coc"},
	{7112,"Thien Am Phan Da Sanh Bac"},
	{7113,"Thien Am Phan Da Sanh Nam"},
	{7114,"Thien Am Phan Da Sanh Dong"},
	{7115,"Thien Am Phan Da Sanh Tay"},
	{7116,"Thien Am Phan Da Am Duong"},
	{7117,"Thien Am Phan Da Duong Duong"},
	{7118,"Thien Am Phan Da Tang 3"},
	{7119,"Chuong Khi Son Coc"},
	{8000,"Dau Truong Chuan Bi"},
	{8001,"Dau Truong Phoi Hop"},
	{8002,"Mo hinh ton tai 2v2"},
	{8003,"Mo hinh ton tai 3v3"},
	{8004,"Mo hinh ton tai 5v5"},
	{8005,"Mo hinh to doi 1v1"},
	{8006,"Mo hinh to doi 2v2"},
	{8007,"Mo hinh to doi 3v3"},
	{8008,"Mo hinh to doi 5v5"},
	{8009,"Khu vuc chuan bi lien server "},
	{8010,"Xi Hoa Giao Nguc Giam"},
	{8011,"Van Linh Dai"},
	{8012,"Thien Am Than Bi Co Dia"},
	{8013,"Truy Long Son"},
	{8018,"Lam Hai Tuyet Nguyen"},
	{8020,"Thien Am Giao Hac Phong Duong"},
	{8021,"Thien Am Giao Hac Phong Duong"},
	{8022,"Thien Am Giao Hac Phong Duong"},
	{8023,"Thien Am Giao Hac Phong Duong"},
	{8024,"Thien Am Giao Hac Phong Duong"},
	{8899,"Khu lien server"},
	{8900,"Lam Gian Tuyet Nguyen"},
	{8901,"The Ngoai Dao Vien"},
	{8902,"Me Coc"},
	{8903,"Sach Dao Bo Hoang"},
	{8904,"Hanh Lang U Minh"},
	{8905,"Chien truong Thanh Sa Ha"},
	{8906,"Chien Truong Thanh Sa Ha-San Chuan Bi"},
	{8907,"Tay Thuc Dao"},
	{8908,"Chuan Bi Chien Truong Tay Thuc Dao 1"},
	{8909,"Chuan Bi Chien Truong Tay Thuc Dao 2"},
	{8910,"Chuan Bi Chien Truong Tay Thuc Dao 3"},

}

tPos = {
	{200,200},
	{220,220},
	{180,180},
	{190,190},
	{170,170},
	{180,200},
	{200,180},
	{200,220},
	{220,200},
}

MAX_MAP_ID = 8910;
MOVE_MODE_1 = -1;
MOVE_MODE_2 = -2;

function OnUse()

--¸³Ò»¸ö¼ÓËÙÄ§·¨¸øÍæ¼Ò£¨"Ä§·¨×Ö·û´®",ËÙ¶ÈÔö³¤,³ÖÐøÊ±¼ä£©
-- CastState("state_move_speed_percent_add",60,5400,1);
-- DelItem(2,0,143,1,1);

	goNewWorld()

end;

function goNewWorld()
	inputString();
end;

function inputString()
	AskClientForString("_request_string_call_back_inputter","{map,coorX,coorY}",1,32,"NhËp tham sè b¶n ®å");
end;

function _request_string_call_back_inputter(str)
	handleString(str);
end;

function handleString(szInputted)
	
	local t = split(szInputted);
	local nTableLen = getn(t);
	local na = -1; -- Not applicate
	-- print("nTableLen: "..nTableLen);
	local szException = "Tham sè hîp lÖ bao gåm 1,2 hoÆc 3 tham sè {map,coorX,coorY}."
		.."\n*1 tham sè: map_id hoÆc map_name"
		.."\n*2 tham sè: nCoordiation_x,nCoordiation_y"
		.."\n*3 tham sè: map_id,nCoorX,nCoorY"
		.."\n\n+ <color=yellow>map_name<color> lµ tiÕng ViÖt kh«ng dÊu trõ 5 tr­êng hîp: tc, bk, td, dc, vlm."
		.."\n+ <color=yellow>map_id<color> lµ m· b¶n ®å. NÕu m· nµy cã gi¸ trÞ -1 th× sÏ më hép tho¹i thao t¸c chuét.";
	
	local szNotFound = "Kh«ng t×m thÊy map nµy";
	
	local nMap = 0;
	local nCoorX = 0;
	local nCoorY = 0;
	
	if nTableLen == 1 then
		if isNummeric(t[1]) == 1 then
			nMap = t[1];
			nMap = tonumber(nMap);
		else
			local nIndex = checkItemInTable(tMaps,2,t[1]);
			if nIndex ~= 0 then
				nMap = tMaps[nIndex][1];
			else
				Talk(1,"",szNotFound);
				return 0;
			end
		end
		if nMap ~= MOVE_MODE_1 and nMap ~= MOVE_MODE_2 then
			nMap,nCoorX,nCoorY = extractMap(nMap);
		end
	elseif nTableLen == 2 then
		nMap = GetWorldPos();
		if isNummeric(t[1]) == 1 and isNummeric(t[2]) == 1 then
			nCoorX = handleCoorX(t[1]);
			nCoorY = handleCoorY(t[2]);
			SetPos(nCoorX,nCoorY);
		else 
			Talk(1,"",szException);
			return 0;
		end
	elseif nTableLen == 3 then
		if isNummeric(t[1]) == 1 then
			nMap = t[1];
			nMap = tonumber(nMap);
		else
			local nIndex = checkItemInTable(tMaps,2,t[1]);
			nMap = tMaps[nIndex][1];
		end
		
		if isNummeric(t[2]) and isNummeric(t[3]) then
			nCoorX = handleCoorX(t[2]);
			nCoorY = handleCoorY(t[3]);
		else
			Talk(1,"",szException);
			return 0;
		end
		
		if nMap ~= 0 then
			NewWorld(nMap,nCoorX,nCoorY);
		else
			Talk(1,"",szNotFound);
		end
	else
		Talk(1,"",szException);
	end
	if nMap == MOVE_MODE_1 or nMap == MOVE_MODE_2 then
		showPosList(abs(nMap));
	else
		Msg2Player(format("%d:%d,%d",nMap,nCoorX,nCoorY));
	end
	return 1;
end;

function extractMap(nMap)
	tMapPos = {
		[200] = {200,1404,2861},
		[300] = {300,1750,3555},
		[100] = {100,1421,2992},
		[425] = {425,1756,3200},
		[150] = {150,1678,3165},
	}
	if tMapPos[nMap] ~= nil then -- input value is in table map with position
		nCoorX = tMapPos[nMap][2];
		nCoorY = tMapPos[nMap][3];
		NewWorld(nMap,nCoorX,nCoorY);
	elseif nMap > 0 and nMap <= getn(tPos) then -- input value is table position index
		local nPos = nMap;
		nMap = GetWorldPos();
		nCoorX = tPos[nPos][2]*8;
		nCoorY = tPos[nPos][3]*16+2;
		SetPos(nCoorX,nCoorY);
	else
		guessPos(nMap);
		nMap,nCoorX,nCoorY = GetWorldPos();
	end
	return nMap, nCoorX, nCoorY;
end;

function showPosList(nRate)
	local tSay = {}
	-- for k,v in pairs(tPos) do
		-- tinsert(tSay,format("*%d:%d,%d/#goPos(%d)",k,v[1],v[2],k))
	-- end
	local m,x,y = GetWorldPos();
	local ACCELERATE = 5;
	
	tinsert(tSay,format("T©y (%d)/#move(%d,0,%d)",-ACCELERATE*nRate,-ACCELERATE*nRate,nRate));
	tinsert(tSay,format("§«g (+%d)/#move(%d,0,%d)",ACCELERATE*nRate,ACCELERATE*nRate,nRate));
	tinsert(tSay,format("B¾c (%d)/#move(0,%d,%d)",-ACCELERATE*nRate,-ACCELERATE*nRate,nRate));
	tinsert(tSay,format("Nam (+%d)/#move(0,%d,%d)",ACCELERATE*nRate,ACCELERATE*nRate,nRate));
	
	if m < MAX_MAP_ID then
		tinsert(tSay,format("\nNext map (%d)/#goWorld(%d)",m+1,m+1));
	end
	if m > 1 then
		tinsert(tSay,format("Prev map (%d)/#goWorld(%d)",m-1,m-1));
	end
	tinsert(tSay,"\nKÕt thóc/nothing");
	Say("",getn(tSay),tSay);
end

function move(hori,vert,nRate)
	local m,x,y = GetWorldPos()
	SetPos(x+hori*8,y+vert*16+2);
	Msg2Player(GetWorldPos());
	showPosList(nRate);
end;

function goWorld(nMap)
	guessPos(nMap);
	Msg2Player(GetWorldPos());
	showPosList(1);
end;

function guessPos(nMap)
	local nWent = NewWorld(nMap,180*8,180*16+2);
	if nWent ~= 1 then nWent = NewWorld(nMap,220*8,220*16+2); end
	if nWent ~= 1 then nWent = NewWorld(nMap,200*8,200*16+2); end
	if nWent ~= 1 then nWent = NewWorld(nMap,220*8,180*16+2); end
	if nWent ~= 1 then nWent = NewWorld(nMap,180*8,220*16+2); end
	if nWent ~= 1 then
		for i=170,220 do
			for j=170,220 do
				nWent = NewWorld(nMap,i*8,j*16+2);
			end
		end
	end
	return nWent;
end;

function goPos(nPosIndex)
	local x = tPos[nPosIndex][1]*8;
	local y = tPos[nPosIndex][2]*16+2;
	SetPos(x,y);
	Msg2Player(GetWorldPos());
	showPosList();
end;

function handleCoorX(szCoorX)
	local szLen = strlen(szCoorX);
	if szLen == 3 then
		szCoorX = szCoorX * 8;
	end
	return szCoorX;
end;

function handleCoorY(szCoorY)
	local szLen = strlen(szCoorY);
	if szLen == 3 then
		szCoorY = szCoorY * 16 + 2;
	end
	return szCoorY;
end;

function checkItemInTable(table,column,str)
	str = trimAndLowerString(str);
	local isExist = 0;

	for index, value in table do
		local szTarget = value[column];
		szTarget = trimAndLowerString(szTarget);
		if str == szTarget then
			isExist = index;
			break
		end
	end
	if isExist == 0 then -- refind with relative accuracy
		for index, value in table do
			local szTarget = value[column];
			szTarget = trimAndLowerString(szTarget);
			if strfind(szTarget,str) ~= nil then
				isExist = index;
				break
			end
		end
	end
	return isExist;
end

function trimAndLowerString(str)
	str = strlower(str);
	str = trim(str);
	str = replace(str," ","");
	return str;
end;

function isNummeric(str)
	return str == tostring(tonumber(str));
end

function nothing()
end;