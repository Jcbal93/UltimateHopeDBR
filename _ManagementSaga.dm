mob/var
	SagaLevel=0//Level for all tier s.
	SagaEXP=0//holds rpp investment
	SagaAdminPermission//allows override of rpp requirements and is required for tier 7/8

	list/SagaAscension=list("Str"=0, "End"=0, "Spd"=0, "For"=0)

	//Tier S variables.

	//WEAPON SOUL
	WeaponSoulType
	BoundLegend//GIVE ME MY SWORD BACK NO JUTSU

	//PERSONA!!!
	PersonaName
	PersonaAction
	PersonaType
	PersonaStrength
	PersonaEndurance
	PersonaSpeed
	PersonaForce
	PersonaOffense
	PersonaDefense
	PersonaRegeneration
	PersonaRecovery

	//JAGAN EYE
	JaganPowerNerf

	//UNLIMITED BLADE WORKS
	UBWReinforce//Adds extra reinforcement stats.
	UBWTrace//When this is marked, you can trace legendary weapons.
	KanshouBakuyaProject
	HolyBladeProject
	CorruptEdgeProject
	ProjectExcalibur
	ProjectLightbringer
	ProjectMuramasa
	ProjectDeathbringer
	MadeOfSwords
	PerfectProjection
	InUBW

	//ANSATSUKEN
	AnsatsukenPath
	AnsatsukenAscension

	//EIGHT GATES
	GatesActive=0

	//VAIZARD
	VaizardRage//TODO: REMOVE
	VaizardHealth//You become immune to damage while this is up.
	VaizardType//Physical, Spiritual, Technical, Balanced
	VaizardIcon
	VaizardCounter//The more you get knocked out, the more likely vaizard is to trigger.

	//SHARINGAN
	SharinganEvolution

	//JINCHUURIKI
	JinchuuType

	//KAMUI
	KamuiType//Purity or Impulse
	KamuiBuffLock//Disallows active slot buffs

	//KEYBLADES
	KeybladeType
	KeybladeColor
	list/Keychains=list()
	KeychainAttached
	SyncAttached
	LimitCounter=0//Add one each form use; used to determine when antiform happens.

	//SAINT SEIYA
	SenseUnlocked=5
	ClothBronze
	ClothGold


