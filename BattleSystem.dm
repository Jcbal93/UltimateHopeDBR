mob/var/LastAnger
mob/proc/SetNoAnger(var/obj/Skills/Buffs/b, var/Value=0)
	b.NoAnger=Value
	if(b.NoAnger)
		OMsg(src, "<font color='grey'>[src]'s anger ebbs away...</font color>")
	else
		OMsg(src, "<font color='red'>[src]'s anger flares back to life!</font color>")

mob/proc/Anger(var/Enraged=0)
	if(src.HasCalmAnger()||src.HasNoAnger())
		src.Anger=0
		return
	if(Anger==0&&!AngerCD)
		for(var/obj/Skills/Buffs/SpecialBuffs/Cursed/Jinchuuriki/J in src)
			if(!J.Using&&J.Mastery==1)
				if(src.ActiveBuff)
					if(src.ActiveBuff.SpecialBuffLock)
						src.ActiveBuff.Trigger(src)
				for(var/obj/Skills/Buffs/SlotlessBuffs/SB in src.SlotlessBuffs)
					if(SB.SpecialBuffLock)
						SB.Trigger(src)
				if(src.SpecialBuff)
					if(src.SpecialBuff.BuffName=="Jinchuuriki")
						return
					else
						src.SpecialBuff.Trigger(src)
						J.Trigger(src)
						return

				else
					J.Trigger(src)
					return
		for(var/obj/Skills/Buffs/SpecialBuffs/Cursed/Vaizard_Mask/V in src)
			if(!V.Using&&V.Mastery==1)
				if(src.ActiveBuff)
					if(src.ActiveBuff.SpecialBuffLock)
						src.ActiveBuff.Trigger(src,Override=1)
				if(src.SpecialBuff)
					src.SpecialBuff.Trigger(src,Override=1)
				for(var/obj/Skills/Buffs/SlotlessBuffs/SB in src.SlotlessBuffs)
					if(SB.SpecialBuffLock)
						SB.Trigger(src,Override=1)
				if(src.SpecialBuff)
					if(src.SpecialBuff.BuffName=="Vaizard Mask")
						return
					else
						src.SpecialBuff.Trigger(src)
						V.Trigger(src)
						return
				else
					V.Trigger(src)
					return

		Anger=AngerMax
		if(src.AngerMessage)
			if(!src.AngerColor)
				if(!Enraged)OMsg(src, "<font color='red'>[src] [src.AngerMessage]</font color>")
			else
				if(!Enraged)OMsg(src, "<font color='[src.AngerColor]'>[src] [src.AngerMessage]</font color>")
		else
			if(src.AngerMax>1)
				if(!src.AngerColor)
					if(!Enraged)OMsg(src, "<font color='red'>[src] becomes angry!</font color>")
				else
					if(!Enraged)OMsg(src, "<font color='[src.AngerColor]'>[src] becomes angry!</font color>")

mob/proc/Unconscious(mob/P,var/text)
	if(src.KO)
		return
	if(P)
		if(!istype(src,/mob/Player/FevaSplits))
			src.OMessage(15,"[src] is knocked out by [P]!","<font color=red>[src]([src.key]) is knocked out by [P]([P.key])")
			if(FightingSeriously(P,0)||src.BPPoison<1||src.MortallyWounded)
				src.KOBrutal=1
			else
				src.KOBrutal=0
				OMsg(src, "...but it wasn't too rough, so they'll probably walk it off.")
	if(text)
		if(!istype(src,/mob/Player/FevaSplits))
			src.OMessage(15,"[src] is knocked out by [text]!","<font color=red>[src]([src.key]) is knocked out by [text]")
	if(src.GatesActive==8)
		src.KO=0
		src.OMessage(15,"...but [src]'s youth is burning too bright to be stopped!","<font color=red>[src]([src.key]) remains standing in their celebration of youth!")
		src.Health=1
		src.VaizardHealth+=30
		src.HealthAnnounce10++
		if(src.HealthAnnounce10>=2)
			if(src.CheckActive("Eight Gates"))
				src.ActiveBuff:Close_Gates()//deactivate...
		return
	if(src.Desperation&&(!src.CyberCancel||src.Saga=="King of Braves"))
		if(src.HealthAnnounce10<=1&&FightingSeriously(P,src))
			if(prob((src.Desperation*2.5)+5))
				src.KO=0
				src.OMessage(15, "...but [src] refuses to go down!", "<font color=red>[src]([src.key]) remains standing despite impossible odds!")
				src.Health=1
				src.VaizardHealth+=5 //actual clutch now.
				src.HealthAnnounce10=2
				return
	var/GetUpOdds=1
	if(src.KOBrutal)
		GetUpOdds=2
	if(src.ManaDeath)
		src.Death(null, "turning into stone from overexposure to natural energy!")
		src.ManaDeath=0
		return
	src.PoweringUp=0
	src.PoweringDown=0
	src.Auraz("Remove")
	src.KOTimer=(300/(src.GetRecov())*GetUpVar*GetUpOdds)
	src.DealWounds(src,20/max(src.GetRecov(2), 1))
	src.KO=1
	src.icon_state="KO"
	src.Health=1
	src.Energy=1
	src.PowerControl=100
	src.Burn=0
	src.AfterImageStrike=0
	src.VaizardHealth=0
	src.ForceCancelBeam()
	src.ForceCancelBuster()
	if(P && P.Saga == "Kamui" && P.CheckSlotless("Decapitation Mode"))
		var/a=0
		for(var/obj/Items/Wearables/w in src)
			if(w.PermEquip) continue
			if(!w.suffix) continue
			w.ObjectUse(src)
			a++
		if(a) viewers(src) << "<b><font color=#ff7878 size=+2>[P] annihilates [src]'s clothing with a finishing blow!</b></font>"


	if(src.alpha<255)
		src.alpha=255
	var/obj/Items/Enchantment/Flying_Device/FD=src.EquippedFlyingDevice()
	if(src.Flying)
		Flight(src, Land=1)
		sleep(5)
		if(FD)
			FD.AlignEquip(src)

	src.MeditationCD=0
	src.LastBreath=0
	if(src.TotalInjury)
		if(!src.HasInjuryImmune())
			if(src.TotalInjury>=35&&src.TotalInjury<60&&src.BPPoison>=0.9)
				var/Time=RawHours(12)
				Time/=src.GetRecov()
				if(Time > BPPoisonTimer)
					src.BPPoisonTimer=Time
				src.BPPoison=0.9
				if(src.AscensionsAcquired<1&&!src.ZenkaiEXP)
					src.ZenkaiEXP+=1
				src.OMessage(10, "[src] has been lightly wounded!", "[src]([src.key]) has over 35% injury.")
			if(src.TotalInjury>=60&&src.BPPoison>=0.7)
				var/Time=RawHours(12)
				Time/=src.GetRecov()
				if(Time > BPPoisonTimer)
					src.BPPoisonTimer=Time
				src.BPPoison=0.7
				if(src.AscensionsAcquired<2&&!src.ZenkaiEXP)
					src.ZenkaiEXP+=1
				src.OMessage(10, "[src] has been heavily wounded!", "[src]([src.key]) has over 50% injury.")
			if(src.TotalInjury>=85)
				var/Time=RawHours(6)
				Time/=src.GetRecov()
				if(Time > BPPoisonTimer)
					src.BPPoisonTimer=Time
				src.BPPoison=0.5
				src.MortallyWounded+=1
				if(src.AscensionsAcquired<4&&!src.ZenkaiEXP)
					src.ZenkaiEXP+=1
				src.OMessage(10, "[src] has been grieviously wounded!", "[src]([src.key]) has over 85% injury.")
	if(src.client)
		if((src.trans["active"]||src.trans["tension"]||src.ssj["active"]||src.ssj["god"])&&!src.HasNoRevert()&&!src.HasMystic())
			for(var/obj/Skills/Buffs/B in src)
				if(src.BuffOn(B)&&B.Transform&&!B.AlwaysOn)
					B.Trigger(src)
					break
			if(src.Race!="Changeling")
				src.Revert()
				src<<"Being knocked out forced you to revert!"
		if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
			src.Oozaru(0)
	if(src.Grab)
		src.Grab_Release()



mob/proc/Conscious()
	if(!src.client)
		return
	if(src.z==global.DjinnZoneZ)
		return
	if(src.KO)
		src.MortallyWounded=0
		src.TsukiyomiTime=1
		src.KOTimer=0
		src.KO=0
		src.icon_state=""

		if(src.KOBrutal)
			src.KOBrutal=0
			src.Health=1
			src.Energy=EnergyMax/100
		else
			src.Health=15
			src.Energy=EnergyMax/5

		if(src.Secret=="Zombie")
			src.HealthCut+=0.1
			src.OMessage(15,"[src] degenerates further.","<font color=blue>[src]([src.key]) decomposes...")
		src.OMessage(15,"[src] regains consciousness.","<font color=blue>[src]([src.key]) regains consciousness")

