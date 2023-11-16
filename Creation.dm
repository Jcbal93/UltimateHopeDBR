mob/Players
	Login()
		usr.density=1
		usr.client.view=8
		if(usr.Class=="Dance"||usr.Class=="Potara")
			usr.Savable=0

		else if(usr.Manufactured)
			usr.Savable=1
			usr.Redo_Stats()
			usr.EraAge=global.Era
			for(var/obj/Items/Tech/Android_Frame/A in world)
				if(A.Savable == src.ckey)
					del A
		else
			if(usr.Savable==0)
				usr.Savable=1
				usr.Finalize()
		if(!locate(/obj/Money) in src)
			src.contents += new/obj/Money
		usr.ssj["transing"]=0
		usr.trans["transing"]=0
		winshow(usr,"StatsWindow",0)
		winshow(usr,"StatsWindow2",0)
		for(var/e in list("Health","Energy","Power","Mana"))
			winset(src,"Bar[e]","is-visible=true")
		usr.client.show_verb_panel=1
		usr.Admin("Check")
		usr.overlays-='Emoting.dmi'
		if(!Mapper)
			for(var/obj/Skills/Fly/f in src)
				del f
		if(usr.calmcounter)
			usr.calmcounter=2

		for(var/obj/Items/I in usr)
			usr.AddItem(I, AlreadyHere=1)

		for(var/obj/Skills/S in usr)
			usr.AddSkill(S, AlreadyHere=1)

		if(src.RPPSpendable<0)
			src.RPPSpendable=0
		if(src.RPPSpendableEvent<0)
			src.RPPSpendableEvent=0
		if(src.RPPMult<1)
			src.RPPMult=1
		for(var/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm/da in src)
			if(src.Race=="Demon")
				da.name="Devil Arm ([src.TrueName])"


		var/obj/Items/Tech/protecc
		for(var/obj/Items/Tech/Anesthetics/ans in src)
			if(!protecc)
				protecc=ans
			else
				protecc.TotalStack++
				del ans

		if(!locate(/obj/Communication,usr.contents))
			usr.contents+=new/obj/Communication
		if(!locate(/obj/Skills/Meditate,usr.contents))
			usr.AddSkill(new/obj/Skills/Meditate)
		if(!locate(/obj/Skills/Queue/Heavy_Strike,usr.contents))
			usr.AddSkill(new/obj/Skills/Queue/Heavy_Strike)
		if(!locate(/obj/Skills/Grab,usr.contents))
			usr.AddSkill(new/obj/Skills/Grab)
		if(!locate(/obj/Skills/Grapple/Toss,usr.contents))
			usr.AddSkill(new/obj/Skills/Grapple/Toss)
		if(!locate(/obj/Skills/Dragon_Dash,usr.contents))
			usr.AddSkill(new/obj/Skills/Dragon_Dash)
			usr.AddSkill(new/obj/Skills/Reverse_Dash)
			usr.AddSkill(new/obj/Skills/Aerial_Payback)
			usr.AddSkill(new/obj/Skills/Aerial_Recovery)
		if(!locate(/obj/Skills/Target_Clear,usr.contents))
			usr.AddSkill(new/obj/Skills/Target_Clear)
			usr.AddSkill(new/obj/Skills/Target_Switch)
		if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Clash, usr))
			usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Clash)
		if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Clash_Defensive, usr))
			usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Clash_Defensive)
		if(!locate(/obj/Skills/Buffs/Stances/Stance_Selector, usr))
			usr.AddSkill(new/obj/Skills/Buffs/Stances/Stance_Selector)
		if(!locate(/obj/Skills/Buffs/Styles/Style_Selector, usr))
			usr.AddSkill(new/obj/Skills/Buffs/Styles/Style_Selector)

		if(!src.RewardsLastGained)//a clause for pretty much just androids
			src.RewardsLastGained=Yesterday()

		if(src.Race!="Shinjin" && src.PotentialRate>0)//if its not a kaio and its not an ec
			if(global.RPPHighest<src.GetRPP()/src.GetRPPMult())
				global.RPPHighest=src.GetRPP()/src.GetRPPMult()

		src.RegenMod="N/A"
		src.EnergyMod="N/A"
		src.RecovMod=2
		if(src.Race=="Human")
			src.RecovMod=1
			src.RecovAscension=0

		if(src.sig_reset<2)
			if(!src.Saga)
				src.SignatureSelected=list()
				for(var/obj/Skills/s in src)
					if(s.SignatureTechnique)
						if(istype(s, /obj/Skills/Buffs/NuStyle))
							continue
						if(istype(s, /obj/Skills/Buffs/SlotlessBuffs/Devil_Arm))
							continue
						if(istype(s, /obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade2))
							continue
						if(istype(s, /obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade3))
							continue
						del s

				src << "Your signatures have been reset."
			src.sig_reset=2
		if(src.zenkai_reset<2)
			if(src.Race=="Saiyan")
				if(src.ssj["unlocked"]>2)
					src.ssj["unlocked"]=2
				if(src.masteries["2mastery"]>50)
					src.masteries["2mastery"]=50
				src << "Your SSj level has been reset to 2, and your masteries are undone."
			src.zenkai_reset=2

		for(var/obj/Skills/Buffs/NuStyle/ns in src)
			var/obj/Skills/Buffs/NuStyle/Prime=ns
			for(var/obj/Skills/Buffs/NuStyle/ns2 in src)
				if(ns2==Prime)
					continue
				if(ns2.type==Prime.type)
					if(ns2.Mastery>Prime.Mastery)
						del Prime
					else
						del ns2
		if(src.Race=="Saiyan")
			for(var/obj/Skills/Buffs/b in src)
				if(b.SpecialSlot && !b.UnrestrictedBuff)
					if(src.CheckSpecial(b.BuffName))
						b.Trigger(src)
					del b
		if(sig_reset<3)
			if(src.PotentialRate>0)
				for(var/obj/Skills/Buffs/SlotlessBuffs/Sparking_Blast/sb in src)
					src << "Sparking Blast removed."
					del sb
				for(var/obj/Skills/Buffs/SlotlessBuffs/Unbound_Mode/sb in src)
					src << "Unbound Mode removed."
					del sb
				for(var/obj/Skills/Buffs/SlotlessBuffs/Legend_of_Black_Heaven/sb in src)
					src << "Legend of Black Heaven removed."
					del sb
				src.SignatureSelected.Remove("Sparking Blast")
				src.SignatureSelected.Remove("Unbound Mode")
				src.SignatureSelected.Remove("Legend of Black Heaven")
			sig_reset=3
		if(grimoire_reset<1)
			if(!src.Race=="Shinjin")
				if(locate(/obj/Skills/Utility/Grimoire_Arcana, src))
					for(var/obj/Skills/Utility/Grimoire_Arcana/ga in src)
						del ga
						src << "You have lost access to Grimoire Arcana."
				for(var/obj/Skills/Buffs/SlotlessBuffs/Grimoire/g in src)
					del g
				for(var/obj/Items/Gear/Pure_Grimoire/pa in src)
					del pa
				for(var/obj/Items/Gear/Prosthetic_Limb/Azure_Grimoire/ag in src)
					del ag
				for(var/obj/Items/Gear/Prosthetic_Limb/Blue_Grimoire/ag in src)
					del ag
				for(var/obj/Items/Gear/Crimson_Grimoire/cg in src)
					del cg
				for(var/obj/Skills/Utility/Contractor/c in src)
					del c
				for(var/obj/Items/Gear/Blood_Grimoire/bg in src)
					del bg
				for(var/obj/Skills/Queue/Ragna_Blade/rb in src)
					del rb
				for(var/obj/Skills/AutoHit/Giga_Slave/gs in src)
					del gs
				for(var/obj/Skills/Teleport/Traverse_Void/tv in src)
					del tv
				src << "You have lost access to any grimoires you had on you."
			grimoire_reset=1

		for(var/obj/Items/Enchantment/Magic_Crest/mc in src)
			for(var/obj/Skills/s in mc.Spells)
				if(s.Cooldown==-1)
					src << "[s] has been removed from your magic crest."
					mc.Spells.Remove(s)
				if(s.NoTransplant)
					src << "[s] has been removed from your magic crest."
					mc.Spells.Remove(s)


		if(src.NoSoul)
			src.NoSoul=0

		if(src.Potential<1)
			src.Potential=1
		src.potential_max()

		if(src.Imagination<=0)
			if(src.Race=="Android")
				src.Imagination=0.05
			else
				src.Imagination=0.25
		if(src.Intelligence<=0)
			src.Intelligence=0.25

		for(var/obj/Skills/Buffs/NuStyle/s in src)
			src.StyleUnlock(s)


		for(var/obj/Items/e in src)
			if(e.name=="" || e.name==null || !e.name)
				e.name="Item"

		src.potential_gain(0, npc=0)//set status message.

		for(var/obj/Skills/Buffs/NuStyle/ns in src)
			if(ns.Mastery==0)
				src << "[ns] has been removed from you on account of being a copied style."
				del ns

		for(var/obj/Items/Enchantment/Crystal_Ball/cb in src)
			if(cb.suffix)
				cb.suffix=null
				Reset_Overlays()

		//stop holding zanzo charges
		if(usr.ActiveZanzo)
			usr.ActiveZanzo=0
		for(var/obj/Skills/Zanzoken/z in usr)
			z.ZanzoAmount=0

		if(global.RPPTotal["[src.ckey]"])
			if(global.RPPTotal["[src.ckey]"] > global.RPPStarting)
				src.RPPCurrent=global.RPPTotal["[src.ckey]"]
				src.RPPTotal=global.RPPTotal["[src.ckey]"]

		if(!src.RPPCurrent)
			src.RPPCurrent=global.RPPStarting

		//automation
		src.reward_auto()//checks to see if its been a day

		if(last_online)
			var regen_time = (world.realtime - last_online)/10 //Seconds.
			if((TotalInjury + TotalFatigue + TotalCapacity) >= 10)
				usr << "You have been offline for [round(((world.realtime - last_online)/10)/60)] minutes. Your wound timer, injury, capacity, and fatigue have been restored accordingly."
			var/purerpmode
			if(regen_time >= 3600)
				purerpmode=PureRPMode
				PureRPMode=0
			Recover("Injury", regen_time)
			Recover("Fatigue", regen_time)
			Recover("Capacity", regen_time)

			if(regen_time >= 3600)
				PureRPMode=purerpmode

			BPPoisonTimer = max(1,BPPoisonTimer - regen_time)

			var/food_time=0
			if(src.Satiated)
				if(src.Satiated>=regen_time)
					src.Satiated-=regen_time
					food_time=regen_time
				else
					food_time=src.Satiated
					src.Satiated=0
					if(src.Drunk)
						src.Drunk=0
				BPPoisonTimer = max(1,BPPoisonTimer - food_time)
				if(src.StrTax)
					src.SubStrTax(0.5/RawDays(1)*food_time, Forced=1)
				if(src.EndTax)
					src.SubEndTax(0.5/RawDays(1)*food_time, Forced=1)
				if(src.SpdTax)
					src.SubSpdTax(0.5/RawDays(1)*food_time, Forced=1)
				if(src.ForTax)
					src.SubForTax(0.5/RawDays(1)*food_time, Forced=1)
				if(src.OffTax)
					src.SubOffTax(0.5/RawDays(1)*food_time, Forced=1)
				if(src.DefTax)
					src.SubDefTax(0.5/RawDays(1)*food_time, Forced=1)
				if(src.RecovTax)
					src.SubRecovTax(0.5/RawDays(1)*food_time, Forced=1)
			if(regen_time>food_time)
				regen_time-=food_time
				if(src.StrTax)
					src.SubStrTax(0.5/RawDays(1)*regen_time)
				if(src.EndTax)
					src.SubEndTax(0.5/RawDays(1)*regen_time)
				if(src.SpdTax)
					src.SubSpdTax(0.5/RawDays(1)*regen_time)
				if(src.ForTax)
					src.SubForTax(0.5/RawDays(1)*regen_time)
				if(src.OffTax)
					src.SubOffTax(0.5/RawDays(1)*regen_time)
				if(src.DefTax)
					src.SubDefTax(0.5/RawDays(1)*regen_time)
				if(src.RecovTax)
					src.SubRecovTax(0.5/RawDays(1)*regen_time)

			last_online = world.realtime

		if(usr.GiantForm)
			if(usr.appearance_flags<512)
				usr.appearance_flags+=512
		if(global.ContractBroken)
			if(usr.ckey in ContractBroken)
				usr << "One of your contracts was broken while you were asleep!"
				usr.SummonContract--
				global.ContractBroken.Remove(usr.ckey)
		for(var/obj/Skills/Buffs/b in usr.Buffs)
			if(!b.BuffName)
				b.BuffName="[b.name]"

		for(var/obj/Skills/Projectile/_Projectile/PS in src)
			del PS

		if(src.ModifyBaby)
			src.ModifyBaby=0
		if(src.ModifyEarly)
			src.ModifyEarly=0
		if(src.ModifyPrime)
			src.ModifyPrime=0
		if(src.ModifyLate)
			src.ModifyLate=0
		if(src.ModifyPrime)
			src.ModifyPrime=0

		if(src.Class=="Dance"||src.Class=="Potara")
			src.Timeless=1

		var/Dif=global.Era-src.EraAge


		if(!src.Timeless)
			if(src.Dead&&!src.DeadTime)
				src.DeadAge=Dif
				src.DeadTime=global.Era
			if(src.DeadAge)
				if(src.Dead)
					src.EraAge=global.Era-src.DeadAge
					Dif=global.Era-src.EraAge
				else
					src.DeadAge=0

			var/CurrentBody=src.EraBody
			var/Message
			//EraAge only tracks what era the person was born in; it does not move
			//global Era WILL move.
			if(Dif>=0&&(Dif-ModifyBaby)<1)
				src.EraBody="Child"
				Message="You are considered a child.  You're quite weak, but at least you have a long life ahead of you!"
				if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
					src.Tail(1)
			if((Dif-ModifyBaby)>=1&&(Dif-(ModifyBaby+ModifyEarly))<2)
				src.EraBody="Youth"
				Message="You are now considered a youth.  You're able to access more of your power, but your full potential hasn't been unleashed yet!"
				if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
					src.Tail(1)
			if((Dif-(ModifyBaby+ModifyEarly))>=2&&(Dif-(ModifyBaby+ModifyEarly+ModifyPrime))<4)
				src.EraBody="Adult"
				Message="You are now an adult, and you are able to access your full power!"
			if((Dif-(ModifyBaby+ModifyEarly+ModifyPrime))>=4&&(Dif-(ModifyBaby+ModifyEarly+ModifyPrime+ModifyLate))<5)
				src.EraBody="Elder"
				if(!locate(/obj/Skills/Utility/Teachz, src))
					src.AddSkill(new/obj/Skills/Utility/Teachz)
					src << "You can now teach those younger than you!"
				Message="You are now considered elderly and have permission to teach your techniques.  In just a few more years, you'll be reaching the end of your lifespan..."
			if((Dif-(ModifyBaby+ModifyEarly+ModifyPrime+ModifyLate))>=5)
				src.EraBody="Senile"
				Message="You have entered your last years of life."
				if(!locate(/obj/Skills/Utility/Teachz, src))
					src.AddSkill(new/obj/Skills/Utility/Teachz)
					src << "You can now teach those younger than you!"
			if((Dif-(ModifyBaby+ModifyEarly+ModifyPrime+ModifyLate+ModifyFinal))>=5)
				if(!src.EraDeathClock&&!src.Immortal)
					var/DeathClock=Day(7+GoCrand(0,1))
					var/DeathClockAdjustment=(Dif-5)
					if(DeathClockAdjustment>=0)
						DeathClock/=(5**DeathClockAdjustment)
					src.EraDeathClock=world.realtime+DeathClock
					Message+="<br><b>You will die from old age soon. Use your remaining time well.</b>"
			if(CurrentBody!=src.EraBody)
				src << Message
				if(src.EraBody=="Elder")
					src.RPPDonate=(src.RPPSpendable+src.RPPSpent)/4
				if(src.EraBody=="Senile")
					src.RPPDonate+=(src.RPPSpendable+src.RPPSpent)/2
		else
			if(Dif>=4)
				if(!locate(/obj/Skills/Utility/Teachz, src) && !(src.Class in list("Dance","Potara")) )
					src.AddSkill(new/obj/Skills/Utility/Teachz)
					src.RPPDonate+=(src.RPPSpendable+src.RPPSpent)/4
					src << "You can now teach those younger than you!"

		if(src.ParasiteCrest())
			var/obj/Items/Enchantment/Magic_Crest/mc=src.EquippedCrest()
			if(!mc.CrestMadeAge)
				mc.CrestMadeAge=global.Era
			if(global.Era > mc.CrestMadeAge)
				OMsg(src, "[src] struggles as their cursed crest begins to consume them!")
				spawn(66)
					src.Death(null, "being consumed by their cursed crest!", SuperDead=99)
					src.Reincarnate()

		src.SetCyberCancel()
		src.AppearanceOn()

		if(!src.MobColor)
			src.MobColor=list(1,0,0, 0,1,0, 0,0,1, 0,0,0)

		if(usr.Flying==null)
			usr.Flying=0

		for(var/obj/Regenerate/R in usr)
			if(R.X&&R.Y&&R.Z)
				spawn()
					Regenerate(R)
			break


		gain_loop.Add(src)
		var/list/lol=list("butt1","butt3","butt4","butt5")
		for(var/x in lol)
			winset(src,x,"'is-visible'=true")
		if(ScreenSize)
			src.client.view=ScreenSize


		if(usr.SenseRobbed>=5)
			animate(usr.client, color = list(-1,0,0, 0,-1,0, 0,0,-1, 1,1,1))

		if(src.StasisSpace)
			spawn()animate(src.client, color = list(-1,0,0, 0,-1,0, 0,0,-1, 0,1,1))

		spawn()src.FlickeringGlow(src)
		spawn()src.WindupGlow(src)

		src.CheckWeightsTraining()
		src.IgnoreFlyOver=0

		if(AllowObservers)
			winshow(src, "WatchersLabel",1)
		if(PureRPMode)
			for(var/obj/Skills/s in src)
				if(s.cooldown_remaining)
					s.Using=1
		else
			for(var/obj/Skills/s in src)
				s.cooldown_remaining=0
				s.cooldown_start=0
		for(var/obj/Redo_Stats/r in src)
			if(r.LoginUse) r.RedoStats(src)
		if(locate(/obj/Skills/Companion/arcane_follower) in src) is_arcane_beast = locate(/obj/Skills/Companion/arcane_follower) in src
		for(var/obj/Items/Tech/Vessel/v in world)
			if("[ckey] [EnergySignature]" in v.occupants) v.AddOccupant(src)
		return
	Logout()
		if(dancing) transform=dancing
		last_online = world.realtime
		gain_loop.Remove(src)
		for(var/mob/Player/AI/p in ai_followers)
			p.EndLife()
			ai_followers -= p
		if(src.party)
			src.party.remove_member(src)
		..()
		del(usr)



