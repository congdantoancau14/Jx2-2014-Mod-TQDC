--前提技能判断
function Calfroskill(id)
	if (HaveLearnedSkill(id)==1) then	--已经学过当前技能
   		return 1	--满足前提技能条件
	elseif  (SKILLS[id]["levelless"][2] == 0)  then	--没有前提技能
		return 1	--满足前提技能条件
	elseif	(SKILLS[id]["levelless"][3] == 0)  then	--前提技能（或关系）
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) >= SKILLS[id]["levelless"][4 + var]) then
					return 1	--满足前提技能条件
				end
			end
	elseif	(SKILLS[id]["levelless"][3] == 1)  then	--前提技能（与关系）
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) < SKILLS[id]["levelless"][4 + var]) then
					return 0	--不满足前提技能条件
				end
			end
			return 1
	else 
	       return 0	--不满足前提技能条件
   	end
end;

--获取学习技能需要的经验
function get_learn_need_exp(id)
	local skillLevel = GetSkillLevel(id)
	if not skillLevel then
		return 2100000000
	end
	local needExp = SKILLS[id][1][3]
	if SKILLS[id][2] then
		needExp = floor(needExp + (skillLevel - 1) * skillLevel * SKILLS[id][2][3] / 2)
	end
	return needExp
end

--升级判断
function canlearnskill(id)
  local skillLevel = GetSkillLevel(id)
  if skillLevel==nil	then
  	return 0
  end
  if (GetLevel() >= LinearValue(skillLevel + 1, 2, SKILLS[id]["levelless"][1], SKILLS[id])) then	-- 检查玩家等级
	local needExp = get_learn_need_exp(id)
	if (GetExp() >= needExp)  then	--检查经验值
		if (GetReputation() >= LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])) then	--检查声望
			i = Calfroskill(id)	--检查前提技能
		 	if (i == 1) then
		 		if (GetCash() >= (needExp / 2)) then	--检查金钱
		 			return 1	--可以学
		 		else
		 			return 6	--金钱不够
		 		end
		 	else
				return 5	--前提技能没学完
			end
		else
				return 4	--声望不够
		end
	else
				return 3	--经验值不够
	end
  else
	return 2	--等级不够
  end
end;

--学习，升级询问
function learnskill(id)
	Msg2Player("learnskill");
	local skillLevel = GetSkillLevel(id)
	if (skillLevel == nil) then
		return
	end

	if (skillLevel >= SKILLS[id][SKILLS[id]["levelless"][1]][1]) then
		return
	end

	local needExp = get_learn_need_exp(id)
	
	local needRep = 0
	local needRepBefore = LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])
	if (needRepBefore ~= nil) then
		needRep = floor(needRepBefore)
	end

	local tipbeforelearn = beforelearnskill(id)
	if (type(tipbeforelearn) == "string") then
		tipbeforelearn = tipbeforelearn.."<enter>"
	else
		tipbeforelearn = ""
	end

	if (HaveLearnedSkill(id) == 0) then
		Say(tipbeforelearn.."H鋍 v� c玭g n祔 c莕 "..needRep.." 甶觤 danh v鋘g v� "..needExp.." 甶觤 kinh nghi謒!"..floor(needExp/2).." ng, x竎 nh ch�?",2,"уng �/yeslearn","B� qua/no")
	else
		Say(tipbeforelearn.."H鋍 v� c玭g n祔 c莕 "..needRep.." 甶觤 danh v鋘g v� "..needExp.." 甶觤 kinh nghi謒!"..floor(needExp/2).." ng, x竎 nh ch�?",2,"уng �/yeslearn","B� qua/no")
	end
end

--学习，升级执行
function yeslearn()
	id = GetLearningSkill()
	if (id == nil) then
		return
	end
	
	n = canlearnskill(id)
 	if (n==0) then
 		 return
 	end	
	if (n==1) then 
		skillLevel = GetSkillLevel(id)
		if (skillLevel == nil) then
			return
		end
		
		needExp = get_learn_need_exp(id)
		ModifyExp(-needExp)	--扣除经验
 		Pay(floor(needExp/2))	--扣除金钱
 
		if (HaveLearnedSkill(id)) == 0 then
 			LearnSkill(id)		--学会技能
  		else
  			LevelUpSkill(id)	--升级技能
		end

		afterlearnskill(id)

	end
	showlimit(n)	--反馈信息给玩家

end;

function no()
end;