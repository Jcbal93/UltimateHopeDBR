var/list/EnchantmentKnowledge=list("Alchemy", "ImprovedAlchemy", "ToolEnchantment", "ArmamentEnchantment", "TomeCreation", "CrestCreation", "SummoningMagic", "SealingMagic", "SpaceMagic", "TimeMagic")
var/list/KnowledgeTreeList=list("Forging"=list(),"RepairAndConversion"=list(),"Medicine"=list(),"ImprovedMedicalTechnology"=list(),"Telecommunications"=list(),"AdvancedTransmissionTechnology"=list(),"Engineering"=list(),"CyberEngineering"=list(),"MilitaryTechnology"=list(),"MilitaryEngineering"=list(),"Alchemy"=list(),"ImprovedAlchemy"=list(),"ToolEnchantment"=list(),"ArmamentEnchantment"=list(),"TomeCreation"=list(),"CrestCreation"=list(),"SummoningMagic"=list(),"SealingMagic"=list(),"SpaceMagic"=list(),"TimeMagic"=list())
proc/MakeKnowledgeTreeList()
	for(var/x in KnowledgeTree)
		for(var/i in KnowledgeTree[x])
			var/obj/KnowledgeTreeObj/B=new
			B.cost=KnowledgeTree[x][i]
			var/namez=i
			if(copytext("[i]",1,2)=="/")
				var/path=text2path("[i]")
				var/obj/nameref=new path
				namez=nameref.name
				spawn(3)del(nameref)
			B.path=i
			B.name="[namez]"
			KnowledgeTreeList[x]+=B

var/KnowledgeTree=list(\
//Technology
"Forging"=list("Forging"=40),\
"RepairAndConversion"=list("RepairAndConversion"=80),\
"Medicine"=list("Medicine"=40),\
"ImprovedMedicalTechnology"=list("ImprovedMedicalTechnology"=80),\
"Telecommunications"=list("Telecommunications"=40),\
"AdvancedTransmissionTechnology"=list("AdvancedTransmissionTechnology"=80),\
"Engineering"=list("Engineering"=40),\
"CyberEngineering"=list("CyberEngineering"=80),\
"MilitaryTechnology"=list("MilitaryTechnology"=40),\
"MilitaryEngineering"=list("MilitaryEngineering"=80),\

//Enchantment
"Alchemy"=list("Alchemy"=40),\
"ImprovedAlchemy"=list("ImprovedAlchemy"=80),\
"ToolEnchantment"=list("ToolEnchantment"=40),\
"ArmamentEnchantment"=list("ArmamentEnchantment"=80),\
"TomeCreation"=list("TomeCreation"=40),\
"CrestCreation"=list("CrestCreation"=80),\
"SummoningMagic"=list("SummoningMagic"=40),\
"SealingMagic"=list("SealingMagic"=80),\
"SpaceMagic"=list("SpaceMagic"=40),\
"TimeMagic"=list("TimeMagic"=80)
)

mob
	var
		//Technology
		ForgingUnlocked
		RepairAndConversionUnlocked
		MedicineUnlocked
		ImprovedMedicalTechnologyUnlocked
		TelecommunicationsUnlocked
		AdvancedTransmissionTechnologyUnlocked
		EngineeringUnlocked
		CyberEngineeringUnlocked
		MilitaryTechnologyUnlocked
		MilitaryEngineeringUnlocked

		//Enchantment
		AlchemyUnlocked
		ImprovedAlchemyUnlocked
		ToolEnchantmentUnlocked
		ArmamentEnchantmentUnlocked
		TomeCreationUnlocked
		CrestCreationUnlocked
		SummoningMagicUnlocked
		SealingMagicUnlocked
		SpaceMagicUnlocked
		TimeMagicUnlocked


var/list/knowledge_tree_clickers = list() //List of clients who are using KnowledgeTreeObj inputs.
client/New()
	..()
	if(ckey in knowledge_tree_clickers) knowledge_tree_clickers -= ckey