mob/Creation
	Login()
		usr.client.view=8
		usr<<browse("[basehtml][Notes]")
		if(copytext(usr.key,1,6)=="Guest")
			usr<<"Guest keys are disabled at this time, please login using a real key!"
			del(usr)

		for(var/e in list("Health","Energy","Power","Mana"))
			winset(src,"Bar[e]","is-visible=false")
		usr.CheckPunishment("Ban")
		usr.Gender="Male"
		if(usr.gender=="female")
			usr.Gender="Female"
		for(var/W in list("Grid1","Grid2","Finalize_Screen","Race_Screen"))
			winshow(usr,"[W]",0)
		usr.Admin("Check")

		usr<<"<font color='red'><b>READ THIS BEFORE PLAYING:</b></font>"
		usr<<"Wipe Topic: <a href='https://docs.google.com/document/d/1EDy4NyMlanXn1E72Uqc-RucCNziSqLKFcnu0lAo6_bc/edit'>Click Here</a>"
		usr<<"We have a Discord server at: https://discord.gg/HHVvRXp"
		usr<<"<br><font color=#FFFF00>Welcome to [world.name]!"
		usr<<"<b><small>Click the title screen to continue...</b><br>"
		usr.loc=locate(1,7,1)

	Logout()
		..()
		del(usr)