mob/proc/Death(mob/P,var/text,var/SuperDead=0, var/NoRemains=0, var/Zombie)
	BreakViewers() //STOP LOOKING AT ME THE SHAME OF DEATH TOO MUCH

	if(src.NoVoid)
		SuperDead=1

	if(src.IsGrabbed())
		src.IsGrabbed().Grab_Release()
	if(src.Grab)
		src.Grab_Release()

	if(P)
		if(P.Race!="Demon")
			for(var/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm/da in src)
				if(src.CheckSlotless("Devil Arm"))
					da.Trigger(src)
				if(src.Race=="Demon")
					da.name="Devil Arm ([src.TrueName])"
				P.contents+=da
				P << "You have inherited [src]'s Devil Arm!"
				src << "You have bestowed your Devil Arm upon [P]!"

	if(istype(src, /mob/Player/AI))
		if(P)

			var/mob/Player/AI/a = src
			if(a.in_squad)
				a.in_squad.RemoveMember(src) //Squad members die die when they die.
				a.Potential = 0 //No gains!
			if(a.Potential)
				if(P.Secret=="Zombie")
					P.HealthCut-=(0.001*src.Potential)
				var/potential_gain=a.Potential/10
				if(P.party)
					if(P.party.members.len>0)
						potential_gain/=P.party.members.len
						for(var/mob/m in P.party.members)
							m.potential_gain(potential_gain, npc=1)
							if((m.GetRPP()/m.GetRPPMult())<global.RPPHighest)
								m.RPPSpendable+=(1*max(0.25, (a.Potential/100))*m.GetRPPMult())
								if(a.RPPower>1)
									m.RPPSpendable+=1*m.GetRPPMult()
				else
					P.potential_gain(potential_gain, npc=1)
					if((P.GetRPP()/P.GetRPPMult())<global.RPPHighest)
						P.RPPSpendable+=(1*max(0.25, (a.Potential/100))*P.GetRPPMult())
						if(a.RPPower>1)
							P.RPPSpendable+=1*P.GetRPPMult()
			for(var/obj/Items/i in src)
				i.loc = locate(src.x, src.y, src.z)
				i.Health=10000000000000
				i.layer=6
				if(istype(i, /obj/Items/Enchantment/PhilosopherStone/Magicite))
					var/obj/Items/Enchantment/PhilosopherStone/Magicite/Prime
					var/obj/Items/Enchantment/PhilosopherStone/Magicite/NewMagi=i
					for(var/obj/Items/Enchantment/PhilosopherStone/Magicite/m2 in P)
						if(!Prime)
							Prime=m2
							continue
					if(Prime)
						Prime.MaxCapacity+=NewMagi.MaxCapacity
						Prime.CurrentCapacity+=NewMagi.CurrentCapacity
						del NewMagi
						P << "Your magicite collects into a single cluster."
						Prime.Update_Description()
					else
						P.contents.Add(NewMagi)
			for(var/obj/Money/m in src)
				P.GiveMoney(m.Level)
				del m

	if(text)
		src.OMessage(20,"[src] was just killed by [text]!","<font color=red>[src] was just killed by [text]!")
	if(P)
		var/obj/Items/Sword/s=P.EquippedSword()
		var/obj/Items/Enchantment/Staff/st=P.EquippedStaff()
		src.OMessage(20,"[src] was just killed by [P]!","<font color=red>[src] was just killed by [P]([P.key])!")
		if(P.HasPurity())
			SuperDead=2
			NoRemains=1
			if(P.Secret=="Ripple")
				src.OMessage(20,"[src] is completely destroyed by the Ripple running through their body!","<font color=red>[src] was purified [P]([P.key])!")
			else
				src.OMessage(20,"[src]'s existence is purged from the world!","<font color=red>[src] was purified [P]([P.key])!")
		else if(s||st)
			if((s && s.Element=="Silver")||(st && st.Element=="Silver"))
				if(src.IsEvil())
					SuperDead=1
					src.OMessage(20,"[src]'s existence is purged from the world!","<font color=red>[src] was purified [P]([P.key])!")

	if(NoRemains!=2)
		if(src.BloodPower>=2)
			src.BloodPower-=(0.5+(1.5*SuperDead))
			if(src.BloodPower<=2)
				src.BloodPower=2
			if(src.BloodPower>2)
				src.Stasis=2000
				sleep(30)
				src.Conscious()
				src.OMessage(15,"...but [src] uses a consumed life to come back to life!","<font color=red>[src]([src.key]) consumes a life!")
				animate(src, color = list(0.7,0,0, 0,0,0, 0,0,0, 0,0,0), time = 15)
				spawn(15)
					animate(src, color = src.MobColor, time = 35)
				src.HealWounds(30)
				src.HealFatigue(30)
				src.HealHealth(30)
				src.HealEnergy(30)
				src.HealMana(30)
				src.Stasis=0
				return
		if(src.Phylactery)
			for(var/obj/Items/Enchantment/Phylactery/Phy in world)
				if(Phy.Signature==src.ckey)
					OMsg(src, "[src] vanishes!")
					src.loc=Phy.loc
					src << "Your phylactery has saved you from doom."
					src.PhylacteryNerf+=0.2
					src.MortallyWounded=0
					src.BPPoison=0.9
					src.BPPoisonTimer=1
					src.Conscious()
					return
		if(src.NoDeath)
			if(src.HealthCut<0.5&&!SuperDead)
				src.KO=1
				src.Stasis=2000
				src.icon_state="KO"
				if(src.VenomBlood)
					src.overlays+=image('ArtificalObj.dmi',"Acid")
				else
					src.overlays+=image('ArtificalObj.dmi',"Blood")
				src << "Due to damage suffered you will be inert for a minute."
				spawn(Minute(1))
					src.Conscious()
					src.Stasis=0
					if(src.Secret!="Zombie")
						src.HealWounds(50)
						src.HealFatigue(50)
					src.HealHealth(50)
					src.HealEnergy(50)
					if(src.VenomBlood)
						src.overlays-=image('ArtificalObj.dmi',"Acid")
					else
						src.overlays-=image('ArtificalObj.dmi',"Blood")
					src.HealthCut+=0.2
					src << "Your body fails to regenerate all damage done to it."
				return
		if(locate(/obj/Regenerate, src))
			if(src.Regenerating)
				return
			for(var/obj/Regenerate/A in src)
				if(A.Level>=1)
					src.Regenerating=1
					A.X=src.x
					A.Y=src.y
					A.Z=src.z
					src.Regenerate(A)
					A.Level/=2
					src.loc=locate(global.NearDeadX, global.NearDeadY, global.NearDeadZ)
					return
				else
					src << "Your body fails to regenerate rapidly enough... you can feel yourself fading."

	if(ClothBronze&&ClothBronze=="Phoenix")
		NoRemains=0
		SuperDead=0
		Zombie=0

	if(!src.client)
		NoRemains=1
		SuperDead=1
		Zombie=0

	if(src.Dead)
		NoRemains=1

	if(!NoRemains)
		src.Leave_Body(SuperDead, Zombie)
	else
		for(var/obj/Items/I in src)
			if(I)
				if(I.suffix=="*Equipped*"||I.suffix=="*Equipped (Second)*"||I.suffix=="*Equipped (Third)*")
					I.ObjectUse(User=src)
				if((!I.LegendaryItem&&I.Destructable)||NoRemains==2)
					del I
				if(I)
					I.loc=src.loc
		for(var/obj/Money/Q in src)
			if(Q.Level)
				var/obj/Money/M=new
				M.Level=Q.Level
				M.name="[Commas(round(M.Level))] [global.MoneyName]"
				src.TakeMoney(M.Level)
				if(M)
					if(NoRemains==2)
						del M
					else
						M.loc=src.loc
		if(!src.client)
			if(istype(src, /mob/Player/AI))
				var/mob/Player/AI/ai = src
				ai.EndLife(animatedeath=0)

			else
				src.loc=locate(0, 0, 0)
		else
			if(NoRemains==3)
				src.loc=locate(global.PhilosopherX, global.PhilosopherY, global.PhilosopherZ)
			else
				src.loc=locate(global.DeadX, global.DeadY, global.DeadZ)

	if(src.Dead)
		src.Conscious()
	else
		src.Dead=1
		src.Conscious()
		src.Poison=0
		src.Burn=0
		src.Slow=0
		src.Shatter=0
		src.Harden=0
		src.Shock=0
		src.Sheared=0
		src.Crippled=0
		src.HealthCut=0
		src.EnergyCut=0
		src.TotalInjury=0
		src.TotalFatigue=0
		src.OverClockNerf=0
		src.OverClockTime=0
		src.BPPoison=1
		src.BPPoisonTimer=0
		src.MortallyWounded=0
		src.StrTax=0
		src.StrCut=0
		src.StrStolen=0
		src.StrEroded=0
		src.EndTax=0
		src.EndCut=0
		src.EndStolen=0
		src.EndEroded=0
		src.SpdTax=0
		src.SpdCut=0
		src.SpdStolen=0
		src.SpdEroded=0
		src.ForTax=0
		src.ForCut=0
		src.ForStolen=0
		src.ForEroded=0
		src.OffTax=0
		src.OffCut=0
		src.OffStolen=0
		src.OffEroded=0
		src.DefTax=0
		src.DefCut=0
		src.DefStolen=0
		src.DefEroded=0
		src.RecovTax=0
		src.RecovCut=0
		if(src.Secret=="Zombie")
			src.Secret=null
			src.NoDeath=0
			src.Timeless=0
			src.VenomImmune-=1
			src.SpaceWalk-=1

obj/Regenerate
	var/X
	var/Y
	var/Z

mob/proc/Regenerate(var/obj/Regenerate/R in src)
	var/Timer=600/max(R.Level,0.0001)
	src.Regenerating=1
	src <<"You will regenerate in [Timer/10] seconds."
	src.OMessage(10,null,"[src]([src.key]) will regenerate in [Timer/10] seconds.")
	if(KO) Conscious()
	spawn(Timer)
		if(src&&R)
			if(R.X&&R.Y&&R.Z)
				loc=locate(R.X,R.Y,R.Z)
				src.Sheared=0
				src.Maimed=0
				src.MortallyWounded=0
				src.TotalInjury=0
				src.TotalFatigue=0
				src.HealHealth(100)
				src.HealEnergy(100)
				src.HealMana(100)
				R.X=null
				R.Y=null
				R.Z=null
				src.Regenerating=0


mob/Body
	KO=1
	var/DeathTime
	var/TrulyDead=1//dont nerf people who are voiding naturally
	New()
		DeathTime=world.realtime
		..()
	verb/Bury()
		set src in oview(1)
		OMsg(usr, "[usr] buries [src]")
		if(!(world.time > usr.verb_delay)) return
		usr.verb_delay=world.time+1
		src.layer=AREA_LAYER
		src.density=0
		src.Grabbable=0
		src.Savable=1
	verb/Loot()
		set category=null
		set src in range(1, usr)
		if(!(world.time > usr.verb_delay)) return
		usr.verb_delay=world.time+1
		usr.Grid("Loot", Lootee=src)
		OMsg(usr, "[usr] loots [src]...")
	Del()
		for(var/obj/Items/Sword/I in src)
			if(I.Conjured)
				del I
		for(var/obj/Items/Armor/I in src)
			if(I.Conjured)
				del I
		for(var/obj/Items/I in src)
			if(I.Stealable)
				if(I.suffix=="*Equipped*")
					spawn(5)
						I.suffix=null
			I.loc=src.loc
		if(Target)
			Target << "Your body has been destroyed."
		..()

proc/Save_Bodies()
	set background = 1
	var/Amount=0
	var/E=1
	var/savefile/F=new("Saves/Bones/File[E]")
	var/list/Types=new
	for(var/mob/Body/A in world) if(A.Savable&&A.z)
		A.buildPreviousX = A.x
		A.buildPreviousY = A.y
		A.buildPreviousZ = A.z
		Types+=A
		Amount+=1
		if(Amount % 250 == 0)
			F["Types"]<<Types
			E++
			F=new("Saves/Bones/File[E]")
			Types=new
	if(Amount % 250 != 0)
		F["Types"]<<Types
	hacklol
	if(fexists("Saves/Bones/File[E++]"))
		fdel("Saves/Bones/File[E++]")
		world<<"<small>Server: Objects DEBUG system check: extra bones file deleted!"
		E++
		goto hacklol

