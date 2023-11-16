
obj/Skills/var
	cooldown_remaining
	cooldown_start
obj/Skills/proc/Cooldown(var/modify=1, var/Time)
	if(!src.Using || Time)
		src.Using=1
		var/mob/m=src.loc
		if(Cooldown==-1)
			src.Using=1
			return
		var/forcemessage=0
		if(!Time && src && m)
			if(!src.CooldownStatic)
				if(m.HasTechniqueMastery())
					modify/=max((1+(m.GetTechniqueMastery()/10)),0.1)
			else
				if(m.Hustle||m.HasLegendaryPower() > 0.25)
					modify*=0.75
			if(m.Saga=="Hiten Mitsurugi-Ryuu")
				if(src.StyleNeeded=="Hiten Mitsurugi")
					if(m.SagaLevel>=5)
						modify/=1.5
					if(m.SagaLevel>=8)
						if(src.FatigueCost)
							src.FatigueCost=0
						if(src.CooldownScalingCounter>0)
							src.CooldownScalingCounter=0
			Time=src.Cooldown*10*modify*(1+0.33*src.CooldownScalingCounter)
			if(src.CooldownScaling)
				src.CooldownScalingCounter++
		else
			forcemessage=1
		cooldown_remaining = Time
		if(m)
			if(m.PureRPMode)
				return
			cooldown_start = world.realtime
			var/start_time = world.realtime
			spawn(Time)
				if(cooldown_start != start_time) return //This instance of the CD was canceled.
				src.Using=0
				cooldown_remaining = 0
				cooldown_start = 0
				if(Time>=50 || forcemessage)
					if(src in typesof(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff))
						return
					if(src.CooldownNote)
						m << "<font color='white'><b>[src] is off cooldown. ([src.CooldownNote])</b></font color>"
					else
						m << "<font color='white'><b>[src] is off cooldown.</b></font color>"


mob/Players/verb
	Attack()
		set category="Skills"
		set name="Normal Attack"
		if(usr.icon_state=="Meditate")
			usr.icon_state=""
		usr.Melee()