mob/var/tmp/race_selecting = 1
mob/Creation/verb
	RaceShift(var/blah as text)
		set hidden=1
		set name=".RaceShift"
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(!race_selecting)
			return
		if(blah=="+")
			UpdateRaceScreen("Race","+")
		if(blah=="-")
			UpdateRaceScreen("Race","-")
	IconSelect()
		set hidden=1
		set name=".Select_Icon"
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(usr.Race=="Human"||usr.Race=="Saiyan"||usr.Race=="Tuffle"||usr.Race=="Half Saiyan")
			usr.Grid("CreationHuman")
		else if(usr.Race=="Namekian")
			usr.Grid("CreationNamekian")
		else if(usr.Race=="Changeling")
			usr.Grid("CreationChangeling")
		else if(usr.Race=="Alien"||usr.Race=="Monster")
			usr.Grid("CreationAlien")
		else if(usr.Race=="Demon")
			usr.Grid("CreationDemon")
		else if(usr.Race=="Makyo")
			usr.Grid("CreationMakyo")
		else if(usr.Race=="Shinjin")
			usr.Grid("CreationKaio")
		else if(usr.Race=="Android")
			usr.Grid("CreationAndroid")
		else if(usr.Race=="Monster"&&usr.Class=="Eldritch")
			usr.icon='AlienSquid.dmi'
		else
			if(!usr.icon)
				usr.icon='MaleLight.dmi'
	PlanetShift(var/blah as text)
		set hidden=1
		set name=".PlanetShift"
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(!race_selecting)
			return
		if(blah=="+")
			UpdateRaceScreen("Planet","+")
		if(blah=="-")
			UpdateRaceScreen("Planet","-")

	NextStep()
		set hidden=1
		set name=".Next_Step"
		if(!race_selecting)
			return
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		race_selecting=0
		if(usr.Race=="Android")
			var/Choice
			var/list/Androids=list("Cancel")
			for(var/obj/Items/Tech/Android_Frame/A in world)
				if(A.Savable == usr.ckey)
					Choice = A
					break
				if(A.invisibility<=0&&A.CreatorKey)
					Androids.Add(A)
			if(!Choice)
				if(Androids.len<2)
					usr << "There are no free frames in the world."
					del usr
					return
				Choice = input("There are free Android frames in the world; would you like to activate one of them?","Android Activation") in Androids
				if(Choice!="Cancel")
					if(Choice:Password)
						var/Pass=input(usr, "This item is protected by a password; you have to provide it before inhabiting it.", "Remove Safety") as text
						if(Choice:Password!=Pass)
							usr << "That is not the correct password."
							del usr
							return
					usr.loc=Choice:loc
					usr.name=Choice:name
					usr.icon=Choice:icon
					usr.icon_state=Choice:icon_state
					usr.AscensionsUnlocked=Choice:Level
					usr.Manufactured=1
					del Choice
				else
					del usr
					return
		winshow(usr,"Race_Screen",0)
		winshow(usr,"Finalize_Screen",1)
		usr.RacialStats()
		usr.UpdateBio()
		usr<<output(usr, "IconUpdate:1,[usr]")
		spawn()
			Namez//label
			src.name=html_encode(copytext(input(src,"Name? (25 letter limit)"),1,25))
			if(!src.name)
				goto Namez
				return
			if(findtext(name,"\n"))
				world<<"[key] ([client.address]) tried to use their name to spam. They were booted."
				del(src)
				return
			usr.UpdateBio()

mob/Creation/proc
	NextStep2(mob/usrr)
		set hidden=1
		set name=".Next_Step2"
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(!usrr.race_selecting)
			return
		if(!usrr)
			usrr=usr
		usrr.race_selecting=0
		winshow(usrr,"Race_Screen",0)
		winshow(usrr,"Finalize_Screen",1)
		usrr.UpdateBio()
		usrr.RacialStats()
		usrr.UpdateBio()
		usrr<<output(usr, "IconUpdate:1,[usrr]")
		spawn()
			Namez//label
			usrr.name=html_encode(copytext(input(usrr,"Name? (25 letter limit)"),1,25))
			if(!usrr.name)
				goto Namez
				return
			if(findtext(usrr.name,"\n"))
				world<<"[usrr.key] ([usrr.client.address]) tried to use their name to spam. They were booted."
				del(usrr)
				return
			usrr.UpdateBio()