proc/Load_Bodies()
	var/amount=0
	var/filenum=0
	wowza
	filenum++
	if(fexists("Saves/Bones/File[filenum]"))
		var/savefile/F=new("Saves/Bones/File[filenum]")
		var/list/L=new
		F["Types"]>>L
		for(var/mob/Body/A in L)
			amount+=1
			A.x = A.buildPreviousX
			A.y = A.buildPreviousY
			A.z = A.buildPreviousZ
		goto wowza

mob/proc/Leave_Body(var/SuperDead=0, var/Zombie, var/ForceVoid=0)
	var/mob/Body/A=new
	var/ActuallyDead=0
	var/Chance=global.VoidChance
	var/c_red=Chance * (min(src.Potential, 100) / 100)
	Chance-=c_red

	if(src.Saga=="King of Braves")
		Chance+=(src.SagaLevel*5)

	if(src.ClothBronze=="Phoenix")
		Chance+=(40 - (src.SagaLevel*5))

	A.icon_state="KO"
	A.name="Body of [src]"
	A.loc=src.loc
	A.transform=src.transform
	src.loc=locate(global.NearDeadX, global.NearDeadY, global.NearDeadZ)

	if(!SuperDead)
		if(global.VoidsAllowed||ForceVoid)
			var/Timer
			ActuallyDead=1
			if(src.Race=="Human"&&src.HellPower>=1&&src.HellPower<2&&src.Potential>=50)
				src.HalfDemonAscension()
				src.Burn=0
				src.Poison=0
				src.Slow=0
				src.Shatter=0
				src.Sheared=0
				src.TotalFatigue=0
				src.TotalInjury=0
				src.TotalCapacity=0
				src.InjuryAnnounce=0
				src.Health=100
				src.Energy=100
				src.ManaAmount=src.ManaMax*src.GetManaCapMult()
				OMsg(src, "[src] raises to their feet, surrounded by extremely corrupted power...")
				src.loc=A.loc
				del A
				return
			if(ForceVoid)
				Timer=Minute(5)//this will always happen
				ActuallyDead=0
				A.TrulyDead=0
			if(prob(Chance))
				ActuallyDead=0
				A.TrulyDead=0
			if(!ActuallyDead)
				Log("Admin", "[ExtractInfo(src)] is voiding.")
			if(ForceVoid > 1)
				Timer=Minute(ForceVoid)
			else
				Timer=Minute(30)
			src << "<font color=red><big>DO NOT LOG OUT!</big></font color>"
			src << "Your fate is still uncertain and you may come back to life..."
			spawn(Timer)
				if(src&&A)
					if(src.Grab)
						src.Grab_Release()
					var/mob/m=src.IsGrabbed()
					if(m)
						m.Grab_Release()
					if(!ActuallyDead)
						src << "Your fate is not yet decided! You return to the light of the living!"
						A.Barely_Alive(src)
					else
						if(src.NoSoul)
							src << "You have no soul contained within your body; there is nothing after life for you."
							src.Savable=0
							if(istype(src, /mob/Players))
								fdel("Saves/Players/[src.ckey]")
							src.loc=locate(0,0,0)
							return
						else
							src << "Your fate has been decided; you move on to the realm of the dead..."
							src.loc=locate(global.DeadX, global.DeadY, global.DeadZ)

	else if(SuperDead&&Zombie)
		src<<"<font color=red><big>DO NOT LOG OUT!"
		src<<"Your life is being shackled by a powerful curse!"
		src.OMessage(0,"","<font color=red>[src] is zombifying.")
		ActuallyDead=0
		spawn(600)
			if(src&&A)
				A.Unholy_Alive(src)
	else
		ActuallyDead=1
		if(src.NoSoul)
			src << "<font size='big'><b>You have been destroyed completely by some overwhelming force -- body and soul. Nothing remains.</b></font size>"
			src.Savable=0
			if(istype(src, /mob/Players))
				fdel("Saves/Players/[src.ckey]")
			src.loc=locate(0,0,0)
			return
		else
			src << "Your fate has been sealed by an overwhelming force; you move on immediately to the realm of the dead..."
			src.loc=locate(global.DeadX, global.DeadY, global.DeadZ)
	src.Burn=0
	src.Poison=0
	src.Slow=0
	src.Shatter=0
	src.Shock=0
	src.Sheared=0
	src.Crippled=0
	src.Confused=0
	src.Stunned=0
	A.Race=Race
	A.Body=Body
	if(1>=ForceVoid)
		A.Health=1000
	A.EnergyMax=src.EnergyMax
	A.Energy=src.Energy
	A.Power=src.Power
	A.StrMod=src.GetStr()
	A.EndMod=src.GetEnd()
	A.ForMod=src.GetFor()
	A.Target=src
	A.icon=src.icon
	A.overlays=src.overlays
	A.DeathKillerTargets=src.key//used for Death Killer
	A.Savable=0
	if(src.ClothBronze&&src.ClothBronze=="Phoenix"&&!ActuallyDead)
		A.invisibility=100
		A.Savable=1
		A.density=0
		A.Grabbable=0
		OMsg(A, "[A] turns to ash!")
	if(!ForceVoid)
		if(src.VenomBlood)
			A.overlays+=image('ArtificalObj.dmi',"Acid")
		else
			A.overlays+=image('ArtificalObj.dmi',"Blood")
	if(src.client)
		src.overlays-='Halo.dmi'
		src.overlays+='Halo.dmi'
	if(ActuallyDead)
		for(var/obj/Items/I in src)
			if(I.suffix=="*Equipped*")
				I.ObjectUse(src)
			A.contents+=I
	for(var/obj/Money/Q in src)
		if(Q.Level)
			var/obj/Money/M=new(A.loc)
			M.Level=Q.Level
			M.name="[Commas(round(M.Level))] [global.MoneyName]"
			src.TakeMoney(M.Level)
	if(src.NoSoul && !ForceVoid && !Zombie)
		src << "<font size='big'><b>You have died on a plane with no Afterlife; there is nothing for you now. This is oblivion.</b></font size>"
		src.Savable=0
		if(istype(src, /mob/Players))
			fdel("Saves/Players/[src.ckey]")
		src.loc=locate(0,0,0)
		return


mob/proc/Barely_Alive(mob/P) if(P)
	var/Zenkai=round(100/max(global.VoidChance,25))
	P.loc=loc
	if(P.KO)
		P.Conscious()
	P.Revive()
	P<<"You have returned to your body, barely alive."
	if(P.Race=="Saiyan"||P.Race=="Half Saiyan")
		if(P.Race=="Half Saiyan")
			Zenkai/=2
		if(P.AscensionsUnlocked<Zenkai)
			P.AscensionsUnlocked++
			Log("Admin","[ExtractInfo(P)] triggered Zenkai through surviving lethal wounds.")
	del(src)

mob/proc/Unholy_Alive(mob/P) if(P)
	var/icon/Z=new(P.icon)
	Z.MapColors(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11, 0,0,0)
	P.loc=loc
	P.Conscious()
	P.Health=50
	P.Energy=100
	P.Sheared=100
	P.HealthCut=0.2
	P.NoDeath=1
	P.Timeless=1
	P.VenomImmune+=1
	P.SpaceWalk+=1
	P.Revive()
	P.icon=Z
	P.Secret="Zombie"
	P<<"You have returned to your body, a mockery of what you once were."
	del(src)

mob/proc/Revive()
		overlays-='Halo.dmi'
		Dead=0



	//LABEL: ACCURACY FORMULA
proc/Accuracy_Formula(var/mob/Offender,var/mob/Defender,var/AccMult=1,var/BaseChance=global.WorldDefaultAcc, var/Backfire=0, var/IgnoreNoDodge=0)
	if(Offender&&Defender)
		if(Defender.Frozen==3)
			return 0
		if(Offender.HasNoMiss())
			return 1
		if(Defender.HasNoDodge()&&!IgnoreNoDodge)
			return 1
		if(Backfire&&Offender==Defender)
			return 1
		if(Defender.SureDodge&&!Defender.NoDodge)
			Defender.SureDodge=0
			if(Offender.SureHit)
				return 1
			else
				return 0
		if(Offender.SureHit)
			Offender.SureHit=0
			return 1
		if(get_dir(Defender, Offender) in list(turn(Defender.dir, 180), turn(Defender.dir, 135), turn(Defender.dir, 235)))
			AccMult*=1.25
		if(Offender.UsingCriticalImpact())
			AccMult*=1.25
		if(Defender.HasRefractivePlating()||Defender.HasPlatedWeights())
			AccMult*=1.25
		if(Offender.AttackQueue)
			AccMult*=Offender.QueuedAccuracy()
		if(Offender.SenseRobbed>=4&&(Offender.SenseUnlocked<=Offender.SenseRobbed&&Offender.SenseUnlocked>5))
			AccMult*=(1-(Offender.SenseRobbed*0.1))
		if(Defender.SenseRobbed>=4&&(Defender.SenseUnlocked<=Defender.SenseRobbed&&Defender.SenseUnlocked>5))
			AccMult/=(1-(Offender.SenseRobbed*0.1))
		if(Defender.Adrenaline)
			var/CombatSlow=10/max(Defender.Health,1)
			if(CombatSlow>1)
				AccMult/=1+(0.05*CombatSlow)
		if(Offender.HasClarity()||Offender.HasFluidForm()||Offender.HasIntuition())
			if(AccMult<1)
				AccMult+=0.3*AccMult
				if(AccMult>1)
					AccMult=1
		if(Defender.HasClarity()||Defender.HasFluidForm()||Defender.HasIntuition())
			if(AccMult>1)
				AccMult-=0.3*AccMult
				if(AccMult<1)
					AccMult=1
		if(Offender.Desperation&&Offender.HealthAnnounce10&&(!Offender.CyberCancel||Offender.Saga=="King of Braves"))
			AccMult*=1+round(0.05*Offender.Desperation,0.1)*Offender.HealthAnnounce10
		if(Defender.Desperation&&Defender.HealthAnnounce10&&(!Defender.CyberCancel||Defender.Saga=="King of Braves"))
			AccMult/=1+round(0.05*Defender.Desperation,0.1)*Defender.HealthAnnounce10
		var/Offense=((Offender.Power/Offender.GetPowerUpRatio())*(Offender.GetOff(0.8)+Offender.GetSpd(0.2)))**(1/3)*(1+Offender.GetGodKi())
		var/Defense=((Defender.Power/Defender.GetPowerUpRatio())*(Defender.GetDef(0.8)+Defender.GetSpd(0.2)))**(1/3)*(1+Defender.GetGodKi())
		var/TotalAccuracy=BaseChance
		TotalAccuracy*=(Offense*AccMult/max(Defense,0.01))
		if(TotalAccuracy>=100)
			TotalAccuracy=100
		if(prob(TotalAccuracy)||Defender.Stunned||Defender.Launched||Defender.PoweringUp||Offender.Grab==Defender)
			return 1
		return 0
	else
		return 0

