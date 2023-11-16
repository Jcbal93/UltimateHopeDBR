mob
	var
		//HAKI
		HakiSpecialization
		HakiCounterArmament
		HakiCounterObservation

		//HAMON
		Ripple//Breathing

		//VAMPIRISM
		BloodPower

mob/Admin3/verb
	SecretManagement(var/mob/Players/P in world)
		set category="Admin"
		var/list/Secrets=list("Hamon of the Sun", "Bellow of the Moon", "Blood, Currency of Soul", "Sage Arts", "Ambition")
		var/Selection=input(src, "Which aspect of power does [P] awaken to?", "Secret Management") in Secrets
		if(P.Secret)
			src << "They already have a secret."
			return
		else
			switch(Selection)
				if("Hamon of the Sun")
					P.ModifyPrime+=1
					P.Secret="Ripple"
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Ripple/Ripple_Breathing)
					P << "Your blood's beat is razor sharp...You've awakened the power of the Ripple!"
				if("Sage Arts")
					P.ModifyPrime+=1
					P.Secret="Senjutsu"
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Senjutsu/Senjutsu_Focus)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Sennin_Mode)
					P << "Enlightened to the natural order of things, you become capable of drawing on the power of the world!"
				if("Ambition")
					P.ModifyPrime+=1
					P.Secret="Haki"
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armament)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Observation)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armor_Lite)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armor)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Shield_Lite)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Shield)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Relax_Lite)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Relax)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Future_Flash_Lite)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Future_Flash)
					P << "Possessing such an overwhelming amount of willpower, you learn to chart destiny through your own ambition!"
				if("Bellow of the Moon")
					P.Secret="Werewolf"
					P.Restoration=1
					P.EnhancedHearing=1
					P.EnhancedSmell=1
					P.Timeless=1
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Regeneration, P))
						P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in P)
						if(!r.RegenerateLimbs)
							r.RegenerateLimbs=1
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Werewolf/New_Moon_Form)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Werewolf/Half_Moon_Form)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Werewolf/Full_Moon_Form)
					P << "You have given into the lunar curse, forsaking your humanity... You've awakened the power of a Werewolf!"
				if("Blood, Currency of Soul")
					P.Secret="Vampire"
					P.BloodPower=1
					P.Timeless=1
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Regeneration, P))
						P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
					P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Vampire/Frenzy)
					P << "You have willingly consumed blood, forsaking your humanity...You've awakened the power of a Vampire!"
mob
	proc
		AddHaki(var/Type)
			src.vars["HakiCounter[Type]"]++
			if(src.vars["HakiCounter[Type]"]>=100&&!src.HakiSpecialization)
				src.HakiSpecialization="[Type]"
				src << "Your Haki becomes centered around the Color of [Type]!"