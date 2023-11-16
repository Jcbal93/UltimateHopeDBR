mob
	proc
		HasPassive(var/Passive, var/BuffsOnly=0, var/SwordBuff=0, var/StaffBuff=0, var/NoMobVar=0, var/NoAttackQueue=0)
			if(src.StanceBuff)
				if(src.StanceBuff.vars["[Passive]"])
					return 1
			if(src.StyleBuff)
				if(src.StyleBuff.vars["[Passive]"])
					return 1
			if(src.ActiveBuff)
				if(src.ActiveBuff.vars["[Passive]"])
					return 1
			if(src.SpecialBuff)
				if(src.SpecialBuff.vars["[Passive]"])
					return 1
			for(var/obj/Skills/Buffs/SlotlessBuffs/b in src.SlotlessBuffs)
				if(b.vars["[Passive]"])
					return 1
			if(!BuffsOnly && !NoAttackQueue)
				if(src.AttackQueue)
					if(src.AttackQueue.vars["[Passive]"])
						return 1
			if(SwordBuff||StaffBuff)
				var/obj/Items/Sword/s=src.EquippedSword()
				var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
				if(SwordBuff)
					if(s)
						if(s.vars["[Passive]"])
							return 1
				if(StaffBuff)
					if(st)
						if(st.vars["[Passive]"])
							return 1
			else
				if(!NoMobVar)
					if(src.vars["[Passive]"])
						return 1
			return 0
		GetPassive(var/Passive, var/BuffsOnly=0, var/SwordBuff=0, var/StaffBuff=0, var/NoMobVar=0, var/NoAttackQueue=0)
			var/Return=0

			if(SwordBuff)
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s)
					if(s.vars["[Passive]"])
						Return+=s.vars["[Passive]"]
			if(StaffBuff)
				var/obj/Items/Sword/st=src.EquippedStaff()
				if(st)
					if(st.vars["[Passive]"])
						Return+=st.vars["[Passive]"]
			if(!NoMobVar)
				if(src.vars["[Passive]"])
					Return+=src.vars["[Passive]"]
			if(src.StanceBuff)
				if(src.StanceBuff.vars["[Passive]"])
					Return+=src.StanceBuff.vars["[Passive]"]
			if(src.StyleBuff)
				if(src.StyleBuff.vars["[Passive]"])
					Return+=src.StyleBuff.vars["[Passive]"]
			if(src.ActiveBuff)
				if(src.ActiveBuff.vars["[Passive]"])
					Return+=src.ActiveBuff.vars["[Passive]"]
			if(src.SpecialBuff)
				if(src.SpecialBuff.vars["[Passive]"])
					Return+=src.SpecialBuff.vars["[Passive]"]
			for(var/obj/Skills/Buffs/SlotlessBuffs/b in src.SlotlessBuffs)
				if(b.vars["[Passive]"])
					Return+=b.vars["[Passive]"]
			if(!BuffsOnly)
				if(src.AttackQueue && !NoAttackQueue)
					if(src.AttackQueue.vars["[Passive]"])
						Return+=src.AttackQueue.vars["[Passive]"]
			return Return
		GetPassiveCount(var/Passive, var/BuffsOnly=0, var/SwordBuff=0, var/StaffBuff=0, var/NoMobVar=0)
			var/Sources=0
			if(SwordBuff)
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s)
					if(s.vars["[Passive]"])
						Sources++
			else
				if(!NoMobVar)
					if(src.vars["[Passive]"])
						Sources++
			if(src.StanceBuff)
				if(src.StanceBuff.vars["[Passive]"])
					Sources++
			if(src.StyleBuff)
				if(src.StyleBuff.vars["[Passive]"])
					Sources++
			if(src.ActiveBuff)
				if(src.ActiveBuff.vars["[Passive]"])
					Sources++
			if(src.SpecialBuff)
				if(src.SpecialBuff.vars["[Passive]"])
					Sources++
			for(var/obj/Skills/Buffs/SlotlessBuffs/b in src.SlotlessBuffs)
				if(b.vars["[Passive]"])
					Sources++
			if(!BuffsOnly)
				if(src.AttackQueue)
					if(src.AttackQueue.vars["[Passive]"])
						Sources++
			return Sources
		AveragePassive(var/Passive, var/BuffsOnly=0, var/SwordBuff=0, var/StaffBuff=0, var/NoMobVar=0)
			var/Return=0
			var/Sources=0
			if(SwordBuff)
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s)
					if(s.vars["[Passive]"])
						Return+=s.vars["[Passive]"]
						Sources++
			else
				if(!NoMobVar)
					if(src.vars["[Passive]"])
						Return+=src.vars["[Passive]"]
						Sources++
			if(src.StanceBuff)
				if(src.StanceBuff.vars["[Passive]"])
					Return+=src.StanceBuff.vars["[Passive]"]
					Sources++
			if(src.StyleBuff)
				if(src.StyleBuff.vars["[Passive]"])
					Return+=src.StyleBuff.vars["[Passive]"]
					Sources++
			if(src.ActiveBuff)
				if(src.ActiveBuff.vars["[Passive]"])
					Return+=src.ActiveBuff.vars["[Passive]"]
					Sources++
			if(src.SpecialBuff)
				if(src.SpecialBuff.vars["[Passive]"])
					Return+=src.SpecialBuff.vars["[Passive]"]
					Sources++
			for(var/obj/Skills/Buffs/SlotlessBuffs/b in src.SlotlessBuffs)
				if(b.vars["[Passive]"])
					Return+=b.vars["[Passive]"]
					Sources++
			if(!BuffsOnly)
				if(src.AttackQueue)
					if(src.AttackQueue.vars["[Passive]"])
						Return+=src.AttackQueue.vars["[Passive]"]
						Sources++
			Return/=Sources
			Return=round(Return, 0.25)
			return Return
		GetSwordDamage(var/obj/Items/Sword/s)
			var/list/Swordsmanship=list("Weapon Soul", "Hiten Mitsurugi-Ryuu")
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.DamageEffectiveness
				Ascensions=s.Ascended
				if(src.HasSwordAscension())
					Ascensions+=src.GetSwordAscension()
					if(Ascensions>4)
						Ascensions=4
				if(src.Saga)
					if(src.Saga in Swordsmanship)
						if(round(src.SagaLevel/2)>Ascensions)
							Ascensions=round(src.SagaLevel/2)
				if(s.Glass)
					Ascensions+=1
				if(s.Conversions=="Sharp")
					Ascensions+=1
			else if(src.CheckSlotless("Excalibur"))
				Total=2
				if(src.HasSwordAscension())
					Ascensions+=src.GetSwordAscension()
					if(Ascensions>4)
						Ascensions=4
			else if(!src.NotUsingLiving() && src.StyleBuff)
				Ascensions=round(src.StyleBuff.Mastery/2)
			else if(src.UsingKendo())
				Ascensions=1+src.UsingKendo()+src.StyleBuff.Mastery
			if(src.HasSwordDamageBuff())
				Ascensions+=src.GetSwordDamageBuff()
			Total*=1+(Ascensions*0.25)
			return Total
		GetSwordDelay(var/obj/Items/Sword/s)
			var/list/Swordsmanship=list("Weapon Soul", "Hiten Mitsurugi-Ryuu")
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.SpeedEffectiveness
				Ascensions=s.Ascended
				if(src.HasSwordAscension())
					Ascensions+=src.GetSwordAscension()
					if(Ascensions>4)
						Ascensions=4
				if(src.Saga)
					if(src.Saga in Swordsmanship)
						if(round(src.SagaLevel/2)>Ascensions)
							Ascensions=round(src.SagaLevel/2)
				if(s.Glass)
					Ascensions+=1
				if(s.Conversions=="Light")
					Ascensions+=1
			else if(src.CheckSlotless("Excalibur"))
				Total=0.95
				if(src.HasSwordAscension())
					Ascensions+=src.GetSwordAscension()
					if(Ascensions>4)
						Ascensions=4
			else if(!src.NotUsingLiving() && src.StyleBuff)
				Ascensions=round(src.StyleBuff.Mastery/2)
			else if(src.UsingKendo())
				Ascensions=1+src.UsingKendo()+src.StyleBuff.Mastery
			if(src.HasSwordDelayBuff())
				Ascensions+=src.GetSwordDelayBuff()
			Total*=1+(Ascensions*0.125)
			return Total
		GetSwordAccuracy(var/obj/Items/Sword/s)
			var/list/Swordsmanship=list("Weapon Soul", "Hiten Mitsurugi-Ryuu")
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.AccuracyEffectiveness
				Ascensions=s.Ascended
				if(src.HasSwordAscension())
					Ascensions+=src.GetSwordAscension()
					if(Ascensions>4)
						Ascensions=4
				if(src.Saga)
					if(src.Saga in Swordsmanship)
						if(round(src.SagaLevel/2)>Ascensions)
							Ascensions=round(src.SagaLevel/2)
				if(s.Glass)
					Ascensions+=1
				if(s.Conversions=="Hardened")
					Ascensions-=1
			else if(src.CheckSlotless("Excalibur"))
				Total=0.9
				if(src.HasSwordAscension())
					Ascensions+=src.GetSwordAscension()
					if(Ascensions>4)
						Ascensions=4
			else if(!src.NotUsingLiving() && src.StyleBuff)
				Ascensions=round(src.StyleBuff.Mastery/2)
			else if(src.UsingKendo())
				Ascensions=1+src.UsingKendo()+src.StyleBuff.Mastery
			if(src.HasSwordAccuracyBuff())
				Ascensions+=src.GetSwordAccuracyBuff()
			Total*=1+(Ascensions*0.0625)
			return Total
		HasSwordAscension()
			if(src.HasPassive("SwordAscension", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetSwordAscension()
			return src.GetPassive("SwordAscension", BuffsOnly=1, NoMobVar=1)
		HasSwordDamageBuff()
			if(src.HasPassive("SwordDamage", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetSwordDamageBuff()
			return src.GetPassive("SwordDamage", BuffsOnly=1, NoMobVar=1)
		HasSwordDelayBuff()
			if(src.HasPassive("SwordDelay", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetSwordDelayBuff()
			return src.GetPassive("SwordDelay", BuffsOnly=1, NoMobVar=1)
		HasSwordAccuracyBuff()
			if(src.HasPassive("SwordAccuracy", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetSwordAccuracyBuff()
			return src.GetPassive("SwordAccuracy", BuffsOnly=1, NoMobVar=1)
		GetStaffDamage(var/obj/Items/Enchantment/Staff/s)
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.DamageEffectiveness
				Ascensions=s.Ascended
				if(src.HasStaffAscension())
					Ascensions+=src.GetStaffAscension()
					if(Ascensions>4)
						Ascensions=4
			Total*=1+(Ascensions*0.25)
			return Total
		GetStaffDrain(var/obj/Items/Enchantment/Staff/s)
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.SpeedEffectiveness
				Ascensions=s.Ascended
				if(src.HasStaffAscension())
					Ascensions+=src.GetStaffAscension()
					if(Ascensions>4)
						Ascensions=4
			Total*=1+(Ascensions*0.125)
			return Total
		GetStaffAccuracy(var/obj/Items/Enchantment/Staff/s)
			var/Total=1
			if(s)
				Total=s.AccuracyEffectiveness
				var/Ascensions=s.Ascended
				if(src.HasStaffAscension())
					Ascensions+=src.GetStaffAscension()
					if(Ascensions>4)
						Ascensions=4
				if(s.Conversions=="Hardened")
					Ascensions-=1
				Total*=1+(Ascensions*0.0625)
			return Total
		HasStaffAscension()
			if(src.HasPassive("StaffAscension", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetStaffAscension()
			return src.GetPassive("StaffAscension", BuffsOnly=1, NoMobVar=1)
		GetArmorDamage(var/obj/Items/Armor/s)
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.DamageEffectiveness
				Ascensions=s.Ascended
				if(src.HasArmorAscension())
					Ascensions+=src.GetArmorAscension()
					if(Ascensions>4)
						Ascensions=4
				if(src.HasArmorDamageBuff())
					Ascensions+=src.GetArmorDamageBuff()
			Total*=1+(Ascensions*0.125)
			return Total
		GetArmorDelay(var/obj/Items/Armor/s)
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.SpeedEffectiveness
				Ascensions=s.Ascended
				if(src.HasArmorAscension())
					Ascensions+=src.GetArmorAscension()
					if(Ascensions>4)
						Ascensions=4
				if(src.HasArmorDelayBuff())
					Ascensions+=src.GetArmorDelayBuff()
			Total*=1+(Ascensions*0.05)
			return Total
		GetArmorAccuracy(var/obj/Items/Armor/s)
			var/Total=1
			var/Ascensions=0
			if(s)
				Total=s.AccuracyEffectiveness
				Ascensions=s.Ascended
				if(src.HasArmorAscension())
					Ascensions+=src.GetArmorAscension()
					if(Ascensions>4)
						Ascensions=4
				if(s.Conversions=="Hardened")
					Ascensions-=1
				if(src.HasArmorAccuracyBuff())
					Ascensions+=src.GetArmorAccuracyBuff()
			Total*=1+(Ascensions*0.05)
			return Total
		HasArmorAscension()
			if(src.HasPassive("ArmorAscension", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetArmorAscension()
			return src.GetPassive("ArmorAscension", BuffsOnly=1, NoMobVar=1)
		HasArmorDamageBuff()
			if(src.HasPassive("ArmorDamage", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetArmorDamageBuff()
			return src.GetPassive("ArmorDamage", BuffsOnly=1, NoMobVar=1)
		HasArmorDelayBuff()
			if(src.HasPassive("ArmorDelay", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetArmorDelayBuff()
			return src.GetPassive("ArmorDelay", BuffsOnly=1, NoMobVar=1)
		HasArmorAccuracyBuff()
			if(src.HasPassive("ArmorAccuracy", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetArmorAccuracyBuff()
			return src.GetPassive("ArmorAccuracy", BuffsOnly=1, NoMobVar=1)
		HasShatterTier(var/obj/Items/Equip)//this is so fucking stupid, everything should just work off shatter tier
			if(!Equip.Destructable)
				return 0
			if(Equip.ShatterTier)
				return 1
			if(istype(Equip, /obj/Items/Armor))
				return 1
			return 0
		GetShatterTier(var/obj/Items/Equip)//as above
			if(!Equip.Destructable)
				return 0
			var/Total=0
			if(Equip.ShatterTier)
				Total+=Equip.ShatterTier
			if(istype(Equip, /obj/Items/Armor))
				Total+=4-min(Equip.Ascended+src.GetArmorAscension(),4)
			if(Total>4)
				Total=4
			return Total
		MovementSealed()
			for(var/obj/Seal/s in src)
				if(s.ZPlaneBind)
					return 1
			return 0
		HasTensionLock()
			if(src.HasPassive("TensionDrain", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasEmptyGrimoire()
			if(locate(/obj/Skills/Teleport/Traverse_Void, src))
				return 1
			return 0
		HasMafuba()
			if(locate(/obj/Skills/Buffs/SlotlessBuffs/Grimoire/Mafuba, src))
				return 1
			return 0
		HasElementalDefense(var/ele)
			if(src.ElementalDefense==ele)
				return 1
			if(src.HasArmor())
				var/obj/Items/Armor/a=src.EquippedArmor()
				if(a.Element==ele)
					return 1
			return 0
		HasFakePeace()
			if(src.HasPassive("FakePeace", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasDashMaster()
			if(src.HasPassive("DashMaster", NoMobVar=1))
				return 1
			return 0
		HasDashCount()
			if(src.HasPassive("DashCountLimit", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetDashCount()
			return src.GetPassive("DashCount", BuffsOnly=1, NoMobVar=1)
		IncDashCount()
			if(src.ActiveBuff)
				if(src.ActiveBuff.DashCountLimit)
					src.ActiveBuff.DashCount++
					if(src.ActiveBuff.DashCount>=src.ActiveBuff.DashCountLimit)
						src.ActiveBuff.Trigger()
			if(src.SpecialBuff)
				if(src.SpecialBuff.DashCountLimit)
					src.SpecialBuff.DashCount++
					if(src.SpecialBuff.DashCount>=src.SpecialBuff.DashCountLimit)
						src.SpecialBuff.Trigger()
			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
				if(sb.DashCountLimit)
					sb.DashCount++
					if(sb.DashCount>=sb.DashCountLimit)
						sb.Trigger(src)
			if(!src.HasDashMaster())
				for(var/obj/Skills/Dragon_Dash/dd in src)
					dd.Cooldown=30
				for(var/obj/Skills/Reverse_Dash/rd in src)
					rd.Cooldown=30

		HasAdrenalBoost()
			if(src.HasPassive("AdrenalBoost", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasBetterAim()
			if(src.HasPassive("BetterAim", BuffsOnly=1))
				return 1
			return 0
		GetBetterAim()
			return src.GetPassive("BetterAim", BuffSOnly=1)
		HasMechanized()
			if(src.Race=="Android")
				return 1
			if(src.HasPassive("Mechanized", BuffsOnly=1))
				return 1
			if(src.CyberCancel)
				return 1
			return 0
		HasPiloting()
			if(src.HasPassive("Piloting", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasPossessive()
			if(src.HasPassive("Possessive", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasImitate()
			if(src.HasPassive("Imitate", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		TomeSpell(var/obj/Skills/Z)
			if(!Z) return 0
			var/Streamline=0
			var/obj/Items/Enchantment/Tome/T=src.EquippedTome()
			var/obj/Items/Enchantment/Magic_Crest/MC=src.EquippedCrest()
			if(T)
				for(var/obj/Skills/S in T.Spells)
					if(Z.type==S.type)
						Streamline+=1
			if(is_arcane_beast || CheckSpecial("Wisdom Form") || CheckSpecial("Master Form") || CheckSpecial("Final Form"))
				Streamline+=1
			if(src.UsingMasteredMagicStyle())
				if(Z.ElementalClass)
					if(IsList(src.StyleBuff.ElementalClass))
						if(Z.ElementalClass in src.StyleBuff.ElementalClass)
							Streamline+=1
					else
						if(src.StyleBuff.ElementalClass==Z.ElementalClass)
							Streamline+=1
				else
					Streamline+=1
			else if(MC)
				for(var/obj/Skills/S in MC.Spells)
					if(Z.type==S.type)
						Streamline+=1
			return Streamline

		CrestSpell(var/obj/Skills/Z)
			var/obj/Items/Enchantment/Magic_Crest/MC=src.EquippedCrest()
			if(MC)
				for(var/obj/Skills/S in MC.Spells)
					if(Z.type==S.type)
						return 1
			return 0

		EquippedTome()
			var/obj/Items/Enchantment/Tome/T
			for(var/obj/Items/Enchantment/Tome/Tomes in src)
				if(Tomes.suffix=="*Equipped*")
					T=Tomes
					return T
			return 0
		EquippedFlyingDevice()
			var/obj/Items/Enchantment/Flying_Device/FD
			for(var/obj/Items/Enchantment/Flying_Device/Fly in src)
				if(Fly.suffix=="*Equipped*")
					FD=Fly
					return FD
			return 0
		EquippedCrest()
			var/obj/Items/Enchantment/Magic_Crest/MC
			for(var/obj/Items/Enchantment/Magic_Crest/Crest in src)
				if(Crest.suffix=="*Equipped*")
					MC=Crest
					return MC
			return 0
		ParasiteCrest()
			for(var/obj/Items/Enchantment/Magic_Crest/Crest in src)
				if(Crest==src.EquippedCrest())
					if(Crest.Parasite&&!src.Timeless)
						return 1
			return 0
		HasPlatedWeights()
			var/obj/Items/WeightedClothing/WC=src.EquippedWeights()
			if(WC)
				if(WC.Plated)
					return 1
			return 0
		HasCeramicPlating()
			var/obj/Items/Plating/P=src.EquippedPlating()
			if(istype(P, /obj/Items/Plating/Ceramic_Plating))
				if(P.suffix=="*Broken")
					return 0
				return 1
			return 0
		HasRefractivePlating()
			var/obj/Items/Plating/P=src.EquippedPlating()
			if(istype(P, /obj/Items/Plating/Refractive_Plating))
				return 1
			return 0
		HasBlastShielding()
			var/obj/Items/BlastShielding/B=src.EquippedShielding()
			if(B)
				return 1
			return 0
		EquippedPlating()
			var/obj/Items/Plating/P
			for(var/obj/Items/Plating/Platez in src)
				if(Platez.suffix=="*Equipped*")
					P=Platez
					break
			if(P)
				return P
			return 0
		EquippedShielding()
			var/obj/Items/BlastShielding/B
			for(var/obj/Items/BlastShielding/Shieldz in src)
				if(Shieldz.suffix=="*Equipped*")
					B=Shieldz
					break
			if(B)
				return B
			return 0
		GetProsthetics()
			var/Return=0
			for(var/obj/Items/Gear/Prosthetic_Limb/PL in src)
				if(PL.suffix=="*Equipped*")
					Return++
			if(Return > 4)
				Return=4
			return Return
		HasJagan()
			if(locate(/obj/Skills/Buffs/SpecialBuffs/Cursed/Jagan_Eye, src))
				return 1
			return 0
		HasScouter()
			for(var/obj/Items/Tech/Scouter/Scoutz in src)
				if(Scoutz.suffix=="*Equipped*")
					return 1
			if(src.InternalScouter)
				return 1
			return 0
		HasIntuition()
			if(locate(/obj/Skills/Buffs/SpecialBuffs/Cursed/Jagan_Eye, src))
				return 1
			if(locate(/obj/Skills/Utility/Sense, src))
				return 1
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation")
				return 1
			if(src.SenseUnlocked>5&&src.SenseUnlocked>src.SenseRobbed)
				return 1
			if(src.GetGodKi()>=0.25)
				return 1
		HasClarity()
			if(locate(/obj/Skills/Clairvoyance, src))
				return 1
			if("Combat Scanning" in src.UnlockedTechnology)
				return 1
			if(src.EnhancedHearing&&src.EnhancedSmell)
				return 1
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation")
				return 1
			if(src.GetGodKi()>=0.25)
				return 1
			return 0
		HasEnlightenment()
			if(src.Dead)
				if(src.HasGodKi())
					return 1
				if(src.Saga=="Sharingan"&&src.SagaLevel==8)
					return 1
				if(src.Saga=="Cosmo"&&src.SagaLevel>=7)
					return 1
				if(src.HasSpiritPower())
					return 1
			return 0
		HasTransMimic()
			if(src.HasPassive("TransMimic", BuffsOnly=1, NoMobVar=1))
				return src.GetPassive("TransMimic", BuffsOnly=1, NoMobVar=1)
			return 0
		HasBuffMastery()
			var/Return=0
			if(src.HasPassive("BuffMastery", BuffsOnly=1))
				Return+=src.GetPassive("BuffMastery", BuffsOnly=1)
			var/stp=src.SaiyanTransPower()
			if(stp)
				Return+=stp
			return Return
		HasPursuer()
			var/Return=0
			if(src.HasPassive("Pursuer", BuffsOnly=1))
				Return+=src.GetPassive("Pursuer", BuffsOnly=1)
			if(src.Saga=="Eight Gates")
				Return+=2
			if(src.Race=="Alien" && src.AscensionsAcquired>=5)
				Return+=2
			if(src.KamuiBuffLock)
				Return+=3
			var/stp=src.SaiyanTransPower()
			if(stp)
				Return+=stp
			return Return
		HasGodspeed()
			var/Return=0
			var/gk=src.GetGodKi()
			if(gk>=0.25)
				Return+=round(gk/0.25)
			if(src.HasPassive("Godspeed", BuffsOnly=1))
				Return+=src.GetPassive("Godspeed", BuffsOnly=1)
			var/t=src.HighestTrans()
			if(t)
				Return+=t
			if(src.InfinityModule)
				Return+=1
			if(src.KamuiBuffLock)
				Return++
				Return++
			Return=round(Return)
			Return=min(4,Return)
			return Return
		HasFlicker()
			var/Return=0
			var/gk=src.GetGodKi()
			if(gk>=0.5)
				Return+=round(gk/0.5)
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation")
				Return++
			if(src.HasPassive("Flicker", BuffsOnly=1))
				Return+=src.GetPassive("Flicker", BuffsOnly=1)
			if(src.HasWalking())
				Return++
			if(src.HasShunkanIdo())
				Return++
			var/stp=src.SaiyanTransPower()
			if(stp)
				Return+=stp
			if(src.InfinityModule)
				Return++
			if(src.KamuiBuffLock)
				Return++
				Return++
			return Return
		HasDeathField()
			if(src.HasPassive("DeathField", BuffsOnly=1))
				return 1
			if(src.KamuiBuffLock)
				return 1
			return 0
		GetDeathField()
			return src.GetPassive("DeathField", BuffsOnly=1)+(src.KamuiBuffLock*10)
		HasVoidField()
			if(src.HasPassive("VoidField", BuffsOnly=1))
				return 1
			if(src.CheckSlotless("Drunken Mastery") && src.Drunk)
				return 1
			return 0
		GetVoidField()
			var/Extra=0
			if(src.CheckSlotless("Drunken Mastery") && src.Drunk)
				Extra+=2
			return src.GetPassive("VoidField", BuffsOnly=1)+Extra
		HasMaimStrike()
			if(src.HasPassive("MaimStrike"))
				return 1
			if(src.DemonicPower())
				return 1
			return 0
		GetMaimStrike()
			var/Return=0
			if(src.HasMaimStrike())
				Return+=src.GetPassive("MaimStrike")
			if(src.DemonicPower())
				Return+=0.05 * src.AscensionsAcquired
			if(src.Saga=="Ansatsuken"&&src.AnsatsukenAscension=="Chikara")
				Return-=(Return * (0.25*(src.SagaLevel-4)))
			if(Return<0.001)
				Return=0.001
			return Return
		HasNoMiss()
			if(src.HasPassive("NoMiss"))
				return 1
			return 0
		HasNoDodge()
			if(src.HasPassive("NoDodge"))
				return 1
			return 0
		HasVoid()
			if(src.HasPassive("Void", BuffsOnly=1))
				return 1
			return 0
		HasBleedHit()
			if(src.HasPassive("BleedHit", BuffsOnly=1))
				return 1
			if(src.GatesActive && src.GatesActive>=3 && src.GatesActive<8)
				return 1
			if(src.CheckSpecial("Kaioken"))
				return 1
			if(src.HasHealthPU())
				if(src.PowerControl>100)
					return 1
			return 0
		GetBleedHit()
			var/Return=0
			var/kkmast=0
			if(src.HasPassive("BleedHit", BuffsOnly=1))
				Return+=src.GetPassive("BleedHit", BuffsOnly=1)
			if(src.Kaioken)
				for(var/obj/Skills/Buffs/SpecialBuffs/Kaioken/kk in src.Buffs)
					kkmast=kk.Mastery
				Return+=src.Kaioken
			if(src.HasHealthPU())
				if(src.PowerControl>100)
					Return*=(src.PowerControl/100)
			if(src.Saga=="Kamui")
				Return-= (Return / 8) * src.SagaLevel
			if(src.GatesActive && src.GatesActive >=3 && src.GatesActive<8)
				Return+=(1/src.SagaLevel)
			if(src.Kaioken)
				if(kkmast>src.Kaioken)
					Return=src.Kaioken/2
			return Return
		HasEnergyLeak()
			if(src.HasPassive("EnergyLeak", BuffsOnly=1, NoMobVar=1))
				return 1
			if(src.TransActive()&&!src.HasMystic())
				if(src.masteries["[src.TransActive()]mastery"]>10&&src.masteries["[src.TransActive()]mastery"]<75||(src.Race=="Saiyan"&&src.HasGodKi()&&masteries["4mastery"]!=100))
					if(src.Race!="Changeling")
						return 1
					else
						if(src.TransActive()>3)
							return 1
			return 0
		GetEnergyLeak()
			var/Total=0
			Total+=src.GetPassive("EnergyLeak", BuffsOnly=1, NoMobVar=1)
			if(src.TransActive()&&!src.HasMystic())
				if(src.masteries["[src.TransActive()]mastery"]>10&&src.masteries["[src.TransActive()]mastery"]<75)
					if(src.Race!="Changeling")
						Total+=src.TransActive()*0.25
					else
						if(src.TransActive()>3)
							Total+=0.5
			return Total
		HasFatigueLeak()
			if(src.HasPassive("FatigueLeak", BuffsOnly=1, NoMobVar=1))
				return 1
			if(src.TransActive()&&src.Race=="Saiyan"&&src.HasGodKi()&&masteries["4mastery"]!=100)
				return 1
			if(src.GatesActive && src.GatesActive < 8)
				return 1
			return 0
		GetFatigueLeak()
			var/Total=0
			Total+=src.GetPassive("FatigueLeak", BuffsOnly=1, NoMobVar=1)
			if(src.TransActive()&&src.Race=="Saiyan"&&src.HasGodKi()&&masteries["4mastery"]!=100)
				Total+=1
			if(src.GatesActive && src.GatesActive < 8)
				Total+=src.GatesActive/src.SagaLevel
			return  Total
		HasSoftStyle()
			if(src.HasPassive("SoftStyle"))
				return 1
			return 0
		GetSoftStyle()
			return src.GetPassive("SoftStyle")
		HasHardStyle()
			if(src.HasPassive("HardStyle"))
				return 1
			if(src.KamuiBuffLock)
				return 1
			return 0
		GetHardStyle()
			return src.GetPassive("HardStyle")+(src.KamuiBuffLock*3)
		HasDebuffCrash()
			if(src.HasPassive("DebuffCrash", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetDebuffCrash()
			var/list/Debuffs=list()
			for(var/obj/Skills/Buffs/b in src.SlotlessBuffs)
				if(b.DebuffCrash)
					Debuffs.Add(b.DebuffCrash)
			if(Debuffs.len > 0)
				return Debuffs
			return 0
		HasCyberStigma()
			if(src.HasPassive("CyberStigma"))
				return 1
			return 0
		GetCyberStigma()
			return src.GetPassive("CyberStigma")
		HasKiControl()
			if(src.HasPassive("KiControl", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasKiControlMastery()
			if(src.GetGodKi()>=0.25 && src.Race!="Shinjin")
				return 1
			if(src.AdaptationCounter&&src.AdaptationTarget)
				return 1
			if(src.HasPassive("KiControlMastery", BuffsOnly=1))
				return 1
			if(src.Race=="Namekian"&&src.TransActive())
				return 1
			if(src.Race=="Shinjin"&&src.Potential>=25)
				return 1
			if(src.Race in list("Demon", "Dragon"))
				return 1
			if(src.Race in list("Human", "Half Saiyan", "Changeling", "Makyo")&&src.AscensionsAcquired)
				return 1
			return 0
		GetKiControlMastery()
			var/Total=src.GetPassive("KiControlMastery", BuffsOnly=1)
			if(src.AdaptationCounter&&src.AdaptationTarget)
				Total+=src.AdaptationCounter
			if(src.HasGodKi() && src.Race!="Shinjin")
				Total+=round(src.GetGodKi()/0.25)
			if(src.Race=="Namekian"&&src.TransActive())
				Total+=3
			if(src.Race=="Makyo"&&src.AscensionsAcquired)
				Total+=src.AscensionsAcquired
			if(src.Race=="Shinjin")
				Total+=round(src.Potential/25)
			if(src.Race in list("Dragon", "Demon"))
				Total+=1
			if(src.Race in list("Human", "Changeling")&&src.AscensionsAcquired)
				Total+=(0.5*src.AscensionsAcquired)
			if(src.Race=="Half Saiyan"&&src.AscensionsAcquired)
				Total+=(0.25*src.AscensionsAcquired)
			return min(Total,4)
		HasPULimited()
			if(src.HasPassive("AllowedPower", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetPULimited()
			return src.GetPassive("AllowedPower", BuffsOnly=1, NoMobVar=1)
		HasPULock()
			if(src.HasPassive("PULock", BuffsOnly=1))
				return 1
			return 0
		HasPUSpike()
			if(src.HasPassive("PUSpike", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetPUSpike()
			return src.GetPassive("PUSpike", BuffsOnly=1, NoMobVar=1)
		HasUnstoppable()
			if(src.HasPassive("Unstoppable", BuffsOnly=1))
				return 1
			return 0
		SaiyanTransPower()
			var/t
			var/m
			if(src.HasTransMimic() && src.Race in list("Saiyan", "Half Saiyan"))
				t=src.HasTransMimic()
			if(src.TransActive() && src.Race in list("Saiyan", "Half Saiyan"))
				m=src.TransActive()
			if(t || m)
				if(t>m)
					return t
				else
					return m
			else
				return 0
		DrunkPower()
			if(src.CheckSlotless("Drunken Mastery") && src.Drunk)
				return 1
		HasPureDamage()
			var/Return=0
			if(src.HasPassive("PureDamage"))
				Return+=src.GetPassive("PureDamage")
			var/stp=src.SaiyanTransPower()
			if(stp)
				Return+=stp
			if(src.DrunkPower())
				Return+=3
			var/mm=src.HasMaimMastery()
			if(src.Maimed&&mm)
				Return+=(src.Maimed*mm)*0.5
			if(src.TarotFate=="The Hanged Man")
				Return+=5
			if(src.TarotFate=="Justice")
				Return-=5
			return Return
		HasPureReduction()
			var/Return=0
			if(src.HasPassive("PureReduction"))
				Return+=src.GetPassive("PureReduction")
			var/stp=src.SaiyanTransPower()
			if(stp)
				Return+=stp
			var/mm=src.HasMaimMastery()
			if(src.Maimed&&mm)
				Return+=(src.Maimed*mm)*0.5
			if(src.Race=="Djinn")
				Return+=(src.Potential/10)
			if(src.TarotFate=="The Hanged Man")
				Return-=5
			if(src.TarotFate=="Justice")
				Return+=5
			return Return
		HasWalking()
			if(locate(/obj/Skills/Walking, src))
				return 1
			return 0
		HasShunkanIdo()
			if(locate(/obj/Skills/Teleport/Instant_Transmission, src))
				return 1
			return 0
		HasVaizard()
			if(locate(/obj/Skills/Buffs/SpecialBuffs/Cursed/Vaizard_Mask, src))
				for(var/obj/Skills/Buffs/SpecialBuffs/Cursed/Vaizard_Mask/vm in src.Buffs)
					if(vm.Mastery==1)
						return 2
				return 1
			return 0
		HasJinchuuriki()
			if(locate(/obj/Skills/Buffs/SpecialBuffs/Cursed/Jinchuuriki, src))
				return 1
			return 0
		HasSweepingStrike()
			if(src.HasPassive("SweepingStrike", BuffsOnly=1))
				return 1
			if(src.CheckSlotless("Sage Mode")&&src.StyleActive)
				return 1
			return 0
		HasTechniqueMastery()
			if(src.HasPassive("TechniqueMastery", BuffsOnly=1))
				return 1
			if(src.TarotFate=="The World")
				return 1
			return 0
		GetTechniqueMastery()
			var/Return=0
			if(src.HasPassive("TechniqueMastery", BuffsOnly=1))
				Return+=src.GetPassive("TechniqueMastery", BuffsOnly=1)
			if(src.TarotFate=="The World")
				Return+=5
			return Return
		HasUnarmedDamage()
			if(src.HasPassive("UnarmedDamage", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetUnarmedDamage()
			return src.GetPassive("UnarmedDamage", BuffsOnly=1, NoMobVar=1)
		HasSpiritualDamage()
			if(src.HasPassive("SpiritualDamage", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetSpiritualDamage()
			return src.GetPassive("SpiritualDamage", BuffsOnly=1, NoMobVar=1)
		HasDuelist()
			if(src.HasPassive("Duelist", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetDuelist()
			return src.GetPassive("Duelist", BuffsOnly=1, NoMobVar=1)
		HasVanish()
			if(src.HasPassive("Vanishing", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetVanish()
			return src.GetPassive("Vanishing", BuffsOnly=1, NoMobVar=1)
		HasMovementMastery()
			if(src.HasPassive("MovementMastery", NoAttackQueue=1))
				return 1
			return 0
		GetMovementMastery()
			var/Total=0
			if(src.HasPassive("MovementMastery", NoAttackQueue=1))
				Total+=src.GetPassive("MovementMastery", NoAttackQueue=1)
			if(src.DrunkPower())
				Total+=5
			return Total
		HasPhysicalHitsLimit()
			if(src.HasPassive("PhysicalHitsLimit", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasSwordHitsLimit()
			if(src.HasPassive("SwordHitsLimit", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasUnarmedHitsLimit()
			if(src.HasPassive("UnarmedHitsLimit", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasSpiritHitsLimit()
			if(src.HasPassive("SpiritHitsLimit", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasAutoReversal()
			if(src.HasPassive("Reversal", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetAutoReversal()
			return src.GetPassive("Reversal", BuffsOnly=1, NoMobVar=1)
		HasAttracting()
			if(src.HasPassive("Attracting", NoMobVar=1))
				return 1
			return 0
		GetAttracting()
			return src.GetPassive("Attracting", NoMobVar=1)
		HasTerrifying()
			if(src.HasPassive("Terrifying", NoMobVar=1))
				return 1
			return 0
		GetTerrifying()
			return src.GetPassive("Terrifying", NoMobVar=1)
		HasNoRevert()
			if(src.HasPassive("NoRevert", BuffsOnly=1))
				return 1
			return 0
		HasCounterMaster()
			if(src.HasPassive("CounterMaster", BuffsOnly=1, NoMobVar=1))
				return src.GetPassive("CounterMaster", BuffsOnly=1, NoMobVar=1)
			return 0
		HasActiveBuffLock()
			if(src.HasPassive("ActiveBuffLock", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasSpecialBuffLock()
			if(src.HasPassive("SpecialBuffLock", BuffsOnly=1, NoMobVar=1))
				return 1
			if(src.InfinityModule)
				return 1
			return 0
		HasInjuryImmune()
			if(src.HasPassive("InjuryImmune", BuffsOnly=1))
				return 1
			return 0
		GetInjuryImmune()
			return src.GetPassive("InjuryImmune", BuffsOnly=1)
		HasFatigueImmune()
			if(src.HasPassive("FatigueImmune", BuffsOnly=1))
				return 1
			return 0
		GetFatigueImmune()
			return src.GetPassive("FatigueImmune", BuffsOnly=1)
		HasDebuffImmune()
			if(src.HasPassive("DebuffImmune", BuffsOnly=1))
				return 1
			return 0
		GetDebuffImmune()
			return src.GetPassive("DebuffImmune", BuffsOnly=1)
		HasVenomImmune()
			if(src.HasPassive("VenomImmune", BuffsOnly=1))
				return 1
			return 0
		HasWalkThroughHell()
			if(src.HasPassive("WalkThroughHell", BuffsOnly=1))
				return 1
			return 0
		HasWaterWalk()
			if(src.HasPassive("WaterWalk", BuffsOnly=1))
				return 1
			return 0
		HasSuperDash()
			var/Return=0
			if(src.HasPassive("SuperDash", BuffsOnly=1))
				Return=src.GetPassive("SuperDash", BuffsOnly=1)
			if(src.SenseUnlocked>5&&src.SenseUnlocked>src.SenseRobbed)
				Return+=1
			var/ta=src.TransActive()
			var/tm=src.HasTransMimic()
			if(ta || tm)
				if(tm > ta)
					Return+=round(tm/4)
				else
					Return+=round(ta/4)
			Return=round(Return)
			return Return
		GetSuperDash()
			var/Total=0
			Total+=src.GetPassive("SuperDash", BuffsOnly=1)
			if(src.SenseUnlocked>5&&src.SenseUnlocked>src.SenseRobbed)
				Total+=1
				if(src.SenseUnlocked>=7)
					Total+=1
			Total=round(Total)
			return min(Total,2)
		HasDeflection()
			if(src.HasPassive("Deflection", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetDeflection()
			return src.GetPassive("Deflection", BuffsOnly=1, NoMobVar=1)
		HasBulletKill()
			if(src.HasPassive("BulletKill", BuffsOnly=1, SwordBuff=1))
				return 1
			if(src.HasPassive("BulletKill", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasMovingCharge()
			if(src.HasPassive("MovingCharge", BuffsOnly=1))
				return 1
			return 0
		HasQuickCast()
			if(src.HasPassive("QuickCast", BuffsOnly=1))
				return 1
			return 0
		GetQuickCast()
			return src.GetPassive("QuickCast", BuffsOnly=1)
		HasDualCast()
			if(src.HasPassive("DualCast", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasHealthPU()
			if(src.HasPassive("HealthPU", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasShear()
			if(src.HasPassive("Shearing"))
				return 1
			if(src.HasPassive("Shearing", SwordBuff=1))
				return 1
			return 0
		GetShear()
			var/Total=0
			Total+=src.GetPassive("Shearing", SwordBuff=1)
			return Total
		HasCripple()
			if(src.HasPassive("Crippling"))
				return 1
			if(src.StyleActive=="Butcher" || src.StyleActive=="Five Rings")
				if(src.AttackQueue||src.AutoHitting)
					return 1
			return 0
		GetCripple()
			var/Total=0
			Total+=src.GetPassive("Crippling")
			if(src.StyleActive=="Butcher" || src.StyleActive=="Five Rings")
				if(src.AttackQueue||src.AutoHitting)
					Total+=1
			return Total
		HasNoSword()
			if(src.HasPassive("NoSword", NoMobVar=1))
				return 1
			return 0
		HasNoStaff()
			if(src.HasPassive("NoStaff", NoMobVar=1))
				return 1
			return 0
		HasNeedsStaff()
			if(src.HasPassive("NeedsStaff", NoMobVar=1))
				return 1
			return 0
		HasNeedsSword()
			if(src.HasPassive("NeedsSword", NoMobVar=1))
				return 1
			return 0
		HasRipple()
			if(src.HasPassive("Ripple", BuffsOnly=1))
				return 1
			return 0
		GetRipple()
			var/RippleEffectivness=1
			if(src.Slow)
				RippleEffectivness*=0.75
			if(src.Shock)
				RippleEffectivness*=0.75
			if(src.CyberCancel)
				RippleEffectivness*=0.75
			if(src.Swim)
				RippleEffectivness*=1.5
			return (src.GetPassive("Ripple", BuffsOnly=1)*RippleEffectivness)
		HasNoForcedWhiff()
			if(src.HasPassive("NoForcedWhiff"))
				return 1
			return 0
		HasSpecialStrike()
			if(src.HasPassive("SpecialStrike", BuffsOnly=1))
				return 1
			return 0
		HasGodKiBuff()
			if(locate(/obj/Skills/Buffs/SlotlessBuffs/God_Ki, src) || CheckSpecial("Sacred Energy") ||CheckSpecial("Final Getsuga Tenshou") || CheckSpecial("Ultra Instinct") || SenseUnlocked >= 7)
				return 1
			return 0
		HasTelepathy()
			if(locate(/obj/Skills/Utility/Telepathy, src))
				return 1
			return 0
		HasFlow()
			if(src.KO)
				return 0
			if(src.HasPassive("Flow", BuffsOnly=1))
				return 1
			if(src.Secret=="Ripple"&&src.StyleActive)
				return 1
			if(src.Secret=="Vampire"&&src.StyleActive)
				return 1
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation"&&src.StyleActive)
				return 1
			if(src.CombatCPU)
				return 1
			return 0
		GetFlow()
			var/Extra=0
			if(src.Secret=="Ripple"&&src.StyleActive)
				Extra+=1
			if(src.Secret=="Vampire"&&src.StyleActive)
				Extra+=1
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation"&&src.StyleActive)
				Extra+=1
			if(src.CombatCPU)
				Extra+=1
			if(src.DrunkPower())
				Extra+=2
			return (GetPassive("Flow", BuffsOnly=1)+Extra)
		HasInstinct()
			var/Return=0
			if(src.HasPassive("Instinct"))
				Return+=src.GetPassive("Instinct")
			var/t=src.HighestTrans()
			if(round(t/4))
				Return+=1
			return Return
		HasSoulSteal()
			if(src.HasPassive("SoulSteal"))
				return 1
			return 0
		GetSoulSteal()
			return src.GetPassive("SoulSteal")
		HasLifeSteal()
			if(src.HasPassive("LifeSteal"))
				return 1
			return 0
		GetLifeSteal()
			return src.GetPassive("LifeSteal")
		HasEnergySteal()
			if(src.HasPassive("EnergySteal"))
				return 1
			return 0
		GetEnergySteal()
			return src.GetPassive("EnergySteal")
		HasLifeStealTrue()
			if(src.HasPassive("LifeStealTrue"))
				return 1
			return 0
		HasLifeGeneration()
			if(src.HasPassive("LifeGeneration"))
				return 1
			return 0
		GetLifeGeneration()
			return src.GetPassive("LifeGeneration")
		HasEnergyGeneration()
			if(src.HasPassive("EnergyGeneration"))
				return 1
			return 0
		GetEnergyGeneration()
			return src.GetPassive("EnergyGeneration")
		HasManaGeneration()
			if(src.HasPassive("ManaGeneration", NoMobVar=1))
				return 1
			if(src.HasPassive("ManaGeneration", NoMobVar=1, SwordBuff=1))
				return 1
			if(src.HasPassive("ManaGeneration", NoMobVar=1, StaffBuff=1))
				return 1
			return 0
		GetManaGeneration()
			return src.GetPassive("ManaGeneration", BuffsOnly=1, NoMobVar=1, SwordBuff=1, StaffBuff=1)
		HasMystic()
			if(src.Mystic)
				return 1
			return 0
		HasMaki()
			if(src.HasPassive("Maki", BuffsOnly=1))
				return 1
			return 0
		HasTaxThreshold()
			if(src.HasPassive("TaxThreshold", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetTaxThreshold()
			return src.GetPassive("TaxThreshold", BuffsOnly=1, NoMobVar=1)
		DemonicPower() //Fake Demon.
			if(src.Saga=="Ansatsuken"&&src.SagaLevel>=8&&src.AnsatsukenAscension)
				return 1
			if(src.Race=="Demon")
				return 1
			if(src.CheckSlotless("Majin"))
				return 1
			if(src.Race=="Human"&&src.HellPower>=2&&src.AscensionsAcquired>=4)
				return 1
			return 0
		HasSpiritPower()
			var/Extra=0
			if(src.TarotFate=="Judgment")
				Extra=1
			if(src.HasPassive("SpiritPower") || src.HasSpiritAugment())
				return min(2+Extra, src.GetPassive("SpiritPower")+src.HasSpiritAugment()+Extra)
			if(src.HasMafuba())
				return 1+Extra
			return 0
		HasLegendaryPower()
			var/Extra=0
			if(src.TarotFate=="Judgment")
				Extra=1
			if(src.HasPassive("LegendaryPower") || src.HasLegendAugment())
				return min(2+Extra, src.GetPassive("LegendaryPower")+src.HasLegendAugment()+Extra)
			return 0
		HasHellPower()
			var/Extra=0
			if(src.TarotFate=="Judgment")
				Extra=1
			if(CheckSlotless("Satsui no Hado") && SagaLevel>=8)
				return 1+Extra
			if(src.HasPassive("HellPower") || src.HasHellAugment())
				return min(2+Extra, src.GetPassive("HellPower")+src.HasHellAugment()+Extra)
			return 0
		HasSpiritAugment()
			for(var/obj/Items/i in src)
				if(!i.suffix)
					continue
				if(!i.SpiritPower)
					continue
				return i.SpiritPower
			return 0
		HasLegendAugment()
			for(var/obj/Items/i in src)
				if(!i.suffix)
					continue
				if(!i.LegendaryPower)
					continue
				return i.LegendaryPower
			return 0
		HasHellAugment()
			for(var/obj/Items/i in src)
				if(!i.suffix)
					continue
				if(!i.HellPower)
					continue
				return i.HellPower
			return 0
		HasPowerReplacement()
			if(src.HasPassive("PowerReplacement", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		GetPowerReplacement()
			return src.GetPassive("PowerReplacement", BuffsOnly=1, NoMobVar=1)
		HasDesperation()
			if(src.HasPassive("Desperation", BuffsOnly=1))
				return 1
			if(src.TarotFate=="The Tower")
				return 1
			return 0
		GetDesperation()
			var/Extra=0
			if(src.TarotFate=="The Tower")
				Extra=2
			return (src.GetPassive("Desperation", BuffsOnly=1)+Extra)

		GetIntimidationIgnore(var/mob/m)
			var/Return=0
			if(src.Race in list("Human"))
				Return+=(20*src.AscensionsAcquired)
			if(src.Race == "Namekian")
				Return+=(10*src.AscensionsAcquired)
			if(src.Race=="Tuffle")
				Return+=(20*(src.Intelligence+src.Imagination))

			if(m)
				if(m.Race in list("Human"))
					Return-=(20*m.AscensionsAcquired)
				if(m.Race=="Namekian")
					Return-=(10*m.AscensionsAcquired)
				if(m.Race=="Tuffle")
					Return-=(20*(m.Intelligence+m.Imagination))
				if(m.Race=="Makyo")
					Return-=(20*m.AscensionsAcquired)
				if(m.HasGodKi())
					if(src.HasLegendaryPower())
						Return-=(m.GetGodKi())*(100-(src.HasLegendaryPower()*100))
					else
						Return-=m.GetGodKi()*100
			if(src.HasGodKi())
				Return+=src.GetGodKi()*100

			if(src.Saga=="Ansatsuken")
				if(src.AnsatsukenAscension=="Chikara")
					Return+=((src.SagaLevel-4)*25)
			if(m.Saga=="Ansatsuken")
				if(m.AnsatsukenAscension=="Chikara")
					Return-=((m.SagaLevel-4)*25)
			if(src.Race=="Android")
				Return=100

			if(m)
				if(m.CyberCancel)
					Return-=m.CyberCancel*100
				if(m.Mechanized && m.Race!="Tuffle")
					Return-=100
				if(m.Race=="Android")
					Return=0
			if(Return>100)
				Return=100
			if(Return<0)
				Return=0
			Return/=100
			return Return
		HasIntimidation()
			var/Effective=src.Intimidation
			if(src.ShinjinAscension=="Makai")
				Effective+=1
			if(src.Race=="Demon"||src.Race=="Djinn")
				Effective+=1
			if(src.Race=="Makyo"&&src.ActiveBuff&&src.AscensionsAcquired&&!src.CyberCancel)
				Effective+=1
			var/stp=src.SaiyanTransPower()
			if(stp)
				Effective+=1
			if(src.CheckActive("Mobile Suit")||src.CheckSlotless("Battosai")||src.CheckSlotless("Susanoo"))
				Effective+=1
			if(src.Health<(1-src.HealthCut)&&src.HealthAnnounce10&&src.Saga=="King of Braves"&&src.SpecialBuff)
				if(src.SpecialBuff.BuffName=="Broken Brave")
					Effective*=3
				else if(src.SpecialBuff.BuffName=="Genesic Brave")
					Effective*=2
			if(src.HasHellPower())
				Effective+=1
			if(src.KaiokenBP>1)
				Effective+=1
			if(Effective>1)
				return 1
			return 0
		GetIntimidation()
			var/Effective=src.Intimidation
			if(src.ShinjinAscension=="Makai")
				Effective*=src.GetGodKi()*50
			if(src.Race in list("Demon", "Djinn") || src.CheckSlotless("Majin"))
				Effective*=(src.Potential/2)
				if(src.Race=="Demon"&&src.AscensionsAcquired>=5)
					Effective*=2
				if(src.Race=="Djinn")
					switch(src.AscensionsAcquired)
						if(1)
							Effective*=1.25
						if(2)
							Effective*=1.5
						if(3)
							Effective*=2
			if(!src.CheckSlotless("Majin"))
				var/stp=src.SaiyanTransPower()
				if(stp)
					switch(stp)
						if(1)
							Effective*=10
						if(2)
							Effective*=20
						if(3)
							Effective*=25
						if(4)
							Effective*=50
				if(src.Race=="Makyo"&&src.ActiveBuff&&src.AscensionsAcquired&&!src.CyberCancel)
					switch(src.AscensionsAcquired)
						if(1)
							Effective*=2.5
						if(2)
							Effective*=20
						if(3)
							Effective*=30
						if(4)
							Effective*=50
						if(5)
							Effective*=75

			if(src.Race=="Changeling"&&src.TransActive()&&src.AscensionsAcquired)
				Effective+=(10*src.AscensionsAcquired)
			if(src.CheckActive("Mobile Suit")||src.CheckSlotless("Battosai")||src.CheckSlotless("Susanoo"))
				Effective+=5
				if(Effective<10)
					Effective=10
					if(src.CheckActive("Mobile Suit"))
						for(var/obj/Items/Gear/Mobile_Suit/ms in src)
							Effective*=ms.Level
			if(src.Health<(1-src.HealthCut)&&src.HealthAnnounce10&&src.Saga=="King of Braves"&&src.SpecialBuff)
				if(src.SpecialBuff.BuffName=="Broken Brave")
					Effective*=2
				else if(src.SpecialBuff.BuffName=="Genesic Brave")
					Effective*=3
			if(src.HasHellPower())
				Effective*=src.GetHellScaling()
			if(src.KaiokenBP>1)
				Effective*=src.KaiokenBP
			if(Effective<0)
				Effective=1
			return Effective
		GetHellScaling()
			var/Return=1
			var/Mult=src.HasHellPower()
			Mult+=round(src.Potential/100, 0.05)
			Return=1+(0.35 * (abs(src.Health-100)/100) * Mult)
			if(Return>1+(0.35*Mult))
				Return=1+(0.35*Mult)
			return Return
		HasGodKi()
			if(src.HasPassive("GodKi", BuffsOnly=1))
				return 1
			if(src.SenseUnlocked>6&&(src.SenseUnlocked>src.SenseRobbed))
				return 1
			if(src.CheckSlotless("Saiyan Soul")&&src.HasGodKiBuff()&&!src.ssj["god"])
				if(!src.Target.CheckSlotless("Saiyan Soul")&&src.Target.HasGodKi())
					return 1
			if(src.HasSpiritPower() && FightingSeriously(src, 0))
				if(src.Health<=max(15, (30+src.TotalInjury)*src.HasSpiritPower()) || src.InjuryAnnounce)
					return 1
			if(src.KamuiBuffLock)
				return 1
			return 0
		GetGodKi()
			var/Total=src.GetPassive("GodKi", BuffsOnly=1)
			if(src.HasSpiritPower() && FightingSeriously(src, 0))
				if(src.Health<=(30+src.TotalInjury)*src.HasSpiritPower())
					if(src.SenseUnlocked<7)//saintz
						Total+=0.25*src.HasSpiritPower()
					else
						Total+=(0.25*src.HasSpiritPower()*0.5)//halved rate for god ki saints
			if(src.SenseUnlocked>6&&(src.SenseUnlocked>src.SenseRobbed))
				if(src.SenseUnlocked>=7)
					if(src.SagaLevel<7)
						if(src.Health<=15 || src.InjuryAnnounce)
							Total+=0.25
					else
						Total+=0.25
				if(src.SenseUnlocked>=8)
					Total+=1
			if(src.CheckSlotless("Saiyan Soul")&&src.HasGodKiBuff()&&!src.ssj["god"])
				if(!src.Target.CheckSlotless("Saiyan Soul")&&src.Target.HasGodKi())
					Total+=src.Target.GetGodKi()/2
			if(src.KamuiBuffLock)
				Total+=0.25
			if(src.Race=="Dragon")
				if(src.AscensionsAcquired==6 && Total<0.5)
					Total=0.5//fully ascended dragon
			return Total
		HasFluidForm()
			if(src.HasPassive("FluidForm", BuffsOnly=1))
				return 1
			if(src.HasLegendaryPower()>=1)
				return 1
			if(src.HasEmptyGrimoire())
				return 1
			return 0
		HasStunningStrike()
			if(src.HasPassive("StunningStrike", BuffsOnly=1))
				return 1
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Armament"&&src.StyleActive)
				return 1
			return 0
		GetStunningStrike()
			var/Extra=0
			if(src.Secret=="Haki"&&src.HakiSpecialization=="Armament"&&src.StyleActive)
				Extra=1
			return (src.GetPassive("StunningStrike", BuffsOnly=1)+Extra)
		HasDrainlessMana()
			if(src.HasPassive("DrainlessMana", BuffsOnly=1))
				return 1
			return 0
		HasLimitlessMagic()
			if(src.HasPassive("LimitlessMagic", BuffsOnly=1))
				return 1
			if(src.HasPassive("MartialMagic", BuffsOnly=1, NoMobVar=1))
				return 2
			return 0
		HasManaCapMult()
			if(src.HasPassive("ManaCapMult", BuffsOnly=1))
				return 1
			return 0
		HasManaLeak()
			if(src.HasPassive("ManaLeak", NoAttackQueue=1))
				return 1
			if(src.Race=="Monster"&&src.Class=="Yokai"&&src.AscensionsAcquired&&src.ActiveBuff&&!src.Mechanized)
				return 1
			return 0
		GetManaLeak()
			var/Return=0
			Return+=src.GetPassive("ManaLeak", NoAttackQueue=1)
			if(src.Race=="Monster"&&src.Class=="Yokai"&&src.AscensionsAcquired&&src.ActiveBuff&&!src.Mechanized)
				Return+=0.5
			return Return
		GetManaCapMult()
			return src.GetPassive("ManaCapMult", BuffsOnly=1)
		HasManaStats()
			if(src.HasPassive("ManaStats", BuffsOnly=1))
				return 1
			if(src.Race=="Monster"&&src.Class=="Yokai"&&src.AscensionsAcquired&&src.ActiveBuff&&!src.Mechanized)
				return 1
			return 0
		GetManaStats()
			var/Return=0
			if(src.HasPassive("ManaStats", BuffsOnly=1))
				Return+=src.AveragePassive("ManaStats", BuffsOnly=1)
			if(src.Race=="Monster"&&src.Class=="Yokai"&&src.AscensionsAcquired&&src.ActiveBuff&&!src.Mechanized)
				Return+=(src.AscensionsAcquired*0.2)
			return Return
		HasBurning()
			if(src.HasPassive("Burning"))
				return 1
			if(src.Attunement=="Fire")
				return 1
			if(src.InfusionElement=="Fire")
				return 1
			return 0
		GetBurning()
			return src.GetPassive("Burning")
		HasScorching()
			if(src.HasPassive("Scorching"))
				return 1
			return 0
		GetScorching()
			return src.GetPassive("Scorching")
		HasChilling()
			if(src.HasPassive("Chilling"))
				return 1
			if(src.Attunement=="Water")
				return 1
			if(src.InfusionElement=="Water")
				return 1
			return 0
		GetChilling()
			return src.GetPassive("Chilling")
		HasFreezing()
			if(src.HasPassive("Freezing"))
				return 1
			return 0
		GetFreezing()
			return src.GetPassive("Freezing")
		HasHardening()
			if(src.HasPassive("Hardening", BuffsOnly=1))
				return 1
			return 0
		GetHardening()
			return src.GetPassive("Hardening", BuffsOnly=1)
		HasCrushing()
			if(src.HasPassive("Crushing"))
				return 1
			if(src.Attunement=="Earth")
				return 1
			if(src.InfusionElement=="Earth")
				return 1
			return 0
		GetCrushing()
			return src.GetPassive("Crushing")
		HasShattering()
			if(src.HasPassive("Shattering"))
				return 1
			return 0
		GetShattering()
			return src.GetPassive("Shattering")
		HasShocking()
			if(src.HasPassive("Shocking"))
				return 1
			if(src.Attunement=="Wind")
				return 1
			if(src.InfusionElement=="Wind")
				return 1
			return 0
		GetShocking()
			return src.GetPassive("Shocking")
		HasParalyzing()
			if(src.HasPassive("Paralyzing"))
				return 1
			return 0
		GetParalyzing()
			return src.GetPassive("Paralyzing")
		HasPoisoning()
			if(src.HasPassive("Poisoning"))
				return 1
			return 0
		GetPoisoning()
			return src.GetPassive("Poisoning")
		HasToxic()
			if(src.HasPassive("Toxic"))
				return 1
			return 0
		GetToxic()
			return src.GetPassive("Toxic")
		HasPacifying()
			if(src.HasPassive("Pacifying", NoMobVar=1))
				return 1
			return 0
		GetPacifying()
			return src.GetPassive("Pacifying")
		HasEnraging()
			if(src.HasPassive("Enraging", NoMobVar=1))
				return 1
			return 0
		GetEnraging()
			return src.GetPassive("Enraging")
		HasDoubleStrike()
			if(src.HasPassive("DoubleStrike", NoMobVar=1))
				return 1
			if(src.HasPassive("TripleStrike", NoMobVar=1))
				return 1
			return 0
		GetDoubleStrike()
			return src.GetPassive("DoubleStrike", NoMobVar=1)
		HasTripleStrike()
			if(src.HasPassive("TripleStrike", NoMobVar=1))
				return 1
			return 0
		GetTripleStrike()
			return src.GetPassive("TripleStrike", NoMobVar=1)
		HasDebuffReversal()
			if(src.HasPassive("DebuffReversal", BuffsOnly=1))
				return 1
			return 0
		HasDisorienting()
			if(src.HasPassive("Disorienting"))
				return 1
			return 0
		GetDisorienting()
			return src.GetPassive("Disorienting")
		HasConfusing()
			if(src.HasPassive("Confusing"))
				return 1
			return 0
		GetConfusing()
			return src.GetPassive("Confusing")
		HasHolyMod()
			if(src.HasPassive("HolyMod"))
				return 1
			if(src.TarotFate=="The Lovers")
				return 1
			if(src.TarotFate=="The Hierophant")
				return 1
			return 0
		GetHolyMod()
			var/Reduce=0
			var/Extra=0
			if(src.TarotFate=="The Lovers")
				Extra=2.5
			if(src.TarotFate=="The Hierophant")
				Extra=5
			if(src.GetPassiveCount("HolyMod")>1)
				Reduce=(src.GetPassiveCount("HolyMod")-1)
			return (src.GetPassive("HolyMod")+Extra-Reduce)
		HasAbyssMod()
			if(src.HasPassive("AbyssMod"))
				return 1
			if(src.TarotFate=="The Devil")
				return 1
			if(src.TarotFate=="The Lovers")
				return 1
			return 0
		GetAbyssMod()
			var/Reduce=0
			var/Extra=0
			if(src.TarotFate=="The Devil")
				Extra=5
			if(src.TarotFate=="The Lovers")
				Extra=2.5
			if(src.GetPassiveCount("AbyssMod")>1)
				Reduce=(src.GetPassiveCount("AbyssMod")-1)
			return (src.GetPassive("AbyssMod")+Extra-Reduce)
		HasSlayerMod()
			if(src.HasPassive("SlayerMod"))
				return 1
			return 0
		GetSlayerMod()
			var/Reduce=0
			if(src.GetPassiveCount("SlayerMod")>1)
				Reduce=(src.GetPassiveCount("SlayerMod")-1)
			return (src.GetPassive("SlayerMod")-Reduce)
		HasBeyondPurity()
			if(src.HasPassive("BeyondPurity"))
				return 1
			if(src.PoseEnhancement&&src.HasRipple())//Ripple Pure shenanigans
				return 1
			return 0
		HasPurity()
			if(src.HasPassive("Purity", SwordBuff=1))
				return 1
			if(src.HasPassive("Purity"))
				return 1
			if(src.PoseEnhancement&&src.HasRipple())//Ripple Pure shenanigans
				return 1
			return 0
		HasNoAnger()
			if(src.HasPassive("NoAnger", BuffsOnly=1))
				return 1
			return 0
		HasAngerThreshold()
			if(src.HasPassive("AngerThreshold", BuffsOnly=1))
				return 1
			return 0
		GetAngerThreshold()
			return src.GetPassive("AngerThreshold", BuffsOnly=1)
		HasWeaponBreaker()
			if(src.HasPassive("WeaponBreaker", SwordBuff=1))
				return 1
			if(src.HasPassive("WeaponBreaker"))
				return 1
			if(src.HasAdaptation()&&src.AdaptationTarget&&istype(src.AdaptationTarget, /mob/Players)&&src.AdaptationTarget.HasSword())
				return 1
			return 0
		GetWeaponBreaker()
			var/Extra=0
			if(src.HasAdaptation()&&src.AdaptationTarget&&istype(src.AdaptationTarget, /mob/Players)&&src.AdaptationTarget.HasSword())
				Extra=1*src.AdaptationCounter
			return src.GetPassive("WeaponBreaker", SwordBuff=1)+Extra
		HasGiantForm()
			if(src.HasPassive("GiantForm", BuffsOnly=1))
				return 1
			if(src.HasLegendaryPower()>=1)
				return 1
			var/t=src.HighestTrans()
			if(round(t/4))//only do it for ssj4
				return 1
			return 0
		HighestTrans()
			var/tm=src.HasTransMimic()
			var/ta=src.TransActive()
			if(tm || ta)
				if(tm > ta)
					return tm
				else
					return ta
			else
				return 0
		HasSteady()
			if(src.HasPassive("Steady"))
				return 1
			return 0
		GetSteady()
			return src.GetPassive("Steady")
		HasErosion()
			if(src.HasPassive("Erosion", BuffsOnly=1))
				return 1
			return 0
		GetErosion()
			return src.GetPassive("Erosion", BuffsOnly=1)
		HasMirrorStats()
			if(src.HasPassive("MirrorStats", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasManaPU()
			if(src.HasPassive("ManaPU", BuffsOnly=1))
				return 1
			return 0
		HasCalmAnger()
			if(src.HasPassive("CalmAnger", BuffsOnly=1))
				return 1
			if(src.HasPassive("CalmAnger", SwordBuff=1, BuffsOnly=1))
				return 1
			if(src.HasPassive("CalmAnger", StaffBuff=1, BuffsOnly=1))
				return 1
			if(src.Race=="Shinjin" && src.ShinjinAscension=="Makai")
				return 1
			if(src.Race=="Namekian" && src.TransActive())
				return 1
			if(src.TarotFate=="Temperance")
				return 1
			return 0
		HasExtend()
			if(src.HasPassive("Extend", BuffsOnly=1, SwordBuff=1))
				return 1
			return 0
		GetExtend()
			return src.GetPassive("Extend", BuffsOnly=1, SwordBuff=1, NoMobVar=1)
		HasWarp()
			if(src.HasPassive("Warp", BuffsOnly=1))
				return 1
			return 0
		HasPridefulRage()
			if(src.HasPassive("PridefulRage"))
				return 1
			return 0
		HasSpiritHand()//Str*(For**1/2)
			if(src.HasPassive("SpiritHand"))
				return 1
			if(src.TarotFate=="The Empress")
				return 1
			return 0
		HasSpiritFlow()//For*(Str**1/2)
			if(src.HasPassive("SpiritFlow", BuffsOnly=1))
				return 1
			if(src.TarotFate=="The Emperor")
				return 1
			return 0
		HasSpiritSword()//Str(0.75)+For(0.75)
			if(src.HasPassive("SpiritSword", SwordBuff=1, NoMobVar=1))
				return 1
			return 0
		GetSpiritSword()//Str(0.75)+For(0.75)
			return src.GetPassive("SpiritSword", SwordBuff=1, NoMobVar=1)/src.GetPassiveCount("SpiritSword", SwordBuff=1, NoMobVar=1)
		HasHybridStrike()//Str(0.75)+For(0.75)
			if(src.HasPassive("HybridStrike", SwordBuff=0, NoMobVar=1))
				return 1
			return 0
		GetHybridStrike()//Str(0.75)+For(0.75)
			return src.GetPassive("HybridStrike", SwordBuff=0, NoMobVar=1)/src.GetPassiveCount("HybridStrike", SwordBuff=0, NoMobVar=1)
		HasSpiritStrike()//For v.s. End
			if(src.HasPassive("SpiritStrike", NoMobVar=1))
				return 1
			return 0
		CheckActive(var/Name)
			if(src.ActiveBuff&&src.ActiveBuff.BuffName=="[Name]")
				return 1
			return 0
		CheckSpecial(var/Name)
			if(src.SpecialBuff&&src.SpecialBuff.BuffName=="[Name]")
				return 1
			return 0
		CheckSlotless(var/Name)
			if(src.SlotlessBuffs.len!=0)
				for(var/obj/Skills/Buffs/SlotlessBuffs/s in src.SlotlessBuffs)
					if(s.BuffName=="[Name]")
						return 1
			return 0
		HasMaimMastery()
			var/Return=0
			if(src.Saga=="Ansatsuken" && src.AnsatsukenAscension=="Chikara")
				Return+=(src.SagaLevel-4)*0.25
			if(src.HasPassive("MaimMastery", BuffsOnly=1))
				Return+=src.GetPassive("MaimMastery", BuffsOnly=1)
			return Return
		CheckKeybladeStyle(var/Style)
			if(src.StyleActive=="[Style]"&&src.CheckActive("Keyblade"))
				return 1
			return 0
		UsingKeybladeStyle()
			if(src.UsingSpeedRave())
				return 1
			if(src.UsingCriticalImpact() && src.StyleActive!="Momentum Shift")
				return 1
			if(src.UsingSpellWeaver())
				return 1
			if(src.UsingFirestorm())
				return 1
			if(src.UsingDiamondDust())
				return 1
			if(src.UsingThunderbolt())
				return 1
			if(src.UsingWingblade())
				return 1
			if(src.UsingCyclone())
				return 1
			if(src.UsingRockBreaker())
				return 1
			if(src.UsingDarkImpulse())
				return 1
			if(src.UsingGhostDrive())
				return 1
			if(src.UsingBladeCharge())
				return 1
			return 0
		UsingSpeedRave()
			if(src.CheckKeybladeStyle("Speed Rave"))
				return 1
			return 0
		UsingCriticalImpact()
			if(src.CheckKeybladeStyle("Critical Impact"))
				return 1
			if(src.StyleActive=="Momentum Shift")
				return 1
			return 0
		UsingSpellWeaver()
			if(src.CheckKeybladeStyle("Spell Weaver"))
				return 1
			return 0
		UsingFirestorm()
			if(src.CheckKeybladeStyle("Firestorm"))
				return 1
			return 0
		UsingDiamondDust()
			if(src.CheckKeybladeStyle("Diamond Dust"))
				return 1
			return 0
		UsingThunderbolt()
			if(src.CheckKeybladeStyle("Thunderbolt"))
				return 1
			return 0
		UsingWingblade()
			if(src.CheckKeybladeStyle("Wing Blade"))
				return 1
			return 0
		UsingCyclone()
			if(src.CheckKeybladeStyle("Cyclone"))
				return 1
			return 0
		UsingRockBreaker()
			if(src.CheckKeybladeStyle("Rock Breaker"))
				return 1
			return 0
		UsingDarkImpulse()
			if(src.CheckKeybladeStyle("Dark Impulse"))
				return 1
			return 0
		UsingGhostDrive()
			if(src.CheckKeybladeStyle("Ghost Drive"))
				return 1
			return 0
		UsingBladeCharge()
			if(src.CheckKeybladeStyle("Blade Charge"))
				return 1
			return 0
		UsingPridefulRage()
			if(src.HasPridefulRage())
				return 1
			return 0
		UsingSpiritHand()
			if(src.HasSpiritHand())
				return 1
			return 0
/*		UsingHybridStrike()
			if(src.HasSpiritSword())
				return 1
			if(src.HasHybridStrike())
				return 1
			return 0*/
		UsingSpiritStrike()
			if(src.HasSpiritStrike())
				return 1
			return 0
		ElementalAttunement()
			if(src.Attunement)
				return 1
			return 0
		HasMilitaryFrame()
			if(locate(/obj/Skills/Buffs/SpecialBuffs/MilitaryFrames/Ripper_Mode, src.contents))
				return 1
			if(locate(/obj/Skills/Buffs/SpecialBuffs/MilitaryFrames/Armstrong_Augmentation, src.contents))
				return 1
			if(locate(/obj/Skills/Buffs/SpecialBuffs/MilitaryFrames/Ray_Gear, src.contents))
				return 1
			if(locate(/obj/Skills/Buffs/SpecialBuffs/MilitaryFrames/Overdrive,src.contents))
				return 1
			if(src.InfinityModule)
				return 1
			return 0
		HasConversionModules()
			var/Total=0
			if(src.FusionPowered)
				Total+=2
			if(src.NanoBoost)
				Total+=2
			if(src.CombatCPU)
				Total+=2
			if(src.BladeMode)
				Total+=2
			if(locate(/obj/Skills/Queue/Cyberize/Taser_Strike, src))
				Total+=1
			if(locate(/obj/Skills/AutoHit/Cyberize/Machine_Gun_Flurry, src))
				Total+=1
			if(locate(/obj/Skills/Projectile/Cyberize/Rocket_Punch, src))
				Total+=1
			if(locate(/obj/Skills/Utility/Internal_Communicator, src))
				Total+=1
			if(src.StabilizeModule)
				Total+=1
			if(src.MeditateModule)
				Total+=1
			return Total
		HasEnhancementChips()
			var/Total=0
			if(src.EnhancedStrength)
				Total+=src.EnhancedStrength
			if(src.EnhancedForce)
				Total+=src.EnhancedForce
			if(src.EnhancedEndurance)
				Total+=src.EnhancedEndurance
			if(src.EnhancedAggression)
				Total+=src.EnhancedAggression
			if(src.EnhancedReflexes)
				Total+=src.EnhancedReflexes
			if(src.EnhancedSpeed)
				Total+=src.EnhancedSpeed
			return Total


		CursedWounds()
			if(src.HasPassive("FakePeace", BuffsOnly=1, NoMobVar=1))
				return 0
			if(src.HasPassive("CursedWounds"))
				return 1
			if(src.HasPassive("Curse", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		SwordWounds()
			for(var/obj/Items/Sword/s in src)
				if(findtext(s.suffix, "Equipped"))
					if((s.Class != "Wooden") && GetSwordDamage(s)>1)
						return 1
			return 0
			/*if(src.HasSword())
				var/obj/Items/Sword/S=src.EquippedSword()
				if(S.Class=="Wooden")
					return 0
				if(GetSwordDamage(S)>1)
					return 1
			return 0*/

		NeedsSecondSword()
			if(src.HasPassive("NeedsSecondSword", BuffsOnly=1, NoMobVar=1))
				return 1
			if(src.HasPassive("MakesSecondSword", BuffsOnly=1, NoMobVar=1))
				return 1
			else return NeedsThirdSword()
		NeedsThirdSword()
			if(src.HasPassive("NeedsThirdSword", BuffsOnly=1, NoMobVar=1))
				return 1
			if(src.HasPassive("MakesThirdSword", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		HasArmor()
			var/obj/Items/Armor/ar=src.EquippedArmor()
			if(ar)
				return 1
			return 0
		HasSword()
			var/s=src.EquippedSword()
			if(s)
				return 1
			return 0
		HasStaff()
			var/s=src.EquippedStaff()
			if(s)
				return 1
			else
				var/obj/Items/Sword/s2=src.EquippedSword()
				if(s2)
					if(s2.MagicSword)
						return 1
			return 0
		NotUsingMagicSword()
			if(src.HasSword())
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s.MagicSword)
					return 0
			return 1
		HasLightSword()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s)
				if(s.Class=="Light")
					return 1
			return 0

		HasMediumSword()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s)
				if(s.Class=="Medium")
					return 1
			return 0
		NoMediumSword()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s)
				if(s.Class=="Medium")
					return 0
			return 1
		HasHeavySword()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s)
				if(s.Class=="Heavy")
					return 1
			return 0
		HasWeights()
			if(src.EquippedWeights())
				return 1
			return 0
		EquippedWeights()
			var/obj/Items/WeightedClothing/wc
			for(var/obj/Items/WeightedClothing/waitz in src)
				if(waitz.suffix=="*Equipped*")
					wc=waitz
					break
			if(wc)
				return wc
			return 0
		EquippedArmor()
			var/obj/Items/Armor/armr
			for(var/obj/Items/Armor/a in src)
				if(a.suffix=="*Equipped*")
					armr=a
					break
			if(armr)
				return armr
			return 0
		EquippedSword()
			var/obj/Items/Sword/sord
			for(var/obj/Items/Sword/s in src)
				if(s.suffix=="*Equipped*")
					sord=s
					break
			if(sord)
				return sord
			return 0
		EquippedSecondSword()
			var/obj/Items/Sword/sord
			for(var/obj/Items/Sword/s in src)
				if(s.suffix=="*Equipped (Second)*")
					sord=s
					break
			if(sord)
				return sord
			return 0
		EquippedThirdSword()
			var/obj/Items/Sword/sord
			for(var/obj/Items/Sword/s in src)
				if(s.suffix=="*Equipped (Third)*")
					sord=s
					break
			if(sord)
				return sord
			return 0
		UsingDarkElementSword()
			var/obj/Items/Sword/s=src.EquippedSword()
			var/obj/Items/Sword/s2=src.EquippedSecondSword()
			var/obj/Items/Sword/s3=src.EquippedThirdSword()
			if(s)
				if(s.Element=="Dark")
					return 1
			if(s2)
				if(s2.Element=="Dark")
					return 1
			if(s3)
				if(s3.Element=="Dark")
					return 1
			return 0
		UsingLightElementSword()
			var/obj/Items/Sword/s=src.EquippedSword()
			var/obj/Items/Sword/s2=src.EquippedSecondSword()
			var/obj/Items/Sword/s3=src.EquippedThirdSword()
			if(s)
				if(s.Element=="Light")
					return 1
			if(s2)
				if(s2.Element=="Light")
					return 1
			if(s3)
				if(s3.Element=="Light")
					return 1
			return 0
		EquippedStaff()
			var/obj/Items/Enchantment/Staff/staf
			for(var/obj/Items/Enchantment/Staff/s in src)
				if(s.suffix=="*Equipped*")
					staf=s
					break
			if(src.Race=="Android"||src.HasMechanized())
				return 0
			else if(staf)
				return staf
			else
				return 0
		CanLoseVitalBP()
			if(src.Race=="Android")
				return 0
			if(src.HasMechanized())
				return 0
			if(src.Anger)
				return 0
			if(src.StableBP)
				return 0
			if(src.Kaioken)
				return 0
			if(src.HasCalmAnger())
				return 0
			if(src.AngerMax==1)
				if(src.Race!="Changeling")
					return 0
			if(src.SenseUnlocked>5&&src.SenseUnlocked>src.SenseRobbed)
				return 0
			return 1
		CanBeSlowed()
			if(src.HasLegendaryPower() > 0.5)
				return 0
			if(src.HasGodspeed()>=2)
				return 0
			if(src.Race=="Android"||src.Race=="Djinn")
				return 0
			if(src.VaizardHealth)
				return 0
			if(src.LastBreath)
				return 0
			if(src.CheckSlotless("Unburdened")||src.CheckSlotless("Unrestrained")||src.CheckSlotless("Berserk"))
				return 0
			if(src.SenseUnlocked>5&&src.SenseUnlocked>src.SenseRobbed)
				return 0
			return 1
		SteadyRace()
			if(src.Race in list("Human", "Makyo", "Namekian", "Tuffle", "Monster",  "Demon", "Alien", "Android", "Dragon"))
				return 1
			return 0
		TransRace()
			if(src.Race in list("Saiyan", "Half Saiyan", "Changeling", "Alien"))
				return 1
			return 0
		OtherRace()
			if(src.Race in list("Djinn", "Shinjin"))
				return 1
			return 0
		SureHit()
			if(src.SureHit)
				return 1
			return 0
		NoWhiff()
			if(src.NoWhiff)
				return 1
			return 0
		Afterimages()
			if(src.Afterimages)
				return 1
			return 0

		KBFreeze()
			if(src.EdgeOfMap())
				return 1
			if(src.AerialRecovery==1)
				src.AerialRecovery=0
				return 1
			if(src.AerialRecovery==2)
				src.AerialRecovery=1
				return 1
			return 0
		EdgeOfMap()
			var/turf/t=get_step(src, src.Knockbacked)
			if(!t)
				return 1
			if(t.density>=1)
				return 1
			return 0
		HasSpellFocus(var/obj/Skills/Z)
			var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
			var/obj/Items/Sword/sord=src.EquippedSword()
			var/Pass=0
			if(src.Saga=="Persona"||src.Saga=="Magic Knight")
				Pass=1
			if(src.is_arcane_beast)
				Pass=1
			if(istype(Z, /obj/Skills/Buffs))
				if(Z:MagicFocus)
					Pass=1
			if(Z.ElementalClass)
				if(src.StyleBuff)
					if(src.StyleBuff.ElementalClass==Z.ElementalClass)
						Pass=1
					else if(istype(src.StyleBuff.ElementalClass, /list))
						if(Z.ElementalClass in src.StyleBuff.ElementalClass)
							Pass=1
			if(src.UsingMasteredMagicStyle())
				Pass=1
			if(src.CrestSpell(Z))
				Pass=1
			if(sord)
				if(sord.MagicSword)
					Pass=1
			if(st)
				Pass=1
			if(src.HasLimitlessMagic())
				Pass=1
			if(src.HasMagicFocus())
				Pass=1
			return Pass

		HasMagicFocus()
			if(src.HasPassive("MagicFocus", BuffsOnly=1, NoMobVar=1))
				return 1
			return 0
		UsingYinYang()
			if(src.StyleActive=="Balance")
				return 1
			if(src.CheckSpecial("Libra Cloth"))
				return 1
			if(src.CheckSpecial("Ultra Instinct"))
				return 1
			if(src.Race=="Dragon"&&src.AscensionsAcquired>=2)
				return 1
			return 0
		UsingSpiritStyle()
			var/Return=0
			if(src.UsingMartialStyle())
				Return++
			if(src.UsingMasteredMartialStyle())
				Return++
			if(src.Race=="Dragon")
				Return++
			return Return
		HasAdaptation()
			if(src.Adaptation)
				return 1
			if(src.StyleActive in list("Balance", "Metta Sutra", "West Star", "Shaolin"))
				return 1
			if(src.Race=="Dragon"&&src.AscensionsAcquired>=1)
				return 1
			if(src.Race=="Djinn")
				return 1
			return 0
		UsingMartialStyle()
			if(src.UsingMasteredMartialStyle())
				return 1
			if(src.StyleActive in list("Turtle", "Crane", "Snake", "Cat","Black Leg", "Strong Fist", "Gentle Fist", "Lightning Kickboxing", "Kendo", "Battle Mage"))
				return 1
			if(src.StyleActive in list("Ansatsuken", "Hiten Mitsurugi"))
				return 1
			if(src.Saga=="Weapon Soul" && src.SagaLevel>=2 && src.StyleActive in list("Iaido", "Zornhau", "Fencing"))
				return 1
			return 0
		UsingMasteredMartialStyle()
			if(src.Saga=="Eight Gates")
				if(src.StyleActive in list("Strong Fist", "Black Leg", "Lightning Kickboxing"))
					return 1
			if(src.Saga=="Ansatsuken" || src.Saga=="Hiten Mitsurugi")
				if(src.SagaLevel>=6)
					return 1
			if(src.Saga=="Weapon Soul" && src.SagaLevel>=6 && src.StyleActive in list("Iaido", "Zornhau", "Fencing"))
				return 1
			if(src.StyleActive in list("Drunken Fist", "Golden Kirin", "Drunken Fist", "Dire Wolf", "Devil Leg", "Flow Reversal", "Phage", "North Star", "Imperial Devil", "South Star"))
				return 1
			return 0
		UsingMasteredMagicStyle()
			if(src.Saga=="Keyblade")
				if(src.SagaLevel>=6)
					return 1
			if(src.StyleActive in list("Moonlight", "Entropy", "Imperial Devil", "Atomic Karate", "East Star"))
				return 1
			if(src.Race=="Dragon"&&src.AscensionsAcquired>=3)
				return 1
			if(src.Race=="Djinn")
				return 1
			return 0
		UsingZornhau()
			var/Found=0
			var/obj/Items/Sword/S=src.EquippedSword()
			if(src.StyleActive=="Zornhau")
				Found=1
			if(src.StyleActive=="Kendo")
				Found=1
			if(src.StyleActive=="Champloo")
				Found=1
			if(src.StyleActive=="Butcher")
				Found=1
			if(src.StyleActive=="Five Rings")
				Found=1
			if(S)
				if(S.ExtraClass&&S.Class=="Heavy")
					Found+=1
			return Found
		UsingFencing()
			var/Found=0
			var/obj/Items/Sword/S=src.EquippedSword()
			if(src.StyleActive=="Fencing")
				Found=1
			if(src.StyleActive=="Dual Wield")
				Found=1
			if(src.StyleActive=="Kendo")
				Found=1
			if(src.StyleActive=="Arcane Bladework")
				Found=1
			if(src.StyleActive=="Trinity")
				Found=1
			if(src.StyleActive=="Five Rings")
				Found=1
			if(S)
				if(S.ExtraClass&&S.Class=="Medium")
					Found+=1
			return Found
		UsingIaido()
			var/Found=0
			var/obj/Items/Sword/S=src.EquippedSword()
			if(src.StyleActive=="Iaido")
				Found=1
			if(src.StyleActive=="Dual Wield")
				Found=1
			if(src.StyleActive=="Secret Knife")
				Found=1
			if(src.StyleActive=="Arcane Bladework")
				Found=1
			if(src.StyleActive=="Trinity")
				Found=1
			if(src.StyleActive=="Blade Singing")
				Found=1
			if(src.StyleActive=="Rhythm of War")
				Found=1
			if(src.StyleActive=="Five Rings")
				Found=1
			if(S)
				if(S.ExtraClass&&S.Class=="Light")
					Found+=1
			return Found
		NotUsingLiving()
			if(src.StyleActive=="Living Weapon")
				return 0
			if(src.StyleActive=="Champloo")
				return 0
			if(src.StyleActive=="Secret Knife")
				return 0
			if(src.StyleActive=="Blade Singing")
				return 0
			if(src.StyleActive=="Shaolin")
				return 0
			if(src.StyleActive=="Rhythm of War")
				return 0
			if(src.StyleActive=="West Star")
				return 0
			if(src.KiBlade)
				return 0
			if(src.Saga == "Kamui")
				return 0
			if(src.Race=="Demon" || (CheckSlotless("Satsui no Hado") && SagaLevel>=8))
				return 0
			return 1
		UsingDualWield()
			if(src.StyleActive=="Dual Wield")
				return 1
			if(src.StyleActive=="Trinity Style")
				return 1
			if(src.StyleActive=="Five Rings")
				return 1
			return 0
		UsingTrinityStyle()
			if(src.StyleActive=="Trinity Style")
				return 1
			if(src.StyleActive=="Five Rings")
				return 1
			return 0
		UsingKendo()
			if(src.StyleActive=="Kendo")
				return 1
			return 0
		NotUsingChamploo()
			if(src.StyleActive=="Secret Knife")
				return 0
			if(src.StyleActive=="Champloo")
				return 0
			if(src.StyleActive=="Blade Singing")
				return 0
			if(src.StyleActive=="Butcher")
				return 0
			if(src.StyleActive=="Shaolin")
				return 0
			if(src.StyleActive=="Rhythm of War")
				return 0
			if(src.StyleActive=="Five Rings")
				return 0
			if(src.StyleActive=="West Star")
				return 0
			if(src.CheckSpecial("Libra Cloth"))
				return 0
			if(src.CheckSlotless("Libra Armory"))
				return 0
			if(src.Saga == "Kamui")
				return 0
			if(src.Race=="Demon" || (CheckSlotless("Satsui no Hado") && SagaLevel>=8))
				return 0
			return 1
		NotUsingBattleMage()
			if(src.StyleActive=="Battle Mage")
				return 0
			return 1
		UsingAnsatsuken()
			if(src.StyleActive=="Ansatsuken")
				return 1
			return 0
		UsingIronFist()
			if(src.StyleActive=="Iron Skin")
				return 1
			return 0
		UsingThunderFist()
			if(src.StyleActive=="Spark Impulse")
				return 1
			return 0
		UsingSunlight()
			if(src.StyleActive=="Sunlight")
				return 1
			if(src.StyleActive=="Moonlight")
				return 1
			if(src.StyleActive=="Atomic Karate")
				return 1
			if(src.StyleActive=="Imperial Devil")
				return 1
			if(src.StyleActive=="Devil Leg")
				return 1
			return 0
		UsingMoonlight()
			if(src.StyleActive=="Moonlight")
				return 1
			if(src.StyleActive=="Atomic Karate")
				return 1
			if(src.StyleActive&&src.Secret=="Werewolf"&&(!src.CheckSlotless("Half Moon Form")))
				return 1
			return 0
		UsingVoidDefense()
			if(src.ElementalDefense=="Void")
				return 1
			if(src.Race=="Djinn")
				return 1
			return 0
		HasDarknessFlame()
			if(src.HasPassive("DarknessFlame", BuffsOnly=1))
				return 1
			return 0
		HasAbsoluteZero()
			if(src.HasPassive("AbsoluteZero", BuffsOnly=1))
				return 1
			return 0
		UsingVortex()
			if(src.StyleActive=="Tide Trap")
				return 1
			return 0
		UsingUltima()
			if(src.StyleActive=="Atomic Karate")
				return 1
			if(src.ElementalDefense=="Ultima")
				return 1
			return 0
		UsingDireFist()
			if(src.StyleActive=="Dire Wolf")
				return 1
			if(src.StyleActive=="Imperial Devil")
				return 1
			return 0
		UsingTranquilFist()
			if(src.StyleActive=="Tranquil Dove")
				return 1
			if(src.StyleActive=="Dire Wolf")
				return 1
			if(src.StyleActive=="Imperial Devil")
				return 1
			if(src.StyleActive=="Moonlight")
				return 1
			return 0
		UsingAtomicFist()
			if(src.StyleActive=="Atomic Karate")
				return 1
			return 0
		UsingBattleMage()
			if(src.StyleActive=="Battle Mage")
				return 1
			return 0
		UsingMuken()
			if(src.StyleActive=="Ansatsuken"&&src.AnsatsukenAscension=="Chikara"&&src.SagaLevel==8)
				return 1
			return 0
		HasLowWeaponSoul()
			if(src.WeaponSoulType=="Holy Blade"||src.WeaponSoulType=="Corrupt Edge"||src.WeaponSoulType=="Weapon Soul")
				return 1
			return 0
		HasUnmasteredWeaponSoul()
			if(src.HasLowWeaponSoul())
				return 1
			return 0
		WSCaledfwlch()
			if(src.WeaponSoulType=="Caledfwlch")
				return 1
			return 0
		WSKusanagi()
			if(src.WeaponSoulType=="Kusanagi")
				return 1
			return 0
		WSDurendal()
			if(src.WeaponSoulType=="Durendal")
				return 1
			return 0
		WSMasamune()
			if(src.WeaponSoulType=="Masamune")
				return 1
			return 0
		WSSoulCalibur()
			if(src.WeaponSoulType=="Soul Calibur")
				return 1
			return 0
		WSSoulEdge()
			if(src.WeaponSoulType=="Soul Edge")
				return 1
			return 0
		WSMuramasa()
			if(src.WeaponSoulType=="Muramasa")
				return 1
			return 0
		WSDainsleif()
			if(src.WeaponSoulType=="Dainsleif")
				return 1
			return 0
		GetWeaponSoulType()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s.type==/obj/Items/Sword/Light/Legendary/WeaponSoul/Bane_of_Blades)
				return "Muramasa"
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Blade_of_Ruin)
				return "Dainsleif"
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Blade_of_Order)
				return "Soul Calibur"
			if(s.type==/obj/Items/Sword/Heavy/Legendary/WeaponSoul/Blade_of_Chaos)
				return "Soul Edge"
			if(s.type==/obj/Items/Sword/Light/Legendary/WeaponSoul/Sword_of_Purity)
				return "Masamune"
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Sword_of_Glory)
				return "Caledfwlch"
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Sword_of_Faith)
				return "Kusanagi"
			if(s.type==/obj/Items/Sword/Heavy/Legendary/WeaponSoul/Sword_of_Hope)
				return "Durendal"
			return 0
		WSCorrupt()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s.type==/obj/Items/Sword/Light/Legendary/WeaponSoul/Bane_of_Blades)
				return 1
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Blade_of_Ruin)
				return 1
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Blade_of_Order)
				return 1
			if(s.type==/obj/Items/Sword/Heavy/Legendary/WeaponSoul/Blade_of_Chaos)
				return 1
			return 0
		WSHoly()
			var/obj/Items/Sword/s=src.EquippedSword()
			if(s.type==/obj/Items/Sword/Light/Legendary/WeaponSoul/Sword_of_Purity)
				return 1
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Sword_of_Glory)
				return 1
			if(s.type==/obj/Items/Sword/Medium/Legendary/WeaponSoul/Sword_of_Faith)
				return 1
			if(s.type==/obj/Items/Sword/Heavy/Legendary/WeaponSoul/Sword_of_Hope)
				return 1
			return 0
		HasSSjVars()
			if(src.Race in list("Saiyan", "Half Saiyan"))
				return 1
			return 0

		CanAttack(ModifyAttack=0)
			if(ModifyAttack >= 0 && (NextAttack-ModifyAttack > world.time))
				return 0
			if(src.BusterCharging)
				return 0
			if(src.Beaming)
				return 0
			if(src.icon_state=="Meditate")
				return 0
			if(src.icon_state=="Train")
				return 0
			if(src.KO)
				return 0
			if(src.Frozen)
				return 0
			if(src.Stunned)
				return 0
			if(src.Stasis)
				return 0
			if(src.WindingUp)
				return 0
			if(src.AutoHitting)
				return 0
			if(src.TimeFrozen)
				return 0
			if(src.PoweringUp)
				return 0
			if(src.EquippedFlyingDevice())
				return 0
			if(istype(src.loc,/mob))
				return 0
			return 1
		HasMana(var/Value)
			if(src.ManaAmount>=Value)
				return 1
			if(src.HasDrainlessMana())
				return 1
			return 0
		GetMoney()
			for(var/obj/Money/m in src)
				return m.Level
		HasMoney(var/Value=null)
			var/Money=src.GetMoney()
			if(Money>=Value)
				return 1
			return 0
		HasRadar()
			for(var/obj/Items/Tech/Radar/r in src)
				return 1
			return 0
		HasManaCapacity(var/Value)
			var/Total=0
			if(usr.Race!="Android"&&!usr.HasMechanized())
				Total+=(100-src.TotalCapacity)*src.GetManaCapMult()//Personal reserves
			for(var/obj/Items/Enchantment/PhilosopherStone/PS in src)
				if(!PS.ToggleUse) continue
				Total+=PS.CurrentCapacity
			for(var/obj/Magic_Circle/MC in range(3, src))
				if(!MC.Locked)
					Total/=0.9
				else
					if(MC.Creator==src.ckey)
						Total/=0.75
				break
			if(Total>=Value)
				return 1
			return 0

		NeedSpellFocii(var/obj/Skills/b)
			if(!b) return
			if(b.ManaCost)
				if(b.Copyable>0 && b.Copyable < 3) return 0
				else if(HasLimitlessMagic()) return 0
				else if(CrestSpell(b)) return 0
				else return 1
			return 0

		InMagitekRestrictedRegion()
			if(usr.z in ArcaneRealmZ) return 3 //Will eventually use a list to make specific restrictions.
			return 0
atom
	proc
		NoTPZone(var/dead_use=0, var/arc_use=0)
			var/SP=0
			if(istype(src, /mob/Players))
				if(src:HasSpiritPower())
					SP=1
			if(src.z == global.DjinnZoneZ)
				return 1
			if(src.z == global.DeadZ && !dead_use && !SP)
				return 1
			if(src.z == global.PhilosopherZ)
				return 1
			if(src.z == global.NearDeadZ && !dead_use && !SP)
				return 1
			if(src.z == global.ArcaneRealmZ && !arc_use)
				return 1
			return 0

proc
	FightingSeriously(var/mob/Offender=0, var/mob/Defender=0)
		if(Offender)
			if(Offender.Lethal)
				return 1
			if(Offender.WoundIntent)
				return 1
			if(Offender.CursedWounds())
				return 1
			if(Offender.SwordWounds())
				return 1
			if(Offender.HasPurity())
				if(Defender&&Defender.IsEvil())
					return 1
		if(Defender)
			if(Defender.Lethal)
				return 1
			if(Defender.WoundIntent)
				return 1
			if(Defender.CursedWounds())
				return 1
			if(Defender.SwordWounds())
				return 1
			if(Defender.HasPurity())
				if(Offender&&Offender.IsEvil())
					return 1
		return 0

obj
	Skills
		Projectile
			proc
				EdgeOfMapProjectile()
					var/turf/t=get_step(src, src.dir)
					if(!t)
						return 1
					if(t.x==0||t.y==0||t.z==0)
						return 1
					if(t)
						if(istype(t, /turf/Special/Blank))
							return 1
					return 0