mob/Creation/verb
	AbortingCC()
		set hidden=1
		set name=".Aborting_CC"
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(race_selecting)
			return
		verb_delay=world.time+1
		race_selecting=1
		winshow(usr,"Race_Screen",1)
		winshow(usr,"Finalize_Screen",0)
		spawn()
			usr.UpdateRaceScreen()
	ToggleBlah(var/blah as text)
		set name=".ToggleBlah"
		set hidden=1
		if(race_selecting)
			return
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(blah=="Name")
			Namez
			src.name=html_encode(copytext(input(src,"Name? (25 letter limit)"),1,25))
			if(!src.name)
				goto Namez
				return
			if(findtext(name,"\n"))
				world<<"[key] ([client.address]) tried to use their name to spam. They were booted."
				del(src)
			usr.UpdateBio()
		if(blah=="Class")
			if(usr.Race=="Namekian")
				if(usr.Class=="Warrior")
					usr.Class="Dragon"
				else if(usr.Class=="Dragon")
					usr.Class="Warrior"

			else if(usr.Race=="Monster")
				if(usr.Class=="Beastmen")
					usr.Class="Yokai"
					usr.icon='AlienElf_Male.dmi'
				else if(usr.Class=="Yokai")
					usr.Class="Eldritch"
					usr.icon='AlienSquid.dmi'
				else if(usr.Class=="Eldritch")
					usr.Class="Beastmen"
					usr.icon='AlienTiger_Male.dmi'

			else if(usr.Race=="Shinjin")
				if(usr.Class=="South")
					usr.Class="East"
				else if(usr.Class=="East")
					usr.Class="North"
				else if(usr.Class=="North")
					usr.Class="West"
				else if(usr.Class=="West")
					usr.Class="South"

			usr.RacialStats()
			spawn()usr.UpdateBio()

		if(blah=="Sex")
			if(usr.Asexual)
				usr.Gender="---"
			else if(usr.Gender=="Male")
				usr.Gender="Female"
			else
				usr.Gender="Male"
			usr.RacialStats()
			usr.UpdateBio()
			return

	ToggleHelp(var/blah as text)
		set name=".ToggleHelp"
		set hidden=1
		if(!(world.time > verb_delay))
			return
		verb_delay=world.time+1
		if(blah=="Name")
			alert("This will be what other people see you as, it's your character's In Character (IC) name.")
		if(blah=="Class")
			alert("Wizards are energy/magic users, sacrificing physical skills. Fighers are just the default. Technologists are more intelluctual over combat skills, some races may have alternate classes.")
		if(blah=="Sex")
			alert("Female or Male...used for breeding purposes.")
		if(blah=="Race")
			alert("Odds are you already read the blurb.")
		if(blah=="Size")
			alert("Mediums are default, small are agile, large are gigantic. Will complete later..")
		if(blah=="Battle Power")
			alert("This determines how fast (or slow) you gain Battle Power (BP).")
		if(blah=="Zenkai")
			alert("This determines how fast (or slow) you gain BP though being injured.")
		if(blah=="TrainRate")
			alert("This determines various gain rates. Training typically is used for gains related to the Train verb.")
		if(blah=="MedRate")
			alert("This determines various gain rates. Meditation typically is used for gains related to Meditating.")
		if(blah=="IntelMod")
			alert("This determines how fast (or slow) you gain Intelligence Experience. Intelligence is used to make Technology.")
		if(blah=="EnchantMod")
			alert("This determines how fast (or slow) you gain Enchantment Experience. Enchantment is used to make Magical Items.")
		if(blah=="EnergyMod")
			alert("This determines how fast (or slow) you gain Maximum Energy. Energy is used for a wide range of things, including learning new skills, using those skills, and more. If you are low on Energy, many options may become unavailable, and your movement speed will be dramatically reduced.")
		if(blah=="StrMod")
			alert("This determines how fast (or slow) you gain Strength. Strength is used for melee attacks for the most part, though a few ranged attacks do exist.")
		if(blah=="EndMod")
			alert("This determines how fast (or slow) you gain Endurance. Endurance is used for melee defense. The more you have, the less damage melee attacks will do to you.")
		if(blah=="SpdMod")
			alert("This determines how fast (or slow) you gain Speed. Speed has a range of uses, including Attack Speed (mod), and is a important part of the Accuracy math.")
		if(blah=="ForMod")
			alert("This determines how fast (or slow) you gain Force. Force is used for both Ki and Magical attacks, and determines the damage done by those.")
		if(blah=="OffMod")
			alert("This determines how fast (or slow) you gain Offense. Offense is extremely important in regards to hitting players.")
		if(blah=="DefMod")
			alert("This determines how fast (or slow) you gain Defense. Defense is extremely important in regards to avoiding attacks, both melee and ranged.")
		if(blah=="RegenerationMod")
			alert("This determines how fast (or slow) you recover Health while Meditating. This cannot be increased at character creation, but various items and abilities may be able to increase it.")
		if(blah=="RecoveryMod")
			alert("This determines how fast (or slow) you recover Energy and charge Ki attacks. It cannot be trained, but various abilities can increase or decrease it.")
		if(blah=="AngerMod")
			alert("This determines how much power you gain when you Anger, an event that occurs if a hit that would have reduced you under 25% heatlh happens..")

mob/proc/UpdateBio()
	src.PerkDisplay()
	winset(src,"LabelRace","text=\"[src.Race]\"")
	if(src.Asexual)
		winset(src,"LabelSex","text=\"---\"")
	else
		winset(src,"LabelSex","text=\"[src.Gender]\"")
	winset(src,"LabelType","text=\"[src.Class]\"")
	winset(src,"LabelName","text=\"[src.name]\"")

mob
	verb/ToggleBlah2(var/blah as text)
		set name=".ToggleBlah"
		set hidden=1
		if(!(world.time > verb_delay)) return
		verb_delay=world.time+1
		if(!src.Redoing_Stats)
			return
		if(blah=="Name")
			Namez
			src.name=html_encode(copytext(input(src,"Name? (25 letter limit)"),1,25))
			if(!src.name)
				goto Namez
				return
			usr.UpdateBio()
		if(blah=="Class")
			if(usr.Race=="Namekian")
				if(usr.Class=="Warrior")
					usr.Class="Dragon"
				else if(usr.Class=="Dragon")
					usr.Class="Warrior"
				else if(usr.Class=="Fighter")
					usr.Class="Warrior"

			else if(usr.Race=="Monster")
				if(usr.Class=="Beastmen")
					usr.Class="Yokai"
					usr.icon='AlienElf_Male.dmi'
				else if(usr.Class=="Yokai")
					usr.Class="Eldritch"
					usr.icon='AlienSquid.dmi'
				else if(usr.Class=="Eldritch")
					usr.Class="Beastmen"
					usr.icon='AlienTiger_Male.dmi'
				else if(usr.Class=="Fighter")
					usr.Class="Beastmen"

			else if(usr.Race=="Shinjin")
				if(usr.Class=="South")
					usr.Class="East"
				else if(usr.Class=="East")
					usr.Class="North"
				else if(usr.Class=="North")
					usr.Class="West"
				else if(usr.Class=="West")
					usr.Class="South"
				else if(usr.Class=="Fighter")
					usr.Class="South"

			usr.RacialStats()
			spawn()usr.UpdateBio()

		if(blah=="Sex")
			if(usr.Asexual)
				usr.Gender="---"
			else if(usr.Gender=="Male")
				usr.Gender="Female"
			else
				usr.Gender="Male"
			usr.RacialStats()
			usr.UpdateBio()
			return



mob/var/Plan=1
mob/var/Rac=1
mob/var/Tin=1

var/list/SagaLockOut=list()
var/list/RaceLock=list()
var/list/TechLockOut=list()

mob/proc/CheckRace(var/Race, var/Dir)
	if(!src.CheckUnlock(Race))
		UpdateRaceScreen("Race", Dir)
mob/proc/CheckOffworld(var/Dir)
	if(!src.CheckUnlock("Shinjin")&&!src.CheckUnlock("Demon")&&!src.CheckUnlock("Dragon"))
		UpdateRaceScreen("Planet", Dir)
		return 1
	return 0
mob/proc/CheckCreated(var/Dir)
	if(!src.CheckUnlock("Android")&&!src.CheckUnlock("Djinn"))
		UpdateRaceScreen("Planet", Dir)
		return 1
	return 0