proc/Deflection_Formula(var/mob/Offender,var/mob/Defender,var/AccMult=1,var/BaseChance=global.WorldDefaultAcc, var/Backfire=0)
	if(Offender&&Defender)
		if(Defender.Frozen==3)
			return 0
		if(Offender.HasNoMiss())
			return 1
		if(Defender.SureDodge)
			Defender.SureDodge=0
			if(Offender.SureHit)
				return 1
			else
				return 0
		if(Offender.SureHit)
			Offender.SureHit=0
			return 1
		if(Backfire&&Offender==Defender)
			AccMult*=3
		if(get_dir(Defender, Offender) in list(turn(Defender.dir, 180), turn(Defender.dir, 135), turn(Defender.dir, 235)))
			AccMult*=1.25
		if(Defender.Beaming || Defender.BusterTech)
			AccMult*=1.25
		if(Defender.HasRefractivePlating()||Defender.HasPlatedWeights())
			AccMult/=1.5
		if(Offender.SenseRobbed>=4&&(Offender.SenseUnlocked<=Offender.SenseRobbed&&Offender.SenseUnlocked>5))
			AccMult*=(1-(Offender.SenseRobbed*0.05))
		if(Defender.SenseRobbed>=4&&(Defender.SenseUnlocked<=Defender.SenseRobbed&&Defender.SenseUnlocked>5))
			AccMult/=(1-(Defender.SenseRobbed*0.05))
		if(Defender.Adrenaline)
			var/CombatSlow=10/max(Defender.Health,1)
			if(CombatSlow>1)
				AccMult/=1+(0.05*CombatSlow)
		if(Offender.HasClarity()||Offender.HasFluidForm()||Offender.HasIntuition())
			if(AccMult<1)
				AccMult+=0.3*AccMult
				if(AccMult>1)
					AccMult=1
		if(Defender.HasClarity()||Defender.HasFluidForm()||Defender.HasIntuition())
			if(AccMult>1)
				AccMult-=0.3*AccMult
				if(AccMult<1)
					AccMult=1
		if(Offender.Desperation&&Offender.HealthAnnounce10&&(!Offender.CyberCancel||Offender.Saga=="King of Braves"))
			AccMult*=1+round(0.05*Offender.Desperation,0.1)*Offender.HealthAnnounce10
		if(Defender.Desperation&&Defender.HealthAnnounce10&&(!Defender.CyberCancel||Defender.Saga=="King of Braves"))
			AccMult/=1+round(0.05*Defender.Desperation,0.1)*Defender.HealthAnnounce10
		var/Offense=((Offender.Power/Offender.GetPowerUpRatio())*(Offender.GetOff(0.8)+Offender.GetSpd(0.2)))**(1/3)*(1+Offender.GetGodKi())
		var/Defense=((Defender.Power/Defender.GetPowerUpRatio())*(Defender.GetDef(0.8)+Defender.GetSpd(0.2)))**(1/3)*(1+Defender.GetGodKi())
		var/TotalAccuracy=BaseChance
		TotalAccuracy*=(Offense*AccMult/max(Defense,0.01))
		if(TotalAccuracy>=100)
			TotalAccuracy=100
		if(prob(TotalAccuracy)||Defender.Stunned||Defender.Launched||Defender.PoweringUp||Offender.Grab==Defender)
			return 1
		return 0
	else
		return 0

mob/proc/GetDamageMod()

	if(src.HasSteady())
		return min(src.GetSteady(),9)

	if(src.UsingZornhau()&&src.HasSword())
		var/obj/Items/Sword/s=src.EquippedSword()
		var/Value=GoCrand(1,9)
		switch(s.Class)
			if("Wooden")
				Value+=1
			if("Light")
				Value+=1
			if("Medium")
				Value+=2
			if("Heavy")
				Value+=4
		if(src.UsingZornhau()>1)
			Value+=src.UsingZornhau()
		if(src.Saga=="Weapon Soul"&&src.SagaLevel>=2)
			Value+=1
		if(Value>9)
			Value=9
		return Value
	if(src.UsingKendo()&&src.HasSword())
		var/obj/Items/Sword/s=src.EquippedSword()
		var/Value=GoCrand(1,9)
		if(s.Class=="Wooden")
			Value+=(3*src.UsingKendo())
		else
			Value+=(1.5*src.UsingKendo())
		if(Value>9)
			Value=9
		return Value

	if(src.Judgment&&!src.Oozaru)
		var/Value=GoCrand(1,9)
		Value+=src.AscensionsAcquired
		if(Value>9)
			Value=9
		return Value

	return GoCrand(1,9)

mob/var/tmp/last_combo
mob/proc/Comboz(var/mob/M, LightAttack=0)
	if(last_combo >= world.time) return
	last_combo = world.time
	var/list/dirs = list(NORTH,SOUTH,EAST,WEST,NORTHWEST,SOUTHWEST,NORTHEAST,SOUTHEAST)
	if(M in view(15, src))
		var/turf/W
		if(M.z!=src.z)
			return //lol you can't combo through dimensions anymore.  sad.
		if(M.x>(src.x+15)||M.x<(src.x-15))
			return//please don't hit me from across the map
		if(M.y>(src.y+15)||M.y<(src.y-15))
			return//pleez


		while(dirs.len)
			var/direction = pick(dirs)
			dirs-=direction

			W=get_step(M, direction)
			if(W)
				if(istype(W,/turf/Special/Blank))
					return
				if(!W.density)
					for(var/atom/x in W)
						if(x.density)
							return
					if(W.density)
						return
					src.loc=W
					src.dir=ReturnDirection(src,M)
					if(!LightAttack && get_dist(src,M)>1)
						if(src.AttackQueue && src.AttackQueue.Rapid)
							FlashImage(src)
						else
							VanishImage(src)
					if(M.Beaming!=2)
						M.dir=ReturnDirection(M,src)
					break


