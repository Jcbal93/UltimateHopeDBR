obj/Skills
	Grapple
		var
			DamageMult=1
			MultiHit=1//hit multiple times durr
			EnergyDamage=0//do damage to energy+fatigue and heal self mana

			StrRate=1
			ForRate=0
			EndRate=1

			UnarmedOnly=1
			SwordOnly=0//TODO REMOVE
			SpecialAttack=0//staves n shiet

			ObjectEnabled=0
			Reversal=0//allows you to throw the one you've grabbed
			//Stunner

			ThrowDir/*carries a direction so people dont end up going wonky*/
			ThrowAdd=0//adds value to kb
			ThrowMult=1//mult value to kb

			TriggerMessage
			Effect//"Shockwave"
			EffectMult=1
			OneAndDone=0//prevents multiple iterations from effectmult
////BASIC
		Toss
			DamageMult=0
			UnarmedOnly=0
			ObjectEnabled=1
			CooldownStatic=1
			Cooldown=20
			TriggerMessage="tosses"
			verb/Toss()
				set category="Skills"
				if(!usr.Grab && !src.Using)
					usr.SecretToss(src)
				else
					src.Activate(usr)
////AUTO TRIGGER
		Lotus_Drop
			DamageMult=5
			StrRate=1
			TriggerMessage="spins into a vicious lotus drop to crack the skull of"
			Effect="Lotus"
			EffectMult=3
			OneAndDone=1
			ThrowMult=0
			ThrowAdd=0
			//Set from other queues
		True_Lotus
			DamageMult=10
			StrRate=1
			TriggerMessage="embraces the full power of their youth to spiral into a lotus drop to crack the skull of"
			Effect="Lotus"
			EffectMult=4
			OneAndDone=1
			ThrowMult=0
			ThrowAdd=0
			//still set from other queues
////UNARMED
		Snake_Fang_Bites
			MultiHit=2
			DamageMult=2
			StrRate=1
			ForRate=1
			ThrowAdd=5
			TriggerMessage="drives two fang-hands into"
			Effect="Strike"
			EffectMult=1
		Hammer_Crush
			Stunner=3
			DamageMult=4
			StrRate=1
			ForRate=0
			ThrowAdd=1
			ThrowMult=0
			TriggerMessage="presses down fiercely on"
			Effect="Suplex"
		Imperial_Disgust
			Stunner=5
			DamageMult=10
			StrRate=1
			ForRate=1
			ThrowMult=0
			ThrowAdd=10
			TriggerMessage="casts all of their disgust upon"
			Effect="Bang"
			EffectMult=5
//T1 is in Queues.
//T2 is in Autohits.
//T3 has damage mult 3 - 5.
		Throw
			SkillCost=120
			Copyable=3
			DamageMult=4
			StrRate=1
			ThrowAdd=5
			ThrowMult=1.5
			TriggerMessage="violently throws"
			Effect="Shockwave"
			Cooldown=90
			verb/Throw()
				set category="Skills"
				src.Activate(usr)
		Judo_Throw
			SkillCost=120
			Copyable=4
			PreRequisite=list("/obj/Skills/Grapple/Throw")
			LockOut=list("/obj/Skills/Grapple/Izuna_Drop", "/obj/Skills/Grapple/Suplex", "/obj/Skills/Grapple/Burning_Finger")
			DamageMult=3
			Reversal=1
			Stunner=2
			StrRate=1
			ThrowAdd=1
			ThrowMult=0
			TriggerMessage="performs a judo throw on"
			Effect="Shockwave"
			Cooldown=90
			verb/Judo_Throw()
				set category="Skills"
				src.Activate(usr)
		Izuna_Drop
			SkillCost=120
			Copyable=4
			PreRequisite=list("/obj/Skills/Grapple/Throw")
			LockOut=list("/obj/Skills/Grapple/Judo_Throw", "/obj/Skills/Grapple/Suplex", "/obj/Skills/Grapple/Burning_Finger")
			DamageMult=5
			StrRate=1
			ThrowAdd=0
			ThrowMult=0
			TriggerMessage="goes on a short flight with"
			Effect="Lotus"
			EffectMult=2
			OneAndDone=1
			Cooldown=90
			verb/Izuna_Drop()
				set category="Skills"
				src.Activate(usr)
		Suplex
			SkillCost=120
			Copyable=4
			PreRequisite=list("/obj/Skills/Grapple/Throw")
			LockOut=list("/obj/Skills/Grapple/Judo_Throw", "/obj/Skills/Grapple/Izuna_Drop", "/obj/Skills/Grapple/Burning_Finger")
			DamageMult=4
			Stunner=4
			StrRate=1
			ThrowAdd=1
			ThrowMult=0
			TriggerMessage="suplexes"
			Effect="Suplex"
			EffectMult=1
			Cooldown=90
			verb/Suplex()
				set category="Skills"
				src.Activate(usr)
		Burning_Finger
			SkillCost=120
			Copyable=4
			PreRequisite=list("/obj/Skills/Grapple/Throw")
			LockOut=list("/obj/Skills/Grapple/Judo_Throw", "/obj/Skills/Grapple/Izuna_Drop", "/obj/Skills/Grapple/Suplex")
			DamageMult=4
			StrRate=0.75
			ForRate=0.75
			TriggerMessage="shoves their burning red hand through"
			Effect="Bang"
			EffectMult=2
			ThrowMult=0
			ThrowAdd=5
			Cooldown=90
			verb/Burning_Finger()
				set category="Skills"
				src.Activate(usr)