mob/proc/UpdateRaceScreen(var/Mode,var/Change)
	if(Change)
		if(Mode)
			switch(Mode)
				if("Planet")
					Rac=1
					switch(Change)
						if("+")
							src.Plan++
							if(Plan>4)
								Plan=1
						if("-")
							src.Plan--
							if(Plan<1)
								Plan=4

				if("Race")
					switch(Change)
						if("+")
							Rac++
						if("-")
							Rac--
	else
		Change="+"
	src.Hairz("Remove")
	src.Class="Fighter"
	if(Plan==1)//Civilized; Human, Makyo, Half Saiyan, Namekian
		if(Rac>4)
			Rac=1
		if(Rac<1)
			Rac=4
		if(Rac==4)//these boys are still rare
			src.CheckRace("Half Saiyan", Change)

		if(Rac==1)
			src.Asexual=0
			Race="Human"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'
		if(Rac==2)
			src.Asexual=0
			Race="Makyo"
			src.icon='Makyo1.dmi'
		if(Rac==3)
			src.Asexual=1
			src.Race="Namekian"
			src.Class="Dragon"
			src.icon='Namek1.dmi'
		if(Rac==4)
			src.Asexual=0
			Race="Half Saiyan"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'


	if(Plan==2)//Savage; Saiyan, Tuffle, Alien, Monster, Changeling
		if(Rac>5)
			Rac=1
		if(Rac<1)
			Rac=5
		if(Rac==5)//these boys are still rare
			src.CheckRace("Changeling", Change)

		if(Rac==1)
			src.Asexual=0
			src.Race="Saiyan"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'
		if(Rac==2)
			src.Asexual=0
			src.Race="Tuffle"
			if(src.gender=="female")
				src.icon='FemaleLight.dmi'
			else
				src.icon='MaleLight.dmi'
		if(Rac==3)
			src.Asexual=0
			src.Race="Alien"
			if(src.gender=="female")
				src.icon='AlienElf_Female.dmi'
			else
				src.icon='AlienElf_Male.dmi'
		if(Rac==4)
			src.Asexual=0
			src.Race="Monster"
			src.Class="Beastmen"
			if(src.gender=="female")
				src.icon='AlienAvian_Female.dmi'
			else
				src.icon='AlienTiger_Male.dmi'
		if(Rac==5)
			src.Asexual=1
			src.Race="Changeling"
			src.icon='Frieza1.dmi'
			src.Class="Fighter"

	if(Plan==3)//Offworld; Shinjin, Demon, Dragon
		if(src.CheckOffworld(Change))
			return
		if(Rac>3)
			Rac=1
		if(Rac<1)
			Rac=3
		if(Rac==1)
			src.CheckRace("Shinjin", Change)
		if(Rac==2)
			src.CheckRace("Demon", Change)
		if(Rac==3)
			src.CheckRace("Dragon", Change)

		if(Rac==1)
			src.Asexual=1
			src.Race="Shinjin"
			src.Class="North"
			if(src.gender=="female")
				src.icon='CustomFemale.dmi'
			else
				src.icon='CustomMale.dmi'
		if(Rac==2)
			src.Asexual=0
			src.Race="Demon"
			src.icon='Demon1.dmi'
			src.Class="D"
		if(Rac==3)
			src.Asexual=1
			src.Race="Dragon"
			src.icon='Dragon1.dmi'


	if(Plan==4)//Created; Android, Djinn
		if(src.CheckCreated(Change))
			return
		if(Rac>2)
			Rac=1
		if(Rac<1)
			Rac=2
		if(Rac==1)
			src.CheckRace("Android", Change)
		if(Rac==2)
			src.CheckRace("Djinn", Change)

		if(Rac==1)
			src.Asexual=1
			src.Race="Android"
			src.icon='Android1.dmi'
			src.Class="Fighter"
		if(Rac==2)
			src.Asexual=1
			src.Race="Djinn"
			src.icon='Majin.dmi'

	winset(src,"RaceName","text=\"[src.Race]\"")

	if(Plan==1)
		winset(src,"PlanetName","text='Civilized'")
		winset(src,"Planet1","image=['i_Earth.png']")
	if(Plan==2)
		winset(src,"PlanetName","text='Savage'")
		winset(src,"Planet1","image=['i_Vegeta.png']")
	if(Plan==3)
		winset(src,"PlanetName","text='Otherworld'")
		winset(src,"Planet1","image=['i_Afterlife.png']")
	if(Plan==4)
		winset(src,"PlanetName","text='Artificial'")
		winset(src,"Planet1","image=['i_AntiSpiral.png']")

	if(src.Race=="Human")
		winset(usr,"Iconz","image=['i_Human.gif']")
		src<<output("Humans are a physically weak race with no outstanding qualities save for their ability to learn things up quickly.","raceblurb")
	if(src.Race=="Makyo")
		winset(usr,"Iconz","image=['i_Makyojin.gif']")
		src<<output("Makyos are an ogre-like race drawing their power from the mysterious Makyo Star. In their powered-up forms they are incredibly mighty, but to underestimate their abilities with magic would be foolish.","raceblurb")
	if(src.Race=="Namekian")
		winset(usr,"Iconz","image=['i_Namekian.gif']")
		src<<output("Namekians are a green-skinned race with both animal and plant-like characteristics.  They easily regenerate and can survive by drinking water alone.  The Dragon clan is effective at manipulating energy and magic; the Warrior caste handles frontline combat.","raceblurb")
	if(src.Race=="Half Saiyan")
		winset(usr,"Iconz","image=['i_Halfie.gif']")
		src<<output("Half Saiyans are children of Saiyans and Humans. They have the power of their Saiyan parent, adaptability of their Human one and combine the immense potential of both.","raceblurb")

	if(src.Race=="Saiyan")
		winset(usr,"Iconz","image=['i_Saiyans.gif']")
		src<<output("Saiyans are a race of some of the most powerful warriors in the universe.  They morph into great apes under the light of the full moon which vastly increases their destructive capability.","raceblurb")
	if(src.Race=="Tuffle")
		winset(usr,"Iconz","image=['i_Tuffle.gif']")
		src<<output("Tuffles are a race naturally disposed towards blending with cybernetics. They are incredibly intelligent and only become more so as they develop.","raceblurb")
	if(src.Race=="Alien")
		winset(usr,"Iconz","image=['i_Alien.gif']")
		src<<output("A catch call term for a broad range of races, Aliens are extremely diverse and populate various corners of the Universe.","raceblurb")
	if(src.Race=="Monster")
		winset(usr,"Iconz","image=['i_Monster.gif']")
		src<<output("Collective category of weird races which are as likely to be solitary as social.  They slowly amass experience over their lifetime, becoming legendary beasts.","raceblurb")
	if(src.Race=="Changeling")
		winset(usr,"Iconz","image=['i_Changling.gif']")
		src<<output("Changelings are a morphic species, able to change shape to restrict some of their power. They stand shoulder to shoulder with some of the strongest known races and can withstand incredible punishment.","raceblurb")

	if(src.Race=="Shinjin")
		winset(usr,"Iconz","image=['i_Shinjin.gif']")
		src<<output("Shinjin are divine beings birthed from fruit of a divine tree.  They tend to watch over the realms of existence, rare cases defecting to Makai.","raceblurb")
	if(src.Race=="Demon")
		winset(usr,"Iconz","image=['i_Demon.gif']")
		src<<output("Demons are an inherently wicked race populating the Makai.  Their powers take source in the impurities of their soul.","raceblurb")
	if(src.Race=="Dragon")
		winset(usr,"Iconz","image=['i_Dragon.gif']")
		src<<output("Dragons are typically born when artifacts of great power are abused. They represent the negative aspects of the utilized power and are extremely powerful and dangerous.","raceblurb")

	if(src.Race=="Android")
		winset(usr,"Iconz","image=['i_Android.gif']")
		src<<output("Androids are artifical lifeforms typically created by skilled scientists.  They cannot upgrade their own systems, but they will never grow tired or weary.","raceblurb")
	if(src.Race=="Djinn")
		winset(usr,"Iconz","image=['i_Majin.gif']")
		src<<output("Djinn are ancient beings corrupted by negative energy of other living beings permeating the Universe. They can absorb others, adding their abilities and knowledge to their own. Most of them exist bound by ancient seals of unknown origin.","raceblurb")

obj/Login
	name="\[            \]"
	Savable=0
	Grabbable=0
	Screenz
		layer=555
		icon='NewNewTitle.png'
		density=1
	Newz
		icon='ArtificalObj.dmi'
		icon_state="Misc"
		layer=999
		alpha=0
		Click()
			if(WorldLoading)
				usr<<"Please wait until the world is done loading..."
				return
			if(usr.Race)return
			if(fexists("Saves/Players/[usr.ckey]"))
				var/savefile/f=new("Saves/Players/[usr.ckey]")
				var/cc
				f["name"] >> cc
				del f
				switch(alert("WARNING: You already have a character save on this key ([cc])! If you make a new character, it is likely your current one will be lost!","Oh snaps!","Yes","No"))
					if("Yes")
						winshow(usr,"Race_Screen",1)
						spawn()usr.UpdateRaceScreen()
					if("No")
						return
			else
				winshow(usr,"Race_Screen",1)
				spawn()usr.UpdateRaceScreen()
	Loadz
		icon='ArtificalObj.dmi'
		icon_state="Misc"
		layer=999
		alpha=0
		Click()
			if(WorldLoading)
				usr<<"Please wait until the world is done loading..."
				return
			if(usr.Race)return
			if(fexists("Saves/Players/[usr.ckey]"))
				usr.client.LoadChar()
			else
				usr<<"<font color=yellow><b>Attention:</b>Savefile for [usr.key] not found!"




mob/var
	tmp/Clicked
	tmp/ChooseStats

client
	proc
		LoadChar()
			if(fexists("Saves/Players/[src.ckey]"))
				var/savefile/F=new("Saves/Players/[src.ckey]")
				F["mob"] >> src.mob
				if(src.mob.Fused)
					if(global.fusion_locs.len)
						if(src.mob.Fused==1)
							var/list/l
							for(var/index in fusion_locs) if(findtext(index, ckey) || findtext(index, mob.Fusee))
								l = fusion_locs[index]
								break
							if(l)
								src.mob.loc=locate(l["x"], l["y"], l["z"])
								src.mob.BeginKB(WEST, 2)
						if(src.mob.Fused==2)
							var/list/l
							for(var/index in fusion_locs) if(findtext(index, ckey) || findtext(index, mob.Fusee))
								l = fusion_locs[index]
								break
							if(l)
								src.mob.loc=locate(l["x"]-1, l["y"], l["z"])
								src.mob.BeginKB(EAST, 2)
					src.mob.Fused=0
					src.mob.AppearanceOff()
					src.mob.AppearanceOn()
					for(var/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance/FD in src.mob)
						if(FD)
							FD.Cooldown()
					for(var/obj/Skills/Buffs/SlotlessBuffs/Divine_Fusion/DF in src.mob)
						if(DF)
							DF.Cooldown()
					src.mob.Health=25


		BackupSaveChar()
			if(src.mob.Savable)
				var/savefilefound=file("Saves/Players/[src.ckey]")
				fcopy(savefilefound,"SaveBackups/Players/[src.ckey]")

		SaveChar()
			if(src.mob.Savable)
				if(istype(src.mob, /mob/Players))
					var/mob/p = src.mob
					p.last_online = world.realtime
				var/savefile/F=new("Saves/Players/[src.ckey]")
				F["mob"] << src.mob
				F["name"] << src.mob.name