obj/KnowledgeTreeObj
	var/path
	var/cost
	icon='skilltree.dmi'
	layer=9999

	Click()
		if(!(world.time > usr.verb_delay)) return
		usr.verb_delay=world.time+1
		if(copytext("[src.path]",1,2)!="/")
			if(usr.ckey in knowledge_tree_clickers) return
			knowledge_tree_clickers += usr.ckey

			var/NuCost=src.cost/usr.Intelligence//preserve the original cost and don't tamper with global variables
			if(src.path in EnchantmentKnowledge)
				if(usr.Imagination==0)
					usr << "You're incapable of studying magic due to lack of soul!"
					return
				NuCost/=usr.Imagination//If it's magic, incorperate Imagination
			/*if(src.path=="Forging")
				if(usr.ForgingUnlocked>=1&&usr.ForgingUnlocked<3)
					NuCost*=1.5
				if(usr.ForgingUnlocked>=3)
					NuCost*=2
			if(src.path=="RepairAndConversion")
				if(usr.RepairAndConversionUnlocked>=1&&usr.RepairAndConversionUnlocked<3)
					NuCost*=1.5
				if(usr.RepairAndConversionUnlocked>=3)
					NuCost*=2
			if(src.path=="Medicine")
				if(usr.MedicineUnlocked>=1&&usr.MedicineUnlocked<3)
					NuCost*=1.5
				if(usr.MedicineUnlocked>=3)
					NuCost*=2
			if(src.path=="ImprovedMedicalTechnology")
				if(usr.ImprovedMedicalTechnologyUnlocked>=1&&usr.ImprovedMedicalTechnologyUnlocked<3)
					NuCost*=1.5
				if(usr.ImprovedMedicalTechnologyUnlocked>=3)
					NuCost*=2
			if(src.path=="Telecommunications")
				if(usr.TelecommunicationsUnlocked>=1&&usr.TelecommunicationsUnlocked<3)
					NuCost*=1.5
				if(usr.TelecommunicationsUnlocked>=3)
					NuCost*=2
			if(src.path=="AdvancedTransmissionTechnology")
				if(usr.AdvancedTransmissionTechnologyUnlocked>=1&&usr.AdvancedTransmissionTechnologyUnlocked<3)
					NuCost*=1.5
				if(usr.AdvancedTransmissionTechnologyUnlocked>=3)
					NuCost*=2
			if(src.path=="Engineering")
				if(usr.EngineeringUnlocked>=1&&usr.EngineeringUnlocked<3)
					NuCost*=1.5
				if(usr.EngineeringUnlocked>=3)
					NuCost*=2
			if(src.path=="CyberEngineering")
				if(usr.CyberEngineeringUnlocked>=1&&usr.CyberEngineeringUnlocked<3)
					NuCost*=1.5
				if(usr.CyberEngineeringUnlocked>=3)
					NuCost*=2
			if(src.path=="MilitaryTechnology")
				if(usr.MilitaryTechnologyUnlocked>=1&&usr.MilitaryTechnologyUnlocked<3)
					NuCost*=1.5
				if(usr.MilitaryTechnologyUnlocked>=3)
					NuCost*=2
			if(src.path=="MilitaryEngineering")
				if(usr.MilitaryEngineeringUnlocked>=1&&usr.MilitaryEngineeringUnlocked<3)
					NuCost*=1.5
				if(usr.MilitaryEngineeringUnlocked>=3)
					NuCost*=2
			if(src.path=="Alchemy")
				if(usr.AlchemyUnlocked>=1&&usr.AlchemyUnlocked<3)
					NuCost*=1.5
				if(usr.AlchemyUnlocked>=3)
					NuCost*=2
			if(src.path=="ImprovedAlchemy")
				if(usr.ImprovedAlchemyUnlocked>=1&&usr.ImprovedAlchemyUnlocked<3)
					NuCost*=1.5
				if(usr.ImprovedAlchemyUnlocked>=3)
					NuCost*=2
			if(src.path=="ToolEnchantment")
				if(usr.ToolEnchantmentUnlocked>=1&&usr.ToolEnchantmentUnlocked<3)
					NuCost*=1.5
				if(usr.ToolEnchantmentUnlocked>=3)
					NuCost*=2
			if(src.path=="ArmamentEnchantment")
				if(usr.ArmamentEnchantmentUnlocked>=1&&usr.ArmamentEnchantmentUnlocked<3)
					NuCost*=1.5
				if(usr.ArmamentEnchantmentUnlocked>=3)
					NuCost*=2
			if(src.path=="TomeCreation")
				if(usr.TomeCreationUnlocked>=1&&usr.TomeCreationUnlocked<3)
					NuCost*=1.5
				if(usr.TomeCreationUnlocked>=3)
					NuCost*=2
			if(src.path=="CrestCreation")
				if(usr.CrestCreationUnlocked>=1&&usr.CrestCreationUnlocked<3)
					NuCost*=1.5
				if(usr.CrestCreationUnlocked>=3)
					NuCost*=2
			if(src.path=="SummoningMagic")
				if(usr.SummoningMagicUnlocked>=1&&usr.SummoningMagicUnlocked<3)
					NuCost*=1.5
				if(usr.SummoningMagicUnlocked>=3)
					NuCost*=2
			if(src.path=="SealingMagic")
				if(usr.SealingMagicUnlocked>=1&&usr.SealingMagicUnlocked<3)
					NuCost*=1.5
				if(usr.SealingMagicUnlocked>=3)
					NuCost*=2
			if(src.path=="SpaceMagic")
				if(usr.SpaceMagicUnlocked>=1&&usr.SpaceMagicUnlocked<3)
					NuCost*=1.5
				if(usr.SpaceMagicUnlocked>=3)
					NuCost*=2
			if(src.path=="TimeMagic")
				if(usr.TimeMagicUnlocked>=1&&usr.TimeMagicUnlocked<3)
					NuCost*=1.5
				if(usr.TimeMagicUnlocked>=3)
					NuCost*=2*/

			var/Confirm=alert(usr, "With your mental capacity factored in, [src.path] will cost [NuCost] to learn.  Do you wish to continue?", "Knowledge Tree", "Yes", "No")
			knowledge_tree_clickers -= usr.ckey
			if(Confirm=="No")
				return
			if(usr.vars["[src.path]Unlocked"]>=5)//If the shit is already unlocked...
				usr << "You've already researched this subject fully!"
				return

			//Technology
			if(src.path=="RepairAndConversion")
				if(usr.ForgingUnlocked < 3)
					usr << "You must become proficient in Forging before this!"
					return
			if(src.path=="ImprovedMedicalTechnology")
				if(usr.MedicineUnlocked < 3)
					usr << "You must become proficient in Medicine before this!"
					return
			if(src.path=="AdvancedTransmissionTechnology")
				if(usr.TelecommunicationsUnlocked < 3)
					usr << "You must become proficient in Communication Technology before this!"
					return
			if(src.path=="CyberEngineering")
				if(usr.EngineeringUnlocked < 3)
					usr << "You must become proficient in Engineering before this!"
					return
			if(src.path=="MilitaryEngineering")
				if(usr.MilitaryTechnologyUnlocked < 3)
					usr << "You must become proficient in Military Systems before this!"
					return

			//Enchantment
			if(src.path=="ImprovedAlchemy")
				if(usr.AlchemyUnlocked < 3)
					usr << "You must become proficient in Alchemy before this!"
					return
			if(src.path=="ArmamentEnchantment")
				if(usr.ToolEnchantmentUnlocked < 3)
					usr << "You must become proficient in Tool Enchantment before this!"
					return
			if(src.path=="CrestCreation")
				if(usr.TomeCreationUnlocked < 3)
					usr << "You must become proficient in Tome Creation before this!"
					return
			if(src.path=="SealingMagic")
				if(usr.SummoningMagicUnlocked < 3)
					usr << "You must become proficient in Summoning Magic before this!"
					return
			if(src.path=="TimeMagic")
				if(usr.SpaceMagicUnlocked < 3)
					usr << "You must become proficient in Space Magic before this!"
					return


			if(usr.SpendRPP(NuCost, "[src.path]", Training=0))

				usr.vars["[src.path]Unlocked"]++
				var/list/SubTypes=list()//Populated depending on what type was picked
				var/New//Kept reference of just so there's a message...


				//Technology
				if(src.path=="Forging")
					SubTypes=list("Weapons", "Armor", "Weighted Clothing", "Smelting", "Locksmithing")
				if(src.path=="RepairAndConversion")
					SubTypes=list("Molecular Technology", "Light Alloys", "Shock Absorbers", "Advanced Plating", "Modular Weaponry")

				if(src.path=="Medicine")
					SubTypes=list("Medkits", "Fast Acting Medicine", "Enhancers", "Anesthetics", "Automated Dispensers")
				if(src.path=="ImprovedMedicalTechnology")
					SubTypes=list("Regenerator Tanks", "Prosthetic Limbs", "Genetic Manipulation", "Regenerative Medicine", "Revival Protocol")

				if(src.path=="Telecommunications")
					SubTypes=list("Wide Area Transmissions", "Espionage Equipment", "Surveilance", "Drones", "Local Range Devices")
				if(src.path=="AdvancedTransmissionTechnology")
					SubTypes=list("Scouters", "Obfuscation Equipment", "Satellite Surveilance", "Combat Scanning", "EM Wave Projectors")

				if(src.path=="Engineering")
					SubTypes=list("Hazard Suits", "Force Shielding", "Jet Propulsion", "Power Generators")// Space Travel for last level
				if(src.path=="CyberEngineering")//Unlocking tree grants cybernetic enhancement
					SubTypes=list("Android Creation", "Conversion Modules", "Enhancement Chips", "Involuntary Implantation")//Cyberize Self for last level

				if(src.path=="MilitaryTechnology")
					SubTypes=list("Assault Weaponry", "Missile Weaponry", "Melee Weaponry", "Thermal Weaponry", "Blast Shielding")
				if(src.path=="MilitaryEngineering")
					SubTypes=list("Powered Armor Specialization", "Armorpiercing Weaponry", "Impact Weaponry", "Hydraulic Weaponry")// Meks for last level

				//Enchantment
				if(src.path=="Alchemy")//Unlocking this gives cauldron creation
					SubTypes=list("Healing Herbs", "Refreshment Herbs", "Magic Herbs", "Toxic Herbs", "Philter Herbs")
				if(src.path=="ImprovedAlchemy")//both alchemy levels are put together to determine how hard you can transmute
					SubTypes=list("Stimulant Herbs", "Relaxant Herbs", "Numbing Herbs", "Distillation Process", "Mutagenic Herbs")

				if(src.path=="ToolEnchantment")
					SubTypes=list("Spell Focii", "Artifact Manufacturing", "Arcane Espionage", "Flying Devices", "Warding Glyphs")
				//ArmamentEnchantment only has scaling levels of enhancement

				if(src.path=="TomeCreation")
					SubTypes=list("Tome Cleansing", "Tome Security", "Tome Translation", "Tome Binding", "Tome Excerpts")
				//no typez for crest creation

				//no types for summon magic
				if(src.path=="SealingMagic")
					SubTypes=list("Turf Sealing", "Object Sealing", "Power Sealing", "Mobility Sealing", "Command Sealing")

				if(src.path=="SpaceMagic")
					SubTypes=list("Teleportation", "Retrieval", "Bilocation", "Dimensional Manipulation", "Dimensional Restriction")
				if(src.path=="TimeMagic")
					SubTypes=list("Transmigration", "Lifespan Extension", "Temporal Displacement", "Temporal Acceleration", "Temporal Rewinding")


				if(src.path=="Engineering")
					if(("Hazard Suits" in usr.UnlockedTechnology) && ("Force Shielding" in usr.UnlockedTechnology) && ("Jet Propulsion" in usr.UnlockedTechnology) && ("Power Generators" in usr.UnlockedTechnology))
						New="Space Travel"
				else if(src.path=="CyberEngineering")
					if(("Android Creation" in usr.UnlockedTechnology) && ("Conversion Modules" in usr.UnlockedTechnology) && ("Enhancement Chips" in usr.UnlockedTechnology) && ("Involuntary Implantation" in usr.UnlockedTechnology))
						New="Self Augmentation"
				else if(src.path=="MilitaryEngineering")
					if(("Powered Armor Specialization" in usr.UnlockedTechnology) && ("Armorpiercing Weaponry" in usr.UnlockedTechnology) && ("Impact Weaponry" in usr.UnlockedTechnology) && ("Hydraulic Weaponry" in usr.UnlockedTechnology))
						New="Vehicular Power Armor"
				else if(src.path=="ArmamentEnchantment" && usr.ArmamentEnchantmentUnlocked<5)
					New="Weapon Ascension"
				else if(src.path=="CrestCreation")
					if(usr.CrestCreationUnlocked<5)
						New="Magic Crests"
					else
						New="Parasite Crests"

				else if(src.path=="SummoningMagic")
					if(usr.SummoningMagicUnlocked<5)
						New="Spirit Contracts"
					else
						New="Otherworldly Summoning"
				if(!New)
					for(var/x in SubTypes)
						if(x in usr.UnlockedTechnology)
							SubTypes.Remove(x)
					if(SubTypes.len>0)
						New=pick(SubTypes)
				usr.UnlockedTechnology.Add(New)
				usr << "You have unlocked knowledge of <b>[src]</b>!"
				usr << "You've gained insight on <b>[New]</b>!"

	//Tied to subtype
				if(New=="Smelting")
					if(!locate(/obj/Skills/Utility/Smelt, usr))
						usr.AddSkill(new/obj/Skills/Utility/Smelt)
						usr << "You learn how to smelt tech items down for a return of 50% of their cost!"

				if(New=="Locksmithing")
					if(!locate(/obj/Skills/Utility/Copy_Key, usr))
						usr.AddSkill(new/obj/Skills/Utility/Copy_Key)
						usr << "You learn how to make identical copies of keys!"

				if(New=="Revival Protocol")
					if(!locate(/obj/Skills/Utility/Revival_Protocol, usr))
						usr.AddSkill(new/obj/Skills/Utility/Revival_Protocol)
						usr << "You learn how to attempt to save people from the threshold of death!"

				if(New=="Espionage Equipment")
					if(!locate(/obj/Skills/Utility/Espionage_Scan, usr))
						usr.AddSkill(new/obj/Skills/Utility/Espionage_Scan)
						usr << "You can right click a nearby person to scan them for espionage equipment!"
				if(New=="Satellite Surveilance")
					if(!locate(/obj/Skills/Utility/Satellite_Surveilance, usr))
						usr.AddSkill(new/obj/Skills/Utility/Satellite_Surveilance)
						usr << "You have the know-how to construct and launch a Satellite camera to remote view the population of a section of the world!"
				if(New=="Combat Scanning")
					usr << "Your focus and perception is great enough to defeat disadvantageous situations and learn techniques from pre-recorded footage! (Dependent on your learning and intelligence)"

				if(New=="Android Creation")
					usr << "You learn how to construct and modify a working, independent mechanized entity!"
				if(New=="Self Augmentation")
					usr << "You develop the acumen necessary to run operations on yourself!"

				if(New=="Healing Herbs")
					usr.PotionTypes.Add("Healing Herb")
				if(New=="Refreshment Herbs")
					usr.PotionTypes.Add("Refreshment Herb")
				if(New=="Magic Herbs")
					usr.PotionTypes.Add("Magic Herb")
				if(New=="Toxic Herbs")
					usr.PotionTypes.Add("Toxic Herb")
					usr.PotionTypes.Add("Hallucinogen Herb")
				if(New=="Philter Herbs")
					usr.PotionTypes.Add("Philter Herb")
				if(New=="Stimulant Herbs")
					usr.PotionTypes.Add("Stimulant Herb")
				if(New=="Relaxant Herbs")
					usr.PotionTypes.Add("Relaxant Herb")
				if(New=="Numbing Herbs")
					usr.PotionTypes.Add("Numbing Herb")
				if(New=="Mutagenic Herbs")
					usr.PotionTypes.Add("Mutagenic Herb")
				if(New=="Distillation Process")
					usr << "You can now double up on potion effects!"

				if(New=="Turf Sealing")
					if(!locate(/obj/Skills/Utility/Seal_Turf, usr))
						usr.AddSkill(new/obj/Skills/Utility/Seal_Turf)
						usr << "You learn to place a seal on the ground to stymie movement!"
				if(New=="Object Sealing")
					if(!locate(/obj/Skills/Utility/Seal_Object, usr))
						usr.AddSkill(new/obj/Skills/Utility/Seal_Object)
						usr << "You learn to seal an object to protect it!"
				if(New=="Power Sealing")
					if(!locate(/obj/Skills/Utility/Seal_Power, usr))
						usr.AddSkill(new/obj/Skills/Utility/Seal_Power)
						usr << "You learn to seal an incapacitated foe's power!"
				if(New=="Mobility Sealing")
					if(!locate(/obj/Skills/Utility/Seal_Movement, usr))
						usr.AddSkill(new/obj/Skills/Utility/Seal_Movement)
						usr << "You learn to bind an incapacitated foe to a particular plane!"
				if(New=="Command Sealing")
					if(!locate(/obj/Skills/Utility/Crystalize_Command_Seal, usr))
						usr.AddSkill(new/obj/Skills/Utility/Crystalize_Command_Seal)
						usr << "You learn to bind a powerful command in the form of a seal!"

	//Tied to category
				if(src.path=="RepairAndConversion")
					if(!locate(/obj/Skills/Utility/Reforge, usr))
						usr.AddSkill(new/obj/Skills/Utility/Reforge)
						usr << "You learn how to reforge weapons, armor, and staves!"

				if(src.path=="ImprovedMedicalTechnology")
					if(!locate(/obj/Skills/Utility/Surgery, usr))
						usr.AddSkill(new/obj/Skills/Utility/Surgery)
						usr << "You learn how to treat crippling long-term injuries!"

				if(usr.CyberEngineeringUnlocked)
					if(!locate(/obj/Skills/Utility/Cybernetic_Augmentation, usr))
						usr.AddSkill(new/obj/Skills/Utility/Cybernetic_Augmentation)
						usr << "You learn how to operate with cybernetics!"

				if(src.path=="Alchemy")
					usr.PotionTypes.Add("Wild Herb")
				if(src.path=="ImprovedAlchemy")
					if(usr.CrestCreationUnlocked>=3&&usr.ImprovedAlchemyUnlocked>=3)
						if(!locate(/obj/Skills/Utility/Transmute, usr))
							usr << "You now know enough about alchemy and magic circuits to transmute a victim into a true Philosopher Stone!  This will cost their life..."
							usr.AddSkill(new/obj/Skills/Utility/Transmute)
					if(usr.CrestCreationUnlocked>=5&&usr.ImprovedAlchemyUnlocked>=5)
						usr << "You now know enough about alchemy and magic circuits to transmute an artificial Philosopher Stone from a cauldron!  It costs [Commas(global.EconomyCost*100)] resources..."

				if(src.path=="ToolEnchantment"&&usr.ToolEnchantmentUnlocked==1)
					if(!locate(/obj/Skills/Utility/Create_Magic_Circle, usr))
						usr << "You learn to craft a magical circle!  This will cut all capacity costs by 25% while you are present on it.  You can only make one, so choose wisely where to put it!"
						usr.AddSkill(new/obj/Skills/Utility/Create_Magic_Circle)

				if(src.path=="ArmamentEnchantment")
					if(!locate(/obj/Skills/Utility/Upgrade_Equipment, usr))
						usr.AddSkill(new/obj/Skills/Utility/Upgrade_Equipment)
						usr << "You learn the Upgrade Equipment skill, which can enchant swords and staves!"
					switch(usr.ArmamentEnchantmentUnlocked)
						if(1)
							usr << "You learn how to enchant weapons with fire, water, wind or earth elements and reinforce their basic functions!"
						if(2)
							usr << "You learn how to coat weapons with poison or pure silver!"
						if(3)
							usr << "You learn how to enchant weapons with pacifying light or enraging darkness and ascend the weapons into unique status!"
						if(4)
							usr << "You learn how to magnify the traits of a weapon class with magic!"
						if(5)
							usr << "You learn how to enchant weapons with the forces of chaos and make them rival arms of legend!"

				if(src.path=="CrestCreation")
					if(usr.CrestCreationUnlocked==1)
						if(!locate(/obj/Skills/Utility/Create_Magic_Crest, usr))
							usr.AddSkill(new/obj/Skills/Utility/Create_Magic_Crest)
							usr << "You learn how to shape your very own Magic Crest!"
					if(usr.CrestCreationUnlocked>=3&&usr.ImprovedAlchemyUnlocked>=3)
						if(!locate(/obj/Skills/Utility/Transmute, usr))
							usr << "You now know enough about alchemy and magic circuits to transmute a victim into a true Philosopher Stone!  This will cost their life..."
							usr.AddSkill(new/obj/Skills/Utility/Transmute)
					if(usr.CrestCreationUnlocked>=5)
						usr << "You know enough about Magic Crests that you can now malform one to encourage greater growth at the cost of the wielder's lifespan!"
					if(usr.CrestCreationUnlocked>=5&&usr.ImprovedAlchemyUnlocked>=5)
						usr << "You now know enough about alchemy and magic circuits to transmute an artificial Philosopher Stone from a cauldron!  It costs [Commas(global.EconomyCost*100)] resources..."

				if(src.path=="SummoningMagic")
					if(!locate(/obj/Skills/Utility/Summon_Spirit, usr))
						usr.AddSkill(new/obj/Skills/Utility/Summon_Spirit)
						usr << "You learn how to invoke a spirit!  It will only hang around temporarily though."
					if(IsOdd(usr.SummoningMagicUnlocked))
						usr.AddSkill(new/obj/Items/Enchantment/Summoning_Contract)
						usr << "You draft a summoning contract to be signed by a spiritual being!"
					if(usr.SummoningMagicUnlocked>4)
						usr.AddSkill(new/obj/Skills/Utility/Summon_Absurdity)
						usr << "You learn the ritual to invoke an otherworldly entity if you know its True Name! But such things are best left undisturbed..."

				if(src.path=="SealingMagic")
					if(!locate(/obj/Skills/Utility/Seal_Break, usr))
						usr.AddSkill(new/obj/Skills/Utility/Seal_Break)
						usr << "You learn how to attempt dismantling any existing seal!"

				if(src.path=="SpaceMagic")
					if(usr.SpaceMagicUnlocked>3)
						if(!locate(/obj/Skills/Blink, usr))
							usr.AddSkill(new/obj/Skills/Blink)
							usr << "You learn how to instantly displace yourself through space!"