mob/Admin3/verb
	SagaManagement(mob/Players/P in world)
		set category="Admin"
		var/list/SagaList=list("Cancel","Ansatsuken","Cosmo","Eight Gates","Hiten Mitsurugi-Ryuu","Kamui","Keyblade","King of Braves","Sharingan","Weapon Soul")
		if(P.Saga)
			if(P.SagaLevel>=8)
				src << "They've already fully mastered the power of their soul."
				return
			for(var/obj/Items/Enchantment/Crystal_of_Bilocation/CoD in world)
				if(CoD.Signature==P.ckey)
					switch(input("This character has a Crystal of Bilocation setup right now. Are you sure you would like to tier them up?") in list("Yes","No"))
						if("No")
							return

			var/list/choices=list("Cancel")
			var/math=(9-P.SagaLevel)
			for(var/x=1, x<math, x++)
				choices.Add(x)

			var/input=input("This character is currently [P.Saga] Tier [P.SagaLevel]. How many levels do you want to add to them?") in choices
			if(input=="Cancel") return
			P.SagaAdminPermission=input
			P << "You've had [input] levels of your Saga unlocked! Meditate to obtain your new powers!"
			Log("Admin", "[ExtractInfo(src)] has increased [ExtractInfo(P)]'s [P.Saga] level from [P.SagaLevel] to [P.SagaLevel+input].")

		else
			var/selection
			if(P.Race in global.NoSagaRaces)
				src << "[P] is a [P.Race], and they are therefore not eligible to receive a Saga."
				return
			else
				selection=input("Select a Tier S to grant. This will set them to T1 in it, granting whatever verbs at that level.") in SagaList
			switch(selection)

				if("Cosmo")
					P.Saga="Cosmo"
					P.SagaLevel=1
					P.KiControlMastery+=1
					if(!P.ClothBronze)
						P.ClothBronze=pick(global.ConstellationsBronze)
						global.ConstellationsBronze.Remove(P.ClothBronze)
					P<<"Your destiny is defined by the stars of [P.ClothBronze]; you have become a champion of Gods: <b>Saint</b>!"
					P<<"You gained the ability to ignite your Cosmo, exchanging stamina for the ability to unlock extrasensory perception on the level of heroes and deities..."
					P<<"Your celestial guardian blesses you with a trump card technique!"
					switch(P.ClothBronze)
						if("Pegasus")
							if(!locate(/obj/Skills/AutoHit/Pegasus_Meteor_Fist, P))
								P.AddSkill(new/obj/Skills/AutoHit/Pegasus_Meteor_Fist)
						if("Dragon")
							if(!locate(/obj/Skills/Queue/Rising_Dragon_Fist, P))
								P.AddSkill(new/obj/Skills/Queue/Rising_Dragon_Fist)
						if("Cygnus")
							if(!locate(/obj/Skills/Projectile/Diamond_Dust, P))
								P.AddSkill(new/obj/Skills/Projectile/Diamond_Dust)
						if("Andromeda")
							if(!locate(/obj/Skills/Projectile/Nebula_Stream, P))
								P.AddSkill(new/obj/Skills/Projectile/Nebula_Stream)
						if("Phoenix")
							if(!locate(/obj/Skills/Queue/Phoenix_Demon_Illusion_Strike, P))
								P.AddSkill(new/obj/Skills/Queue/Phoenix_Demon_Illusion_Strike)

				if("Weapon Soul")
					P<<"You have honed your skills to become a warrior of legend... <b>Arms Master</b>!"
					P.Saga="Weapon Soul"
					P.WeaponSoulType="Weapon Soul"
					P.SagaLevel=1
					P.AddSkill(new/obj/Skills/Buffs/ActiveBuffs/Weapon_Soul)
					fuckup
					var/list/Skills=list("/obj/Skills/AutoHit/Stinger","/obj/Skills/AutoHit/Sword_Pressure","/obj/Skills/AutoHit/Light_Step","/obj/Skills/AutoHit/Overhead_Divide",\
"/obj/Skills/AutoHit/Hack_n_Slash","/obj/Skills/AutoHit/Vacuum_Render","/obj/Skills/AutoHit/Hamstring","/obj/Skills/AutoHit/Cross_Slash")
					var/text=input(P, "What skill do you want to inherit from your Weapon Soul?", "Skill Inheritance") in Skills
					var/path=text2path(text)
					var/obj/Skills/s=new path
					if(locate(s, P))
						P << "Pick a skill you don't have already."
						goto fuckup
					P << "You inherit [s] from the sea of your soul!"
					P.AddSkill(s)

				if("Persona")
					P<<"You awaken an arcane power through confronting your shadow... <b>Persona</b>!"
					P.Saga="Persona"
					P.AddSkill(new/obj/Skills/Buffs/ActiveBuffs/Persona)
					P.SagaLevel=1

				if("King of Braves")
					P<<"You are the embodiment of courage. The hero everyone has been waiting for...the <b>King of Braves</b>!"
					P.Saga="King of Braves"
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/King_Of_Braves, P))
						P.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/King_Of_Braves)
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Will_Knife, P))
						P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Will_Knife)
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Protect_Shade, P))
						P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Protect_Shade)
					if(!locate(/obj/Skills/Projectile/King_of_Braves/Broken_Magnum, P))
						P.AddSkill(new/obj/Skills/Projectile/King_of_Braves/Broken_Magnum)
					P.SagaLevel=1

				if("Unlimited Blade Works")
					P<<"Your whole life is... <b>Unlimited Blade Works</b>!"
					P.Saga="Unlimited Blade Works"
					P.SagaLevel=1
					if(!locate(/obj/Skills/Utility/Make_Equipment, P))
						P.AddSkill(new/obj/Skills/Utility/Make_Equipment)
						P<<"You can conjure copies of equipment just from mana..."
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Magic/Reinforce_Object, P))
						P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Magic/Reinforce_Object)
						P<<"You can reinforce any blade..."
					P.UBWReinforce=1

				if("Hiten Mitsurugi-Ryuu")
					P<<"You embark down the path of slaying men... <b>Hiten Mitsurugi Style</b>!"
					P.Saga="Hiten Mitsurugi-Ryuu"
					P.SagaLevel=1
					if(!locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Hiten_Mitsurugi_Ryuu, P))
						var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/SwordStyle/Hiten_Mitsurugi_Ryuu
						P.AddSkill(s)
						P.StanceUnlock(s)
					if(!locate(/obj/Skills/Queue/JawStrike,P))
						P.AddSkill(new/obj/Skills/Queue/JawStrike)
					if(!locate(/obj/Skills/Queue/FallingBlade,P))
						P.AddSkill(new/obj/Skills/Queue/FallingBlade)
					P.SagaThreshold("Spd", 0.25)
					P.SagaThreshold("Str", 0.125)
					P.SagaThreshold("End", 0.125)
					P.SlayerMod+=0.625
					P.Pursuer+=0.5
					P.SuperDash+=0.25
					P.Godspeed+=0.25

				if("Ansatsuken")
					P<<"You begin to learn of the assassin's fist... <b>Ansatsuken</b>!"
					P.Saga="Ansatsuken"
					P.SagaLevel=1
					P.SlayerMod+=0.625
					if(!locate(/obj/Skills/Buffs/NuStyle/UnarmedStyle/Ansatsuken_Style, P))
						var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/UnarmedStyle/Ansatsuken_Style
						P.AddSkill(s)
						P.StanceUnlock(s)
						P << "You have learned the style of the Assassin's Fist..."
					if(!locate(/obj/Skills/Projectile/Ansatsuken/Hadoken, P))
						P << "You've learned how to project a wave of energy: <b>Hadoken</b>!"
						P.AddSkill(new/obj/Skills/Projectile/Ansatsuken/Hadoken)
					if(!locate(/obj/Skills/Queue/Shoryuken, P))
						P << "You've learned how to release the uppercut of the dragon: <b>Shoryuken</b>!"
						P.AddSkill(new/obj/Skills/Queue/Shoryuken)
					if(!locate(/obj/Skills/AutoHit/Tatsumaki, P))
						P << "You've learned to unleash a mighty whirlwind kick: <b>Tatsumaki</b>!"
						P.AddSkill(new/obj/Skills/AutoHit/Tatsumaki)


				if("Eight Gates")
					P<<"After tirelessly training you finally managed to arrive at the summit of martial arts... <b>Eight Gates</b>!"
					P.Saga="Eight Gates"
					P.SagaLevel=1
					P<<"Your constant hard work shows its effects..."
					P.SagaThreshold("Str", 0.125)
					P.SagaThreshold("End", 0.125)
					P.SagaThreshold("Spd", 0.125)
					P<<"You learn to shatter your natural limitations. Be wary though: the strain of doing that may haunt your future..."
					P.AddSkill(new/obj/Skills/Buffs/ActiveBuffs/Eight_Gates)
					if(!locate(/obj/Skills/Queue/Front_Lotus, P))
						P.AddSkill(new/obj/Skills/Queue/Front_Lotus)

				if("Sharingan")
					P.SagaLevel=1
					P.Saga="Sharingan"
					P.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Sharingan)
					P<<"The curse of hatred blooms in you..."

				if("Kamui")
					P.SagaLevel=1
					P.Saga="Kamui"
					var/choice
					var/confirm
					while(confirm!="Yes")
						choice=alert(P, "What kind of weave do you represent?", "Kamui", "Purity", "Impulse")
						switch(choice)
							if("Impulse")
								confirm=alert(P, "The path of Impulse highlights the unity between clothes and humanity, recklessly fighting alongside one another.  Is this your weave?", "Kamui Path", "Yes", "No")
							if("Purity")
								confirm=alert(P, "The path of Purity highlights humanity's superiority over clothing, using them as protective garment subjugated by your will.  Is this your weave?", "Kamui Path", "Yes", "No")
					P.KamuiType=choice
					if(P.KamuiType=="Impulse")
						P.contents+=new/obj/Items/Symbiotic/Kamui/KamuiSenketsu
						P.SagaThreshold("Str", 0.25)
						P.SagaThreshold("End", 0.25)
					else if(P.KamuiType=="Purity")
						P.contents+=new/obj/Items/Symbiotic/Kamui/KamuiJunketsu
						P.SagaThreshold("Spd", 0.5)
					P<<"You are cloaked in unearthly robes... <b>Kamui</b>!"
					P<<"<i>Let's get naked.</i>"

				if("Magic Knight")
					P.SagaLevel=1
					P.Saga="Magic Knight"
					P.ManaCapMult+=0.25
					P << "You stake yourself on a code of honor and truthfulness."
					var/Weapon=alert(P, "As an Magic Knight, you may draw a blade made of Aether or create a bow and arrow.  Which do you choose?", "Aether Weapon", "Blade", "Bow")
					switch(Weapon)
						if("Blade")
							if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Spirit_Sword, P))
								P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Spirit_Sword)
								P << "You take up the path of the Aether Blade!"
						if("Bow")
							if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Spirit_Bow, P))
								P.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Spirit_Bow)
								P << "You take up the path of the Aether Bow!"
					var/list/Aethers=list("Strength", "Endurance", "Force", "Offense", "Defense")
					var/Aether=input(P, "As your mastery of Aether grows, it heightens one of your attributes at rest.  Which attribute?", "Aether Ascension") in Aethers
					switch(Aether)
						if("Strength")
							P.StrAscension+=0.5
						if("Endurance")
							P.EndAscension+=0.5
						if("Force")
							P.ForAscension+=0.5
						if("Offense")
							P.OffAscension+=0.5
						if("Defense")
							P.DefAscension+=0.5

				if("Keyblade")
					var/list/Choices=list("A Sword of Courage", "A Staff of Spirit", "A Shield of Kindness")
					var/choice
					var/confirm
					while(confirm!="Yes")
						choice=input(P, "A weapon is engraved upon every heart.  What lies within yours?", "Keyblade Awakening") in Choices
						switch(choice)
							if("A Sword of Courage")
								confirm=alert(P, "With this, your heart will be dedicated and impulsive.", "A Sword who's strength is Courage. Bravery to stand against anything.", "Yes", "No")
							if("A Staff of Spirit")
								confirm=alert(P, "With this, your heart will be flexible and unrestrained.", "A Staff who's strenth is Spirit. Power the eye cannot see.", "Yes", "No")
							if("A Shield of Kindness")
								confirm=alert(P, "With this, your heart will be able to endure anything for the sake of those you love.", "A Shield who's strength is Kindness. The desire to help one's friends.", "Yes", "No")
					switch(choice)
						if("A Sword of Courage")
							P.KeybladeType="Sword"
						if("A Staff of Spirit")
							P.KeybladeType="Staff"
						if("A Shield of Kindness")
							P.KeybladeType="Shield"
					var/Color=alert(P, "Light or Darkness?", "Keyblade", "Light", "Darkness")
					P.AddSkill(new/obj/Skills/Buffs/ActiveBuffs/Keyblade)
					P<<"You awaken the [P.KeybladeType] of your heart!"
					P.Saga="Keyblade"
					P.SagaLevel=1
					P.KeybladeColor=Color
					switch(P.KeybladeColor)
						if("Light")
							P.KeychainAttached="Kingdom Key"
							P.SyncAttached="Kingdom Key"
						if("Darkness")
							P.KeychainAttached="Kingdom Key D"
							P.SyncAttached="Kingdom Key D"
			Log("Admin","[ExtractInfo(usr)] granted [selection] to [P].")

	Keychain_Add(mob/Players/m in world)
		set category="Admin"
		var/list/Options=list("Cancel","Kingdom Key","Kingdom Key D","Wayward Wind","Oathkeeper","Way To Dawn","Rainfell","Oblivion","No Name","Earthshaker","Fenrir","Chaos Ripper")
		for(var/o in m.Keychains)
			Options.Remove(o)
		var/Choice=input(usr, "What keychain do you wish to grant to [m]?", "Heart Share") in Options
		if(Choice=="Cancel")
			return
		m.Keychains.Add(Choice)
		Log("Admin", "[ExtractInfo(usr)] unlocked [Choice] keychain for [ExtractInfo(m)]!")

	Constellation_Control()
		set category="Admin"
		var/Choice1=alert(usr, "Do you wish lock or unlock a celestial guardian?", "Constellations", "Unlock", "Lock", "View")
		if(Choice1=="Unlock")
			var/Choice2=input(usr, "Which celestial guardian becomes awake?", "Constellations") in list("Pegasus","Dragon","Cygnus","Andromeda","Phoenix")
			if(!locate(Choice2,global.ConstellationsBronze))
				global.ConstellationsBronze.Add(Choice2)
				usr << "The guardian is free to bind to a new person."
			else
				usr << "The guardian is already awoken."
				return
		else if(Choice1=="Lock")
			var/Choice3=input(usr, "Which celestial guardian becomes bound?", "Constellations") in global.ConstellationsBronze
			global.ConstellationsBronze.Remove(Choice3)
			usr << "The guardian won't be bound to anyone else now."
		else
			usr<<"<hr>"
			for(var/q in global.ConstellationsBronze)
				usr<<"[q]"
			usr<<"<hr>"
			return


var
	HiyoriTaken
	IchigoTaken
	KanameTaken
	KenseiTaken
	LisaTaken
	LoveTaken
	MashiroTaken
	RojuroTaken
	ShinjiTaken
	ShowlongTaken
	TousenTaken
proc
	CheckVaizardMasksTaken()
		if(HiyoriTaken&&IchigoTaken&&KanameTaken&&KenseiTaken&&LisaTaken&&LoveTaken&&MashiroTaken&&RojuroTaken&&ShinjiTaken&&ShowlongTaken&&TousenTaken)
			HiyoriTaken=0
			IchigoTaken=0
			KanameTaken=0
			KenseiTaken=0
			LisaTaken=0
			LoveTaken=0
			MashiroTaken=0
			RojuroTaken=0
			ShinjiTaken=0
			ShowlongTaken=0
			TousenTaken=0

mob
	proc
		GetVaizardIcon()
			CheckVaizardMasksTaken()
			var/list/Masks=list('Hiyori.dmi', 'Ichigo.dmi', 'Kaname.dmi', 'Kensei.dmi', 'Lisa.dmi', 'Love.dmi', 'Mashiro.dmi', 'Rojuro.dmi', 'Shinji.dmi', 'Showlong.dmi')
			if(HiyoriTaken)
				Masks.Remove('Hiyori.dmi')
			if(IchigoTaken)
				Masks.Remove('Ichigo.dmi')
			if(KanameTaken)
				Masks.Remove('Kaname.dmi')
			if(KenseiTaken)
				Masks.Remove('Kensei.dmi')
			if(LisaTaken)
				Masks.Remove('Lisa.dmi')
			if(LoveTaken)
				Masks.Remove('Love.dmi')
			if(MashiroTaken)
				Masks.Remove('Mashiro.dmi')
			if(RojuroTaken)
				Masks.Remove('Rojuro.dmi')
			if(ShinjiTaken)
				Masks.Remove('Shinji.dmi')
			if(ShowlongTaken)
				Masks.Remove('Showlong.dmi')
			src.VaizardIcon=pick(Masks)
			if(src.VaizardIcon=='Hiyori.dmi')
				HiyoriTaken=1
			if(src.VaizardIcon=='Ichigo.dmi')
				IchigoTaken=1
			if(src.VaizardIcon=='Kaname.dmi')
				KanameTaken=1
			if(src.VaizardIcon=='Kensei.dmi')
				KenseiTaken=1
			if(src.VaizardIcon=='Lisa.dmi')
				LisaTaken=1
			if(src.VaizardIcon=='Love.dmi')
				LoveTaken=1
			if(src.VaizardIcon=='Mashiro.dmi')
				MashiroTaken=1
			if(src.VaizardIcon=='Rojuro.dmi')
				RojuroTaken=1
			if(src.VaizardIcon=='Shinji.dmi')
				ShinjiTaken=1
			if(src.VaizardIcon=='Showlong.dmi')
				ShowlongTaken=1