mob/proc/Melee(var/damagemulti=1,var/speedmulti=1,var/iconoverlay,var/forcewarp,var/MeleeTarget=null,var/ExtendoAttack=null,var/SecondStrike,var/ThirdStrike,var/accmulti=1, var/SureKB=0, var/NoKB=0, var/IgnoreCounter=0, var/BreakAttackRate=0)
	if(damagemulti<=0)
		damagemulti=1
	if(src.Stasis)
		return
	if(SecondStrike || ThirdStrike)
		BreakAttackRate=1

	if(!src.CanAttack() && !BreakAttackRate)
		return

	var/UnarmedAttack=1
	var/SwordAttack=0
	var/LightAttack=0

	var/Delay=SpeedDelay()

	if(src.AttackQueue)
		if(src.AttackQueue.Combo && !(src.AttackQueue.Counter + src.AttackQueue.CounterTemp))
			if(!src.Target||src.Target==src)
				src << "You need a target to combo!"
				return
			if(src.AttackQueue.ComboPerformed>0)
				src.Comboz(src.Target)
			if(src.AttackQueue.ComboPerformed<=src.AttackQueue.Combo)
				src.AttackQueue.ComboPerformed++
			else
				src.ClearQueue()
			if(src.AttackQueue.ComboHitMessages.len>0)
				var/Message=src.AttackQueue.ComboHitMessages[src.AttackQueue.ComboPerformed]
				if(Message)
					if(src.AttackQueue.TextColor)
						src.OMessage(10, "<font color='[src.AttackQueue.TextColor]'><b>[src] [Message]</b></font color>", "[src]([src.key]) hit with [src.AttackQueue].")
					else
						src.OMessage(10, "<font color='[src.Text_Color]'><b>[src] [Message]</b></font color>", "[src]([src.key]) hit with [src.AttackQueue].")
			Delay/=5
		if(src.AttackQueue.Rapid||src.AttackQueue.Launcher)
			Delay/=10//gatta go fass.

	var/obj/Items/Sword/s=src.EquippedSword()
	var/obj/Items/Sword/s2=src.EquippedSecondSword()
	if(!s2 && UsingDualWield()) s2 = s
	var/obj/Items/Sword/s3=src.EquippedThirdSword()
	if(!s3 && UsingTrinityStyle()) s3 = s
	var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
	var/Accuracy=1
	var/Damage
	var/DamageRoll=src.GetDamageMod()

	Damage=src.Power*DamageRoll//Normal


	if(s||!src.NotUsingLiving())
		UnarmedAttack=0
		SwordAttack=1

	if(src.AttackQueue)
		if(src.AttackQueue.NeedsSword)
			UnarmedAttack=0
			SwordAttack=1
		else
			UnarmedAttack=1
			SwordAttack=0

	if(src.UsingSunlight()||src.HasSpiritHand()&&(UnarmedAttack||SwordAttack))
		if(src.StyleActive!="Sunlight"&&src.StyleActive!="Moonlight"&&src.StyleActive!="Atomic Karate"&&!src.CheckSpecial("Prana Burst"))
			Damage*=src.GetStr()*min(2,max(src.GetFor(0.25),1.25))
		else
			Damage*=src.GetStr()*min(4,max(src.GetFor(0.5),1.5))
	else if(SwordAttack&&src.HasSpiritSword())
		Damage*=(src.GetStr(src.GetSpiritSword())+src.GetFor(src.GetSpiritSword()))
	else if(src.HasHybridStrike())
		Damage*=(src.GetStr(src.GetHybridStrike())+src.GetFor(src.GetHybridStrike()))
	else if(src.HasSpiritStrike())
		Damage*=src.GetFor()
	else
		Damage*=src.GetStr()

	if(!src.AttackQueue)
		if(src.HasDoubleStrike())
			if(prob(35*src.GetDoubleStrike()+(35*src.GetTripleStrike()))&&!SecondStrike)
				Melee(SecondStrike=1)
			if(src.HasTripleStrike())
				if(prob(35*src.GetTripleStrike())&&SecondStrike&&!ThirdStrike)
					Melee(SecondStrike=1,ThirdStrike=1)

	if(st)
		if(src.UsingBattleMage())
			Delay/=src.GetStaffDrain(st)

			Damage*=src.GetStaffDamage(st)

			Accuracy*=src.GetStaffAccuracy(st)

	if(!SecondStrike&&!ThirdStrike)

		if((s||!src.NotUsingLiving())&&SwordAttack)

			Delay/=src.GetSwordDelay(s)

			Damage*=src.GetSwordDamage(s)

			Accuracy*=GetSwordAccuracy(s)

	if(SecondStrike&&!ThirdStrike)

		if(s2&&SwordAttack)

			Delay/=src.GetSwordDelay(s2)

			Damage*=src.GetSwordDamage(s2)

			Accuracy*=GetSwordAccuracy(s2)

		else if((s||!src.NotUsingLiving())&&!s2&&SwordAttack)

			Delay/=src.GetSwordDelay(s)

			Damage*=src.GetSwordDamage(s)

			Accuracy*=GetSwordAccuracy(s)

		else if(src.ArcaneBladework&&st)

			Delay/=src.GetStaffDrain(st)

			Damage*=src.GetStaffDamage(st)

			Accuracy*=src.GetStaffAccuracy(st)

			SwordAttack=0

	if(SecondStrike&&ThirdStrike)

		if(s3&&SwordAttack)

			Delay/=src.GetSwordDelay(s3)

			Damage*=src.GetSwordDamage(s3)

			Accuracy*=GetSwordAccuracy(s3)

		else if((s||!src.NotUsingLiving())&&!s3&&SwordAttack)

			Delay/=src.GetSwordDelay(s)

			Damage*=src.GetSwordDamage(s)

			Accuracy*=GetSwordAccuracy(s)


	var/WarpingStrike=0
	if(src.AttackQueue&&!src.AttackQueue.NoWarp)
		if(src.AttackQueue.Warp)
			if(!src.AttackQueue.InstantStrikes)
				WarpingStrike=src.AttackQueue.Warp
			else
				WarpingStrike=src.AttackQueue.Warp
				if(src.AttackQueue.InstantStrikesDelay<2)
					src.AttackQueue.NoWarp=1
	if(src.UsingIaido())
		var/ReqCounter=0
		if(src.HasSword())
			if(src.UsingTrinityStyle())
				switch(s.Class)
					if("Wooden")
						ReqCounter+=8
					if("Light")
						ReqCounter+=3
					if("Medium")
						ReqCounter+=5
					if("Heavy")
						ReqCounter+=8
				switch(s2.Class)
					if("Wooden")
						ReqCounter+=8
					if("Light")
						ReqCounter+=3
					if("Medium")
						ReqCounter+=5
					if("Heavy")
						ReqCounter+=8
				switch(s3.Class)
					if("Wooden")
						ReqCounter+=8
					if("Light")
						ReqCounter+=3
					if("Medium")
						ReqCounter+=5
					if("Heavy")
						ReqCounter+=8
			else if(src.UsingDualWield())
				switch(s.Class)
					if("Wooden")
						ReqCounter+=13
					if("Light")
						ReqCounter+=5
					if("Medium")
						ReqCounter+=8
					if("Heavy")
						ReqCounter+=13
				switch(s2.Class)
					if("Wooden")
						ReqCounter+=13
					if("Light")
						ReqCounter+=5
					if("Medium")
						ReqCounter+=8
					if("Heavy")
						ReqCounter+=13
			switch(s.Class)
				if("Wooden")
					ReqCounter=25
				if("Light")
					ReqCounter=10
				if("Medium")
					ReqCounter=15
				if("Heavy")
					ReqCounter=25
		else
			ReqCounter=10
		if(src.UsingIaido()>1)
			ReqCounter-=((src.UsingIaido()-1)*5)
		if(src.Saga=="Weapon Soul"&&src.SagaLevel>=2)
			ReqCounter=max(1, ReqCounter-3)
		if(src.IaidoCounter>=ReqCounter)
			WarpingStrike=5

	if(src.UsingKendo()&&src.HasSword())
		var/ReqCounter
		if(s.Class=="Wooden")
			ReqCounter=10
		else
			ReqCounter=20
		if(src.IaidoCounter>=ReqCounter)
			WarpingStrike=5


	if(src.UsingSpeedRave())
		var/ReqCounter=10
		if(src.IaidoCounter>=ReqCounter)
			WarpingStrike=3

	if(src.Warping)
		WarpingStrike=src.Warping
		if(WarpingStrike<2)
			WarpingStrike=2//Make sure that you can at least warp from one tile away.

	if(src.BladeMode)
		if(src.Target)
			if(!src.CheckSlotless("Blade Mode"))
				if(src.Target.Launched||src.Target.Stunned)
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Blade_Mode, src))
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Blade_Mode)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Blade_Mode/bm in src)
						if(!bm.Using)
							animate(src.client, color = list(0.5,0.5,0.55, 0.6,0.6,0.66, 0.31,0.31,0.37, 0,0,0), time = 3)
							bm.Trigger(src)


	if(WarpingStrike)
		if(src.Target)
			if(src.Target!=src)
				if(src.Target in view(WarpingStrike, src))
					forcewarp=src.Target

	if(forcewarp)
		src.Comboz(forcewarp)
		if(src.IaidoCounter)
			src.IaidoCounter=0

	if(src.UsingFencing()&&src.HasSword())
		switch(s.Class)
			if("Wooden")
				Delay/=1.1
			if("Light")
				Delay/=1.3
			if("Medium")
				Delay/=1.5
			if("Heavy")
				Delay/=1.1
		if(src.UsingFencing()>1)
			Delay/=(1+((src.UsingFencing()-1) * 0.25))
		if(src.Saga=="Weapon Soul"&&src.SagaLevel>=2)
			Delay/=1.25
	if(src.UsingKendo()&&src.HasSword())
		if(s.Class=="Wooden")
			Delay/=1.5
			if(src.UsingKendo()>1)
				Delay/=(1+((src.UsingKendo()-1)*0.25))
		else
			Delay/=1.25
			if(src.UsingKendo()>1)
				Delay/=(1+((src.UsingKendo()-1)*0.25))
	if(src.UsingFencing()&&!src.HasSword())
		if(src.UsingBattleMage())
			Delay/=1.5
		else
			Delay/=1.3
	if(src.UsingSpeedRave())
		Delay/=1.25
	if(src.UsingCriticalImpact())
		Delay*=1.25//yer slow as fuck 'arry

	if(!BreakAttackRate) src.NextAttack = world.time

	var/list/Pawnch=list()
	if(src.AttackQueue&&src.AttackQueue.PrecisionStrike)
		for(var/mob/Yo in view(src.AttackQueue.PrecisionStrike, src))
			if(Yo!=src&&Yo.density)
				if(Yo==src.Target)
					if(Yo in get_step(src,dir))
						Pawnch:Add(Yo)
					else
						Pawnch:Add(Yo)
						src.NextAttack+=10
	else  if(src.HasSweepingStrike()&&!src.AttackQueue)
		for(var/mob/Yo in oview(1, src))
			if(Yo!=src&&Yo.density)
				Pawnch:Add(Yo)
	else
		for(var/mob/Yo in get_step(src,dir))
			if(Yo.density)
				Pawnch:Add(Yo)
	if(src.Grab)
		Pawnch.Add(src.Grab)
	if(src.party)
		Pawnch.Remove(src.party.members)
	if(Pawnch.len>0)
		src.NextAttack+=Delay
		for(var/mob/P in Pawnch)
			if(P==src)
				continue
			if(P.Stasis)
				continue

			if(src.StyleActive=="Rhythm of War")
				if(!locate(/obj/Skills/Projectile/Warsong, src))
					src.AddSkill(new/obj/Skills/Projectile/Warsong)
				for(var/obj/Skills/Projectile/Warsong/sk in src)
					src.UseProjectile(sk)