mob/Players/verb
	Acquire_Knowledge()
		set category="Other"
		set hidden=1
		if(!(world.time > verb_delay)) return
		verb_delay=world.time+1
		winshow(usr,"knowtree",1)
	knowtreez(var/z as text)
		set hidden=1//interface verb doesnt needa be found out
		if(!(world.time > verb_delay)) return
		verb_delay=world.time+1
		winset(usr,"knowtreegrid","cells=0x0")//clears grid
		usr<<output("Knowledge Tree (RPP: [round(usr.GetRPPSpendable())])","KnowTreeRewardPoints")
		sleep(1)
		var/p=1//used as a positioning locator for rows/columns
		for(var/obj/KnowledgeTreeObj/x in KnowledgeTreeList[z])
			x.icon_state="Available"
			usr<<output(x,"knowtreegrid:1,[p]")
			//Technology
			if(z=="Forging")
				usr<<output("Learn how to make weapons of varying classes as well as armor.  This skill can lead to breakthroughs regarding: Sword Forging, Armor Forging, Weighted Clothing, Smelting, Locksmithing.","knowinfolabel")
			if(z=="RepairAndConversion")
				usr<<output("Knowledge on how to perform proper maintenence and care on your weapons... or push them beyond usual capabilities.  This skill gives you basic knowledge on: Repair Kits, Reforging; can lead to breakthroughs regarding: Fiber Bonding Agents, Resistant Coating, Advanced Plating, Quicksilver Alloys, Trick Weapon Kits.","knowinfolabel")
			if(z=="Medicine")
				usr<<output("Use this to keep yourself in good health.  This skill gives you basic knowledge on: First Aid Materials; can lead to breakthroughs regarding: Medkits, Fast Acting Medicine, Automatic Dispensers, Steroids and Anesthetics.","knowinfolabel")
			if(z=="ImprovedMedicalTechnology")
				usr<<output("Medical technology able to treat even the most grievious wounds!  This skill gives you basic knowledge on: Surgical Practices; can lead to breakthroughs regarding: Regeneration Tanks, Prosthetic Limbs, Genetic Manipulation, Regenerative Medicine, Revival Protocols.","knowinfolabel")
			if(z=="Telecommunications")
				usr<<output("Various kinds of communication and surveillance devices.  This skill gives you basic knowledge on: Communicators and PDAs; can lead to breakthroughs regarding: Wiretaps and Hacking Consoles, Security Devices, Recon Drones, Wide Area Transmissions and Local Range Devices.","knowinfolabel")
			if(z=="AdvancedTransmissionTechnology")
				usr<<output("Various kinds of scanning devices. This skill gives you basic knowledge on: Radars; can lead to breakthroughs regarding: Scouters, EMW Projectors, Stealth Cloaks, Satellite Surveilance and Combat Analysis.","knowinfolabel")
			if(z=="Engineering")
				usr<<output("Knowledge of how to deal with physical sciences.  This skill gives you basic knowledge on: Reinforced Structures, Drill Towers and Digital Keys; can lead to breakthroughs regarding: Secured Suits, Force Shielding, Jet Propulsion, Power Generators; summed up it allows researching Space Travel.","knowinfolabel")
			if(z=="CyberEngineering")
				usr<<output("Advanced knowledge on upgrading or recreating humanoid body structure.  This skill gives you basic knowledge on: modifying Androids and living creatures with a variety of cybernetic modules;  can lead to breakthroughs regarding: Android Creation, Conversion Modules, Enhancement Chips, Involuntary Implantation; summed up it allows researching Self-Augmentation.","knowinfolabel")
			if(z=="MilitaryTechnology")
				usr<<output("Get learned how to make stuff more deader. This skill gives you basic knowledge on: Plasma Blasters and can lead to breakthroughs regarding: Assault Weaponry, Explosive Weaponry, Energy Melee Weaponry, Thermal Weaponry, Heavy Armor Padding.","knowinfolabel")
			if(z=="MilitaryEngineering")
				usr<<output("Get even more learned how to make stuff very much more like deadered. This skill gives you basic knowledge on: Powered Armor; can lead to breakthroughs regarding: Specialized Power Armor, Armorpiercing Weaponry, Impact Weaponry, Hydraulic Weaponry; summed up it allows researching Vehicle-Scale Powered Armor.","knowinfolabel")

			//Enchantment
			if(z=="Alchemy")
				usr<<output("Learn to brew potions.  This skill gives you basic knowledge on: Wild Herbs and constructing Cauldrons for brewing; can lead to breakthroughs regarding: Healing, Philter, Refreshing, Mystical and Toxic Herbs.","knowinfolabel")
			if(z=="ImprovedAlchemy")
				usr<<output("Learn to brew even more potions.  This skill gives you basic knowledge on: Magical Transmutation; can lead to breakthroughs regarding: Stimulant, Relaxant, Numbing or Transformative Herbs and Distillation Process.","knowinfolabel")
			if(z=="ToolEnchantment")
				usr<<output("Make witch / wizard tools. This skill gives you basic knowledge on carving your personal magic circle; can lead to breakthroughs regarding: Spell Focii, Artifact Manufacturing, Arcane Espionage, Flight Devices and Scrying Wards.","knowinfolabel")
			if(z=="ArmamentEnchantment")
				usr<<output("Learn how to make progressively better weapons at the cost of progressively higher investment. This skill gives you the Upgrade Equipment skill and progresses it further.","knowinfolabel")
			if(z=="TomeCreation")
				usr<<output("Learn to scribe tomes, which can alleviate the mana cost of a limited number of magical skills.  This gives you basic knowledge on scribing and expanding Tomes; can lead to breakthroughs regarding manipulating tomes through Cleansing, Securing, Translating and Binding them, or creating excerpts called Scrolls.","knowinfolabel")
			if(z=="CrestCreation")
				usr<<output("Grants the ability to carve out your own living spellbook - a Magic Crest.  This gives you basic knowledge on how to design a Crest; can lead to breakthroughs regarding Transplanting, Upgrading and even Stealing existing Crests, or shaping a Crest into an unique parasitic entity.","knowinfolabel")
			if(z=="SummoningMagic")
				usr<<output("This deals with the act of summoning elementals and possibly even demons.  Researching it will generate a contract item which can be used to enter into an agreement with an otherworldly entity. Additional knowledge in this branch expands the ways you can use your contracts in.","knowinfolabel")
			if(z=="SealingMagic")
				usr<<output("Magic dealing with restriction and limiting others.  Grants basic knowledge on breaking other seals; can lead to breakthroughs regarding: Sealing Locations, Sealing Objects, Sealing People's Mobility and Power and creating powerful Geas-like Command Seals.","knowinfolabel")
			if(z=="SpaceMagic")
				usr<<output("Become versed in displacing various things through space at your own convenience.  Grants basic knowledge on traversing subspace; can lead to breakthroughs regarding: Teleportation, Dimension Manipulation, Spatial Recall and Restraining, Contingency Bilocation.","knowinfolabel")
			if(z=="TimeMagic")
				usr<<output("Understand the flow of time and how to manipulate it to your own ends.  This can lead to breakthroughs regarding: Reincarnation, Immortality, Lifespan Extension, Acceleration and Displacement","knowinfolabel")
			p++