mob/proc
	NewMob()
		var/mob/LOL=new/mob/Players/
		LOL.name=src.name
		LOL.Race=src.Race
		LOL.loc=src.loc
		LOL.Class=src.Class
		LOL.icon=src.icon
		LOL.icon_state=src.icon_state
		LOL.PotentialRate=src.PotentialRate
		LOL.Base=src.Base
		LOL.EnergyMax=src.EnergyMax
		LOL.Gender=src.Gender
		LOL.StrMod=src.StrMod
		LOL.EndMod=src.EndMod
		LOL.SpdMod=src.SpdMod
		LOL.ForMod=src.ForMod
		LOL.OffMod=src.OffMod
		LOL.DefMod=src.DefMod
		LOL.RecovMod=src.RecovMod
		LOL.AngerMax=src.AngerMax
		LOL.RPPMult=src.RPPMult
		LOL.Intelligence=src.Intelligence
		LOL.Imagination=src.Imagination
		LOL.Hair_Base=src.Hair_Base
		LOL.Hair_Color=src.Hair_Color
		LOL.Tail=src.Tail
		LOL.GenRaces=src.GenRaces
		LOL.AscensionsUnlocked=src.AscensionsUnlocked
		src.client.mob=LOL
		del(src)
	Finalize(var/Warped=0)
		src.Hair_Forms()
		src.Hairz("Add")
		if(src.Tail)
			src.Tail(1)
		src.ChargeIcon=image('BlastCharges.dmi',"[rand(1,9)]")
		src.Text_Color=pick("#00FF00","#FFFF00","#FF00FF","#0000FF","#FF0000","#00FFFF")
		src.OOC_Color=pick("#00FF00","#FFFF00","#FF00FF","#0000FF","#FF0000","#00FFFF")
		if(!Warped)
			src.Potential=0
			if(!locate(/obj/Money, src))
				src.contents+=new/obj/Money
		if(src.Race!="Android"&&src.Class!="Dance"&&src.Class!="Potara")
			src.EnergyUniqueness=GoCrand(0.8,1.2)
			src.EnergySignature=rand(1000,9000)
			src.ClothGold=pick(global.ConstellationsGold)
		else
			src.EnergyUniqueness=1
			if(src.Class=="Dance"||src.Class=="Potara")
				src.EnergySignature=rand(9001,9999)
				src.ClothGold="Ophiuchus"

		if(src.Race=="Human")
			src.AngerMessage="grows panicked!"
			src.HiddenAnger=1
			src.AngerPoint=50
			src.CyberizeMod=0.5
		if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
			src.Tail(1)
			src.contents+=new/obj/Oozaru
			if(src.Race=="Half Saiyan")
				src.Desperation=4
			if(src.Race=="Saiyan")
				switch(alert(src, "Are you an exceptionally talented fighter or an exceptionally observant fighter?", "Saiyan Preference", "Talented", "Observant"))
					if("Talented")
						src.PowerBoost=1.5
						src.PotentialRate=1
					if("Observant")
						src.PowerBoost=1
						src.PotentialRate=5
				src.ModifyPrime=1
				src.ModifyFinal=-1
		if(src.Race=="Makyo")
			if(src.icon=='Makyo1.dmi')
				src.ExpandBase='Makyo1_Buff.dmi'
			else if(src.icon=='Makyo2.dmi')
				src.ExpandBase='Makyo2_Buff.dmi'
			else if(src.icon=='Makyo3.dmi')
				src.ExpandBase='Makyo3_Buff.dmi'
			src.PoweredFormSetup()
		if(src.Race=="Namekian")
			var/Choice
			var/Confirm
			src.Asexual=1
			src.AddSkill(new/obj/Skills/Utility/Sense)
			src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
			src.EnhancedHearing=1
			for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in src)
				r.RegenerateLimbs=1

			if(src.Class=="Dragon")
				while(Confirm!="Yes")
					Choice=alert(src, "As you uncover more secrets of Namekian mysticism, you get to choose which secrets of Dragon clan to master. Which path will it be?", "Dragon Clan Secrets", "Healer", "Enchanter", "Heretic")
					switch(Choice)
						if("Healer")
							Confirm=alert(src, "Do you choose the path of healing, learning to mend any wound in an instant?", "Dragon Clan Secrets", "Yes", "No")
						if("Enchanter")
							Confirm=alert(src, "Do you choose the path of enchanting, learning to weave more intricate magicks?", "Dragon Clan Secrets", "Yes", "No")
						if("Heretic")
							Confirm=alert(src, "Do you choose the path of heresy, learning to imbue your body with dark energies and channeling its regenerative life force in alternate ways?", "Dragon Clan Secrets", "Yes", "No")
				if(Choice=="Healer")
					src.AddSkill(new/obj/Skills/Utility/Heal)
					for(var/obj/Skills/Utility/Heal/h in src)
						h.SagaSignature=1//protecc
						h.SignatureTechnique=0//brotecc
				else if(Choice=="Enchanter")
					src.ManaCapMult+=1
				else if(Choice=="Heretic")
					src.AddSkill(new/obj/Skills/AutoHit/AntennaBeam)
					src.NewAnger(1.5)
					src.HellPower=0.5
				src.ModifyLate=1
				src.ModifyFinal=1
			else
				src.AddSkill(new/obj/Skills/AutoHit/AntennaBeam)
				src.AddSkill(new/obj/Skills/Utility/Make_Equipment)
				src.ModifyEarly=-1
				src.ModifyPrime=1

		if(src.Race=="Monster")
			if(src.Class=="Beastmen")
				src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Berserk)
				src << "As a beastman, your anger will flare when you are pressed to your limits!"
				src.ModifyBaby=0
				src.ModifyEarly=0
				src.ModifyPrime=1
				src.ModifyLate=-1
				src.EnhancedSmell=1
				src.EnhancedHearing=1
			if(src.Class=="Yokai")
				src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Spirit_Form)
				src << "As a yokai, you can shift to your spirit form to bolster your energy attacks!"
				src.ModifyLate=3
				src.ModifyFinal=-1
				src.EnhancedHearing=1
				src.Spiritual=1
			if(src.Class=="Eldritch")
				src.SpaceWalk=1
				src.see_invisible=71
				src.Timeless=1
				src << "As an eldritch being, you can last through entropy of time and space and see beyond normal sight."
		if(src.Race=="Tuffle")
			src.CyberizeMod=1
			src.EconomyMult=2
		if(src.Race=="Shinjin")
			src.Timeless=1

			switch(src.Class)
				if("North")
					//you heal faster when close to earth
					src.Restoration=1
					src.Attunement="Earth"
				if("South")
					//Fire doesn't hurt
					src.WalkThroughHell=1
					src.Attunement="Fire"
				if("East")
					//Breathe anything
					src.OxygenMax*=4
					src.SpaceWalk=1
					src.Attunement="Wind"
				if("West")
					//You don't have to swim
					src.WaterWalk=1
					src.Attunement="Water"
			src.AddSkill(new/obj/Skills/Utility/Telepathy)
			src.AddSkill(new/obj/Skills/Utility/Sense)
			src.AddSkill(new/obj/Skills/Telekinesis)
			src.AddSkill(new/obj/Skills/Utility/Observe)
			src.AddSkill(new/obj/Skills/Utility/Keep_Body)
			src.AddSkill(new/obj/Skills/Teleport/Traverse_Underworld)
			src.AddSkill(new/obj/Skills/Reincarnation)
			src.AddSkill(new/obj/Skills/Utility/Teachz)
			src.AddSkill(new/obj/Skills/Utility/Grimoire_Arcana)
			var/list/Choices=list("Kai", "Makai")
			var/Confirm
			var/Choice
			if(!src.ShinjinAscension)
				while(Confirm!="Yes")
					Choice=input(src, "Which realm do you swear your loyalty to?", "Shinjin Ascension") in Choices
					switch(Choice)
						if("Kai")
							Confirm=alert(src, "Do you pledge your allegiance to the continuity and propserity of the Living Realm?", "Shinjin Ascension", "Yes", "No")
						if("Makai")
							Confirm=alert(src, "Do you pledge your allegiance to the expansion and domination of the Demon Realm?", "Shinjin Ascension", "Yes", "No")
				if(Choice=="Kai")
					src.SpiritPower=1
					src.CalmAnger=1
					src.Potential=10
					src.PotentialRate=0.1
					switch(src.Class)
						if("North")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Kaioken)
							src.AddSkill(new/obj/Skills/Projectile/Genki_Dama)
							var/obj/Skills/Buffs/NuStyle/UnarmedStyle/North_Star_Style/nss=new/obj/Skills/Buffs/NuStyle/UnarmedStyle/North_Star_Style
							src.AddSkill(nss)
							src.StanceUnlock(nss)
						if("East")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Toppuken)
							src.AddSkill(new/obj/Skills/AutoHit/Gwych_Dymestl)
							var/obj/Skills/Buffs/NuStyle/UnarmedStyle/East_Star_Style/ess=new/obj/Skills/Buffs/NuStyle/UnarmedStyle/East_Star_Style
							src.AddSkill(ess)
							src.StanceUnlock(ess)
						if("South")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Rekkaken)
							src.AddSkill(new/obj/Skills/Projectile/Zone_Attacks/Global_Devastation)
							var/obj/Skills/Buffs/NuStyle/SwordStyle/South_Star_Style/sss=new/obj/Skills/Buffs/NuStyle/SwordStyle/South_Star_Style
							src.AddSkill(sss)
							src.StanceUnlock(sss)
						if("West")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Kyoukaken)
							src.AddSkill(new/obj/Skills/AutoHit/Great_Deluge)
							var/obj/Skills/Buffs/NuStyle/FreeStyle/West_Star_Style/wss=new/obj/Skills/Buffs/NuStyle/FreeStyle/West_Star_Style
							src.AddSkill(wss)
							src.StanceUnlock(wss)

				if(Choice=="Makai")
					src.HellPower=1
					src.NewAnger(2)
					src.Intimidation=10
					src.Potential=DaysOfWipe()
					src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Majin)
					src.PotentialRate=5
					src.StaticWalk=1
					src.AddSkill(new/obj/Skills/Utility/Grant_Jagan)
				src.ShinjinAscension=Choice

		if(src.Race=="Demon")
			if(src.icon=='Demon3.dmi')
				src.Form1Base='Demon3M.dmi'
			if(src.icon=='Demon4.dmi')
				src.Form1Base='Demon4M.dmi'
			if(src.icon=='Demon5.dmi')
				src.Form1Base='Demon5M.dmi'
			src.AngerPoint=50
			src.HellPower=1
			src.StaticWalk=1
			src.SpaceWalk=1
			src.Timeless=1
			src.Spiritual=1
			src.CursedWounds=1
			src.Potential=DaysOfWipe()
			src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
			src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm)
			src.TrueName=input(src, "As a demon, you have a True Name that can be used to summon you by anyone with the magic and knowledge of it. It should be kept secret. What is your True Name?", "Get True Name") as text
			src << "The name by which you can be conjured is <b>[src.TrueName]</b>."
			global.TrueNames.Add(src.TrueName)
		if(src.Race=="Djinn")
			src.Potential=DaysOfWipe()
			src.StaticWalk=1
			src.GiantForm=1
			src.FluidForm=1
			src.Timeless=1
			src.Spiritual=1
			src.FatigueImmune=1
			src.InjuryImmune=1
			src.AngerPoint=50
			src.AddSkill(new/obj/Skills/Absorb)
			src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
			for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in src)
				r.RegenerateLimbs=1
			src.contents+=new/obj/Regenerate
			for(var/obj/Regenerate/x in src)
				x.Level=4
		if(src.Race=="Dragon")
			src.Intimidation=2.5
			src.AngerMessage="roars furiously!"
			src.Class=input(src, "All dragons possess resilence against the elements, but they also possess an affinity for a specific element.  What is your affinity?", "Elemental Dragon") in list("Fire", "Water", "Metal", "Lightning", "Poison", "Gold", "Time")
			src.DebuffImmune=1
			src.EconomyMult=4
			src.Timeless=1
			src.Spiritual=1
			src.Potential=DaysOfWipe()
			src.AngerPoint=50
			switch(src.Class)
				if("Fire")
					src.Attunement="Fire"
					src.AngerPoint=75
					src.AddSkill(new/obj/Skills/AutoHit/Fire_Breath)
					src.StrAscension=0.25
					src.ForAscension=0.25
					src.OffAscension=0.25
					src << "You have an affinity for <font color='red'><b>fire</b></font color>."
				if("Water")
					src.Attunement="Water"
					src.Fishman=1
					src.AddSkill(new/obj/Skills/Projectile/Beams/Ice_Dragon)
					src.EndAscension=0.25
					src.ForAscension=0.25
					src.DefAscension=0.25
					src << "You have an affinity for <font color='blue'><b>water</b></font color>."
				if("Metal")
					src.Attunement="Earth"
					src.Hardening=1
					src.AddSkill(new/obj/Skills/Projectile/Shard_Storm)
					src.StrAscension=0.25
					src.EndAscension=0.25
					src.DefAscension=0.25
					src << "You have an affinity for <font color='green'><b>earth</b></font color>."
				if("Lightning")
					src.Attunement="Wind"
					src.Godspeed=1
					src.AddSkill(new/obj/Skills/Projectile/Beams/Static_Stream)
					src.StrAscension=0.25
					src.EndAscension=0.25
					src.OffAscension=0.25
					src << "You have an affinity for <font color='cyan'><b>lightning</b></font color>."
				if("Poison")
					src.VenomResistance+=2
					src.AddSkill(new/obj/Skills/AutoHit/Poison_Gas)
					src.StrAscension=0.25
					src.OffAscension=0.25
					src.RecovAscension=0.25
					src << "You have an affinity and partial immunity to <font color='purple'><b>poison</b></font color>."
				if("Gold")
					src.Intelligence=2
					src.EconomyMult*=1.25
					src.ForAscension=0.25
					src.OffAscension=0.25
					src.RecovAscension=0.25
					src << "You lack an elemental affinity but you're gifted with <font color='#FFFF00'><b>brilliance</b></font color>."
				if("Time")
					src.PowerBoost=1.5
					src.AngerMax=1
					src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Force)
					src.StrAscension=0.25
					src.OffAscension=0.25
					src.DefAscension=0.25
					src << "You embrace timelessness of the ancient dragons and assert your <font color='#666666'><b>superiority</b></font color> over everything..."
		if(src.Race=="Alien")
			src.PotentialCap=rand(100, 200)
			src.PotentialCap=round(src.PotentialCap, 5)
			src.PotentialRate+=(abs(src.PotentialCap-200)/100)//2 potential rate at 100 potentialcap, 1 potential rate at 200 potentialcap
			src.AlienRacials()
		if(src.Race=="Android")
			src.AddSkill(new/obj/Skills/Utility/Internal_Communicator)
			src.AddSkill(new/obj/Skills/Utility/Android_Integration)
			src.Mechanized=1//No magic
			src.StabilizeModule=1//In built life support
			src.InjuryImmune=1//What injury?
			src.FatigueImmune=1//What fatigue?
			src.DebuffImmune=1//What debuffs?
			src.VenomImmune=1//no corrosion
			src.EnhancedHearing=1
			src.InternalScouter=1
			src.ExhaustedMessage="appears heavily damaged!"
			src.ExhaustedColor="#999999"
			src.BarelyStandingMessage="appears to be reaching limits of functionality!"
			src.BarelyStandingColor="#999999"
			src.PUConstant=1
			src.ManaPU=1
			src.FusionPowered=1
			src.EnhanceChipsMax=8
			src.Timeless=1
			src.PotentialRate=3
			Warped=1
		if(src.Race=="Changeling")
			src.Intimidation=2
			src.Potential=pick(0, 0, 0, 0, 0, 0, 0, 0, 0, 10)
			src.Adrenaline=1//Go faster at lower health
			src.AngerMessage="loses their cool!"
			src.trans["unlocked"]=3
			src.Potential=DaysOfWipe()
			src.BioArmor=100
			src.BioArmorMax=100
			src.PoweredFormSetup()
			src.AddSkill(new/obj/Skills/Power_Control)
			src.ModifyBaby=-1
			src.ModifyEarly=1
			src.ModifyPrime=2
			src.ModifyLate=-1
			src.ModifyFinal=-1

		src.StrOriginal=src.StrMod
		src.EndOriginal=src.EndMod
		src.SpdOriginal=src.SpdMod
		src.ForOriginal=src.ForMod
		src.OffOriginal=src.OffMod
		src.DefOriginal=src.DefMod
		src.RecovOriginal=src.RecovMod
		src.SetVars()

		if(!Warped)
			if(src.Race=="Alien"||src.Race=="Monster")
				var/Choice=input(src, "Do you want to possess animal characteristics?  These options will give you tails and ears.", "Choose your animal traits.") in list("None", "Cat", "Fox", "Racoon", "Wolf", "Lizard", "Crow", "Bull")
				switch(Choice)
					if("Cat")
						src.Neko=1
					if("Fox")
						src.Kitsune=1
					if("Racoon")
						src.Tanuki=1
					if("Wolf")
						src.Wolf=1
					if("Lizard")
						src.Lizard=1
					if("Crow")
						src.Tengu=1
					if("Bull")
						src.Bull=1
				if(Choice!="None")
					var/Color=input(src,"Choose color") as color|null
					src.Trait_Color=Color
					src.contents+=new/obj/FurryOptions
					src.Hairz("Remove")
					src.Hairz("Add")
				if(src.Race=="Monster"&&src.Class!="Yokai")
					var/Spirits=alert(src, "Do you function as a spiritual being?  This is relevant for establishing summoning contracts.", "Are The Spirits With You?", "No", "Yes")
					if(Spirits=="Yes")
						src.Spiritual=1
					else
						src.Spiritual=0
				if(src.Race=="Monster")
					var/confirm1
					var/choice1
					while(confirm1!="Yes")
						choice1=alert(src, "All monsters hail from battle-ready castes. Which do you hail from?", "Monster Caste", "Warrior", "Shaman", "Hunter")
						switch(choice1)
							if("Warrior")
								confirm1=alert(src, "Warrior caste monsters focus on enduring blows and defeating opponents physically. Is this your caste?", "Warrior Caste", "Yes", "No")
							if("Shaman")
								confirm1=alert(src, "Shaman caste monsters focus on powerful and accurate energy attacks. Is this your caste?", "Shaman Caste", "Yes", "No")
							if("Hunter")
								confirm1=alert(src, "Hunter caste monsters embrace all methods of fighting with particular focus on speed and finesse. Is this your caste?", "Hunter Caste", "Yes", "No")
					src.MonsterClass=choice1

					var/choice2
					var/confirm2
					while(confirm2!="Yes")
						choice2=alert(src, "All monsters draw power from a metaphysical ideal. What is the source of your monstrous strength?", "Monster Source", "Domination", "Determination", "Ingenuity")
						switch(choice2)
							if("Domination")
								confirm2=alert(src, "Monsters sworn to Domination ruthlessly crush opponents with raw and intimidating power. Is this your source of strength?", "Domination Ideal", "Yes", "No")
							if("Determination")
								confirm2=alert(src, "Monsters sworn to Determination exhibit great efficiency of movement and unflagging courage. Is this your source of strength?", "Determination Ideal", "Yes", "No")
							if("Ingenuity")
								confirm2=alert(src, "Monsters sworn to Ingenuity focus on leading their lessers with wise counsel. Is this your source of strength?", "Ingenuity Ideal", "Yes", "No")
					src.MonsterSource=choice2

					var/choice3
					var/confirm3
					while(confirm3!="Yes")
						choice3=alert(src, "All monsters carry a shred of mythos within them that may be cultivated into a true legend. What is your destiny?", "Monster Destiny", "Celestial", "Natural", "Infernal")
						switch(choice3)
							if("Celestial")
								confirm3=alert(src, "Monsters carrying a shred of celestial energy are inherently good - perhaps too good for others to tolerate. Is this your eventual destiny?", "Celestial Destiny", "Yes", "No")
							if("Natural")
								confirm3=alert(src, "Monsters carrying no shred of outside energy are true followers of the laws of nature. Good and evil have no meaning to them, there is only one's own will. Is this your eventual destiny?", "Natural Destiny", "Yes", "No")
							if("Infernal")
								confirm3=alert(src, "Monsters carrying a shred of infernal energy are inherently hateful. As they grow in power, so do their selfish tendencies. Is this your eventual destiny?", "Infernal Destiny", "Yes", "No")
					src.MonsterAscension=choice3

			if(!src.Timeless)
				if(!(src.Race in list("Changeling", "Saiyan", "Monster")))//these bois spawn in with deathtimers if theyre elder...
					//beastman monsters as elders would spawn in with death timers; yokai would be more powerful; eldritch dont even get this choice
					var/Age="Youth"//=alert(src, "Do you want to start as a youth or an elder?  Youths have not yet reached their full potential as fighters. Elders have already passed it, and may teach younger folks.", "Age", "Youth", "Elder")
					src.EraBody=Age
					if(src.EraBody=="Youth")
						src.EraAge=global.Era-src.GetPassedEras("Youth")
						if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
							src.Tail(1)
					else
						src.EraAge=global.Era-src.GetPassedEras("Elder")
						if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
							src.Tail(1)
				else
					src.EraBody="Youth"
					src.EraAge=global.Era-src.GetPassedEras("Youth")
			else
				src.EraAge=-4
				if(src.Class=="Eldritch" || src.Race=="Djinn")
					src.EraAge=global.Era-GetPassedEras("Adult")
				src.EraBody="Adult"
				src << "You've started as a timeless race. You learn slower than others, but can teach younger beings and always have your full power available."

			src.EraBirth=global.Era
			src.ChooseSpawn()

			//spawns can kill beastmens ability to learn anything so this is here now.
			if(src.Intelligence<=0.25)
				src.Intelligence=0.25
			if(src.Imagination<=0.25&&src.Race!="Android")
				src.Imagination=0.25

			if(src.EraAge > 0) //WE ARE ALL ADULTS NOW
				src.EraAge=0
				src.EraBody="Adult"

			if(global.RPPEventCharges["[src.ckey]"])
				src.RPPSpendableEvent+=global.RPPEventCharges["[src.ckey]"]*global.RPPDaily
				src << "You've gained [global.RPPEventCharges["[src.ckey]"]] days of event RPP from a past life."

			if(global.WipeStart)
				src.PotentialLastDailyGain=global.WipeStart
				if(src.Potential==DaysOfWipe())//if its a bad boi who gets free potential
					src.PotentialLastDailyGain=Yesterday()
				src.RewardsLastGained=Yesterday()
				//set these to wipe start so that the login code will give them their rewards and allow them to grind potentialz