/*			if(P.pixel_z!=src.pixel_z)
				if(src.pixel_z==0)
					VanishImage(src)
				src.pixel_z=P.pixel_z*/

			var/obj/Items/Armor/HittingArmor=P.EquippedArmor()
			var/obj/Items/Armor/WearingArmor=src.EquippedArmor()

			//Reduced damage
			if(HittingArmor)
				Damage/=P.GetArmorDamage(HittingArmor)

			//Reduced delay and accuracy
			if(WearingArmor)
				Accuracy*=src.GetArmorAccuracy(WearingArmor)
				Delay/=src.GetArmorDelay(WearingArmor)

			if(speedmulti)
				Delay/=speedmulti
			if(damagemulti)
				Damage*=damagemulti

			var/BlahX=1

			if(src.HasPridefulRage())
				BlahX=(P.Power*min(P.GetEnd(),1))
			else
				BlahX=(P.Power*P.GetEnd())

			if(BlahX<=0)
				BlahX=1

			Damage/=BlahX


			var/Knock_Distance=round(round(GoCrand(1,3),0.5)*(src.Power/P.Power)*max(1,src.GetStr()/P.GetEnd()))
			if(src.KBMult)
				Knock_Distance*=src.KBMult
			if(src.KBAdd)
				Knock_Distance+=src.KBAdd

			if(src.UsingZornhau()&&src.HasSword())
				switch(s.Class)
					if("Wooden")
						Knock_Distance+=1
					if("Light")
						Knock_Distance+=1
					if("Medium")
						Knock_Distance+=2
					if("Heavy")
						Knock_Distance+=3
				if(src.UsingZornhau()>1)
					Knock_Distance+=src.UsingZornhau()
				if(src.Saga=="Weapon Soul"&&src.SagaLevel>=2)
					Knock_Distance+=2
			if(src.UsingKendo()&&src.HasSword())
				if(s.Class=="Wooden")
					Knock_Distance+=(2*src.UsingKendo())
				else
					Knock_Distance+=2

			if(src.UsingCriticalImpact())
				Knock_Distance*=2

			if(src.UsingFencing())
				NoKB=1
			if(src.Grab==P)
				Knock_Distance+=5//yeet that bitch
				src.Grab=null

			if(src.AttackQueue)//Queued techniques like Axe Kick, Headbutt, and GET DUNKED.
				Damage*=src.QueuedDamage(P)
				if(src.QueuedKBMult()<1&&!src.QueuedKBAdd())
					NoKB=1
				else
					Knock_Distance*=src.QueuedKBMult()
				Knock_Distance+=src.QueuedKBAdd()

			if(!Accuracy_Formula(src,P,Accuracy*accmulti))
				Accuracy=0

			if(P.icon_state=="Meditate"||P.KO) Accuracy=1

			Melee_Graphics()
			var/Countered=0

			if((src.AttackQueue&&src.AttackQueue.Dunker&&P.Launched))
				if(src.AttackQueue.Dunker)
					spawn()
						Jump(src)
					sleep(3)
					spawn()
						LaunchLand(P)
			else if(!src.AttackQueue && (P.Launched || P.Stunned)) //suffering prevention on high attack speed builds
				Damage*=1/3

			if(!src.AttackQueue && src.HotHundred)
				LightAttack=1
				var/Adjust=0
				src.Comboz(P, LightAttack=1)
				if(src.HotHundred)
					LightAttack=0
					Adjust=src.HotHundred-1

				Damage/=max(1,3-Adjust)
				if(!Adjust)
					NoKB=1
				if(SecondStrike || ThirdStrike)
					Damage *= 0.5
				NextAttack = world.time + 2

			if(((P.AttackQueue&&(P.AttackQueue.Counter||P.AttackQueue.CounterTemp))||(P.BusterTech&&P.BusterTech.CounterShot))&&(!P.Stunned&&!P.Launched)&&!IgnoreCounter)
				P.dir=get_dir(P, src)
				if(P.BusterTech&&P.BusterTech.CounterShot)
					P.UseProjectile(P.BusterTech)
				else
					if(!src.AttackQueue||!(src.AttackQueue&&(src.AttackQueue.Counter||src.AttackQueue.CounterTemp)))
						Countered=P.AttackQueue.Counter+P.AttackQueue.CounterTemp
					if(P.UsingAnsatsuken())
						P.HealMana(P.SagaLevel)
					if(Countered && P.CanAttack())
						P.Melee(TrueDamage(1+Countered),2,0,0,null,null,0,0,2,1,0,1)

			if(P.Stunned)
				Accuracy=1

			if(!Countered)
				var/Dodged=0
				var/DisperseX=rand(-8,8)
				var/DisperseY=rand(-8,8)

				if(Accuracy)

					if(!P.NoDodge)

						if(P.HasFlow()&&!IgnoreCounter)
							var/FlowClarity=1
							var/inst=src.HasInstinct()
							if(inst)
								FlowClarity=0.5+max(min(((P.GetFlow()-inst)*0.25),0.5),(-0.5))
							if(prob(12.5*FlowClarity*sqrt(P.GetFlow())))
								if(src.AttackQueue)
									if(src.AttackQueue.HitSparkIcon)
										DisperseX=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
										DisperseY=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
										src.HitEffect(P, UnarmedAttack, SwordAttack, SecondStrike, ThirdStrike, DisperseX, DisperseY)
								if(P.CheckSpecial("Ultra Instinct"))
									StunClear(P)
									UltraPrediction(P)
								else
									StunClear(P)
									WildSense(P, src, 0)
								Dodged=1
								if(P.CombatCPU)
									P.LoseMana(1)


						if(P.AfterImageStrike>0&&!Dodged)
							P.AfterImageStrike-=1
							if(P.AfterImageStrike<0)
								P.AfterImageStrike=0
							var/inst=src.HasInstinct()
							if(prob(100-(inst*25)))
								if(src.AttackQueue)
									if(src.AttackQueue.HitSparkIcon)
										DisperseX=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
										DisperseY=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
										src.HitEffect(P, UnarmedAttack, SwordAttack, SecondStrike, ThirdStrike, DisperseX, DisperseY)
								StunClear(P)
								AfterImageStrike(P,src,1)
								Dodged=1
							else
								StunClear(P)
								AfterImageStrike(P,src,0)
								AfterImageStrike(src,P,0)

					else

						if(P.AfterImageStrike>0&&!src.NoDodge&&!Dodged&&!IgnoreCounter)
							P.AfterImageStrike-=1
							if(P.AfterImageStrike<0)
								P.AfterImageStrike=0
							var/inst=src.HasInstinct()
							if(prob(100-(inst*25)))
								if(src.AttackQueue)
									if(src.AttackQueue.HitSparkIcon)
										DisperseX=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
										DisperseY=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
										src.HitEffect(P, UnarmedAttack, SwordAttack, SecondStrike, ThirdStrike, DisperseX, DisperseY)
								P.dir=get_dir(P,src)
								StunClear(P)
								P.NextAttack=0
								P.Melee(1, 1, SureKB=1)
								Dodged=1
							else
								StunClear(P)
								AfterImageStrike(src,P,0)

					if(!Dodged)

						STRIKE

						if(src.UsingSpellWeaver())
							if(prob(50))
								if(!locate(/obj/Skills/Projectile/DancingBlast, src))
									src.AddSkill(new/obj/Skills/Projectile/DancingBlast)
								for(var/obj/Skills/Projectile/DancingBlast/db in src)
									src.UseProjectile(db)
									break
						if(P.GiantForm||P.HasLegendaryPower() >= 1)
							Damage/=DamageRoll
							DamageRoll = max(1, DamageRoll-4)
							Damage*=DamageRoll//Take out the damage mult

						if(!Accuracy_Formula(src,P,BaseChance=global.WorldWhiffRate, IgnoreNoDodge=1)||src.AttackQueue&&src.AttackQueue.NoWhiff)
							if(!src.NoWhiff)
								Damage/=3

						if(P.EnergySiphon)
							if(src.HasSpiritHand()||src.HasSpiritSword()||src.HasHybridStrike()||src.UsingSpiritStrike())
								var/Heal=Damage*P.EnergySiphon//Energy siphon is a value from 0.1 to 1 which reduces damage and heals energy.
								if(src.HasSpiritSword())
									Heal*=src.GetSpiritSword()
								else if(src.HasHybridStrike())
									Heal*=src.GetHybridStrike()
								Damage-=Heal//negated
								P.HealEnergy(Heal)

						if(src.AttackQueue)
							if(src.AttackQueue.Dunker)
								if(P.Launched)
									P.Dunked=src.AttackQueue.Dunker
									LightAttack=0
									NoKB=0
									SureKB=1
									Knock_Distance+=2*src.AttackQueue.Dunker
							if(src.AttackQueue.MortalBlow)
								if(prob(100*src.AttackQueue.MortalBlow))
									var/MortalDamage = P.Health * 0.15
									P.LoseHealth(MortalDamage)
									P.WoundSelf(MortalDamage)
									P.MortallyWounded+=1
									src << "<b><font color=#ff0000>You mortally injure [P]!</font></b>"

						src.DoDamage(P, Damage, UnarmedAttack, SwordAttack, SecondStrike, ThirdStrike) //melee dmg

						if(src.UsingAnsatsuken())
							src.HealMana(src.SagaLevel/8)

						var/OtherDmg=BalanceDamage(Damage+src.GetIntimidation())*(1+(2*src.GetGodKi()))

						if(src.UsingZornhau()&&src.HasSword())
							switch(s.Class)
								if("Wooden")
									OtherDmg*=1
								if("Light")
									OtherDmg*=1
								if("Medium")
									OtherDmg*=1.25
								if("Heavy")
									OtherDmg*=1.5
							if(src.UsingZornhau()>1)
								OtherDmg*=src.UsingZornhau()/1.5
							if(src.Saga=="Weapon Soul"&&src.SagaLevel>=2)
								OtherDmg*=1.25
						if(src.UsingKendo()&&src.HasSword())
							if(s.Class=="Wooden")
								OtherDmg*=(1+(src.UsingKendo()*0.5))
							else
								OtherDmg*=(1+(src.UsingKendo()*0.25))

						if(src.UsingCriticalImpact())
							OtherDmg*=1.5

						var/Shocked=0
						if(src.AttackQueue)
							if(src.AttackQueue.HitSparkDispersion)
								DisperseX=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
								DisperseY=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
							if(src.AttackQueue.PushOut)
								var/Shockwaves=src.AttackQueue.PushOutWaves
								var/ShockSize=src.AttackQueue.PushOut
								var/ShockIcon=src.AttackQueue.PushOutIcon
								for(var/wav=Shockwaves, wav>0, wav--)
									KenShockwave(P,icon=ShockIcon,Size=ShockSize)
									ShockSize/=2
								Shocked=1

						src.HitEffect(P, UnarmedAttack, SwordAttack, SecondStrike, ThirdStrike, DisperseX, DisperseY)
						if(src.AttackQueue)
							if(src.AttackQueue.WarpAway)
								WarpEffect(P, src.AttackQueue.WarpAway)

						if(src.UsingVortex()&&OtherDmg>=3)
							for(var/mob/m in oview(round(OtherDmg/3,1),src))
								m.AddSlow(max(OtherDmg/3,5), src)

						if(OtherDmg >=3||src.AttackQueue&&src.QueuedKBAdd()||SureKB)
							if(!Shocked)
								KenShockwave(P,Size=max(OtherDmg*GoCrand(0.04,0.4),0.2),PixelX=DisperseX,PixelY=DisperseY, Time=6)
							var/QuakeIntensity=OtherDmg
							if(QuakeIntensity>24)
								QuakeIntensity=24
							spawn()
								P.Earthquake(QuakeIntensity,-4,4,-4,4)

						if((SureKB||src.AttackQueue&&src.QueuedKBAdd())&&!NoKB)
							Knock_Distance=round(Knock_Distance)
							if(SureKB&&Knock_Distance<max(SureKB,5))
								Knock_Distance=max(SureKB,5)
							if(!src.AttackQueue||src.AttackQueue&&!src.AttackQueue.Grapple)
								src.Knockback(Knock_Distance,P)

						if(src.AttackQueue)

							if(src.AttackQueue.Launcher)
								var/Time=src.AttackQueue.Launcher
								if(!P.Launched)
									spawn()
										LaunchEffect(src, P, Time)
								else
									P.Launched+=5

							if(src.AttackQueue.InstantStrikes)
								if(src.AttackQueue.InstantStrikesDelay)
									sleep(src.AttackQueue.InstantStrikesDelay)
								if(src.AttackQueue.InstantStrikesPerformed<src.AttackQueue.InstantStrikes-1)
									src.AttackQueue.InstantStrikesPerformed++
									goto STRIKE

							src.QueuedHitMessage(P)//Displays hit message, if it exists
							if(src.AttackQueue.SpecialEffect)
								if(src.AttackQueue.SpecialEffect=="Darkness")
									var/image/i=image(icon='Night.dmi', layer=MOB_LAYER+1)
									for(var/turf/t in Turf_Circle(P, src.AttackQueue.SpecialEffectRange))
										spawn(rand(2,8))
											t.overlays+=i
											spawn(20)
												t.overlays-=i
								if(src.AttackQueue.SpecialEffect=="Ice")
									for(var/turf/T in Turf_Circle(P,src.AttackQueue.SpecialEffectRange))
										spawn(rand(4,8))new/turf/Ice1(locate(T.x, T.y, T.z))
										spawn(rand(4,8))Destroy(T)
								if(src.AttackQueue.SpecialEffect=="Fire")
									for(var/turf/T in Turf_Circle(P,src.AttackQueue.SpecialEffectRange))
										spawn(rand(4,8))new/turf/Waters/Water7(locate(T.x, T.y, T.z))
										spawn(rand(4,8))Destroy(T)
								if(src.AttackQueue.SpecialEffect=="Thunder")
									LightningBolt(P,src.AttackQueue.SpecialEffectRange)
								if(src.AttackQueue.SpecialEffect=="Smash")
									for(var/turf/T in Turf_Circle(P,src.AttackQueue.SpecialEffectRange))
										sleep(-1)
										Dust(T)
							if(src.AttackQueue.Grapple)
								src.Grab_Mob(P, Forced=1)
							if(src.AttackQueue.Explosive)
								Bang(P.loc, src.AttackQueue.Explosive)
							if(src.AttackQueue.Shining)
								P.Shockwave(src.AttackQueue.Shining, 1)
							if(src.AttackQueue.MultiHit)
								src.AttackQueue.HitsUsed++
								if(src.AttackQueue.InstantStrikes)
									src.AttackQueue.InstantStrikesPerformed=0
								if(src.AttackQueue.HitsUsed>=src.AttackQueue.MultiHit)
									src.AttackQueue.HitsUsed=0
									src.ClearQueue()
									sleep()
							else
								if(!src.AttackQueue.Combo)
									src.ClearQueue()
									sleep()
								else if(src.AttackQueue.Combo)
									if(src.AttackQueue.InstantStrikes)
										src.AttackQueue.InstantStrikesPerformed=0
									if(src.AttackQueue.ComboPerformed>=src.AttackQueue.Combo)
										src.ClearQueue()
										sleep()


				else
					if(P.CheckSpecial("Ultra Instinct"))
						if(src.AttackQueue)
							if(src.AttackQueue.HitSparkIcon)
								DisperseX=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
								DisperseY=rand((-1)*src.AttackQueue.HitSparkDispersion,src.AttackQueue.HitSparkDispersion)
								src.HitEffect(P, UnarmedAttack, SwordAttack, SecondStrike, ThirdStrike, DisperseX, DisperseY)
						UltraPrediction2(P, src)
					else if(src.AttackQueue&&src.AttackQueue.NoWhiff)
						P.dir=get_dir(P,src)
						flick("Attack", P)
						if(!LightAttack)
							KenShockwave(P,icon='KenShockwave.dmi',Size=(src.GetIntimidation()+P.GetIntimidation())*0.4,PixelX=((P.x-src.x)*(-16)+pick(-12,-8,8,12)),PixelY=((P.y-src.y)*(-16)+pick(-12,-8,8,12)), Time=6)
						if(src.AttackQueue&&src.AttackQueue.DrawIn)//Queued techniques like Axe Kick, Headbutt, and GET DUNKED.
							AddAttracted((src.AttackQueue.DrawIn*src.QueuedDamage(P)),P)
					else if(!Accuracy_Formula(src,P,BaseChance=(global.WorldWhiffRate))&&!src.NoWhiff||Dodged)
						spawn()
							Dodge(P)
					else
						P.dir=get_dir(P,src)
						flick("Attack", P)
						if(!LightAttack)
							KenShockwave(P,icon='KenShockwave.dmi',Size=max((src.GetIntimidation()+P.GetIntimidation())*GoCrand(0.04,0.4),0.2),PixelX=((P.x-src.x)*(-16)+pick(-12,-8,8,12)),PixelY=((P.y-src.y)*(-16)+pick(-12,-8,8,12)), Time=6)
						if(P.UsingAnsatsuken())
							P.HealMana(P.SagaLevel)
						if(src.AttackQueue&&src.AttackQueue.DrawIn)//Queued techniques like Axe Kick, Headbutt, and GET DUNKED.
							AddAttracted((src.AttackQueue.DrawIn*src.QueuedDamage(P)),P)
					if(src.AttackQueue)
						spawn()
							src.QueuedMissMessage()//displays miss message, clears queue, and does any effects.

			if(forcewarp)
				if(src.StyleActive=="Secret Knife")
					if(!locate(/obj/Skills/Projectile/Secret_Knives, src))
						src.AddSkill(new/obj/Skills/Projectile/Secret_Knives)
					for(var/obj/Skills/Projectile/Secret_Knives/sk in src)
						src.UseProjectile(sk)
				if(src.StyleActive=="Blade Singing")
					if(!locate(/obj/Skills/Projectile/Murder_Music, src))
						src.AddSkill(new/obj/Skills/Projectile/Murder_Music)
					for(var/obj/Skills/Projectile/Murder_Music/sk in src)
						if(src.CheckSlotless("Legend of Black Heaven"))
							if(sk.IconLock=='CheckmateKnives.dmi')
								sk.IconLock='Soundwave.dmi'
						src.UseProjectile(sk)

			if(Delay<=0.5)
				Delay=0.5
	else
		var/TurfDamage=(src.potential_power_mult*src.PowerBoost*src.Power_Multiplier*src.AngerMax)*(src.GetStr(3)+src.GetFor(2)+src.GetIntimidation()+(10*src.GetWeaponBreaker()))
		for(var/turf/T in get_step(src,src.dir))
			Melee_Graphics()
			T.Health-=TurfDamage
			if(T.Health<=0) Destroy(T)
			return
		for(var/obj/P in get_step(src,src.dir))
			if(!P.Attackable)
				continue
			Melee_Graphics()
			for(var/obj/Seal/S in P)
				if(src.ckey!=S.Creator)
					TurfDamage=0
			if(P.Destructable)
				if(P.Health<=TurfDamage)
					Destroy(P)
			return
		if(src.HasSpecialStrike())
			Melee_Graphics()
			NextAttack=world.time
			if(src.CheckSpecial("Ray Gear"))
				if(src.AttackQueue)
					if(src.AttackQueue.Warp)
						if(!locate(/obj/Skills/Projectile/Homing_Ray_Missiles, src))
							src.AddSkill(new/obj/Skills/Projectile/Homing_Ray_Missiles)
						for(var/obj/Skills/Projectile/Homing_Ray_Missiles/pc in src)
							src.UseProjectile(pc)
					else
						if(!locate(/obj/Skills/Projectile/Plasma_Cannon, src))
							src.AddSkill(new/obj/Skills/Projectile/Plasma_Cannon)
						for(var/obj/Skills/Projectile/Plasma_Cannon/pc in src)
							src.UseProjectile(pc)
					src.ClearQueue()
					NextAttack+=15
				else
					if(!locate(/obj/Skills/Projectile/Machine_Gun_Burst, src))
						src.AddSkill(new/obj/Skills/Projectile/Machine_Gun_Burst)
					for(var/obj/Skills/Projectile/Machine_Gun_Burst/pc in src)
						src.UseProjectile(pc)
					NextAttack+=15
			else if(src.CheckSpecial("Wisdom Form"))
				if(!locate(/obj/Skills/Projectile/Wisdom_Form_Blast, src))
					src.AddSkill(new/obj/Skills/Projectile/Wisdom_Form_Blast)
				for(var/obj/Skills/Projectile/Wisdom_Form_Blast/pc in src)
					src.UseProjectile(pc)
				NextAttack+=15
			else if(src.CheckSlotless("OverSoul"))
				if(!locate(/obj/Skills/AutoHit/DurendalPressure, src))
					src.AddSkill(new/obj/Skills/AutoHit/DurendalPressure)
				for(var/obj/Skills/AutoHit/DurendalPressure/pc in src)
					src.Activate(pc)
				NextAttack+=15
			else if(src.CheckSlotless("Heavenly Ring Dance"))
				if(src.Target&&src.Target!=src)
					src.Target.Frozen=1
					src.Target.AddCrippled(20)
					if(src.Target.SenseRobbed<(src.SenseUnlocked-1)&&!src.AttackQueue&&src.TotalFatigue<50&&!BreakAttackRate)
						RecoverImage(src.Target)
						src.Target.SenseRobbed++
						src.GainFatigue(10)
						if(src.Target.SenseRobbed==1)
							src.Target << "You've been stripped of your sense of touch! You find it harder to move!"
						else if(src.Target.SenseRobbed==2)
							src.Target << "You've been stripped of your sense of smell! You find it harder to breathe!"
						else if(src.Target.SenseRobbed==3)
							src.Target << "You've been stripped of your sense of taste! You find it harder to speak!"
						else if(src.Target.SenseRobbed==4)
							src.Target << "You've been stripped of your sense of hearing! You find it harder to hear!"
						else if(src.Target.SenseRobbed==5)
							src.Target << "You've been stripped of your sense of sight! You find it harder to see!"
							animate(src.Target.client, color = list(-1,0,0, 0,-1,0, 0,0,-1, 1,1,1), time = 5)
						else if(src.Target.SenseRobbed==6)
							src.Target << "You've been stripped of your sixth sense! Your mind is clouded and your abilities are crippled!"
					else
						src.ClearQueue()
						src.Activate(new/obj/Skills/AutoHit/Heavenly_Ring_Dance)
						for(var/obj/Skills/Buffs/SlotlessBuffs/Heavenly_Ring_Dance/TH in usr)
							usr.UseBuff(TH)

					NextAttack+=30
					sleep(10)
					src.Target.Frozen=0
				else
					src.Activate(new/obj/Skills/AutoHit/Heavenly_Ring_Dance_Burst)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Heavenly_Ring_Dance/TH in usr)
						usr.UseBuff(TH)
			else if(src.CheckSlotless("Libra Armory")&&src.AttackQueue)
				if(!locate(/obj/Skills/Projectile/Libra_Slash, src))
					src.AddSkill(new/obj/Skills/Projectile/Libra_Slash)
				for(var/obj/Skills/Projectile/Libra_Slash/pc in src)
					src.UseProjectile(pc)
				src.ClearQueue()
				NextAttack+=15
			else if(src.CheckSlotless("Spirit Bow"))
				if(!locate(/obj/Skills/Projectile/Aether_Arrow, src))
					src.AddSkill(new/obj/Skills/Projectile/Aether_Arrow)
				for(var/obj/Skills/Projectile/Aether_Arrow/pc in src)
					src.UseProjectile(pc)
				NextAttack+=15
			return