proc
	GetKeychainClass(var/KC)
		switch(KC)
			if("Kingdom Key")
				return "Wooden"
			if("Kingdom Key D")
				return "Wooden"
			if("Wayward Wind")
				return "Light"
			if("Oathkeeper")
				return "Light"
			if("Way To Dawn")
				return "Light"
			if("Rainfell")
				return "Medium"
			if("Oblivion")
				return "Medium"
			if("No Name")
				return "Medium"
			if("Earthshaker")
				return "Heavy"
			if("Fenrir")
				return "Heavy"
			if("Chaos Ripper")
				return "Heavy"
	GetKeychainDamage(var/KC)
		switch(KC)
			if("Kingdom Key")
				return 1
			if("Kingdom Key D")
				return 1
			if("Wayward Wind")
				return 0
			if("Rainfell")
				return 0
			if("Earthshaker")
				return 2
			if("Oathkeeper")
				return -1
			if("Oblivion")
				return 2
			if("Fenrir")
				return 2
			if("No Name")
				return 0
			if("Way To Dawn")
				return 1
			if("Chaos Ripper")
				return 4
	GetKeychainAccuracy(var/KC)
		switch(KC)
			if("Kingdom Key")
				return 1
			if("Kingdom Key D")
				return 1
			if("Wayward Wind")
				return 1
			if("Rainfell")
				return 2
			if("Earthshaker")
				return 1
			if("Oathkeeper")
				return 2
			if("Oblivion")
				return 2
			if("Fenrir")
				return 3
			if("No Name")
				return 3
			if("Way To Dawn")
				return 2
			if("Chaos Ripper")
				return -1
	GetKeychainDelay(var/KC)
		switch(KC)
			if("Kingdom Key")
				return 1
			if("Kingdom Key D")
				return 1
			if("Wayward Wind")
				return 2
			if("Rainfell")
				return 1
			if("Earthshaker")
				return 0
			if("Oathkeeper")
				return 2
			if("Oblivion")
				return -1
			if("Fenrir")
				return -2
			if("No Name")
				return 0
			if("Way To Dawn")
				return 0
			if("Chaos Ripper")
				return 0
	GetKeychainElement(var/KC)
		switch(KC)
			if("Kingdom Key")
				return 0
			if("Kingdom Key D")
				return 0
			if("Wayward Wind")
				return "Wind"
			if("Rainfell")
				return "Water"
			if("Earthshaker")
				return "Earth"
			if("Oathkeeper")
				return "Light"
			if("Oblivion")
				return "Dark"
			if("Fenrir")
				return 0
			if("No Name")
				return "Void"
			if("Way To Dawn")
				return 0
			if("Chaos Ripper")
				return "Fire"
	GetKeychainIcon(var/KC)
		switch(KC)
			if("Kingdom Key")
				return 'KingdomKey.dmi'
			if("Kingdom Key D")
				return 'KingdomKeyD.dmi'
			if("Wayward Wind")
				return 'WaywardWind.dmi'
			if("Rainfell")
				return 'Rainfell.dmi'
			if("Earthshaker")
				return 'Earthshaker.dmi'
			if("Oathkeeper")
				return 'Oathkeeper.dmi'
			if("Oblivion")
				return 'Oblivion.dmi'
			if("Fenrir")
				return 'Fenrir.dmi'
			if("No Name")
				return 'NoName.dmi'
			if("Way To Dawn")
				return 'WayToTheDawn.dmi'
			if("Chaos Ripper")
				return 'ChaosRipper.dmi'
	GetKeychainIconReversed(var/KC)
		switch(KC)
			if("Kingdom Key")
				return 'KingdomKeySync.dmi'
			if("Kingdom Key D")
				return 'KingdomKeySync.dmi'
			if("Wayward Wind")
				return 'WaywardWindSync.dmi'
			if("Rainfell")
				return 'RainfellSync.dmi'
			if("Earthshaker")
				return 'EarthshakerSync.dmi'
			if("Oathkeeper")
				return 'OathkeeperSync.dmi'
			if("Oblivion")
				return 'OblivionSync.dmi'
			if("Fenrir")
				return 'FenrirSync.dmi'
			if("No Name")
				return 'NoNameSync.dmi'
			if("Way To Dawn")
				return 'WayToTheDawnSync.dmi'
			if("Chaos Ripper")
				return 'ChaosRipperSync.dmi'
mob
	proc
		GetPersonaPoints()
			var/Points=0
			if(src.PersonaStrength)
				Points+=src.PersonaStrength
			if(src.PersonaEndurance)
				Points+=src.PersonaEndurance
			if(src.PersonaSpeed)
				Points+=src.PersonaSpeed
			if(src.PersonaForce)
				Points+=src.PersonaForce
			if(src.PersonaOffense)
				Points+=src.PersonaOffense
			if(src.PersonaDefense)
				Points+=src.PersonaDefense
			if(src.PersonaRegeneration)
				Points+=src.PersonaRegeneration
			if(src.PersonaRecovery)
				Points+=src.PersonaRecovery
			return Points
		AssignPowerPersonaPoints()
			var/list/Stats=list("Strength", "Endurance", "Speed", "Offense", "Defense")
			var/Pick=pick(Stats)
			switch(Pick)
				if("Strength")
					src.PersonaStrength+=0.5
					src.PersonaOffense+=0.5
				if("Endurance")
					src.PersonaEndurance+=0.5
					src.PersonaDefense+=0.5
				if("Speed")
					src.PersonaOffense+=0.5
					src.PersonaSpeed+=0.5
				if("Offense")
					src.PersonaEndurance+=0.5
					src.PersonaOffense+=0.5
				if("Defense")
					src.PersonaStrength+=0.5
					src.PersonaDefense+=0.5
		AssignSkillPersonaPoints()
			var/list/Stats=list("Speed", "Force", "Offense", "Defense", "Regeneration")
			var/Pick=pick(Stats)
			switch(Pick)
				if("Speed")
					src.PersonaDefense+=0.5
					src.PersonaSpeed+=0.5
				if("Force")
					src.PersonaForce+=0.5
					src.PersonaOffense+=0.5
				if("Offense")
					src.PersonaSpeed+=0.5
					src.PersonaOffense+=0.5
				if("Defense")
					src.PersonaForce+=0.5
					src.PersonaDefense+=0.5
				if("Regeneration")
					src.PersonaRegeneration+=0.5
					src.PersonaSpeed+=0.5
		AssignGimmickPersonaPoints()
			var/list/Stats=list("Strength", "Endurance", "Speed", "Force", "Offense", "Defense", "Regeneration", "Recovery")
			var/Pick=pick(Stats)
			switch(Pick)
				if("Strength")
					src.PersonaStrength+=0.5
					src.PersonaOffense+=0.5
				if("Endurance")
					src.PersonaEndurance+=0.5
					src.PersonaDefense+=0.5
				if("Speed")
					src.PersonaOffense+=0.5
					src.PersonaSpeed+=0.5
				if("Force")
					src.PersonaForce+=0.5
					src.PersonaOffense+=0.5
				if("Offense")
					src.PersonaEndurance+=0.5
					src.PersonaOffense+=0.5
				if("Defense")
					src.PersonaForce+=0.5
					src.PersonaDefense+=0.5
				if("Regeneration")
					src.PersonaRegeneration+=0.5
					src.PersonaSpeed+=0.5
				if("Recovery")
					src.PersonaDefense+=0.5
					src.PersonaRecovery+=0.5