mob
	proc
		GetPassedEras(var/Age)
			var/Return=0
			Return+=(1+src.ModifyBaby)//How many eras did it take to become a youth?
			if(Age=="Youth")
				return Return
			Return+=(1+src.ModifyEarly)//How many eras did it take to become an adult?
			if(Age=="Adult")
				return Return
			Return+=(2+src.ModifyPrime)//How many eras did it take to become an elder?
			if(Age=="Elder")
				return Return
			Return+=(1+src.ModifyLate)//How many eras did it take to become an old, dying fuck?
			if(Age=="Senile")
				return Return


mob/proc/InhabitDroid(var/obj/Body,var/mob/Mind)
	var/mob/Players/Droid=new/mob/Players
	Droid.loc=Body.loc
	Droid.name=Body.name
	Droid.icon=Body.icon
	Droid.icon_state=Body.icon_state
	Droid.Race="Android"
	Droid.Asexual=1
	Droid.Manufactured=1
	Droid.RacialStats()
	Droid.UpdateBio()
	Droid.Finalize(Warped=1)
	Droid.Potential=DaysOfWipe()
	Droid.AscensionsAcquired=0
	var/obj/Redo_Stats/r = new
	r.LoginUse=1
	Droid.contents+=r
	var/list/DenyVars=list("client", "key", "loc", "x", "y", "z", "type", "locs", "parent_type", "verbs", "vars", "contents", "Transform", "appearance")
	for(var/obj/Skills/s in Mind)
		if(s.AssociatedGear)
			continue
		if(s.AssociatedLegend)
			continue
		if(s.MagicNeeded)
			continue
		if(!locate(s, Droid))
			var/obj/Skills/NewS=new s.type
			for(var/x in s.vars)
				if(x in DenyVars)
					continue
				NewS.vars[x]=s.vars[x]
			Droid.AddSkill(NewS)
	Droid.ForgingUnlocked=Mind.ForgingUnlocked
	Droid.RepairAndConversionUnlocked=Mind.RepairAndConversionUnlocked
	Droid.MedicineUnlocked=Mind.MedicineUnlocked
	Droid.ImprovedMedicalTechnologyUnlocked=Mind.ImprovedMedicalTechnologyUnlocked
	Droid.TelecommunicationsUnlocked=Mind.TelecommunicationsUnlocked
	Droid.AdvancedTransmissionTechnologyUnlocked=Mind.AdvancedTransmissionTechnologyUnlocked
	Droid.EngineeringUnlocked=Mind.EngineeringUnlocked
	Droid.CyberEngineeringUnlocked=Mind.CyberEngineeringUnlocked
	Droid.MilitaryTechnologyUnlocked=Mind.MilitaryTechnologyUnlocked
	Droid.MilitaryEngineeringUnlocked=Mind.MilitaryEngineeringUnlocked
	Droid.UnlockedTechnology=Mind.UnlockedTechnology
	var/mob/Body2=Mind
	Body2.Leave_Body(SuperDead=1)
	Mind.client.mob=Droid
	del Body


mob/proc/PilotMecha(var/mob/Mecha,var/mob/Pilot)
	Mecha.Manufactured=1
	Pilot.client.mob=Mecha