//T4 is in Queues and Autohits.
//T5 (Sig 1) is damage mult 5, usually.
		Erupting_Burning_Finger
			UnarmedOnly=0
			NeedsSword=0
			SignatureTechnique=1
			DamageMult=5
			StrRate=2
			ForRate=1
			TriggerMessage="shoves their grossly incandescent hand through"
			Effect="Bang"
			EffectMult=5
			ThrowMult=0
			ThrowAdd=15
			Cooldown=150
			verb/Erupting_Burning_Finger()
				set category="Skills"
				src.Activate(usr)
		Lightning_Stake
			UnarmedOnly=0
			NeedsSword=0
			SignatureTechnique=1
			DamageMult=5
			ForRate=2
			StrRate=1
			TriggerMessage="fills their grasp with lightning and takes hold of"
			Effect="Lightning"
			EffectMult=5
			ThrowMult=0
			ThrowAdd=15
			Cooldown=150
			verb/Lightning_Stake()
				set category="Skills"
				src.Activate(usr)




		Energy_Drain
			DamageMult=0.5
			EnergyDamage=5
			ForRate=1
			StrRate=0
			TriggerMessage="drains energy from"
			Effect="Drain"
			EffectMult=1
			OneAndDone=1
			Cooldown=30
			verb/Energy_Drain()
				set category="Skills"
				src.Activate(usr)

		Sword
			NeedsSword=1
			UnarmedOnly=0

			Butterfly_Souffle
				DamageMult=1
				MultiHit=5
				StrRate=1
				ThrowMult=0
				ThrowAdd=1
				TriggerMessage="rips and tears into"
				Effect="Strike"
				EffectMult=5

			Impale
				Copyable=3
				SkillCost=120
				DamageMult=4
				StrRate=0.5
				ForRate=0.5
				TriggerMessage="impales"
				Effect="Strike"
				EffectMult=2
				ThrowMult=1.5
				Cooldown=90
				verb/Impale()
					set category="Skills"
					src.Activate(usr)
			Blade_Drive//run through pt 2
				DamageMult=4
				StrRate=1
				ThrowMult=2
				TriggerMessage="drives their weapon through the guts of"
				Effect="Shockwave"
				EffectMult=3
				//set from other queues
			Eviscerate
				PreRequisite=list("/obj/Skills/Grapple/Sword/Impale")
				LockOut=list("/obj/Skills/Queue/Run_Through", "/obj/Skills/Grapple/Sword/Hacksaw", "/obj/Skills/Grapple/Sword/Form_Ataru")
				Copyable=4
				SkillCost=120
				DamageMult=1
				MultiHit=5
				StrRate=1
				ThrowMult=0
				ThrowAdd=0
				TriggerMessage="eviscerates"
				Effect="Strike"
				EffectMult=5
				Cooldown=90
				verb/Eviscerate()
					set category="Skills"
					src.Activate(usr)
			Hacksaw
				PreRequisite=list("/obj/Skills/Grapple/Sword/Impale")
				LockOut=list("/obj/Skills/Queue/Run_Through", "/obj/Skills/Grapple/Sword/Eviscerate", "/obj/Skills/Grapple/Sword/Form_Ataru")
				Copyable=4
				SkillCost=120
				DamageMult=5
				StrRate=1
				ThrowMult=0
				ThrowAdd=0
				TriggerMessage="hacks their weapon cruelly into"
				Effect="Strike"
				EffectMult=3
				MaimStrike=1
				Cooldown=90
				verb/Hacksaw()
					set category="Skills"
					src.Activate(usr)
				Cancer_Snap
					NeedsSword=0
					TriggerMessage="uses their legs to crush"
					Cooldown=0
					//set from Acubens
			Form_Ataru
				PreRequisite=list("/obj/Skills/Grapple/Sword/Impale")
				LockOut=list("/obj/Skills/Queue/Run_Through", "/obj/Skills/Grapple/Sword/Hacksaw", "/obj/Skills/Grapple/Sword/Eviscerate")
				Copyable=4
				SkillCost=120
				DamageMult=3
				Reversal=1
				StrRate=0.5
				ForRate=0.5
				ThrowMult=0
				ThrowAdd=1
				TriggerMessage="does a slashing flip to break free of"
				Effect="Strike"
				EffectMult=2
				Cooldown=90
				verb/Form_Ataru()
					set category="Skills"
					set name="Form: Ataru"
					src.Activate(usr)



		proc
			Activate(var/mob/User)
				src.ThrowDir=User.dir
				if(src.Using)
					return
				if(User.GrabMove)
					return//do not allow for grab moves to be mashed
				if(!User.Grab)
					if(src.Reversal)
						var/mob/Grabber=User.IsGrabbed()
						if(Grabber)
							Grabber.Grab=null
							User.Grab=Grabber
						else
							return
					else
						return
				if(src.UnarmedOnly)
					if(User.EquippedSword() && User.NotUsingChamploo())
						User << "You cannot use a sword and use [src]!"
						return
					if(User.EquippedStaff() && User.UsingBattleMage())
						User << "You cannot use Battle Mage style and use [src]!"
						return
				if(src.NeedsSword)
					if(!User.EquippedSword() && User.NotUsingLiving() && !(User.EquippedStaff() && User.UsingBattleMage()))
						User << "You have to have a sword to use [src]!"
						return

				if(!src.ObjectEnabled)
					if(isobj(User.Grab))
						User << "You cannot use [src] on an object!"
						return
				else//object grapples
					if(isobj(User.Grab))
						if(istype(src, /obj/Skills/Grapple/Toss))
							var/obj/Q=User.Grab
							User.Grab=null
							for(var/x=5, x>0, x--)
								Q.transform=turn(Q.transform, 225)
								step(Q, src.ThrowDir)
								sleep(1)
							Q.transform=matrix()
							return//dont trigger cd for object interacts

				if(ismob(User.Grab))
					User.GrabMove=1
					var/mob/Trg=User.Grab
					User.Grab=null
					var/StatPower=User.Power
					if(src.StrRate)
						StatPower*=User.GetStr(src.StrRate)
					if(src.ForRate)
						StatPower*=User.GetFor(src.ForRate)
					StatPower/=Trg.Power
					StatPower/=Trg.GetEnd(src.EndRate)
					if(src.NeedsSword)
						StatPower*=User.GetSwordDamage(User.EquippedSword())
					if(src.SpecialAttack)
						var/obj/Items/Enchantment/Staff/st=User.EquippedStaff()
						var/obj/Items/Sword/sw=User.EquippedSword()
						if(sw?.MagicSword)
							StatPower*=User.GetSwordDamage(sw)
						else if(st)
							StatPower*=User.GetStaffDamage(st)

					var/Damage=StatPower
					if(src.DamageMult>=1)
						Damage*=TrueDamage(src.DamageMult)
					else
						Damage*=src.DamageMult
					var/Hits=src.MultiHit
					if(src.MaimStrike)
						User.MaimStrike+=src.MaimStrike
					while(Hits)
						if(!src.EnergyDamage)
							User.DoDamage(Trg, Damage, src.UnarmedOnly, src.NeedsSword, SpiritAttack=src.SpecialAttack)
						else
							Trg.LoseEnergy(Damage*src.EnergyDamage)
							Trg.GainFatigue(Damage*src.EnergyDamage)
							User.HealMana(Damage*src.EnergyDamage)
						Hits--
					if(src.MaimStrike)
						User.MaimStrike-=src.MaimStrike
					OMsg(User, "[User] [src.TriggerMessage] [Trg]!")
					User.Knockback((StatPower*src.ThrowMult)+src.ThrowAdd, Trg, Direction=src.ThrowDir, Forced=1)
					if(src.Stunner)
						Stun(Trg, src.Stunner)
					if(src.Effect in list("Suplex", "Drain", "Lotus"))
						src.OneAndDone=1
					var/Times=src.EffectMult
					spawn()
						if(src.OneAndDone)
							Times=1
						while(Times)
							switch(src.Effect)
								if("Shockwave")
									KenShockwave(Trg)
								if("Bang")
									Bang(Trg.loc, 1.3, Offset=0.75)
								if("Lightning")
									LightningStrike2(Trg, Offset=GoCrand(0.5,0.1*src.EffectMult))
								if("Lotus")
									LotusEffect(User, Trg, src.EffectMult)
								if("Suplex")
									SuplexEffect(User, Trg)
								if("Strike")
									User.HitEffect(Trg)
								if("Drain")
									animate(Trg, color=list(1,1,1, 0,1,0, 1,1,1, 0,0,0), time=10, flags=ANIMATION_RELATIVE)
									sleep(10)
									animate(Trg, color=Trg.MobColor, time=10, flags=ANIMATION_RELATIVE)
									sleep(10)
							sleep(2)
							Times--
						sleep(5)//final effects
						switch(src.Effect)
							if("Bang")//biggest boom
								Bang(Trg.loc, src.EffectMult, Offset=0)
								KenShockwave(Trg, src.EffectMult/2)
							if("Lightning")
								KenShockwave(Trg, src.EffectMult/2)
							if("Strike")
								KenShockwave(Trg, src.EffectMult)

					User.GrabMove=0
					src.Cooldown()
				else
					Log("Admin", "[ExtractInfo(User)] currently has [User.Grab.type] grabbed and attempted to grapple them with [src].")