mob/proc/SkillX(var/Wut,var/obj/Skills/Z,var/bypass=0)
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.KO||src.Stunned||src.AutoHitting||src.Frozen>=2)
		return
	if(src.Stasis)
		return
	if(Z.Using && Wut!="Zanzoken")
		return
	if(Z.MagicNeeded&&!src.HasLimitlessMagic())
		if(src.HasMechanized()&&src.HasLimitlessMagic()!=1)
			src << "You lack the ability to use magic!"
			return
		if(Z.Copyable>=3||!Z.Copyable)
			if(!src.HasSpellFocus(Z))
				src << "You need a spell focus to use [Z]."
				return
	if(!src.Frozen||bypass)
		switch(Wut)

			if("Meditate")
				if(src.KO||src.icon_state=="KB"||src.icon_state=="Train"||src.icon_state=="Flight"||src.Beaming||src.BusterTech||(NextAttack > world.time))
					return
				if(src.icon_state!="Meditate")
					for(var/mob/Player/AI/a in view(25, src))
						if(a.Target==src && (a.WoundIntent || a.Lethal))
							src << "You're in too much danger to begin resting."
							return
					src.CheckAscensions()

					if(!src.SignatureSelecting)
						src.SignatureSelecting=1
						src.PotentialSkillCheck()
						src.SignatureSelecting=0

					if(src.Saga)
						src.YeetSignatures()
						if(src.SagaAdminPermission)
							src.saga_up_self()


					if(src.CheckActive("Ki Control"))
						for(var/obj/Skills/Buffs/ActiveBuffs/Ki_Control/KC in src)
							src.UseBuff(KC)
					if(src.CheckSlotless("What Must Be Done"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/wmbd in src.Buffs)
							if(wmbd.Password)
								src.UseBuff(wmbd)
								del wmbd

					src.OMessage(1,null,"[src]([src.key]) meditated!")
					src.dir=SOUTH
					src.AfterImageStrike=0
					src.Rooted=0
					if(src.InfusionElement)
						src.InfusionElement=null
					src.icon_state="Meditate"
					Z.Using=1
					spawn(20)
						Z.Using=0
					src.Meditation()
				else
					if(Z.Using==1)
						return
					src.icon_state=""
					if(MeditateTime >= 15)
						src.Tension=0
						for(var/obj/Skills/s in src)
							if(s.Cooldown<0 && s.Using)
								s.Using = 0
								usr << "[s] has been reset, allowing you to use it again."
							if(s.CooldownScaling && s.CooldownScalingCounter)
								s.CooldownScalingCounter=0
								usr << "[s] has had its scaling cooldown reset."
					MeditateTime = 0

			if("Grab")
				src.Grab()
				if(ismob(src.Grab))
					Z.Cooldown()


			if("ReverseDash")
				var/Modifier=1
				if(src.Secret=="Haki")
					if(src.HakiSpecialization=="Observation")
						Modifier+=2
					else
						Modifier+=1
				if(src.Saga=="Eight Gates")
					Modifier+=2
				if(!src.HasDashMaster())
					Z.Cooldown(1/Modifier)
				if(src.CheckSlotless("New Moon Form"))
					if(src.CheckSlotless("Half Moon Form"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Werewolf/Half_Moon_Form/H in src)
							H.Trigger(src)
				if(src.Secret=="Haki")
					if(src.CheckSlotless("Haki Armament"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armament/H in src)
							H.Trigger(src)
					if(!src.CheckSlotless("Haki Observation"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Observation/H in src)
							H.Trigger(src)
					src.AddHaki("Observation")
					if(!src.CheckSlotless("Haki Future Flash")&&!src.CheckSlotless("Haki Future Flash Lite"))
						if(src.HakiSpecialization=="Observation")
							for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Future_Flash/H in src)
								H.Trigger(src)
						else
							for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Future_Flash_Lite/H in src)
								H.Trigger(src)
				if(!src.Target||(src.Target&&!istype(src.Target,/mob)))
					return
				if(src.Target==src)
					return
				if(src.Beaming==2)
					return
				if(src.TimeFrozen)
					return
				if(src.Knockbacked)
					return
				var/Distance=5
				var/Delay=1
				src.Frozen=1
				if(src.Beaming||src.BusterTech)
					Distance=3
				if(src.GetSuperDash()>=2)
					AfterImageGhost(src)
					Delay=0
				else if(locate(/obj/Skills/Zanzoken, src)||src.HasSuperDash()&&src.GetSuperDash()<2)
					AfterImage(src)
					Delay=0
				if(is_arcane_beast)
					for(var/mob/Player/AI/Nympharum/n in ai_followers)
						n.PlayAction("NymphReverseDashSupport")
				if(src.HasRipple())
					src.OMessage(10,"[src] increases their distance from [src.Target] to regain the rhythm of their breathing!","<font color=red>[src]([src.key]) used  Back Dash.")
					src.Oxygen+=(src.OxygenMax/max(src.SenseRobbed,1))*0.35
					if(src.Oxygen>=(src.OxygenMax/max(src.SenseRobbed,1))*2)
						src.Oxygen=(src.OxygenMax/max(src.SenseRobbed,1))*2
				else if(src.StanceActive=="Crane")
					src.OMessage(10,"[src] backflips away from [src.Target]!","<font color=red>[src]([src.key]) used  Back Dash.")
				else
					src.OMessage(10,"[src] dashes away from [src.Target]!","<font color=red>[src]([src.key]) used  Back Dash.")
				while(Distance>0)
					if(src.StanceActive=="Crane")
						src.icon_state="KB"
					else if(src.HasRipple())
						src.icon_state="Pose"
					else
						src.icon_state="Flight"
					step_away(src,src.Target,68)
					for(var/atom/a in get_step(src,dir))
						if(a==src)
							continue
						if(a.density)
							Distance=0
					Distance-=1
					sleep(Delay*world.tick_lag)
				src.dir=get_dir(src,src.Target)
				src.Frozen=0
				if(src.Launched)
					src.Launched=0
					LaunchLand(src)
				src.NextAttack=0
				src.icon_state=""
				walk(src,0)
				if(src.Beaming==1)
					for(var/obj/Skills/Projectile/Beams/B in src)
						if(B.Charging)
							src.UseProjectile(B)
				if(src.HasDashCount())
					src.IncDashCount()

			if("DragonDash")
				if(src.Frozen)
					return
				if(src.is_dashing)
					return
				if(!src.Target||(src.Target&&!istype(src.Target,/mob)))
					return
				if(src.Target==src)
					return
				var/Modifier=1
				if(src.Pursuer)
					Modifier+=src.HasPursuer()
				if(src.Saga=="Eight Gates")
					Modifier+=2
				if(!src.HasDashMaster())
					Z.Cooldown(1/Modifier)
				if(src.CheckSlotless("New Moon Form"))
					if(!src.CheckSlotless("Half Moon Form"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Werewolf/Half_Moon_Form/H in src)
							H.Trigger(src)
				if(src.Secret=="Haki")
					src.AddHaki("Armament")
					if(!src.CheckSlotless("Haki Armament"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armament/H in src)
							H.Trigger(src)
					if(src.CheckSlotless("Haki Observation"))
						for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Observation/H in src)
							H.Trigger(src)
					if(!src.CheckSlotless("Haki Armor")&&!src.CheckSlotless("Haki Armor Lite"))
						if(src.HakiSpecialization=="Armament")
							for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armor/H in src)
								H.Trigger(src)
						else
							for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armor_Lite/H in src)
								H.Trigger(src)
				if(src.Beaming==2)
					return
				if(src.TimeFrozen)
					return
				if(src.Knockbacked)
					return
				var/Distance=20
				var/Delay=0.75
				if(src.Beaming||src.BusterTech)
					if(!src.HasMovingCharge())
						Distance=5
					else
						Distance=10
				if(!src.AttackQueue)
					if(src.HasRipple())
						if(src.Oxygen>src.OxygenMax*1.75&&src.Oxygen>300&&src.PoseEnhancement&&src.HealthAnnounce25==1)
							src.HealthAnnounce25=2
							src.SetQueue(new/obj/Skills/Queue/Sunlight_Yellow_Overdrive)
						else
							src.SetQueue(new/obj/Skills/Queue/Zoom_Punch)
					if(src.Secret=="Vampire")
						if(!src.PoseEnhancement)
							src.SetQueue(new/obj/Skills/Queue/Vampire_Lunge)
						else
							src.SetQueue(new/obj/Skills/Queue/Vampire_Rage)
				if(src.HasSuperDash())
					Distance+=15*src.GetSuperDash()
					Delay=0.5/src.GetSuperDash()
					var/Wave=src.GetSuperDash()
					for(var/wav=Wave, wav>0, wav--)
						KenShockwave(src, icon='KenShockwave.dmi', Size=Wave)
						Wave/=2
				src.OMessage(10,"[src] dashed towards [src.Target]!","<font color=red>[src]([src.key]) used  Dragon Dash.")
				src.is_dashing++
				if(src.GetSuperDash()>=2)
					AfterImageGhost(src)
				if(is_arcane_beast)
					for(var/mob/Player/AI/Nympharum/n in ai_followers)
						n.PlayAction("NymphDragonDashSupport")
				src.DashTo(src.Target, Distance, Delay, Clashable=1)
				if(src.Beaming==1)
					for(var/obj/Skills/Projectile/Beams/B in src)
						if(B.Charging)
							src.UseProjectile(B)
				else
					src.NextAttack=0
					if(src.CheckSlotless("East Strength"))
						if(!src.AttackQueue)
							src.SetQueue(new/obj/Skills/Queue/East_Rush)
					src.Melee(1, 5, accmulti=2+src.GetSuperDash(), BreakAttackRate=1)

				if(src.HasDashCount())
					src.IncDashCount()

			if("Aerial Recovery")
				if(src.KO)
					return
				if(src.Beaming||src.BusterTech)
					return
				if(src.TimeFrozen)
					return
				if(!src.Knockback)
					return
				if(src.Energy>EnergyMax/8)
					src.OMessage(10,"[src] regained their footing!!","<font color=red>[src]([src.key]) used Aerial Recovery.")
					RecoverImage(src)
					src.AerialRecovery=1
					src.StopKB()
					if(src.HasRipple()&&src.Oxygen>=30)
						if(!src.AttackQueue)
							src.SetQueue(new/obj/Skills/Queue/Rebuff_Overdrive)
						Z.Cooldown(1.5)
					if(src.Secret=="Werewolf")
						Z.Cooldown(0.5)
					else
						if(!src.HasDashMaster())
							Z.Cooldown()
			if("Aerial Payback")
				if(src.KO)
					return
				if(!src.Target)
					return
				if(src.Beaming||src.BusterTech)
					return
				if(src.TimeFrozen)
					return
				if(!src.Knockback)
					return
				if(src.is_dashing)
					return
				var/Distance=10
				var/Delay=0.75
				if(src.HasSuperDash())
					Distance+=20*src.GetSuperDash()
					Delay=0.5/src.GetSuperDash()
					var/Wave=2
					for(var/wav=Wave, wav>0, wav--)
						KenShockwave(src, icon='KenShockwave.dmi', Size=Wave)
						Wave/=2
				src.OMessage(10,"[src] regained their footing and dashed towards [src.Target]!","<font color=red>[src]([src.key]) used Aerial Payback.")
				RecoverImage(src)
				src.is_dashing++
				src.AerialRecovery=2
				src.StopKB()
				src.DashTo(src.Target, Distance, Delay)
				src.AerialRecovery=0
				if(src.HasRipple()&&src.Oxygen>=30)
					if(!src.AttackQueue)
						src.SetQueue(new/obj/Skills/Queue/Rebuff_Overdrive)
					Z.Cooldown(1.5)
				if(src.Secret=="Werewolf")
					src.Activate(new/obj/Skills/AutoHit/Rabid_Retaliation)
					Z.Cooldown(2)
				else
					if(!src.HasDashMaster())
						Z.Cooldown()
					if(src.Target in oview(src, 1))
						src.dir=get_dir(src, src.Target)
						src.Melee(1, 5, accmulti=2+src.GetSuperDash())


			if("Absorb")
				if(Z.Using)
					return
				var/mob/Players/P = src.Target
				if(get_dist(P,src)>2)
					src << "You can't absorb them from so far away!"
					return
				if(!P.KO)
					src << "You cannot absorb a person while they're still standing."
				if(!src.Anger)
					src << "You're not angry enough to resort to this!"
					return
				if(P.Race=="Android")
					src << "[P] is indigestable."
					return
				if(P.KO)
					if(P.client.address==src.client.address||P.client.computer_id==src.client.computer_id)
						src << "You can't absorb a character from the same computer or IP."
						return
					else
						Z.Cooldown()
						missile('Absorb.dmi',src,P)
						sleep(3)
						if(1)
							src.OMessage(13,"[src] absorbed [P]!","[src]([src.key]) absorbed [P]([P.key])")
							if(src.AscensionsUnlocked<2)
								src.AscensionsUnlocked++
								src.AscAvailable(src.Race)
							else
								switch(P.Race)
									if("Human")
										src.StrAscension=max(src.StrAscension,P.AscensionsAcquired*0.25)
										src.EndAscension=max(src.EndAscension,P.AscensionsAcquired*0.25)
										src.SpdAscension=max(src.SpdAscension,P.AscensionsAcquired*0.25)
										src.ForAscension=max(src.ForAscension,P.AscensionsAcquired*0.25)
										src.OffAscension=max(src.OffAscension,P.AscensionsAcquired*0.25)
										src.DefAscension=max(src.DefAscension,P.AscensionsAcquired*0.25)
										src.Desperation=1
									if("Half Saiyan")
										src.StrAscension=max(src.StrAscension,max(P.AscensionsAcquired-2,0)*0.25)
										src.EndAscension=max(src.EndAscension,max(P.AscensionsAcquired-2,0)*0.25)
										src.SpdAscension=max(src.SpdAscension,max(P.AscensionsAcquired-2,0)*0.25)
										src.ForAscension=max(src.ForAscension,max(P.AscensionsAcquired-2,0)*0.25)
										src.OffAscension=max(src.OffAscension,max(P.AscensionsAcquired-2,0)*0.25)
										src.DefAscension=max(src.DefAscension,max(P.AscensionsAcquired-2,0)*0.25)
									if("Saiyan")
										src.Adaptation=max(src.Adaptation, P.Adaptation)
										src.Judgment=max(src.Judgment, P.Judgment)
										src.Defiance=max(src.Defiance, P.Defiance)
									if("Makyo")
										src.StrAscension=max(src.StrAscension, P.AscensionsAcquired*0.25)
										src.ForAscension=max(src.ForAscension, P.AscensionsAcquired*0.25)
									if("Namekian")
										src.SpdAscension=max(src.SpdAscension,P.AscensionsAcquired*0.25)
										src.RecovAscension=max(src.RecovAscension,P.AscensionsAcquired*0.25)
									if("Tuffle")
										src.PilotingProwess=max(src.PilotingProwess,P.PilotingProwess)
										src.EconomyMult=max(src.EconomyMult,P.EconomyMult)
									if("Demon")
										src.HellPower=1
									if("Shinjin")
										src.KiControlMastery=max(src.KiControlMastery,P.GetKiControlMastery())
										src.SpiritPower=1
									if("Changeling")
										src.BioArmorMax=50
									if("Dragon")
										src.StrAscension=max(src.StrAscension,(P.AscensionsAcquired+1)*0.125)
										src.EndAscension=max(src.EndAscension,(P.AscensionsAcquired+1)*0.125)
										src.SpdAscension=max(src.SpdAscension,(P.AscensionsAcquired+1)*0.125)
										src.ForAscension=max(src.ForAscension,(P.AscensionsAcquired+1)*0.125)
										src.OffAscension=max(src.OffAscension,(P.AscensionsAcquired+1)*0.125)
										src.DefAscension=max(src.DefAscension,(P.AscensionsAcquired+1)*0.125)
									if("Alien")
										if(P.Juggernaut)
											src.Juggernaut=max(src.Juggernaut,P.Juggernaut)
										if(P.Attunement=="Fire")
											src.Burning=max(src.Burning, P.GetBurning())
										if(P.Attunement=="Water")
											src.Chilling=max(src.Chilling, P.GetChilling())
										if(P.Attunement=="Earth")
											src.Crushing=max(src.Crushing, P.GetCrushing())
										if(P.Attunement=="Wind")
											src.Shocking=max(src.Shocking, P.GetShocking())
										if(P.Hustle)
											src.Hustle=max(src.Hustle,P.Hustle)
										if(P.Anaerobic)
											src.Anaerobic=max(src.Anaerobic,P.Anaerobic)
										if(P.Infusion)
											src.Infusion=max(src.Infusion,P.Infusion)
										if(P.Flicker)
											src.Flicker=max(src.Flicker,P.Flicker)
										if(P.Adrenaline)
											src.Adrenaline=max(src.Adrenaline,P.Adrenaline)
										if(P.EnhancedSmell)
											src.EnhancedSmell=max(src.EnhancedSmell,P.EnhancedSmell)
										if(P.EnhancedHearing)
											src.EnhancedHearing=max(src.EnhancedHearing,P.EnhancedHearing)
										if(P.see_invisible)
											src.see_invisible=max(src.see_invisible,P.see_invisible)
										if(P.Fishman)
											src.Fishman=max(src.Fishman,P.Fishman)
										if(P.VenomBlood)
											src.VenomBlood=max(src.VenomBlood,P.VenomBlood)
											src.VenomResistance=max(src.VenomResistance,P.VenomResistance)
									if("Monster")
										if(P.Class=="Beastmen")
											src.AngerPoint=max(src.AngerPoint,P.AngerPoint)
										if(P.Class=="Yokai")
											src.ManaCapMult=max(src.ManaCapMult,P.ManaCapMult)
										if(P.Class=="Eldritch")
											src.WalkThroughHell=max(src.WalkThroughHell,P.WalkThroughHell)
											src.DebuffImmune=max(src.DebuffImmune,P.DebuffImmune)
											src.NoDeath=max(src.NoDeath,P.NoDeath)
								src.RPPower=max(src.RPPower, (P.RPPower*P.PowerBoost*P.AngerMax)/(src.RPPower*src.PowerBoost*src.AngerMax))
								src.Intimidation=max(src.Intimidation, P.Intimidation)
								src.PotentialCap=max(src.PotentialCap, P.PotentialCap)
								src.Intelligence=max(src.Intelligence,P.Intelligence)
								if(P.Class in list("Potara","Dance"))
									src.FusionTimer=P.FusionTimer
							src.HealHealth(50)
							src.HealEnergy(50)
							P.loc=locate(global.DjinnZoneX, global.DjinnZoneY, global.DjinnZoneZ)
							P.Unconscious(0,"being absorbed!")
				return

			if("Time Skip")
				Z.Cooldown()
				src.appearance_flags+=NO_CLIENT_COLOR
				animate(src.client, color = list(-1,0,0, 0,-1,0, 0,0,-1, 1,1,1), time = 3)
				for(var/mob/Players/M in oview(20,src))
					M.client.fps=0.0001
				spawn(30)
					for(var/mob/Players/B in world)
						if(B.client.fps!=world.fps)
							B.client.fps=world.fps
						animate(B.client, color = null, time = 3)
						src.appearance_flags-=NO_CLIENT_COLOR
			if("Time Stop")
				if(src.TimeStop)
					src.TimeStop=0
					Z:TimeStopped=0
					for(var/mob/E in hearers(12,src))
						E<<"<font color=[src.Text_Color]>[src] says: Let the flow of time return to normal."
					for(var/mob/B in world)
						if(B.TimeFrozen)
							B.TimeFrozen=0
							B.Frozen=0
						spawn()animate(B.client, color = null, time = 3)
					Z.Cooldown()
				else
					if(src.Health<20/Z.Mastery)
						src << "You haven't the vitality to stop time..."
						return
					for(var/mob/E in hearers(12,src))
						E<<"<font color=[src.Text_Color]>[src] says: Time..."
					sleep(15)
					for(var/mob/M in view(20,src))
						spawn()animate(M.client, color = list(-1,0,0, 0,-1,0, 0,0,-1, 1,1,1), time = 7)
					for(var/mob/E in hearers(12,src))
						E<<"<font color=[src.Text_Color]>[src] yells: <b>...STOP!</b>"
					for(var/mob/M in view(20,src))
						if(M!=src&&M.WorldImmune==0&&!M.StaticWalk)
							M.Frozen=1
							M.TimeFrozen=1
					sleep(10)
					for(var/mob/M in view(20,src))
						spawn()animate(M.client, color = null, time = 3)
						spawn()animate(M.client, color = list(0.6,0,0.1, 0,0.6,0.1, 0,0,0.7, 0,0,0), time = 3)
					for(var/mob/E in hearers(12,src))
						E<<"<font color=[src.Text_Color]>[src] says: Time is now frozen."
					src.TimeStop=1
					Z:TimeStopped=0

			if("Heal")
				if(src.Energy<50)
					return
				if(src.KO)
					return
				for(var/mob/Players/P in get_step(src,src.dir))
					if(P)
						Z.Cooldown()
						view(src)<<"[src] heals [P]"
						if(src.Imagination<=1)
							src.LoseEnergy(50)
						src.LoseHealth(25)
						if(P.KO)
							P.Conscious()
						P.Sheared=0
						P.HealWounds(25*src.Imagination)
						P.HealHealth(25*src.Imagination)
						P.TotalFatigue=0
						P.Energy=P.EnergyMax
						if(P.BPPoison<1)
							if(src.Imagination>1)
								P.BPPoison=1
							P.BPPoisonTimer=1
						if(P.MortallyWounded)
							P.MortallyWounded=0
							P.TsukiyomiTime=1
							view(src)<<"[src] stabilizes [P]."
						if(P.Race=="Saiyan" && P.ZenkaiEXP>0)
							P.ZenkaiEXP=0
							P << "You feel your battle hardened nature soften..."
						if(P.SenseRobbed)
							if(P.SenseRobbed>=5)
								animate(P.client, color=null, time=1)
							P.SenseRobbed=0
							view(src)<<"[src] restores [P]'s robbed senses!"
						break
			if("Refresh")
				if(src.Energy<80)
					return
				if(src.KO)
					return
				for(var/mob/Players/P in oview(7,usr))
					if(P)
						Z.Cooldown()
						view(src)<<"[src] heals [P]"
						src.LoseEnergy(100)
						src.GainFatigue(100)
						if(P.KO)
							P.Conscious()
						P.Sheared=0
						P.HealWounds(25*src.Imagination)
						P.HealHealth(25*src.Imagination)
						P.TotalFatigue=0
						P.Energy=P.EnergyMax
						if(P.Race=="Saiyan" && P.ZenkaiEXP>0)
							P.ZenkaiEXP=0
							P << "You feel your battle hardened nature soften..."
						if(P.BPPoison<1)
							P.BPPoisonTimer=1
						if(P.MortallyWounded)
							P.MortallyWounded=0
							P.TsukiyomiTime=1
							view(src)<<"[src] stabilizes [P]."
						if(P.SenseRobbed)
							if(P.SenseRobbed>=5)
								animate(P.client, color=null, time=1)
							P.SenseRobbed=0
							view(src)<<"[src] restores [P]'s robbed senses!"
						break
			if("Regrowth")
				if(Z.Using)
					return
				if(!src.HasManaCapacity(50))
					src << "You do not have enough magic capacity to perform regrowth!"
					Using=0
					return
				src << "You begin channeling arcane life force. . ."
				sleep(100)
				src.TakeManaCapacity(50)
				Z.Cooldown()
				if(src.MortallyWounded)
					src.MortallyWounded=0
					src.TsukiyomiTime=1
					view(src) <<"[src] stabilizes themselves through regrowth!"
				if(BPPoison>1)
					BPPoison=1
					BPPoisonTimer=0
					view(src) <<"[src] recovers from their wounds through regrowth!"
				if(Maimed)
					Maimed=max(Maimed-1, 0)
					view(src) <<"[src] recovers a lost limb through regrowth!"
				if(SenseRobbed)
					if(SenseRobbed>=5)
						animate(client, color=null, time=1)
					SenseRobbed=0
					view(src) <<"[src] restores their robbed senses through regrowth!"
				if(StrCut)
					AddStrTax(StrCut)
					StrCut=0
				if(EndCut)
					AddEndTax(EndCut)
					EndCut=0
				if(SpdCut)
					AddSpdTax(SpdCut)
					SpdCut=0
				if(ForCut)
					AddForTax(ForCut)
					ForCut=0
				if(OffCut)
					AddOffTax(OffCut)
					OffCut=0
				if(DefCut)
					AddDefTax(DefCut)
					DefCut=0
				if(src.KO)
					src.Conscious()
				src.HealWounds(50)

			if("Fly")
				if(src.KO||src.icon_state=="Meditate"||src.icon_state=="Train"||src.icon_state=="KB") return
				if(src.Flying)
					if(Z.Using==1)//See: Meditate
						return
					Flight(src, Land=1)
				else if(src.Energy>(src.EnergyMax/10))
					src.Flying=1
					usr.OMessage(1,null,"[usr]([usr.key]) flew!")
					Flight(src, Start=1)
					Z.Using=1
					spawn(20)
						Z.Using=0
				else
					src<<"You do not have enough energy to fly."

			if("Clairvoyance")
				if(Z.BuffUsing)
					Z.BuffUsing=0
					src.sight &= ~(SEE_SELF|SEE_TURFS|SEE_MOBS|SEE_OBJS)
					src.OMessage(10,"[src]'s eyes revert to normal.","<font color=red>[src]([src.key]) deactivated Clairvoyance.")
				else
					Z.BuffUsing=1
					src.sight |= (SEE_SELF|SEE_TURFS|SEE_MOBS|SEE_OBJS)
					src.OMessage(10,"[src]'s pupils begin to pulsate with a strange, golden energy.","<font color=red>[src]([src.key]) activated Clairvoyance.")

			if("Telepath")
				var/list/who=list("Cancel")
				for(var/mob/Players/A in world)
					who.Add(A)
				for(var/mob/Players/W in who)
					if(!(locate(W.EnergySignature) in usr.EnergySignaturesKnown)&&!usr.SpiritPower)
						if(!(W in hearers(50,usr)))
							who.Remove(W)
					if(!W.EnergySignature&&!usr.SpiritPower)
						who.Remove(W)
				var/mob/Players/selector=input("Select a player to telepath.") in who||null
				if(selector=="Cancel")
					return
				var/message=input(src,"What do you want to telepath?") as text|null
				if(message==null)
					return
				message=copytext(message,1,500)
				if(selector)
					selector <<"<font face=Old English Text MT><font color=red>[src] says in telepathy, '[html_encode(message)]'"
					for(var/mob/Players/m in hearers(50, src))
						if(m==selector)
							continue
						if(m==src)
							continue
						if(m.HasTelepathy())
							if(m.HearThoughts)
								m<<"<font face=Old English Text MT><font color=red>[src] says to [selector] in telepathy, '[html_encode(message)]'"
					for(var/mob/Players/m in hearers(50, selector))
						if(m==selector)
							continue
						if(m==src)
							continue
						if(m.HasTelepathy())
							if(m.HearThoughts)
								m<<"<font face=Old English Text MT><font color=red>[src] says to [selector] in telepathy, '[html_encode(message)]'"
					selector.OMessage(0,null,"<font color=purple>[selector]([selector.key]) received the telepath '[html_encode(message)]' from [src]([src.key])")
				if(src)
					src<<"<font face=Old English Text MT><font color=red>You telepathed [selector], '[html_encode(message)]'"
					src.OMessage(0,null,"<font color=purple>[src]([src.key]) telepathed '[html_encode(message)]' to [selector]([selector.key])")

			if("PowerUp")
				if(src.KO)return
				if(src.PoweringDown)return
				if(src.Oozaru)return
				if(src.HasPiloting())return
				if(src.Transforming)return
				if(src.Kaioken)
					var/Mastery
					for(var/obj/Skills/Buffs/SpecialBuffs/Kaioken/KK in src)
						Mastery=KK.Mastery
					if(src.Kaioken<2+Mastery)
						switch(src.Kaioken)
							if(1)
								src.Kaioken=2
								src <<"<b>Kaioken Times Three!</b>"
							if(2)
								src.Kaioken=3
								src <<"<b>Kaioken Times Four!</b>"
							if(3)
								src.Kaioken=4
								src <<"<b>Kaioken Times Ten!</b>"
							if(4)
								src.Kaioken=5
								src <<"<b>Kaioken Times Twenty!</b>"
							if(5)
								src << "You're at your maximum level of Kaioken."
					else
						src << "You don't have enough mastery of Kaioken to push it further."
					return
				if(src.CheckActive("Ki Control")||(src.CheckSpecial("One Hundred Percent Power")&&src.TransUnlocked()<4)||(src.CheckSpecial("Fifth Form")&&src.TransUnlocked()<4))
					return
				if(src.HasPULock())
					return
				if(src.PoweringUp==1)
					if(src.TransActive()<src.TransUnlocked())
						src.PoweringUp=0
						src.Transform()
						return
				if(!src.PoweringUp)
					src.PoweringUp=1
					if(src.PowerControl>=100)
						if(src.Saga=="Cosmo")
							OMsg(src, "[src] ignites their Cosmo!!")
						else if(src.custom_powerup)
							OMsg(src, "[src] [src.custom_powerup]")
						else
							OMsg(src, "[src] begins gathering power!!")
						src.Auraz("Add")
					else
						src.PowerControl=100
						src << "You return to normal power."
						src.PoweringUp=0
			if("PowerDown")
				if(src.KO)
					return
				if(src.Oozaru)
					return
				if(src.HasPiloting())
					return
				if(src.Transforming)
					return
				if(src.Kaioken)
					src << "You douse your Kaioken..."
					src.SpecialBuff.Trigger(src)
					sleep()
					if(src.CheckActive("Ki Control"))
						for(var/obj/Skills/Buffs/ActiveBuffs/Ki_Control/KC in src)
							src.UseBuff(KC)
					return
				if(src.HasPULock())
					return
				if(src.PoweringUp)
					src.PoweringUp=0
					src << "You stop powering up."
					src.Auraz("Remove")
					return
				else
					if(src.CheckActive("Ki Control"))
						for(var/obj/Skills/Buffs/ActiveBuffs/Ki_Control/KC in src)
							src.UseBuff(KC)
							return
					if(src.CheckSpecial("One Hundred Percent Power"))
						for(var/obj/Skills/Buffs/SpecialBuffs/OneHundredPercentPower/FF in src)
							src.UseBuff(FF)
							return
					if(src.CheckSpecial("Fifth Form"))
						for(var/obj/Skills/Buffs/SpecialBuffs/FifthForm/FF in src)
							src.UseBuff(FF)
							return
					if(src.HasKiControl() && src.PowerControl > 100)
						src.PowerControl=100
						src.Auraz("Remove")
						src << "You return to normal power."
						return
					if((src.trans["active"]||src.trans["tension"]||src.ssj["active"]||src.ssj["god"])&&!src.HasNoRevert())
						for(var/obj/Skills/Buffs/B in src)
							if(src.BuffOn(B)&&B.Transform&&!B.AlwaysOn)
								B.Trigger(src)
								return
						src.Revert(Controlled=1)
						src << "You revert from your transformed state."
						return
					else
						if(src.PowerControl!=1)
							src.PowerControl=1
							src << "You restrain your power..."
							src.Auraz("Remove")
							return

			if("FalseMoon")
				if(Z.Using)
					return
				if(src.KO)
					return
				Z.Cooldown()
				src.OMessage(10,"[src] conjures up a ball of energy into their palm and chucks it into the sky!.","[src]([src.key]) made a false moon!")
				new/obj/ProjectionMoon(src.loc)

			if("CallStar")
				if(Z.Using)
					return
				if(src.KO)
					return
				Z.Cooldown()
				src.OMessage(10,"[src] invokes the appearance of the crimson Star!","[src]([src.key]) called upon the cursed star!")
				CallStar(src.z)

			if("Zanzoken")
				if(!src.Move_Requirements())
					return
				if(src.PoweringUp)
					return
				if(src.Beaming||src.BusterTech)
					return

				//UNTARGETED ZANZO
				if(!src.Target)
					src.ActiveZanzo=3
					src.MovementCharges--

				//TARGETED ZANZO
				else
					if(src.Target in oview(15,src))
						src.StopKB()
						if(src.Target.Beaming==2)
							if(!(src.Target in view(10, src)))
								return
							src.Move(get_step(src.Target,src.Target.dir))
							src.dir=src.Target.dir
						else
							if(src.UsingGhostDrive())
								AfterImageGhost(src)
								src.Comboz(src.Target)
								src.dir=get_dir(src,src.Target)
								src.Instinct++
								src.Instinct++
								src.Melee(1, 5, accmulti=2, SureKB=1, BreakAttackRate=1)
								src.Instinct--
								src.Instinct--
							else
								if(src.GiantForm)
									var/Wave=2
									for(var/wav=Wave, wav>0, wav--)
										KenShockwave(src, icon='fevKiai.dmi', Size=Wave)
										Wave/=2
								else
									VanishImage(src)
								src.Comboz(src.Target)
								src.dir=get_dir(src,src.Target)
								src.Instinct++
								src.Melee(1, 5, accmulti=1, SureKB=1, BreakAttackRate=1)
								src.Instinct--
						src.MovementCharges--

			if("Walking")
				if(src.KO||src.Stunned||src.AutoHitting||src.Frozen>=2||src.PoweringUp)
					return
				if(src.Stasis)
					return
				if(Z.Using)
					return
				Z.Cooldown()
				src.ActiveZanzo=0
				sleep()
				src.ActiveZanzo=4

			if("Blink")
				if(src.KO||src.Stunned||src.AutoHitting||src.Frozen>=2||src.PoweringUp)
					return
				if(src.Stasis)
					return
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src << "You begin to rapidly skip through space!"
					return
				else
					Z.BuffUsing=0
					src << "You stabilize your position in space."
					return

			if("KeepBody")
				for(var/mob/Players/P in get_step(src,dir))
					if(P.KeepBody)
						if(!P.KO)
							return
						P.KeepBody=0
						src.OMessage(10,"[src] takes [P]'s body","[src]([src.key]) took [P]([P.key]) 's body")

					else
						P.KeepBody=1
						src.OMessage(10,"[src] gives [P]'s their body.","[src]([src.key]) gave [P]([P.key]) their body.")
					break

			if("GivePower")
				if(Z.Using)
					return
				if(!src.KO)
					for(var/mob/P in get_step(src,dir))
						P.HealHealth(src.Health/2*src.Imagination)
						P.HealEnergy(src.Energy/2*src.Imagination)
						P.BPPoison+=((src.Power/src.GetPowerUpRatio())/(P.Power/P.GetPowerUpRatio()))
						P.BPPoisonTimer=RawMinutes(5*src.Imagination)
						if(P.SenseRobbed)
							if(P.SenseRobbed>=5)
								animate(P.client, color=null, time=1)
							P.SenseRobbed=0
						src.Unconscious(null,"giving power to [P]!")
						src.OMessage(10,null,"[src]([src.key]) gave power to [P]([P.key])")
						return
					Z.Cooldown()

			if("UnlockPotential")
				if(src.KO)
					return
				var/list/Choices=new
				Choices+="Cancel"
				for(var/mob/Players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Unlock the Potential of who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Mystic || world.realtime+Day(10) < Choice.PotentialUnlocked)
					if(Choice.Mystic)
						OMsg(src, "[src] reached to unlock [Choice]'s potential...but that well has already been tapped!")
						return
					else
						OMsg(src, "[src] reached to unlock [Choice]'s potential...but it's been too soon since it was already tapped!")
						return
				if(Choice.PotentialUnlocked<world.realtime+Day(10))
					Choice.PotentialCap*=2
					Choice.Potential+=10
					Choice.Mystic=1
					Choice.CalmAnger+=1
					if(Choice.AscensionsUnlocked<5)
						Choice.AscensionsUnlocked++
					if(!Choice.HasSSjVars()&&Choice.trans["unlocked"]<3)
						Choice.trans["unlocked"]++
					if(Choice.HasSSjVars()&&Choice.ssj["unlocked"]<3)
						Choice.ssj["unlocked"]++
						Choice.masteries["1mastery"]=100
						Choice.masteries["2mastery"]=100
						Choice.masteries["3mastery"]=100
					Choice.SetVars()
				else
					Choice.PotentialUnlocked+=world.realtime+Day(10)
					Choice.Potential+=10
					Choice.PotentialCap*=1.5
					if(Choice.AscensionsUnlocked<5)
						Choice.AscensionsUnlocked++
				OMsg(src, "[src] brought forth [Choice]'s latent potential!")
				Log("Admin","[src] has unlocked [Choice]'s Potential. Please investigate if this was unauthorized.")
				//fuck yourself (temporarily)
				src.AddStrTax(Choice.Potential/100)
				src.AddEndTax(Choice.Potential/100)
				src.AddForTax(Choice.Potential/100)
				src.AddSpdTax(Choice.Potential/100)
				src.AddRecovTax(Choice.Potential/100)
				src.GainFatigue(Choice.Potential)
				src.LoseCapacity(Choice.Potential)
				src << "You feel physically and mentally drained after the fact."


atom/proc/Quake(var/duration=30, var/globe=0)
	set waitfor=0
	while(duration)
		duration-=1
		if(!globe)
			for(var/mob/M in view(src))
				if(M.client)
					M.client.pixel_x=rand(-8,8)
					M.client.pixel_y=rand(-8,8)
				if(!duration)
					if(M.client)
						M.client.pixel_x=0
						M.client.pixel_y=0
		else
			for(var/mob/M in world)
				if(M.z!=globe&&globe!=999)
					continue
				if(M.client)
					M.client.pixel_x=rand(-8,8)
					M.client.pixel_y=rand(-8,8)
				if(!duration)
					if(M.client)
						M.client.pixel_x=0
						M.client.pixel_y=0
		if(duration<0)
			duration=0
		sleep(1)

atom/proc/Earthquake(var/duration=30,var/xpixelmin=0,var/xpixelmax=5,var/ypixelmin=0,var/ypixelmax=5, var/globe=0)
	while(duration)
		duration-=1
		if(!globe)
			for(var/mob/M in view(src))
				if(M.client)
					M.client.pixel_x=rand(xpixelmin,xpixelmax)
					M.client.pixel_y=rand(ypixelmin,ypixelmax)
				if(!duration) if(M.client)
					M.client.pixel_x=0
					M.client.pixel_y=0
		else
			for(var/mob/M in world)
				if(M.z!=globe&&globe!=999)
					continue
				if(M.client)
					M.client.pixel_x=rand(xpixelmin,xpixelmax)
					M.client.pixel_y=rand(ypixelmin,ypixelmax)
				if(!duration)
					if(M.client)
						M.client.pixel_x=0
						M.client.pixel_y=0
		if(duration<0)
			duration=0
		sleep(1)