mob
	proc
		saga_up_self()
			if(!src.SagaAdminPermission)
				if(src.SagaLevel>=6)
					src << "How did you manage to get a Saga Level Up past Tier 6 without permission? Report to the coders."
					return
			else
				if(src.SagaLevel>=6)
					src << "You've been bestowed an additional tier of your Saga purposefully; enjoy your new powers, this is not a bug!"

			src.SagaLevel++
			src.SagaEXP=0
			src.SagaAdminPermission--
			if(src.SagaAdminPermission<0)
				src.SagaAdminPermission=0

			switch(src.Saga)
				if("Cosmo")
					if(src.SagaLevel==2)
						src<<"Your celestial guardian blesses you with the ability to clad yourself in their power!"
					if(src.SagaLevel==3)
						src<<"Your celestial guardian blesses you with revelations of more advanced techniques!"
						switch(src.ClothBronze)
							if("Pegasus")
								if(!locate(/obj/Skills/Projectile/Pegasus_Comet_Fist, src))
									src.AddSkill(new/obj/Skills/Queue/Pegasus_Rolling_Crash)
									src.AddSkill(new/obj/Skills/Projectile/Pegasus_Comet_Fist)
							if("Dragon")
								if(!locate(/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Mountain_Dragon, src))
									src.AddSkill(new/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Mountain_Dragon)
							if("Cygnus")
								if(!locate(/obj/Skills/AutoHit/Aurora_Thunder_Attack, src))
									src.AddSkill(new/obj/Skills/AutoHit/Aurora_Thunder_Attack)
							if("Phoenix")
								if(!locate(/obj/Skills/AutoHit/Phoenix_Rising_Wing, src))
									src.AddSkill(new/obj/Skills/AutoHit/Phoenix_Rising_Wing)
					if(src.SagaLevel==4 || src.SagaLevel==7)
						if(!locate(/obj/Skills/Utility/Zodiac_Invocation, src))
							src.AddSkill(new/obj/Skills/Utility/Zodiac_Invocation)
							src<<"In a severe pinch, you can cry out for assistance to your Zodiac guardian and hope for their protection!"
					if(src.SagaLevel==5)
						src<<"You are experiencing the first glimmers of Seventh Sense when in a pinch!"
					if(src.SagaLevel==6)
						src<<"Through attaining the Seventh Sense you can invoke the techniques of your Zodiac guardian, if only for a moment!"
					if(src.SagaLevel==7)
						src<<"You reach the level of a Golden Saint, standing at the summit as a champion of Gods!"
						switch(src.ClothGold)
							if("Aries")
								if(!locate(/obj/Skills/Projectile/Stardust_Revolution, src))
									src.AddSkill(new/obj/Skills/Projectile/Stardust_Revolution)
								if(!locate(/obj/Skills/AutoHit/Starlight_Extinction, src))
									src.AddSkill(new/obj/Skills/AutoHit/Starlight_Extinction)
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Crystal_Wall, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Crystal_Wall)
								if(!locate(/obj/Skills/Telekinesis, src))
									src.AddSkill(new/obj/Skills/Telekinesis)
							if("Gemini")
								if(!locate(/obj/Skills/Projectile/Galaxian_Explosion, src))
									src.AddSkill(new/obj/Skills/Projectile/Galaxian_Explosion)
								if(!locate(/obj/Skills/AutoHit/Another_Dimension, src))
									src.AddSkill(new/obj/Skills/AutoHit/Another_Dimension)
								if(!locate(/obj/Skills/Queue/Demon_Emperor_Fist, src))
									src.AddSkill(new/obj/Skills/Queue/Demon_Emperor_Fist)
								if(!locate(/obj/Skills/Teleport/Traverse_Dimension, src))
									src.AddSkill(new/obj/Skills/Teleport/Traverse_Dimension)
							if("Cancer")
								if(!locate(/obj/Skills/Projectile/Praesepe_Demonic_Blue_Flames, src))
									src.AddSkill(new/obj/Skills/Projectile/Praesepe_Demonic_Blue_Flames)
								if(!locate(/obj/Skills/AutoHit/Praesepe_Underworld_Waves, src))
									src.AddSkill(new/obj/Skills/AutoHit/Praesepe_Underworld_Waves)
								if(!locate(/obj/Skills/Queue/Acubens, src))
									src.AddSkill(new/obj/Skills/Queue/Acubens)
								if(!locate(/obj/Skills/Teleport/Traverse_Underworld, src))
									src.AddSkill(new/obj/Skills/Teleport/Traverse_Underworld)
							if("Leo")
								if(!locate(/obj/Skills/Projectile/Lightning_Bolt, src))
									src.AddSkill(new/obj/Skills/Projectile/Lightning_Bolt)
								if(!locate(/obj/Skills/AutoHit/Lightning_Plasma_Burst, src))
									src.AddSkill(new/obj/Skills/AutoHit/Lightning_Plasma_Burst)
								if(!locate(/obj/Skills/Queue/Lightning_Plasma_Strike, src))
									src.AddSkill(new/obj/Skills/Queue/Lightning_Plasma_Strike)
							if("Virgo")
								if(!locate(/obj/Skills/AutoHit/Demon_Pacifier, src))
									src.AddSkill(new/obj/Skills/AutoHit/Demon_Pacifier)
								if(!locate(/obj/Skills/Queue/Six_Transmigrations, src))
									src.AddSkill(new/obj/Skills/Queue/Six_Transmigrations)
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Heavenly_Ring_Dance, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Heavenly_Ring_Dance)
							if("Libra")
								if(src.ClothBronze=="Dragon")
									for(var/obj/Skills/Queue/Rising_Dragon_Fist/rdf in src.Queues)
										if(!locate(/obj/Skills/Queue/Rising_Dragon_Lord, src))
											src.AddSkill(new/obj/Skills/Queue/Rising_Dragon_Lord)
										del rdf
									for(var/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Mountain_Dragon/smd in src)
										if(!locate(/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Dragon_Lord, src))
											src.AddSkill(new/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Dragon_Lord)
										del smd
								else
									if(!locate(/obj/Skills/Queue/Rising_Dragon_Fist, src))
										src.AddSkill(new/obj/Skills/Queue/Rising_Dragon_Fist)
									if(!locate(/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Mountain_Dragon, src))
										src.AddSkill(new/obj/Skills/Projectile/Beams/Saint_Seiya/Soaring_Mountain_Dragon)
							if("Scorpio")
								if(!locate(/obj/Skills/Projectile/Scarlet_Needle, src))
									src.AddSkill(new/obj/Skills/Projectile/Scarlet_Needle)
								if(!locate(/obj/Skills/AutoHit/Restriction, src))
									src.AddSkill(new/obj/Skills/AutoHit/Restriction)
								if(!locate(/obj/Skills/Queue/Antares, src))
									src.AddSkill(new/obj/Skills/Queue/Antares)
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Katekao, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Katekao)
							if("Capricorn")
								if(!locate(/obj/Skills/Projectile/Sacred_Sword, src))
									src.AddSkill(new/obj/Skills/Projectile/Sacred_Sword)
								if(!locate(/obj/Skills/AutoHit/Sacred_Sword_Excalibur, src))
									src.AddSkill(new/obj/Skills/AutoHit/Sacred_Sword_Excalibur)
								if(!locate(/obj/Skills/Queue/Jumping_Stone, src))
									src.AddSkill(new/obj/Skills/Queue/Jumping_Stone)
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Excalibur, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Excalibur)
							if("Aquarius")
								if(src.ClothBronze=="Cygnus")
									for(var/obj/Skills/Projectile/Diamond_Dust/dd in src)
										if(!locate(/obj/Skills/Projectile/Diamond_Dust_Storm, src))
											src.AddSkill(new/obj/Skills/Projectile/Diamond_Dust_Storm)
										del dd
								else
									if(!locate(/obj/Skills/Projectile/Diamond_Dust, src))
										src.AddSkill(new/obj/Skills/Projectile/Diamond_Dust)
								if(!locate(/obj/Skills/Projectile/Beams/Big/Saint_Seiya/Aurora_Execution, src))
									src.AddSkill(new/obj/Skills/Projectile/Beams/Big/Saint_Seiya/Aurora_Execution)
								if(!locate(/obj/Skills/AutoHit/Ice_Coffin, src))
									src.AddSkill(new/obj/Skills/AutoHit/Ice_Coffin)
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Kolco, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Kolco)
							if("Pisces")
								if(!locate(/obj/Skills/Projectile/Royal_Demon_Rose, src))
									src.AddSkill(new/obj/Skills/Projectile/Royal_Demon_Rose)
								if(!locate(/obj/Skills/Queue/Piranhan_Rose, src))
									src.AddSkill(new/obj/Skills/Queue/Piranhan_Rose)
								if(!locate(/obj/Skills/AutoHit/Bloody_Rose, src))
									src.AddSkill(new/obj/Skills/AutoHit/Bloody_Rose)
					if(src.SagaLevel==8)
						src<<"Attaining full mastery of the Seventh Sense, you scratch the surface of Godhood!"
						src.SenseUnlocked=6


				if("Weapon Soul")
					if(src.SagaLevel==2)
						src << "Your knowledge on classic swordplay improves."
						fuckup2
						var/list/Skills=list("/obj/Skills/AutoHit/Drill_Spin","/obj/Skills/AutoHit/Rising_Spire","/obj/Skills/AutoHit/Ark_Brave","/obj/Skills/AutoHit/Judgment",\
"/obj/Skills/Queue/Swallow_Reversal","/obj/Skills/Queue/Larch_Dance","/obj/Skills/Queue/Willow_Dance","/obj/Skills/Queue/Zero_Reversal","/obj/Skills/Queue/Infinity_Trap")
						var/text=input(src, "What skill do you want to inherit from your Weapon Soul?", "Skill Inheritance") in Skills
						var/path=text2path(text)
						var/obj/Skills/s=new path
						if(locate(s, src))
							src << "Pick a skill you don't have already."
							goto fuckup2
						src << "You inherit [s] from the sea of your soul!"
						src.AddSkill(s)
					if(src.SagaLevel==3)
						var/Choice=alert(src, "Is your swordsmanship guided by Intuition or Experience?", "Weapon Soul", "Intuition", "Experience")
						if(Choice=="Intuition")
							src.Instinct+=1
							src.Flow+=1
						if(Choice=="Experience")
							src.TechniqueMastery+=3
						src << "You develop the acumen to draw forth greater power from your weapons."
						fuckup3
						var/list/Skills=list("/obj/Skills/Grapple/Sword/Eviscerate","/obj/Skills/Queue/Run_Through","/obj/Skills/Grapple/Sword/Hacksaw","/obj/Skills/Grapple/Sword/Form_Ataru")
						var/text=input(src, "What skill do you want to inherit from your Weapon Soul?", "Skill Inheritance") in Skills
						var/path=text2path(text)
						var/obj/Skills/s=new path
						if(locate(s, src))
							src << "Pick a skill you don't have already."
							goto fuckup3
						src << "You inherit [s] from the sea of your soul!"
						src.AddSkill(s)
					if(src.SagaLevel==4)
						var/Choice=alert(src, "Is your soul one of light or dark?", "Weapon Soul", "Light", "Dark")
						if(Choice=="Light")
							src << "You've learned to infuse your sword with the power of holy light."
							src.AddSkill(new/obj/Skills/Queue/Holy_Blade)
						if(Choice=="Dark")
							src << "You've learned to infuse your sword with overwhelming darkness."
							src.AddSkill(new/obj/Skills/Queue/Darkness_Blade)
						fuckup4
						var/list/Skills=list("/obj/Skills/Projectile/Sword/Backlash_Wave","/obj/Skills/Projectile/Sword/Wind_Scar","/obj/Skills/Projectile/Sword/Air_Carve","/obj/Skills/Projectile/Sword/Phantom_Howl",\
"/obj/Skills/AutoHit/Crowd_Cutter","/obj/Skills/AutoHit/Jet_Slice","/obj/Skills/AutoHit/Holy_Justice","/obj/Skills/AutoHit/Doom_of_Damocles")
						var/text=input(src, "What skill do you want to inherit from your Weapon Soul?", "Skill Inheritance") in Skills
						var/path=text2path(text)
						var/obj/Skills/s=new path
						if(locate(s, src))
							src << "Pick a skill you don't have already."
							goto fuckup4
						src << "You inherit [s] from the sea of your soul!"
						src.AddSkill(s)
					if(src.SagaLevel==5)
						var/Choice=alert(src, "Does your swordsmanship focus on Power or Skill?", "Weapon Soul", "Power", "Skill")
						if(Choice=="Power")
							if(!locate(/obj/Skills/Buffs/SpecialBuffs/Sword/PranaBurst, src))
								var/obj/Skills/Buffs/SpecialBuffs/Sword/PranaBurst/PB=new
								if(locate(/obj/Skills/Queue/Darkness_Blade, src))
									PB.IconLock='DarknessFlameAura.dmi'
									PB.HitSpark='Slash - Hellfire.dmi'
								src.AddSkill(PB)
						if(Choice=="Skill")
							if(!locate(/obj/Skills/Buffs/SpecialBuffs/Sword/SwordSaint, src))
								src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Sword/SwordSaint)
						src << "You develop the acumen to draw forth greater power from your weapons."
					if(src.SagaLevel==6)
						src << "You have gained knowledge sufficient to unleash the secret trump card of legendary weapons!"
						var/list/sord=list("Masamune", "Durendal", "Kusanagi", "Caledfwlch", "Muramasa", "Soul Calibur", "Soul Edge", "Dainsleif")
						if(MasamuneTaken)
							sord.Remove("Masamune")
						if(DurendalTaken)
							sord.Remove("Durendal")
						if(KusanagiTaken)
							sord.Remove("Kusanagi")
						if(CaledfwlchTaken)
							sord.Remove("Caledfwlch")
						if(MuramasaTaken)
							sord.Remove("Muramasa")
						if(SoulCaliburTaken)
							sord.Remove("Soul Calibur")
						if(SoulEdgeTaken)
							sord.Remove("Soul Edge")
						if(DainsleifTaken)
							sord.Remove("Dainsleif")
						if(sord.len<1)
							sord=list("Masamune", "Durendal", "Kusanagi", "Caledfwlch", "Muramasa", "Soul Calibur", "Soul Edge", "Dainsleif")
							ResetSwords()
						src.BoundLegend=input(src, "What sword have you merged with?", "Sword Claim") in sord
						switch(src.BoundLegend)
							if("Masamune")
								MasamuneTaken=1
							if("Durendal")
								DurendalTaken=1
							if("Kusanagi")
								KusanagiTaken=1
							if("Caledfwlch")
								CaledfwlchTaken=1
							if("Muramasa")
								MuramasaTaken=1
							if("Soul Calibur")
								SoulCaliburTaken=1
							if("Soul Edge")
								SoulEdgeTaken=1
							if("Dainsleif")
								DainsleifTaken=1
						src << "You have gained knowledge sufficient to wield a legendary weapon with its original powers!"
						src << "[src.BoundLegend] accepts you as its current wielder!"
						src.AddSkill(new/obj/Skills/Utility/Call_Blade)
					if(src.SagaLevel==7)
						if(!locate(/obj/Skills/Buffs/SpecialBuffs/OverSoul, src))
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/OverSoul)
							src << "You've learned to unseal the true form of your legendary weapon."
						//lasts for 90*(1/worlddamagemult) seconds at this level
					if(src.SagaLevel==8)
						src << "You become capable of assuming a legendary form at will without restriction."
						//limitless oversoul

				if("Unlimited Blade Works")
					switch(src.SagaLevel)
						if(2)
							src.UBWTrace=1
							src.KanshouBakuyaProject=1
							src << "You can project legendary weapons!"
						if(3)
							src << "snrk"
						if(4)
							src << "snrk"

				if("Hiten Mitsurugi-Ryuu")
					//triggers every level
					src.SagaThreshold("Str", 0.125*src.SagaLevel)
					src.SagaThreshold("End", 0.125*src.SagaLevel)
					src.SagaThreshold("Spd", 0.25*src.SagaLevel)
					src.SlayerMod+=0.625
					src.Pursuer+=0.5
					src.SuperDash+=0.25
					src.Godspeed+=0.25
					if(src.SagaLevel==2)
						if(!locate(/obj/Skills/AutoHit/CoiledSlash, src))
							src << "You learn how to add the momentum of your spin to perform an unavoidable slash!"
							src.AddSkill(new/obj/Skills/AutoHit/CoiledSlash)
						//Hiten Style now gives Godspeed 1
						if(!locate(/obj/Skills/AutoHit/NestedSlash, src))
							src<< "You learn how to strike countless times with incredible speed!"
							src.AddSkill(new/obj/Skills/AutoHit/NestedSlash)
					if(src.SagaLevel==3)
						if(!locate(/obj/Skills/Projectile/Sword/Hiten_Mitsurugi/Earth_Dragon_Flash, src))
							src.AddSkill(new/obj/Skills/Projectile/Sword/Hiten_Mitsurugi/Earth_Dragon_Flash)
							src << "You learn to strike the ground and unleash a torrent of debris!"
					if(src.SagaLevel==4)
						//Hiten Style now gives additional Flicker
						if(!locate(/obj/Skills/Queue/Twin_Dragon_Slash, src))
							src.AddSkill(new/obj/Skills/Queue/Twin_Dragon_Slash)
							src << "You can deliver a quick blow with your blade only to be followed with a crushing strike from your sheath!"
					if(src.SagaLevel==5)
						src << "You learn to unleash Hiten Mitsurugi techniques with even faster alacrity!"
						src.MovementMastery+=5
						for(var/obj/Skills/Buffs/NuStyle/SwordStyle/Hiten_Mitsurugi_Ryuu/hmr in src.contents)
							if(hmr.Finisher!="/obj/Skills/Queue/Finisher/True_Flash_Strike")
								hmr.Finisher="/obj/Skills/Queue/Finisher/True_Flash_Strike"
								src << "You have refined your finishing technique: True Flash Strike!"
					if(src.SagaLevel==6)
						if(!locate(/obj/Skills/AutoHit/Sonic_Sheath, src))
							src << "You learn to sheath your sword with such authority that it stuns those around you!"
							src.AddSkill(new/obj/Skills/AutoHit/Sonic_Sheath)
						var/Choice=alert(src, "Hiten Mitsurugi can follow the path of tradition, embracing the code of a hermit and honorable warrior or can truly become an ultimate tool of murder. What is the mantle you will bear?", "Hiten Path", "Tradition", "Slaughter")
						if(Choice=="Tradition")
							src<<"You embrace the path of tradition, sharpening your art and making it a constant presence in your life!"
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Dance_Of_The_Full_Moon)
							src<<"You can now draw out the full form of the Moon by using paired blades."
						if(Choice=="Slaughter")
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Hitokiri_Battosai)
							src<<"You embrace the path of a killer and assassin, revealing your true nature in moments of strife!"
					if(src.SagaLevel==7)
						src<<"Your use of Godspeed has been ingrained in your body!"
						src<<"You can slay even inhuman foes!"
						if(!locate(/obj/Skills/Queue/Nine_Dragons_Strike, src))
							src << "You learn of nine killing blows: Kuzuryusen!"
							src.AddSkill(new/obj/Skills/Queue/Nine_Dragons_Strike)
					if(src.SagaLevel==8)
						src<<"Your speed transcends mortal limit and you can chase down any foe..."
						if(!locate(/obj/Skills/Queue/Heavenly_Dragon_Flash, src))
							src << "You learn the ultimate killing technique...even if you avoid the fangs of the flying dragon, the claws will rip you apart!"
							src.AddSkill(new/obj/Skills/Queue/Heavenly_Dragon_Flash)

				if("Ansatsuken")

					if(src.SagaLevel>=1&&src.SagaLevel<5)
						if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected, src))
							if(prob(10))
								src << "Your drive for victory sometimes overwhelms you..."
								src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected)
					src.SlayerMod+=0.625
					if(src.SagaLevel==2)
						src<<"Your Ansatsuken becomes refined enough to use EX versions of your abilities! Remember: every EX version costs 25 Meter."
					if(src.SagaLevel==3)
						if(!src.AnsatsukenPath)
							src.AnsatsukenPath=alert(src, "You have refined your abilities to excel in one area of Ansatsuken...But what area?", "Ansatsuken Path", "Hadoken", "Shoryuken", "Tatsumaki")
						switch(src.AnsatsukenPath)
							if("Hadoken")
								src << "Your Hadoken and EX-Hadoken improve!"
								for(var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Ansatsuken_Style/ans in src)
									ans.Finisher="/obj/Skills/Queue/Finisher/Isshin"
									src << "You learn to perform the special finisher: Isshin!"
							if("Shoryuken")
								src << "Your Shoryuken and EX-Shoryuken improve!"
								for(var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Ansatsuken_Style/ans in src)
									ans.Finisher="/obj/Skills/Queue/Finisher/Shoryureppa1"
									src << "You learn to perform the special finisher: Shoryureppa!"
							if("Tatsumaki")
								src << "Your Tatsumaki and EX-Tatsumaki improve!"
								for(var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Ansatsuken_Style/ans in src)
									ans.Finisher="/obj/Skills/Queue/Finisher/Shippu_Jinraikyaku"
									src << "You learn to perform the special finisher: Shippu Jinraikyaku!"
					if(src.SagaLevel==4)
						switch(src.AnsatsukenPath)
							if("Hadoken")
								if(!locate(/obj/Skills/Projectile/Ansatsuken/Shinku_Hadoken, src))
									src << "You've developed almighty energy projection: Shinku Hadoken!"
									src.AddSkill(new/obj/Skills/Projectile/Ansatsuken/Shinku_Hadoken)
							if("Shoryuken")
								if(!locate(/obj/Skills/Queue/Shin_Shoryuken, src))
									src << "You've developed peerless coordination: Shinku Shoryuken!"
									src.AddSkill(new/obj/Skills/Queue/Shin_Shoryuken)
							if("Tatsumaki")
								if(!locate(/obj/Skills/AutoHit/ShinkuTatsumaki, src))
									src << "You've developed domineering aerial power: Shinku Tatsumaki!"
									src.AddSkill(new/obj/Skills/AutoHit/ShinkuTatsumaki)
					if(src.SagaLevel==5)
						if(!src.AnsatsukenAscension)
							src.AnsatsukenAscension=alert(src, "The time has come to decide the fate of your soul.  Will you give everything away for victory or hold on to your sanity at the price of becoming a fighting machine?", "Ansatsuken Ascension", "Satsui", "Chikara")
							src <<"Your Ansatsuken stance is refined to suit your beliefs..."
							if(src.AnsatsukenAscension=="Satsui")
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected)
							else
								for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected/SI in src.contents)
									del SI
									src << "You learn to harness your raging desire to dominate in battle."
					if(src.SagaLevel==6)
						switch(src.AnsatsukenAscension)
							if("Satsui")
								src << "Your lust for victory grows...you'll even sacrifice your soul."
								for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected/SI in src.contents)
									SI.NeedsHealth=0
									SI.NeedsAnger=1
									SI.VaizardHealth=0
									SI.ActiveMessage="projects a murderous aura fueled only by the desire for victory!"
									SI.OffMessage="conceals their murderous intent..."
							if("Chikara")
								src << "You've refined your discipline to the point of controlling the electricity coursing through you body..."
								if(!locate(/obj/Skills/Buffs/SpecialBuffs/Denjin_Renki, src))
									src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Denjin_Renki)
					if(src.SagaLevel==7)
						src << "Your abilities with Ansatsuken allow you to rival any foe!"
						switch(src.AnsatsukenAscension)
							if("Satsui")
								src <<"Your rage grows and hones into a new attack!"
								switch(src.AnsatsukenPath)
									if("Hadoken")
										if(!locate(/obj/Skills/Projectile/Ansatsuken/Tenma_Gozanku, src))
											src << "You master a crushing barrage of projectiles: Tenma Gozanku!"
											src.AddSkill(new/obj/Skills/Projectile/Ansatsuken/Tenma_Gozanku)
									if("Shoryuken")
										if(!locate(/obj/Skills/Queue/Messatsu_Goshoryu, src))
											src << "You master a combination of strikes: Messatsu Goshoryu!"
											src.AddSkill(new/obj/Skills/Queue/Messatsu_Goshoryu)
									if("Tatsumaki")
										if(!locate(/obj/Skills/AutoHit/Demon_Armageddon, src))
											src << "You master a whirlwind of kicks: Demon Armageddon!"
											src.AddSkill(new/obj/Skills/AutoHit/Demon_Armageddon)
							if("Chikara")
								if(!locate(/obj/Skills/Projectile/Beams/Big/Ansatsuken/Denjin_Hadoken, src))
									src << "Your internal harmony can be expressed with indiscriminate energy projection: Denjin Hadoken!"
									src.AddSkill(new/obj/Skills/Projectile/Beams/Big/Ansatsuken/Denjin_Hadoken)
					if(src.SagaLevel==8)
						switch(src.AnsatsukenAscension)
							if("Satsui")
								for(var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Ansatsuken_Style/ans in src)
									ans.Finisher="/obj/Skills/Queue/Finisher/Rakan_Dantojin"
									src << "You finisher has evolved into the ultimate murder technique: Shun Goku Satsu!"
								for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Satsui_Infected/SI in src.contents)
									src << "The demonic impulses of the Satsui no Hado have completely overtaken you."
									SI.ManaGlow="#f000e4"
									SI.ElementalOffense="Dark"
									SI.ActiveMessage="loses all shreds of humanity to become evil incarnate!"
									SI.OffMessage="barely represses their demonic power..."
							if("Chikara")
								src << "You learn of peace through fighting and become capable of utilizing the Power of Nothingness."

				if("Sharingan")
					if(src.SagaLevel==2)
						src<<"Your Sharingan's total recall allows you to master common techniques near instantly."
					if(src.SagaLevel==4)
						if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Mangekyou_Sharingan, src))
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Mangekyou_Sharingan)
							src << "Your sharingan has matured into a Mangekyou Sharingan!"
						var/Choice=alert(src, "What kind of emotion made it mature into that form?", "Resolve", "Sacrifice", "Hatred")
						if(Choice)
							src.SharinganEvolution=Choice
					if(src.SagaLevel==5)
						if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Susanoo, src))
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Susanoo)
							src << "You can manifest a ghastly armor to protect and augment your attacks!"

				if("Eight Gates")
					src.SagaThreshold("Str", 0.125*src.SagaLevel)
					src.SagaThreshold("End", 0.125*src.SagaLevel)
					src.SagaThreshold("Spd", 0.125*src.SagaLevel)
					if(src.SagaLevel==3)
						if(!locate(/obj/Skills/Queue/Reverse_Lotus, src))
							src.AddSkill(new/obj/Skills/Queue/Reverse_Lotus)
							src << "You learned how to unleash the full might of your body in a devastating sequence of strikes: <b>Reverse Lotus</b>!!!"
						var/Choice=alert(src, "What kind of strikes does your fighting style focus on?", "Martial Art", "Punches", "Kicks", "Both")
						if(Choice=="Punches")
							var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Strong_Fist_Style/bls=new
							bls.Mastery=4
							bls.UnlockedStances=list("Cancel", "Advancing", "Striking", "Evasive", "Defensive")
							bls.SagaSignature=1
							src.AddSkill(bls)
						if(Choice=="Kicks")
							var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Black_Leg_Style/bls=new
							bls.Mastery=4
							bls.UnlockedStances=list("Cancel", "Advancing", "Striking", "Evasive", "Defensive")
							bls.SagaSignature=1
							src.AddSkill(bls)
						if(Choice=="Both")
							var/obj/Skills/Buffs/NuStyle/UnarmedStyle/Lightning_Kickboxing_Style/bls=new
							bls.Mastery=4
							bls.UnlockedStances=list("Cancel", "Advancing", "Striking", "Evasive", "Defensive")
							bls.SagaSignature=1
							src.AddSkill(bls)
					if(src.SagaLevel==6)
						if(!locate(/obj/Skills/Queue/Morning_Peacock, src))
							src.AddSkill(new/obj/Skills/Queue/Morning_Peacock)
							src << "You can perform a barrage of strikes that burn away the very air: <b>Morning Peacock</b>!!!"
					if(src.SagaLevel==7)
						if(!locate(/obj/Skills/Projectile/Beams/Big/Eight_Gates/Daytime_Tiger, src))
							src.AddSkill(new/obj/Skills/Projectile/Beams/Big/Eight_Gates/Daytime_Tiger)
							src << "You can release a wave of pure kinetic force that devours all in its path: <b>Daytime Tiger</b>!!!"
					if(src.SagaLevel==8)
						if(!locate(/obj/Skills/Projectile/Evening_Elephant, src))
							src.AddSkill(new/obj/Skills/Projectile/Evening_Elephant)
							src << "You can unleash a powerful combination that shakes the foundations of earth: <b>Evening Elephant</b>!!!"
						//if(!locate(/obj/Skills/AutoHit/Night_Guy, src))
						//	src.contents+=new/obj/AutoHit/Night_Guy

				if("King of Braves")
					if(src.SagaLevel==2)
						if(!locate(/obj/Skills/Queue/DrillKnee, src))
							src.AddSkill(new/obj/Skills/Queue/DrillKnee)
						src << "You can form an energy drill out of your body, capable of delivering deciding strikes!"
					if(src.SagaLevel==3)
						if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Plasma_Hold, src))
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Plasma_Hold)
						if(!locate(/obj/Skills/AutoHit/Hell_And_Heaven, src))
							src << "You become capable of delivering the ultimate finishing move: Hell and Heaven!"
							src.AddSkill(new/obj/Skills/AutoHit/Hell_And_Heaven)
					if(src.SagaLevel==4)
						if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Dividing_Driver, src))
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Dividing_Driver)
						if(!locate(/obj/Skills/AutoHit/Goldion_Hammer, src))
							src.AddSkill(new/obj/Skills/AutoHit/Goldion_Hammer)
						src << "You can spawn a set of power tools strong enough to rupture dimensions: Dividing Driver and Goldion Hammer!"
					if(src.SagaLevel==5)
						if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Protect_Wall, src))
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Protect_Wall)
						if(!locate(/obj/Skills/Projectile/King_of_Braves/Broken_Phantom, src))
							src.AddSkill(new/obj/Skills/Projectile/King_of_Braves/Broken_Phantom)
						src.SpaceWalk+=1
						src.CyberizeMod+=0.5
						if(src.CyberizeMod>1)
							src.CyberizeMod=1
						src.PilotingProwess+=1
						src << "You upgrade your abilities to carry you into the Space Era!"
					if(src.SagaLevel==6)
						src << "You master using the power of Destruction and Protection simultaneously!"
					if(src.SagaLevel==7)
						src << "Your Heaven and Hell reaches its perfected form: <b>Genesic Heaven and Hell</b>!"
					if(src.SagaLevel==8)
						src << "<b>You are the ultimate embodiment of Courage!</b>"

				if("Magic Knight")
					var/list/Aethers=list("Strength", "Endurance", "Force", "Offense", "Defense")
					//Add in Aether selections
					src.ManaCapMult+=0.25//this triggers every level
					if(src.SagaLevel==2)
						//Every level penetrates more end/res and gives more (weapon) ascension
						src.BetterAim+=1
						src<<"Your mastery at spells grants your projected energy supernatural accuracy!"
						src.Juggernaut+=1
						src<<"Your knightly resolve allows you to withstand many assaults without flinching!"
					if(src.SagaLevel==3)
						var/Aether=input(src, "As your mastery of Aether grows, it heightens one of your attributes at rest.  Which attribute?", "Aether Ascension") in Aethers
						switch(Aether)
							if("Strength")
								src.StrAscension+=0.5
							if("Endurance")
								src.EndAscension+=0.5
							if("Force")
								src.ForAscension+=0.5
							if("Offense")
								src.OffAscension+=0.5
							if("Defense")
								src.DefAscension+=0.5
					if(src.SagaLevel==4)
						src.StunningStrike+=1
						src<<"Your magical prowess is versatile and constant; a chance blow imbued with mana can stun your enemies!"
						src.Unstoppable+=1
						src<<"Your unflagging will carries you through whatever wounds you may face, no matter how grievous!"
					if(src.SagaLevel==5)
						var/Aether=input(src, "As your mastery of Aether grows, it heightens one of your attributes at rest.  Which attribute?", "Aether Ascension") in Aethers
						switch(Aether)
							if("Strength")
								src.StrAscension+=0.5
							if("Endurance")
								src.EndAscension+=0.5
							if("Force")
								src.ForAscension+=0.5
							if("Offense")
								src.OffAscension+=0.5
							if("Defense")
								src.DefAscension+=0.5
					if(src.SagaLevel==6)
						src.SpiritPower+=1
						src<<"Your devotion blooms in the form of becoming imbued with a truly holy aura!"
						src.MeltyBlood+=1
						src<<"The purity of your spirit imbues your blood with fiery wrath for those who commit the sin of bleeding you!"
					if(src.SagaLevel==7)
						src << "Your knightly ambition allows you to shatter reason to fulfill your goals!"//Gets barelystanding boost.
						var/Aether=input(src, "As your mastery of Aether grows, it heightens one of your attributes at rest.  Which attribute?", "Aether Ascension") in Aethers
						switch(Aether)
							if("Strength")
								src.StrAscension+=0.5
							if("Endurance")
								src.EndAscension+=0.5
							if("Force")
								src.ForAscension+=0.5
							if("Offense")
								src.OffAscension+=0.5
							if("Defense")
								src.DefAscension+=0.5
					if(src.SagaLevel==8)
						src<<"The absolute nature of your vow allows you to shatter all reason in pursuit of your pledge!"//Barelystanding boost is higher.
						var/Aether=input(src, "As your mastery of Aether grows, it heightens one of your attributes at rest.  Which attribute?", "Aether Ascension") in Aethers
						switch(Aether)
							if("Strength")
								src.StrAscension+=0.5
							if("Endurance")
								src.EndAscension+=0.5
							if("Force")
								src.ForAscension+=0.5
							if("Offense")
								src.OffAscension+=0.5
							if("Defense")
								src.DefAscension+=0.5

				if("Kamui")
					if(src.KamuiType=="Impulse")
						src.SagaThreshold("Str", 0.25*src.SagaLevel)
						src.SagaThreshold("End", 0.25*src.SagaLevel)
						src.PUForce+=0.5
					else if(src.KamuiType=="Purity")
						src.SagaThreshold("Spd", 0.5*src.SagaLevel)

					if(src.SagaLevel==2)
						if(src.KamuiType=="Purity")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Resolve)
					if(src.SagaLevel==3)
						if(src.KamuiType=="Impulse")
							var/choice
							var/confirm
							while(confirm!="Yes")
								choice=input(src, "You've grown closer to your Kamui than ever before, and now it can take on a new form!  Which one do you choose?", "Kamui Ascension") in list("Kamui Senjin", "Kamui Shippu")
								switch(choice)
									if("Kamui Senjin")
										confirm=alert(src, "Kamui Senjin makes it so that your Kamui can assume a battle ready form, focused on potent strikes and endurance.  Do you wish to gain this form?", "Kamui Senjin", "Yes", "No")
									if("Kamui Shippu")
										confirm=alert(src, "Kamui Shippu makes it so that your Kamui can assume a speedy form, focused on evasion and elusive manuevers.  Do you wish to gain this form?", "Kamui Shippu", "Yes", "No")
							switch(choice)
								if("Kamui Senjin")
									src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiSenjin)
									src << "You've attained a new form for your Kamui: Kamui Senjin!"
								if("Kamui Shippu")
									src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiShippu)
									src << "You've attained a new form for your Kamui: Kamui Shippu!"
						else if(src.KamuiType=="Purity")
							src << "With each movement forward towards the realization of your ideals, your resolve strengthens..."
					if(src.SagaLevel==4)
						if(src.KamuiType=="Impulse")
							if(locate(/obj/Skills/Buffs/SpecialBuffs/KamuiSenjin, src))
								src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiShippu)
								src << "You've attained a new form for your Kamui: Kamui Shippu!"
							else if(locate(/obj/Skills/Buffs/SpecialBuffs/KamuiShippu, src))
								src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiSenjin)
								src << "You've attained a new form for your Kamui: Kamui Senjin!"
						else if(src.KamuiType=="Purity")
							src << "Through your trials, your resolve sharpens, cutting deeper than glass, sharp enough to sever any thread..."
					if(src.SagaLevel==5)
						if(src.KamuiType=="Impulse")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiSenjinShippu)
							src << "Through adapting to your trials and your own impulsive ambition, you've merged the two forms of your Kamui!"
							src << "Now you can access Senjin Shippu!"
						else if(src.KamuiType=="Purity")
							src << "Though your body may fail you, your ambition will reach across the world!"
							src << "Your resolve allows you to force your Kamui to take on a new form: Kamui Senpu!"
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiSenpu)
					if(src.SagaLevel==6)
						if(src.KamuiType=="Impulse")
							src << "You've united entirely with your Kamui, and you fight as one with no downsides!"
						else if(src.KamuiType=="Purity")
							src << "Your resolve allows you to force your Kamui to take on new form: Senpu Zanken!"
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/KamuiSenpuZanken)
					if(src.SagaLevel==7)
						if(src.KamuiType=="Impulse")
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
							for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/R in src)
								R.RegenerateLimbs=1
							if(src.RecovMod < 3)
								src.RecovMod=3
							src << "Your being has merged with life fibers."
						else if(src.KamuiType=="Purity")
							src << "Unshatterable, your resolve gains a twofold edge...Your goals are nearly within your grasp."
					if(src.SagaLevel==8)
						src << "You gain the ability to unite with your kamui..."
						src.contents+=new/obj/Skills/Buffs/SpecialBuffs/Kamui_Unite

				if("Keyblade")
					if(src.SagaLevel==2)
						switch(src.KeybladeType)
							if("Sword")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Speed_Rave_Style)
								src << "You've developed the focus necessary to move with blistering speeds: <b>Speed Rave Style</b>!"
							if("Shield")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Critical_Impact_Style)
								src << "You've developed the power necessary to make every blow count: <b>Critical Impact Style</b>!"
							if("Staff")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Spell_Weaver_Style)
								src << "You've developed the flexibility necessary to combine spells with swordplay: <b>Spell Weaver Style</b>!"
						var/Choice
						var/Confirm
						while(Confirm!="Yes")
							Choice=alert(src, "Every strong heart is built upon a foundation.  What is your's?", "Keychain Ascension", "Reliability", "Flexibility", "Freedom")
							switch(Choice)
								if("Reliability")
									Confirm=alert(src, "You'll always be there for those who need you.  Is this your foundation?", "Keychain Ascension", "Yes", "No")
								if("Flexibility")
									Confirm=alert(src, "You'll always be able to figure out what to do.  Is this your foundation?", "Keychain Ascension", "Yes", "No")
								if("Freedom")
									Confirm=alert(src, "You'll always follow your own path.  Is this your foundation?", "Keychain Ascension", "Yes", "No")
						switch(Choice)
							if("Reliability")
								src.Keychains.Add("Earthshaker")
							if("Flexibility")
								src.Keychains.Add("Rainfell")
							if("Freedom")
								src.Keychains.Add("Wayward Wind")
						src << "You've obtained your foundation keychain!"
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Attach_Keychain)
					if(src.SagaLevel==3)
						//Elemental command style
						//T1 magic
						var/Choice
						var/Confirm
						while(Confirm!="Yes")
							Choice=alert(src, "You gain the ability to infuse your keyblade with an elemental command style.  Which element do you focus on?", "Command Style", "Firestorm", "Diamond Dust", "Thunderbolt")
							switch(Choice)
								if("Firestorm")
									Confirm=alert(src, "Hail fire and power down on your enemies.  Is this the elemental style you want to learn?", "Command Style", "Yes", "No")
								if("Diamond Dust")
									Confirm=alert(src, "Freeze your enemy with precision and purity.  Is this the elemental style you want to learn?", "Command Style", "Yes", "No")
								if("Thunderbolt")
									Confirm=alert(src, "Sunder your enemy using lightning and thunder.  Is this the elemental style you want to learn?", "Command Style", "Yes", "No")
						switch(Choice)
							if("Firestorm")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Firestorm_Style)
							if("Diamond Dust")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Diamond_Dust_Style)
							if("Thunderbolt")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Thunderbolt_Style)
						src << "You've obtained the [Choice] command style!"

						src.AddSkill(new/obj/Skills/Projectile/Magic/Fire)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Blizzard)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Thunder)
						src << "You've mastered the magical arts of Fire, Blizzard and Thunder!"
					if(src.SagaLevel==4)
						//T2 Command Style
						//Keychain
						var/Style
						var/SConfirm
						while(SConfirm!="Yes")
							if(src.KeybladeType=="Sword")
								Style=alert(src, "Your mastery of both keyblades and magical elements allows you to refine your command style.  Which style do you develop?", "Command Style", "Wingblade", "Cyclone")
								switch(Style)
									if("Wingblade")
										SConfirm=alert(src, "Embody the light by fracturing your sword into six wings of light.  Is this your ultimate style?", "Command Style", "Yes", "No")
									if("Cyclone")
										SConfirm=alert(src, "Embody the wind and carry yourself about on powerful gales.  Is this your ultimate style?", "Command Style", "Yes", "No")
							if(src.KeybladeType=="Shield")
								Style=alert(src, "Your mastery of both keyblades and magical elements allows you to refine your command style.  Which style do you develop?", "Command Style", "Rock Breaker", "Dark Impulse")
								switch(Style)
									if("Rock Breaker")
										SConfirm=alert(src, "Embody the inevitability of the earth and crush your opponents with rocks.  Is this your ultimate style?", "Command Style", "Yes", "No")
									if("Dark Impulse")
										SConfirm=alert(src, "Embody the inescapability of darkness and curse your opponents with sneak attacks.  Is this your ultimate style?", "Command Style", "Yes", "No")
							if(src.KeybladeType=="Staff")
								Style=alert(src, "Your mastery of both keyblades and magical elements allows you to refine your command style.  Which style do you develop?", "Command Style", "Ghost Drive", "Blade Charge")
								switch(Style)
									if("Ghost Drive")
										SConfirm=alert(src, "Embody the intangibility of magic and outwit your opponent with finesse.  Is this your ultimate style?", "Command Style", "Yes", "No")
									if("Blade Charge")
										SConfirm=alert(src, "Embody the raw power of magic and blend blade and spell alike for wide ranged destruction.  Is this your ultimate style?", "Command Style", "Yes", "No")
						switch(Style)
							if("Wingblade")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Wing_Blade_Style)
							if("Cyclone")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Cyclone_Style)
							if("Rock Breaker")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Rock_Breaker_Style)
							if("Dark Impulse")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Dark_Impulse_Style)
							if("Ghost Drive")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Ghost_Drive_Style)
							if("Blade Charge")
								src.AddSkill(new/obj/Skills/Buffs/NuStyle/SwordStyle/Command/Blade_Charge_Style)
						src << "You've obtained the [Style] command style!"
						var/Choice
						var/Confirm
						while(Confirm!="Yes")
							Choice=alert(src, "Every strong heart must devote itself to some key facet.  What are you devoted to?", "Keychain Ascension", "Self-Reliance", "Memories", "Promises")
							switch(Choice)
								if("Self-Reliance")
									Confirm=alert(src, "You'll stand on your own two feet no matter what.  Is this your devotion?", "Keychain Ascension", "Yes", "No")
								if("Memories")
									Confirm=alert(src, "You'll never forget those who helped you get to where you are.  Is this your devotion?", "Keychain Ascension", "Yes", "No")
								if("Promises")
									Confirm=alert(src, "You'll always do what it takes to follow your word.  Is this your devotion?", "Keychain Ascension", "Yes", "No")
						switch(Choice)
							if("Self-Reliance")
								src.Keychains.Add("Fenrir")
							if("Memories")
								src.Keychains.Add("Oblivion")
							if("Promises")
								src.Keychains.Add("Oathkeeper")
						src << "You've obtained your devotion keychain!"
					if(src.SagaLevel==5)
						//Valor Form
						//T2 Magic
						if(src.KeybladeColor=="Light")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Valor_Form)
							src << "You learn to imbue every action with valor!"
							src << "Use the Attach Keychain verb to set your sync keyblade for Valor Form."
						else
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Rage_Form)
							src << "Your reliance on darkness will empower you when pressed to your limits!"
						src.AddSkill(new/obj/Skills/Projectile/Magic/Fira)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Blizzara)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Thundara)
						src << "You develop Fira!"
						src << "You develop Blizzara!"
						src << "You develop Thundara!"
					if(src.SagaLevel==6)
						//Wisdom Form
						//Keychain
						src.ManaCapMult+=0.25
						if(src.KeybladeColor=="Light")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Wisdom_Form)
							src << "You learn to interpret every movement with wisdom!"
							src << "Your newly discovered wisdom increases your magical prowess!"
						else
							for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Rage_Form/rf in src)
								rf.OffMult=1.5
								rf.ForMult=1.5
								rf.TechniqueMastery=5
								rf.MovementMastery=5
								rf.Intimidation=1.5
								rf.QuickCast=1
								rf.Godspeed=1
								rf.NeedsHealth=35
								rf.TooMuchHealth=85
								src << "Your Rage develops to allow for more efficient movement!"

						src.AddSkill(new/obj/Skills/AutoHit/Magic/Stop)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Gravity)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Magnet)
						src << "You've mastered the black magical arts of Stop, Magnet and Gravity!"
					if(src.SagaLevel==7)
						//Master Form
						//T3 Magic
						src.ManaCapMult+=0.25
						var/Path
						switch(src.KeybladeType)
							if("Sword")
								Path="Courage"
							if("Staff")
								Path="Spirit"
							if("Shield")
								Path="Kindness"
						if(src.KeybladeColor=="Light")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Master_Form)
							src << "Merging Wisdom and Valor on the path of [Path], you develop the Master Form!"
						else
							for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Rage_Form/rf in src)
								rf.DefMult=1.5
								rf.RegenMult=1.5
								rf.RecovMult=1.5
								rf.TechniqueMastery=10
								rf.MovementMastery=10
								rf.Intimidation=1.75
								rf.Godspeed=2
								rf.Pursuer=2
								rf.Flicker=2
								rf.QuickCast=2
								rf.PureDamage=2
								rf.PureReduction=2
								rf.Juggernaut=1
								rf.NeedsHealth=45
								rf.TooMuchHealth=95
								src << "Your Rage develops to allow for more primally powerful blows!"

						src.AddSkill(new/obj/Skills/Projectile/Magic/Firaga)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Blizzaga)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Thundaga)
						src << "You develop Firaga!"
						src << "You develop Blizzaga!"
						src << "You develop Thundaga!"
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Magic/Cure)
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Magic/Esuna)
						src << "You've mastered the white magical arts of Cure and Esuna!"
						var/Choice
						var/Confirm
						while(Confirm!="Yes")
							Choice=alert(src, "Every powerful heart stands in opposition to something greater than themselves.  What do you stand against?", "Keychain Ascension", "Destruction", "Emptiness", "Duality")
							switch(Choice)
								if("Destruction")
									Confirm=alert(src, "You'll crush the forces of destruction no matter what it takes.  Is this your antagonism?", "Keychain Ascension", "Yes", "No")
								if("Emptiness")
									Confirm=alert(src, "You'll stand against the feeling of emptiness eternally.  Is this your antagonism?", "Keychain Ascension", "Yes", "No")
								if("Duality")
									Confirm=alert(src, "You'll cut through delusions of duality to follow the pure path of your heart.  Is this your antagonism?", "Keychain Ascension", "Yes", "No")
						switch(Choice)
							if("Destruction")
								src.Keychains.Add("Chaos Ripper")
							if("Emptiness")
								src.Keychains.Add("No Name")
							if("Duality")
								src.Keychains.Add("Way To Dawn")
						src << "You've obtained your antagonism keychain!"
					if(src.SagaLevel==8)
						//Final Form
						//More Majjyk


						if(src.KeybladeColor=="Light")
							src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Final_Form)
							src << "The completion of your heart is fulfilled; you can now access your Final and most powerful Form!"
						else
							for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Rage_Form/rf in src)
								rf.PowerMult=2
								rf.EndMult=1.5
								rf.PureDamage=5
								rf.PureReduction=5
								rf.Intimidation=2
								rf.Flicker=3
								rf.DualCast=1
								rf.AngerMult=2
								rf.NeedsHealth=50
								rf.TooMuchHealth=99
								rf.TripleStrike=1
								src << "Your Rage develops to allow double casting and triple attacks!"
						src.ManaCapMult+=0.5
						src << "Your mastery of the Keyblade grants you unrivalled magical prowess!"
						src << "You develop ultimate black magicks: Stopga, Magnetga and Graviga!"
						src << "You develop ultimate white magicks: Curaga, Esunaga and Holy!"
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Graviga)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Stopga)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Magnetga)
						src.AddSkill(new/obj/Skills/AutoHit/Magic/Holy)
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Magic/Curaga)
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Magic/Esunaga)