mob/proc/SpeedDelay(var/Modifier=1)
	var/Spd=src.GetSpd()**0.5
	var/Delay=15/Spd
	if(Delay>=15)
		Delay=15
	if(src.HasBlastShielding())
		Delay*=3
	return max(Delay,2)


mob/proc/Knockback(var/Distance,var/mob/P,var/Direction=0, var/Forced=0, var/Ki=0, var/override_speed = 0)
	if(src)
		if(istype(src,/mob/Player/Afterimage))
			return
	if(P.Stasis)
		return
	if(!Direction)
		Direction=src.dir
	if(P.Desperation&&(!P.CyberCancel||P.Saga=="King of Braves"))
		if(prob(5*P.Desperation))
			Distance=0
	if(src.GiantForm||src.HasLegendaryPower()>=1)
		Distance*=2
	if(src.StyleActive=="Strong Fist"||src.StyleActive=="Atomic Karate")
		Distance*=2
		Forced=1
	if(P.ContinuousAttacking)
		for(var/obj/Skills/Projectile/p in P.contents)
			if(p.ContinuousOn && !p.StormFall)
				P.UseProjectile(p)
			continue
	if(P.GiantForm||P.HasLegendaryPower()>=1)
		Distance*=0.25
	if(src.KBMult)
		Distance*=src.KBMult
	if(P.KBRes)
		Distance/=P.KBRes
	if(!Forced)
		if(P.Juggernaut||P.HasLegendaryPower() > 0.25||P.VaizardHealth||P.is_dashing)
			return
	else
		if((2 > Forced) && (P.Juggernaut||P.HasLegendaryPower() > 0.25||P.VaizardHealth||P.is_dashing))
			Distance*=Forced/max(P.Juggernaut+P.HasLegendaryPower()+P.VaizardHealth+P.is_dashing,1)
	if(Distance>50)
		Distance=50
	if(Distance<=0.5)
		return
	if(Distance>=0.5&&Distance<1)
		Distance=1


	if(P.Knockbacked)
		P.Knockbacked=Direction
		P.Knockback+=Distance
	else
		P.BeginKB(Direction, Distance, Ki, override_speed = override_speed)

mob
	proc/BeginKB(var/Direction, var/Distance, var/Ki, override_speed)
		src.icon_state="KB"
		src.Knockbacked=Direction
		src.Knockback=Distance
		spawn()
			while(src.Knockback)
				src.ContinueKB(Ki)
				sleep(override_speed ? override_speed : 1)
			src.StopKB(Ki)
	proc/GetKBDir(var/DustBlock=0)
		spawn()
			var/dense=0
			for(var/atom/a in get_step(src, src.Knockbacked))
				if(a.density)
					if(istype(a, /obj/Items/Tech/Door))
						PlanetEnterBump(a, src)
						continue
					dense=1
					break
			if(dense)
				src.StopKB(DustBlock)
	proc/ContinueKB(var/DustBlock=0)
		set waitfor=0
		src.icon_state="KB"
		src.GetKBDir(DustBlock)
		if(src.KBFreeze())
			src.StopKB(DustBlock)
			return
		var/turf/NextTurf=get_step(src, src.Knockbacked)
		if(!NextTurf)//if you're trying to fly off the map or into blankspace
			src.StopKB(DustBlock)
			return
		step(src, src.Knockbacked)
		src.Knockback--
		if(!DustBlock)
			if(prob(5))
				Dust(src.loc)
				if(prob(5))
					Dust(src.loc)
		if(src.Knockback<0)
			src.Knockback=0
	proc/StopKB(var/DustBlock=0)
		if(!src.KO)
			src.icon_state=""
		else
			src.icon_state="KO"
		src.Knockbacked=null
		src.Knockback=null
		if(src.Dunked)
			var/Dunk=src.Dunked
			spawn()
				Crater(src,round(Dunk/2))
			src.Dunked=0
		else if(prob(20)&&src.pixel_z==0&&!DustBlock)
			Dust(src.loc)
			Dust(src.loc)


mob/proc/Melee_Graphics()
	flick("Attack",src)


mob/proc/Grab()
	if(src.Stunned||src.icon_state=="KB")
		return
	if(!Grab)
		if(src.Target&&src.Target!=src&&ismob(src.Target))
			src.DashTo(src.Target, 2)
			if(src.Target in oview(1, src))
				src.Grab_Mob(src.Target)
			for(var/obj/Skills/Grab/g in src)
				g.Cooldown(2)
		else
			var/list/Choices=new
			for(var/atom/O in get_step(src,dir))
				if((isobj(O)||ismob(O))&&O.Grabbable&&O.mouse_opacity)
					Choices+=O
				if(!ismob(O))
					var/obj/Seal/s = (locate(/obj/Seal) in O.contents)
					if(s && (s.Creator != src.ckey))
						Choices-=O
			var/mob/P=input(src,"Grab what?") in Choices
			if(!(locate(P) in get_step(src,dir)))
				return
			else if(istype(P,/obj/Items))
				var/obj/Items/buh=P
				if(buh.Pickable==1)
					src.OMessage(10,"[src] picks up [P].","[src]([src.key]) picks up [ExtractInfo(P)] made by [buh.CreatorKey].")
					if(buh.Stackable)
						var/found=0
						for(var/obj/Items/i in usr)
							if(i.type == P.type)
								i.TotalStack+=buh.TotalStack
								i.suffix="[Commas(i.TotalStack)]"
								del(P)
								return
						if(!found)
							buh.suffix="[Commas(buh:TotalStack)]"
					P.Move(src)
					if(istype(P, /obj/Items/Enchantment/PhilosopherStone/Magicite))
						var/obj/Items/Enchantment/PhilosopherStone/Magicite/Prime
						for(var/obj/Items/Enchantment/PhilosopherStone/Magicite/m2 in src)
							if(!Prime)
								Prime=m2
								continue
							else
								Prime.MaxCapacity+=m2.MaxCapacity
								Prime.CurrentCapacity+=m2.CurrentCapacity
								src << "Your magicite collects into a single cluster."
								del m2
								Prime.Update_Description()
					if(P.suffix=="*Equipped*")
						P.suffix=null
					return
				else
					src.Grab=P
					src.OMessage(10,"[src] grabbed [P]!","[src]([src.key]) grabs [ExtractInfo(P)]")
					src.Grab_Update()
			else if(istype(P,/obj/Money))
				var/obj/Money/buh=P
				src.GiveMoney(P.Level)
				src.OMessage(10,"[src] picks up [P].","[src]([src.key]) picks up ([P.Level])[ExtractInfo(P)] made by [buh.MoneyCreator].")
				del(P)
				return
			else if(ismob(P))
				if(!P.IsGrabbed())
					src.Grab_Mob(P)
			else
				src.Grab=P
				src.OMessage(10,"[src] grabbed [P]!","[src]([src.key]) grabs [ExtractInfo(P)]")
				src.Grab_Update()
	else
		src.Grab_Release()

mob/proc/Grab_Mob(var/mob/P, var/Forced=0)
	if(P.Frozen==2)
		return
	if(!Forced && (P.Fishman||P.HasGiantForm()||P.HasLegendaryPower()>=1)&&!P.KO&&P.icon_state!="Meditate")
		src.OMessage(10,"[src] fails to get a firm hold on [P]!","[src]([src.key]) fails to grab [ExtractInfo(P)]")
		return
	else
		src.Grab=P
		src.GrabTime = world.time
		src.OMessage(10,"[src] grabbed [P]!","[src]([src.key]) grabs [ExtractInfo(P)]")
		src.Grab_Update()
		src.Grab_Effects(P)

mob/proc/Grab_Release()
	src.Grab=null

mob/proc/Grab_Update()
	if(src.Grab)
		src.Grab.loc=src.loc
		if(istype(src.Grab,/mob/Player/AI))
			spawn(10)
				if(src.Grab&&istype(src.Grab,/mob/Player/AI))
					src.Grab_Release()
		if(istype(src.Grab,/mob))
			if(src.Grab.Grab)
				src.Grab.Grab.loc=Grab.loc
			if(src.Grab.Knockbacked||src.Knockbacked)
				src.Grab_Release()
		if(src.KO)
			src.Grab_Release()

mob/proc/Grab_Effects(var/mob/P)
	if(src.HasRipple())
		if(src.Oxygen > src.OxygenMax*0.9)
			src.OMessage(10,"[src] channels the Ripple into [P]...","[src]([src.key]) tests [ExtractInfo(P)]")
			src.Oxygen-=0.1*src.OxygenMax
			if(P.IsEvil())
				src.OMessage(10,"[P] shudders from sudden pain!")
			else
				if(P.MortallyWounded)
					P.MortallyWounded=0
					P.TsukiyomiTime=1
				if(P.SenseRobbed)
					if(P.SenseRobbed>=5)
						animate(P.client, color=null, time=3)
					P.SenseRobbed=0
				if(P.KO)
					P.Conscious()
	if(src.Lethal>=1)
		if(src.Secret=="Vampire")
			if(P.KO&&istype(P, /mob/Players))
				if(istype(P, /mob/Player/AI))
					src << "[P] is an AI!"
					return
				var/Choice=alert(src, "Do you wish to drain the life out of [P]?", "Vampire Grab", "Just A Little", "Yes", "No")
				if(P in range(1, src))
					if(Choice=="Yes")
						src.Grab=null
						P.Death(null, "[src] sucking out their life essence!!", 1, Zombie=1)
						P.BloodPower++
						src.TotalInjury/=2
						src.TotalFatigue/=2
						src.HealHealth(50)
						src.HealEnergy(25)
						src.HealMana(25)
					if(Choice=="Just A Little")
						OMsg(src, "[src] drives their hand into [P], draining away their life force!")
						P.BloodPower+=0.25
						if(!P.MortallyWounded)
							P.MortallyWounded+=1
							P.Health=-1
							src.HealHealth(25)
							src.HealEnergy(10)
							src.HealMana(10)
							//doesn't heal wounds and such
		if((src.Secret=="Werewolf"&&(src.CheckSlotless("New Moon Form")||src.CheckSlotless("Full Moon Form")))||src.Secret=="Zombie")
			if(P.KO&&istype(P, /mob/Players))
				if(istype(P, /mob/Player/AI))
					src << "[P] is an AI!"
					return
				var/Choice=alert(src, "Do you wish to devour [P]?", "Feast", "No", "Yes")
				if(P in range(1, src))
					if(Choice=="Yes")
						src.Grab=null
						if(src.Secret=="Werewolf")
							P.Death(null, "[src] ripping them apart!!", 1, NoRemains=1)
							src.TotalInjury=0
							src.HealHealth(50)
						else if(src.Secret=="Zombie")
							if(P.Class=="Eldritch")
								src << "[P]'s flesh is repulsive to you!"
								return
							if(P.Race=="Android")
								src << "[P]'s metallic form is repulsive to you!"
								return
							P.Death(null, "[src] feasting on their flesh!!", 1, Zombie=1)
							src.HealthCut=0
							if(src.HealthCut<0)
								src.HealthCut=0