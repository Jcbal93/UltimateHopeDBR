var/EconomyMult=1//This is a multiplier to everyone's money gain.
var/EconomyIncome=100//average gain if you invest 100 rpp
var/EconomyCost=100//average...uh...cost.
var/EconomyMana=100//New default for mana is 100

mob/Admin3
	verb/EconomyIncomeSet(var/num as num)
		set category="Admin"
		EconomyIncome=num
		Log("Admin", "[src.key] has set the base economy wage to [Commas(EconomyIncome)].")
	verb/EconomyCostSet(var/num as num)
		set category="Admin"
		EconomyCost=num
		Log("Admin", "[src.key] has set the base price for technology to [Commas(EconomyCost)].")
	verb/EconomyManaSet(var/num as num)
		set category="Admin"
		EconomyMana=num
		Log("Admin", "[src.key] has set the base price for enchantment to [Commas(EconomyMana)].")
	verb/EconomyMultSet(var/num as num)
		set category="Admin"
		global.EconomyMult=num
		Log("Admin", "[src.key] has set the economy mult to x[global.EconomyMult].")


obj
	Savable=1
	var/Unobtainable=0
	var/Pickable=1
	var/Stealable=1
	var/AllowBolt=0

obj/Money
	Level=0
	icon='ArtificalObj.dmi'
	icon_state="ZenniBag"
	var/MoneyCreator
	Stealable=1
	layer=5
	Click()
		if(!(world.time > usr.verb_delay)) return
		usr.verb_delay=world.time+1
		if((src in usr))
			var/Amount=input("Drop how much money? (1-[src.Level])") as num
			Amount=round(Amount)
			if(Amount>Level) Amount=Level
			if(Amount<1) return
			usr.DropMoney(Amount)
		else
			if(ismob(src.loc)&&src.loc:KO)
				var/Amount=input(usr, "Steal how much?") as num|null
				if(Amount>src.Level)
					Amount=src.Level
				if(Amount<1||!Amount)
					return
				src.loc:TakeMoney(Amount)
				OMsg(usr, "[usr] steals [Commas(round(Amount))] [MoneyName] from [src.loc]!")
				usr.GiveMoney(Amount)

obj/Items
	Pickable=1
	Stealable=1
	var/list/Creator=new
	var/CreatorKey
	var/CreatorSignature
	var/Cost
	var/TechType
	var/SubType
	var/UnderlayIcon
	var/UnderlayX
	var/UnderlayY

	var/InternalTimer

	var/EquipIcon
	var/LayerPriority=0//1-9, higher ones are displayed above others
	var/IsHat//Is the object a hat?!

	var/PermEquip=0//Can't be unequipped
	var/BoundEquip//defines true owner
	var/LegendaryItem//Does this have verbs associated with it / a Tier S?
	var/SpiritPower//gives spirit power
	var/LegendaryPower//gives legendary power
	var/HellPower//gives hell power
	var/TrueLegend//flagged so that a bunch of legendaries don't spawn when you boot up the world...
	var/list/Techniques=list()//Techniques the item gives.
	var/NoStrip//Don't take the techniques, durhhh
	var/NoSaga//doesn't allow Saga users to fuck with it
	var/Saga//Associated Tier S
	var/list/TierTechniques=list()//1="technique name" and so on
	var/LockedLegend=0//dont give me my sword jutsu

	var/Stackable=0//If this is flagged, it will accumulate stacks of the item
	var/TotalStack=1//Only used if stackable.

	var/UpdatesDescription=0//If this is flagged, runs the Update_Description proc before outputting a desc

	var/Repairable=0//If this is flagged, you can use a conservation kit on it / repair it.
	var/ShatterCounter=200
	var/ShatterMax=200
	var/ShatterTier=0
	var/Broken=0
	var/Unwieldy=0
	var/Conversions

	var/DamageEffectiveness
	var/AccuracyEffectiveness
	var/SpeedEffectiveness
	var/Class
	var/ExtraClass
	var/Element
	var/Ascended=0
	var/InnatelyAscended=0//for conjured items
	var/Glass=0//+1 stat levels, but breaky
	var/Enchanted=0
	var/EnchantType

	verb/Set_Underlay()
		set src in usr
		if(src.suffix=="*Equipped*")
			usr << "Take [src] off before adding an underlay."
			return
		if(src.UnderlayIcon)
			src.UnderlayIcon=null
			src.UnderlayX=0
			src.UnderlayY=0
			usr << "Underlay icon removed."
			return
		src.UnderlayIcon=input(usr, "What icon do you want to display as an underlay?", "Underlay Icon") as icon|null
		src.UnderlayX=input(usr, "Pixel X?", "Underlay Icon") as num|null
		src.UnderlayY=input(usr, "Pixel Y?", "Underlay Icon") as num|null
		usr << "Done."

	verb/Set_Layer()
		set src in usr
		var/Equipped=0
		if(src.suffix=="*Equipped*")
			src.ObjectUse(usr)
			Equipped=1
		var/list/Options=list("Standard Overlay", "Low Overlay", "Lower Overlay", "Lowest Overlay")
		src.LayerPriority=input(usr, "What layer do you want [src] to appear on?  Higher layers are stacked on top of lower layers.", "Set Layer") in Options
		switch(src.LayerPriority)
			if("Lowest Overlay")
				src.LayerPriority=0.3
			if("Lower Overlay")
				src.LayerPriority=0.2
			if("Low Overlay")
				src.LayerPriority=0.1
			if("Standard Overlay")
				src.LayerPriority=0
		if(Equipped)
			src.ObjectUse(usr)

	proc/Drop()
		if(src.PermEquip)
			if(istype(src, /obj/Items/Enchantment/Magic_Crest))
				usr << "You can't drop this, you can only transplant it!"
				return
			usr << "You can't drop this!"
			return
		if(src.Stackable)
			var/Drop=input(usr, "How many [src]s do you want to drop?", "Drop") as num|null
			if(Drop>0&&Drop)
				if(Drop>src.TotalStack)
					Drop=src.TotalStack
				var/Drop2=new src.type(get_step(usr, usr.dir))
				Drop2:TotalStack=Drop
				Drop2:suffix="[Drop2:TotalStack]"
				src.TotalStack-=Drop
				src.suffix="[src.TotalStack]"
				if(src.TotalStack==0)
					del src
		else
			loc=get_step(usr,usr.dir)
			if(istype(src, /obj/Items/Enchantment/Scrying_Ward))
				var/obj/Items/Enchantment/Scrying_Ward/sw = src
				for(var/mob/m in view(sw.Range, sw))
					if(m.BeingObserved)
						for(var/mob/p in m.BeingObserved)
							if(p.Observing >= 2 || p.HasSpiritPower()) continue
							Observify(p,p)
							p << "Your view of [m] is suddenly broken!"

	verb/DropItem()
		set name="Drop Item"
		var/Nope=0
		if(istype(src,/obj/Items/Sword))
			if(src:ProjectionBlade)
				usr << "Your magic blade dissolves."
				del src
				return
		if(src.suffix=="*Equipped*")
			Nope=1
		if(Nope)
			usr<<"You can't drop a equiped item. Take it off first!"
			return
		Drop()
	Click()
		if(src in Technology_List)
			var/obj/ItemMade
			var/heh
			var/list/already=new
			if(usr.KO)
				usr << "You cannot create items while KO'd."
				return
			var/Mode=alert(usr, "Do you want to buy the item or examine it?", "[src]", "Buy", "Examine")
			if(Mode=="Examine")
				if(istype(src,/obj/Items))
					if(src:UpdatesDescription)
						src:Update_Description()
				if(src.desc)
					usr<<src.desc
				else
					usr << "[src] has no description."
				return
			if(!usr.HasMoney(src.Cost))
				usr << "You don't have enough money to buy [src]."
				return
			if(1)
				if(istype(src,/obj/Items/Tech/SpaceTravel/SpacePod))
					var/Count=1
					for(var/obj/Items/Tech/SpaceTravel/SpacePod/SS in world)
						if(SS in Technology_List)
							continue
						world << "a pod was located"
						world << "checked for 'Pod[Count]'"
						if(SS.Password=="Pod[Count]")
							world << "pod value [Count] confirmed"
							Count++
						else
							world << "pod value [Count] never found; assigning [Count]"
							break
					if(Count>10)
						usr << "There are too many space pods made already."
						return
					heh=Count
				if(!heh)
					if(istype(src,/obj/Items/Tech/SpaceTravel/Ship))
						for(var/obj/Items/Tech/SpaceTravel/Ship/W in world)
							already.Add(W.Password)
						for(var/i=1, i<=10, i++)
							if(already.Find(i))
								continue
							else
								heh=i
								break
						if(!heh)
							usr<<"There are too many of them!"
							return
				if(istype(src,/obj/Items/Tech/Power_Pack))
					var/MultiMake=input("How many packs would you like to make?")as num|null
					if(MultiMake==null||MultiMake<=0)
						return
					var/MultiCost=Technology_Price(usr,src)
					for(var/obj/Money/M in usr)
						if(M.Level>=MultiCost*MultiMake)
							usr.TakeMoney(MultiCost*MultiMake)
							var/obj/Items/Tech/Power_Pack/P=new type(usr.loc)
							P.TotalStack=MultiMake
							P.suffix="[MultiMake]"
							if(MultiMake>1)
								usr<<"You made [MultiMake] [src]."
						else
							usr<<"You don't have enough money! You need [Commas(MultiCost*MultiMake)] resources to make [MultiMake] [src]."
					return
				if(Can_Afford_Technology(usr, src))
					usr.TakeMoney(Technology_Price(usr, src))
					usr.UpdateTechnologyWindow()


					ItemMade=new src.type
					if(ItemMade:Stackable)
						var/stacktype=ItemMade.type
						for(var/obj/Items/o in usr)
							if(o.type==stacktype)
								o.TotalStack++
								usr << "You stack a new [ItemMade]."
								del ItemMade
					if(ItemMade.Grabbable)
						ItemMade.loc=usr
					else
						ItemMade.loc=usr.loc
					ItemMade:CreatorKey=usr.ckey
					ItemMade:CreatorSignature=usr.EnergySignature



					if(istype(src,/obj/Items/Tech/SpaceTravel/SpacePod))
						ItemMade.Password="Pod[heh]"
						world << "assigned [ItemMade.Password] to new pod"
						ItemMade.loc=usr.loc
					usr << "You made \an [ItemMade]!"

				if(istype(src,/obj/Items/Tech/Scouter))
					if(ItemMade:ScouterIcon!=1)
						ItemMade:ScouterIcon=1
						var/Choice=input("What icon would you like for the scouter?") in list ("Green","Blue","Red","Purple")
						switch(Choice)
							if("Green")
								ItemMade:icon='GreenScouter.dmi'
							if("Blue")
								ItemMade:icon='BlueScouter.dmi'
							if("Red")
								ItemMade:icon='RedScouter.dmi'
							if("Purple")
								ItemMade:icon='PurpleScouter.dmi'

		else if(src in Enchantment_List)
			var/obj/ItemMade
			var/Mode=alert(usr, "Do you want to buy the item or examine it?", "[src]", "Buy", "Examine")
			if(Mode=="Examine")
				if(istype(src,/obj/Items))
					if(src:UpdatesDescription)
						src:Update_Description()
				if(src.desc)
					usr<<src.desc
				else
					usr << "[src] has no description."
				return
			if(usr.HasManaCapacity(src.Cost*(global.EconomyMana/100)))
				usr.TakeManaCapacity(src.Cost*(global.EconomyMana/100))
				ItemMade=new src.type
				if(ItemMade.Grabbable)
					ItemMade.loc=usr
				else
					ItemMade.loc=usr.loc
				ItemMade:CreatorKey=usr.ckey
				ItemMade:CreatorSignature=usr.EnergySignature
				usr << "You made \an [ItemMade]!"
			else
				usr << "You don't have enough capacity stored to make [src]!"
				return
			usr.UpdateTechnologyWindow()
			if(istype(src,/obj/Items/Enchantment/Staff))
				if(ItemMade:StaffIconSelected!=1)
					var/Choice=input("What icon would you like for the staff?") in list ("Red","Grey","Brown","Red 2","Green","Cyan","Red 3")
					switch(Choice)
						if("Red")
							ItemMade:icon='MageStaff.dmi'
							ItemMade:StaffIconSelected=1
						if("Grey")
							ItemMade:icon='MageStaff2.dmi'
							ItemMade:StaffIconSelected=1
						if("Brown")
							ItemMade:icon='MageStaff3.dmi'
							ItemMade:StaffIconSelected=1
						if("Red 2")
							ItemMade:icon='MageStaff4.dmi'
							ItemMade:StaffIconSelected=1
						if("Green")
							ItemMade:icon='MageStaff5.dmi'
							ItemMade:StaffIconSelected=1
						if("Cyan")
							ItemMade:icon='MageStaff6.dmi'
							ItemMade:StaffIconSelected=1
						if("Red 3")
							ItemMade:icon='MageStaff8.dmi'
							ItemMade:StaffIconSelected=1
		else if(src in Clothes_List)
			if(usr.IconClicked==0)
				usr.IconClicked=1
				var/Color=input("Choose color") as color|null
				if(Color) icon+=Color
				usr.IconClicked=0
				var/obj/A=new type
				A.icon=icon
				usr.contents+=A
				icon=initial(icon)
		else
			if(!usr.Saga||(usr.Saga&&!src.NoSaga)||(usr.Saga&&src.NoSaga&&src.suffix=="*Equipped*"))
				src.ObjectUse()
			else
				usr << "[src] does not resonate with your legendary abilities."
				return

	Edibles
		Health=1
		layer=MOB_LAYER+0.5
		var/EatText
		var/EatNutrition
		var/EatToxicity
		Booze
			icon='Foods.dmi'
			icon_state="Booze"
			Pickable=1
		Food
			icon='Foods.dmi'
			icon_state="Poor"
			Pickable=1
		Senzu
			icon='Senzu.dmi'
			icon_state=""
			Pickable=1
			EatText="eats the bean; its rejuvenating power heals them fully!"
			EatNutrition=6
		Click()
			if(!(usr in oview(1,src))&&!(src in usr))
				return
			var/RacialHunger=1
			if(usr.Race in list("Saiyan","Half Saiyan","Monster"))
				RacialHunger=5
			if(usr.Race in list("Djinn","Dragon","Demon"))
				RacialHunger=20
			if(usr.EnhancedSmell)
				RacialHunger*=2
			if(usr.Satiated>=4000*RacialHunger)
				usr << "You are completely full!"
				return
			if(src.EatNutrition>=6 && usr.icon_state != "Meditate")
				usr << "You must be meditating to eat this."
			if(!src.EatToxicity)
				if(usr.HasMechanized())
					OMsg(usr, "[usr] doesn't really seem to enjoy the meal...")
				else
					OMsg(usr, "[usr] [EatText]")
					usr.Satiated+=EatNutrition*1000
					if(src.EatNutrition>5)
						usr.Sheared=0
						usr.TotalInjury=0
						usr.TotalFatigue=0
						usr.TotalCapacity=0
						usr.HealHealth(100)
						usr.HealEnergy(100)
						usr.HealMana(100)
						usr.StrTax=0
						usr.EndTax=0
						usr.SpdTax=0
						usr.OffTax=0
						usr.DefTax=0
						if(usr.GatesNerf)
							usr.GatesNerf=1
						if(usr.OverClockTime)
							usr.OverClockTime=1
						if(usr.BPPoison<1)
							usr.BPPoison=1
							usr.BPPoisonTimer=0
						if(usr.Maimed)
							usr.Maimed--
							usr << "You recover from a maiming!"
						if(usr.SenseRobbed)
							if(usr.SenseRobbed>=5)
								animate(usr.client, color=null, time=1)
							usr.SenseRobbed=0
							usr << "You regain lost senses!"
			else
				if(usr.HasMechanized())
					OMsg(usr, "[usr] doesn't really seem to enjoy the drink...")
				else
					OMsg(usr, "[usr] [EatText]")
					usr.Satiated+=EatNutrition*1000
					if(usr.Satiated>=2000 && !usr.Drunk)
						usr.Drunk=1
						usr << "You've grown drunk!"
					if(prob(20*src.EatToxicity))
						usr << "<font color='red'>You feel dizzy!</font>"
						Stun(usr, 2*src.EatToxicity)
					if(prob(20*src.EatToxicity))
						usr << "<font color='red'>You start to stumble!</font>"
						usr.AddConfuse(20*src.EatToxicity)
					if(prob(20*src.EatToxicity))
						usr << "<font color='red'>Your balance is out of whack!</font>"
						usr.AddCrippled(20*src.EatToxicity)
					if(prob(10*src.EatToxicity))
						usr << "You feel really sick!"
						usr.AddPoison(4*src.EatToxicity)
					if(prob(5*src.EatToxicity))
						usr << "<font color='red'>You feel aggressive!</font>"
						usr.Anger()
					else if(prob(5*src.EatToxicity))
						usr << "<font color='red'>You grow mellow!</font>"
						usr.AddPacifying(20*src.EatToxicity)
			del(src)


	Wearables
		Health=1
		var/SpecialClothing=0
		verb/Toggle_Hat()
			set src in usr
			if(src.IsHat)
				src.IsHat=0
				usr << "[src] has been labelled as <FONT COLOR='RED'>NOT A HAT.</font color>"
			else
				src.IsHat=1
				usr << "[src] has been labelled as <font color='green'>A HAT.</font color>"
		verb/Toggle_Special()
			set src in usr
			if(src.SpecialClothing)
				src.SpecialClothing=0
				usr << "[src] has been labelled as <FONT COLOR='RED'>NON-SPECIAL PIECE.</font color>"
			else
				src.SpecialClothing=1
				usr << "[src] has been labelled as <font color='green'>SPECIAL PIECE.</font color>"
		Eyes_1 icon='Eyes.dmi'
		Icon_2 icon='ClothesHeadband.dmi'
		Icon_3 icon='ClothesGlasses.dmi'
		Icon_4 icon='ClothesGlasses_Rimmed.dmi'
		Icon_5 icon='ClothesFacemask.dmi'
		Icon_6 icon='ClothesBandana.dmi'
		Icon_7 icon='ClothesScarf.dmi'
		Icon_8 icon='ClothesScarf_Med.dmi'
		Icon_9 icon='ClothesScarf_Long.dmi'
		Icon_10 icon='ClothesCloak.dmi'
		Icon_11 icon='ClothesBody_Gi.dmi'
		Icon_12 icon='ClothesBody_Jacket.dmi'
		Icon_13 icon='ClothesBody_JacketS.dmi'
		Icon_14 icon='ClothesBody_Unitard.dmi'
		Icon_15 icon='ClothesBody_Vest.dmi'
		Icon_16 icon='ClothesBody_VestH.dmi'
		Icon_17 icon='ClothesShirt.dmi'
		Icon_18 icon='ClothesShirt_Short.dmi'
		Icon_19 icon='ClothesShirt_Sleeve.dmi'
		Icon_20 icon='ClothesShirt_Sleeveless.dmi'
		Icon_21 icon='ClothesShirt_Tank.dmi'
		Icon_22 icon='ClothesShirt_Kaio.dmi'
		Icon_23 icon='ClothesWristband.dmi'
		Icon_24 icon='ClothesWristband_Cloth.dmi'
		Icon_25 icon='ClothesGloves.dmi'
		Icon_26 icon='ClothesGloves_Fingerless.dmi'
		Icon_27 icon='ClothesBelt_Thin.dmi'
		Icon_28 icon='ClothesBelt_Thick.dmi'
		Icon_29 icon='ClothesSash_Thin.dmi'
		Icon_30 icon='ClothesSash_Thick.dmi'
		Icon_31 icon='ClothesPants.dmi'
		Icon_32 icon='ClothesPants_Short.dmi'
		Icon_33 icon='ClothesShoes.dmi'
		Icon_34 icon='ClothesShoes_Flat.dmi'
		Icon_35 icon='ClothesShoes_Boots.dmi'
		Icon_36 icon='ClothesMisc_Backpack.dmi'
		Icon_37 icon='ClothesMisc_Book.dmi'


	AlignWearable
		Unobtainable=1
		verb/Toggle_Hat()
			set src in usr
			if(src.IsHat)
				src.IsHat=0
				usr << "[src] has been labelled as <FONT COLOR='RED'>NOT A HAT.</font color>"
			else
				src.IsHat=1
				usr << "[src] has been labelled as <font color='green'>A HAT.</font color>"
		Align_1 icon='Eyes.dmi'


mob/proc/CheckWeightsTraining()
	var/obj/Items/WeightedClothing/w=EquippedWeights()
	if(w)
		var ready = world.realtime
		if(ready > w.InternalTimer) ready = 1
		else ready = 0
		src << "You've been wearing weights since [time2text(w.InternalTimer - Day(2), "MMM DD hh:mm")]. Your weight training is<b>[ready ? null : " not"] complete![ready ? " Unequip them at 75% health or below to gain their benefits!" : null]"

obj/Items/WeightedClothing//we are now a DBZ rip ... or is it pokemon?
	Unobtainable=1
	Unwieldy=1
	TechType="Forging"
	SubType="Weighted Clothing"
	Cost=1
	desc="Weights restrict your power until removed!  When they are removed, the trainee gains great speed and power for a duration."
	var/Plated//Has plating benefits and gives stronger boonsxz
	var/PlatedHealth=50
	Weights
		icon='MachoBrace.dmi'
		Unobtainable=0
		verb/Apply_Plating()
			set category=null
			set src in usr
			if(!("Advanced Plating" in usr.UnlockedTechnology))
				usr << "You don't know how to add plating to things!"
				return
			if(src.suffix=="*Equipped*")
				usr << "Take off the armor if you're going to fiddle with it!"
				return
			if(src.Plated)
				usr << "[src] already has plating applied to it!"
				return
			var/PCost=(global.EconomyCost*0.5)
			var/Choice=alert(usr, "Do you want to apply refractive and ceramic plating to your weights?  This will apply the effects of both types of plating as well as make the weights much heavier!  It costs [Commas(PCost)] to apply.  Do you want to do this?", "Apply Plating", "No", "Yes")
			if(Choice=="No")
				return
			if(!usr.HasMoney(PCost))
				usr << "You don't have enough money to fund the plating!"
				return
			src.Plated=1
			src.UpdatesDescription=1
			OMsg(usr, "[usr] has applied plating reinforcement to their [src]!")
			usr.TakeMoney(PCost)
		proc/Update_Description()
			desc="Weights restrict your power until removed!  When they are removed, the trainee gains great speed and power for a duration.<br>"
			desc+="This set of weights has been reinforced with plating!<br><br>"
			desc+="<b>Durability:</b> [src.PlatedHealth/50*100]%"
		Examined(mob/user)
			if(user && (src in user))
				usr.CheckWeightsTraining()



obj/Items/Plating
	TechType="RepairAndConversion"
	SubType="Advanced Plating"
	Unobtainable=1
	Cost=2
	var/PlatedHealth=50

	//i dont have icons my dude
	Ceramic_Plating
		Unobtainable=0
		desc="Ceramic plating soaks up wound damage for the user, but it has limited durability!"
		UpdatesDescription=1
		proc/Update_Description()
			desc="Ceramic plating soaks up wound damage for the user, but it has limited durability!<br><br>"
			desc+="<b>Durability:</b> [src.PlatedHealth/50*100]%"

	Refractive_Plating
		Unobtainable=0
		desc="Refractive plating is designed to reflect projectile attacks easily, but it is heavy and makes it harder to dodge melee strikes."

obj/Items/BlastShielding
	TechType="MilitaryTechnology"
	SubType="Blast Shielding"
	Cost=5
	Blast_Shield
		Unobtainable=0
		icon='Blast_Shield.dmi'
		desc="A heavy-duty alloy shield meant to provide additional protection from explosions and other burst type attacks!"

obj/Items/Armor
	Health=10
	//TrueLegend//blah
	//Class//blah
	//ShatterCounter//durability
	//ShatterMax
	//ShatterTier//it breaks down when ur hit
	//Broken//is it bork?
	//Ascended//git gud
	//InnatelyAscended//just in case
	//Element
	var/Conjured=0
	Unobtainable=1
	UpdatesDescription=1
	Repairable=1
	TechType="Forging"
	SubType="Armor"
	Mobile_Armor
		name="Armored Vest"
		Class="Light"
		DamageEffectiveness=1.2
		AccuracyEffectiveness=0.95
		SpeedEffectiveness=0.85
		ShatterCounter=200
		ShatterMax=200
		icon='ArmorLight-White.dmi'
		Unobtainable=0
		Cost=0.3
	Balanced_Armor
		name="Standard Armor"
		Class="Medium"
		DamageEffectiveness=1.4
		AccuracyEffectiveness=0.9
		SpeedEffectiveness=0.8
		ShatterCounter=300
		ShatterMax=300
		icon='ArmorBalanced-White.dmi'
		Unobtainable=0
		Cost=0.4
	Plated_Armor
		name="Plated Armor"
		Class="Heavy"
		DamageEffectiveness=1.6
		AccuracyEffectiveness=0.8
		SpeedEffectiveness=0.6
		ShatterCounter=400
		ShatterMax=400
		icon='ArmorBulky-Black.dmi'
		Unobtainable=0
		Cost=0.5
	New()
		..()
		switch(src.Class)
			if("Light")
				src.icon=pick('ArmorLight-White.dmi','ArmorLight-Black.dmi')
			if("Medium")
				src.icon=pick('ArmorBalanced-White.dmi','ArmorBalanced-Black.dmi')
			if("Heavy")
				src.icon=pick('ArmorBulky-White.dmi','ArmorBulky-Black.dmi')
		spawn()src.Update_Description()

	proc/Update_Description()
		desc="<b>[name]</b><br>\
		<br>"
		desc+="Class: [Class]<br>"
		if(Destructable)
			desc+="Durability: [(round(ShatterCounter/src.ShatterMax,0.01)*100)]%<br>"
		else
			desc+="Durability: Limitless<br>"
		if(Element)
			desc+="Elemental Infusion: [Element]<br>"
		if(Conversions)
			desc+="Upgrade Type: [Conversions]"
		desc+="<br>Armors deflect damage at the cost of reducing accuracy and increasing delays.<br>"

obj/Items/Sword
	Health=10
	Unobtainable=1
	var/Conjured=0
	var/SwordIconSelected=0
	var/ImprovedStat
	var/ProjectionBlade=0//Dissolves on drop
	var/MagicSword=0//Sword is treated as a staff.
	var/ScissorBlade=0
	var/WeaponBreaker=0
	var/Shearing=0//shears stuff
	var/ElementallyInfused
	var/SpiritSword=0
	var/CalmAnger=0
	var/BulletKill=0
	var/Extend=0
	var/HitSparkIcon
	var/HitSparkX
	var/HitSparkY
	var/HitSparkSize=1
	var/Purity//waifu swords
	var/ManaGeneration=0
	var/iconAlt=null
	var/iconAltX=0
	var/iconAltY=0
	var/ClassAlt=null
	icon_state="Inventory"
	TechType="Forging"
	UpdatesDescription=1
	Repairable=1
	Wooden
		name="Training Sword"
		Unobtainable=0
		icon='Bokken.dmi'
		DamageEffectiveness=1
		AccuracyEffectiveness=1
		SpeedEffectiveness=1
		ShatterCounter=100
		ShatterMax=100
		HitSparkIcon='Hit Effect.dmi'
		HitSparkX=-32
		HitSparkY=-32
		HitSparkSize=1
		Cost=0.05
		Repairable=0
		Class="Wooden"
		TechType="BasicTechnology"
		SubType=null
	Light
		name="Bastard Sword"
		Unobtainable=0
		icon='LightSword.dmi'
		DamageEffectiveness=1.3
		AccuracyEffectiveness=0.9
		SpeedEffectiveness=1
		HitSparkSize=0.8
		ShatterCounter=200
		ShatterMax=200
		Cost=0.3
		Class="Light"
		SubType="Weapons"
		Legendary
			LegendaryItem=1
			Unobtainable=1
			Ascended=3

			Yukianesa
				name="Yukianesa"
				icon='Yukianesa.dmi'
				pixel_x=-16
				pixel_y=-16
				NoSaga=1
				CalmAnger=1
				MagicSword=1
				Element="Water"
				ManaGeneration=30
				Techniques=list("/obj/Skills/Buffs/SlotlessBuffs/Grimoire/OverDrive/Frost_End", "/obj/Skills/AutoHit/FrostBite", "/obj/Skills/Projectile/Sword/TougaHyoujin", "/obj/Skills/Queue/KokujinYukikaze")

			WeaponSoul
				Saga="Weapon Soul"
				pixel_x=0
				pixel_y=0

				Sword_of_Purity//Masamune
					name="Sword of Purity"
					icon='Masamune.dmi'
					Purity=1
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/Utility/Death_Killer", null, null)

				Bane_of_Blades//Muramasa
					name="Bane of Blades"
					icon='Muramasa.dmi'
					pixel_x=-16
					pixel_y=-16
					WeaponBreaker=1
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/AutoHit/Deathbringer", null, null)

	Medium
		name="Longsword"
		Unobtainable=0
		icon='MediumSword.dmi'
		DamageEffectiveness=1.6
		AccuracyEffectiveness=0.8
		SpeedEffectiveness=0.95
		ShatterCounter=300
		ShatterMax=300
		Cost=0.4
		Class="Medium"
		SubType="Weapons"
		Legendary
			LegendaryItem=1
			Unobtainable=1
			Ascended=3

			Scissor_Blade
				name="Scissor Blade"
				icon='scissor_blade.dmi'
				pixel_x=-16
				pixel_y=-16
				Shearing=0.5
				iconAlt='Scissor_blade_decap.dmi'
				iconAltX=-32
				iconAltY=-32
				ClassAlt="Heavy"
				Techniques=list("/obj/Skills/Buffs/SlotlessBuffs/WeaponSystems/Decapitation_Mode")

			WeaponSoul
				Saga="Weapon Soul"
				pixel_x=0
				pixel_y=0

				Sword_of_Glory//Caledfwlch
					name="Sword of Glory"
					icon='Caledfwlch.dmi'
					pixel_x=-31
					pixel_y=-30
					SpiritSword=0.75
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/Projectile/Beams/Big/Weapon_Soul/Excalibur", null, null)

				Sword_of_Faith//Kusanagi
					name="Sword of Faith"
					icon='Kusanagi.dmi'
					pixel_x=-16
					pixel_y=-16
					MagicSword=1
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/Buffs/SlotlessBuffs/Totsuka_no_Tsurugi", null, null)

				Blade_of_Order//Soul Calibur
					name="Blade of Order"
					icon='SoulCalibur.dmi'
					Element="Silver"
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/AutoHit/Crystal_Tomb", null, null)

				Blade_of_Ruin//Dainsleif
					name="Blade of Ruin"
					icon='Dainsleif.dmi'
					Shearing=1
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/Buffs/SlotlessBuffs/Fate_of_Blood", null, null)

	Heavy
		name="Greatsword"
		Unobtainable=0
		icon='HeavySword.dmi'
		DamageEffectiveness=1.9
		AccuracyEffectiveness=0.7
		SpeedEffectiveness=0.9
		HitSparkSize=1.2
		ShatterCounter=400
		ShatterMax=400
		Cost=0.5
		Class="Heavy"
		SubType="Weapons"
		Legendary
			LegendaryItem=1
			Unobtainable=1
			Ascended=3

			Ookami
				name="Ookami"
				icon='Ookami.dmi'
				pixel_x=-32
				pixel_y=-32
				NoSaga=1
				CalmAnger=1
				MagicSword=1
				Extend=1
				BulletKill=1
				ManaGeneration=30
				Techniques=list("/obj/Skills/Buffs/SlotlessBuffs/Grimoire/OverDrive/Fierce_God", "/obj/Skills/Buffs/SlotlessBuffs/Grimoire/Slaying_God", "/obj/Skills/Projectile/Sword/KokujinShippu", "/obj/Skills/Queue/KokujinYukikaze")

			WeaponSoul
				Saga="Weapon Soul"
				pixel_x=0
				pixel_y=0

				Sword_of_Hope//Durendal
					name="Sword of Hope"
					icon='Durendal.dmi'
					Destructable=0
					ShatterTier=0
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/AutoHit/Great_Divide", null, null)

				Blade_of_Chaos//Soul Edge
					name="Blade of Chaos"
					icon='SoulEdge.dmi'
					ExtraClass=1
					TierTechniques=list(null, null, null, null, null, "/obj/Skills/Buffs/SlotlessBuffs/Eye_of_Chaos", null, null)


	desc="Weapons alter the effects of melee combat and have their own advantages and disadvantages."
	New()
		..()
		spawn()src.Update_Description()

	proc/Update_Description()
		desc="<b>[name]</b><br>\
		<br>"
		if(name=="Keyblade"&&Class=="Wooden")
			desc+="Class: Starting<br>"
		else
			desc+="Class: [Class]<br>"
		if(Destructable)
			desc+="Durability: [(round(src.ShatterCounter/src.ShatterMax,0.01)*100)]%<br>"
		else
			desc+="Durability: Limitless<br>"
		if(Ascended||InnatelyAscended)
			var/A=min(Ascended+InnatelyAscended, 4)
			switch(A)
				if(1)
					desc+="Ascension Level: Reinforced (1)<br>"
				if(2)
					desc+="Ascension Level: Enchanted (2)<br>"
				if(3)
					desc+="Ascension Level: Legendary (3)<br>"
				if(4)
					desc+="Ascension Level: Peerless (4)<br>"
		if(Element)
			desc+="Elemental Infusion: [Element]<br>"
		if(Conversions)
			desc+="Upgrade Type: [Conversions]"
		desc+="<br>Weapons alter the effects of melee combat and have their own advantages and disadvantages.<br>"

	verb/UseDefaultSwordIcon()
		set src in usr
		switch(src.Class)
			if("Wooden")
				src.icon='Bokken.dmi'
			if("Light")
				src.icon='LightSword.dmi'
			if("Medium")
				src.icon='MediumSword.dmi'
			if("Heavy")
				src.icon='HeavySword.dmi'

obj/Items/Symbiotic
	Destructable=0
	Unobtainable=1
	LegendaryItem=1
	icon_state="Inventory"

	Potara_Earrings
		Right_Earring
			icon='Potara Earrings - Right.dmi'
			Techniques=list("/obj/Skills/Buffs/SlotlessBuffs/Divine_Fusion")
		Left_Earring
			icon='Potara Earrings - Left.dmi'
			Techniques=list("/obj/Skills/Buffs/SlotlessBuffs/Divine_Fusion")

	Saint_Cloth
		Unwieldy=1
		var
			ReturnX=0
			ReturnY=0
			ReturnZ=0
		Bronze_Cloth
			Saga="Cosmo"
			icon='Pandora_Box.dmi'
			Pegasus_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth/Pegasus_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Pegasus")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Dragon_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth/Dragon_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Dragon")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Cygnus_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth/Cygnus_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Cygnus")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Andromeda_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth/Andromeda_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Andromeda")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Phoenix_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth/Phoenix_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Phoenix")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
		Bronze_Cloth_V2
			Saga="Cosmo"
			icon='Pandora_Box.dmi'
			Pegasus_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth_V2/Pegasus_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Pegasus")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Dragon_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth_V2/Dragon_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Dragon")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Cygnus_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth_V2/Cygnus_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Cygnus")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Andromeda_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth_V2/Andromeda_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Andromeda")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
			Phoenix_Cloth
				TierTechniques=list(null, "/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Bronze_Cloth_V2/Phoenix_Cloth", null, null, null, null, null, null)
				verb/Claim_Cloth()
					if(usr.ClothBronze=="Phoenix")
						if(!src.BoundEquip)
							src.BoundEquip=usr
							usr << "You have claimed the Cloth for yourself!"
						else
							usr << "This Cloth is already claimed by [src.BoundEquip]!"
					else
						usr << "You are not accepted by the Cloth!"
		Gold_Cloth
			icon='Golden_Pandora_Box.dmi'
			Aries_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Aries_Cloth")
			Gemini_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Gemini_Cloth")
			Cancer_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Cancer_Cloth")
			Leo_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Leo_Cloth")
			Virgo_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Virgo_Cloth")
			Libra_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Libra_Cloth")
			Scorpio_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Scorpio_Cloth")
			Capricorn_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Capricorn_Cloth")
			Aquarius_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Aquarius_Cloth")
			Pisces_Cloth
				Techniques=list("/obj/Skills/Buffs/SpecialBuffs/Saint_Cloth/Gold_Cloth/Pisces_Cloth")

	Kamui
		Unwieldy=1
		KamuiSenketsu
			icon='Kamui_Uniform.dmi'
			name="Senketsu"
			Techniques=list("/obj/Skills/Buffs/ActiveBuffs/Kamui/KamuiSenketsu")
		KamuiJunketsu
			icon='JunKamui_Uniform.dmi'
			name="Junketsu"
			Techniques=list("/obj/Skills/Buffs/ActiveBuffs/Kamui/KamuiJunketsu")


obj/Items/proc/AlignEquip(mob/A)
	var/placement=FLOAT_LAYER-3
	if(src.LayerPriority)
		placement-=src.LayerPriority
	if(istype(src,/obj/Items/Wearables))
		if(src.IsHat)
			placement=FLOAT_LAYER-1
	if(suffix&&(A==src.loc))
		suffix=null
		if(src.EquipIcon)
			var/image/im=image(icon=src.EquipIcon, pixel_x=src.pixel_x, pixel_y=src.pixel_y, layer=placement)
			A.overlays-=im
		else
			var/image/im=image(icon=src.icon, pixel_x=src.pixel_x, pixel_y=src.pixel_y, layer=placement)
			if(istype(src, /obj/Items/Sword)||istype(src, /obj/Items/Armor)||istype(src, /obj/Items/Enchantment/Staff))
				var/image/im2=image(icon=src.icon, pixel_x=src.pixel_x, pixel_y=src.pixel_y, layer=placement)
				im2.transform*=3
				im2.appearance_flags+=512
				if(A.ArmamentGlow && !istype(src, /obj/Items/Armor))
					im.filters += A.ArmamentGlow
					im2.filters += A.ArmamentGlow
				A.overlays-=im2
			A.overlays-=im
	else
		if(A==src.loc)
			if(istype(src, /obj/Items/Sword))
				if(A.NeedsSecondSword() && A.EquippedSword() && !A.EquippedSecondSword())
					var/found = 0
					for(var/obj/Items/Sword/s in A)
						if(s.suffix == "*Equipped (Second)*")
							found = 1
							break
					if(!found)
						suffix = "*Equipped (Second)*"
				else if(A.NeedsThirdSword() && A.EquippedSword() && !A.EquippedThirdSword())
					var/found = 0
					for(var/obj/Items/Sword/s in A)
						if(s.suffix == "*Equipped (Third)*")
							found = 1
							break
					if(!found)
						suffix = "*Equipped (Third)*"
				else if(!A.EquippedSword())
					suffix = "*Equipped*"
				else return 1
			else
				suffix="*Equipped*"
		else if(istype(src,/obj/Items/Gear/Mobile_Suit))
			src.suffix="*Equipped*"
		if(src.EquipIcon)
			var/image/im=image(icon=src.EquipIcon, pixel_x=src.pixel_x, pixel_y=src.pixel_y, layer=placement)
			A.overlays+=im
		else
			var/image/im=image(icon=src.icon, pixel_x=src.pixel_x, pixel_y=src.pixel_y, layer=placement)
			if(istype(src, /obj/Items/Sword) || istype(src, /obj/Items/Enchantment/Staff))
				if(A.ArmamentGlow)
					im.filters += A.ArmamentGlow
			if(A.CheckActive("Mobile Suit")&&(istype(src, /obj/Items/Sword)||istype(src, /obj/Items/Armor)||istype(src, /obj/Items/Enchantment/Staff)))
				if(src:Conjured)
					im.transform*=3
					im.appearance_flags+=512
			A.overlays+=im
	if(src.UnderlayIcon)
		var/image/im=image(icon=src.UnderlayIcon, pixel_x=src.UnderlayX, pixel_y=src.UnderlayY)
		if(src.suffix=="*Equipped*")
			A.underlays+=im
		else
			A.underlays-=im
	return 1


obj/Items/proc/ObjectUse(var/mob/Players/User=usr)
	var/Looted=0

	if(locate(/obj/Seal, src))
		for(var/obj/Seal/S in src)
			if(User.ckey!=S.Creator)
				usr << "This item has been sealed!  You must break the seal before you can use it."
				return


	if(!(src in User))
		if(ismob(src.loc))
			if(src.loc:KO)
				Looted=1

	if(istype(src, /obj/Items/Cursed_Gear))
		var/obj/Items/Cursed_Gear/ag=src
		if(ag.Bound)
			if(Looted)
				User<<"[src] cannot be taken away!"
				return
		else
			if(!Looted)
				switch(alert(usr, "Are you sure you want to don [ag] willingly? It could be dangerous.", "Don Augmented Gear", "No", "Hell No", "Yes"))
					if("Yes")
						ag.Bound=1
						usr.NoSoul=1
						OMsg(usr, "[ag] worms its way inside [usr]'s body...")
						usr << "You feel the wretched grip of nihilism..."
						if(ag.Augment)
							var/obj/Skills/Buffs/b=text2path(ag.Augment)
							usr.AddSkill(new b)
	if(src.suffix=="*Equipped*"&&src.PermEquip)
		if(istype(src,/obj/Items/Enchantment/Magic_Crest)&&Looted)
			var/mob/Players/OldLoc=src.loc
			src:Transplant_Crest()
			usr.Grid("Loot", Lootee=OldLoc)
			return
		else
			User << "[src] cannot be unequipped!"
			return

	if((src in User)||Looted||istype(src,/obj/Items/Gear/Mobile_Suit))
		if(Looted)
			User=src.loc
		if(src.suffix!="*Equipped*"&&Looted)
			goto Steal

		if(src.Unwieldy)
			if(User.icon_state != "Meditate"||User.KO)
				if(!src.suffix)
					User << "You must be meditating to do this."
					return
			User.Tension=0

		if(istype(src,/obj/Items/Wearables))
			var/obj/Items/W=src
			W.AlignEquip(User)

		if(istype(src,/obj/Items/Enchantment/Arcane_Mask))
			var/obj/Items/W=src
			W.AlignEquip(User)

		if(istype(src,/obj/Items/Enchantment/Tome))
			var/obj/Items/Enchantment/Tome/T=User.EquippedTome()
			if(T)
				if(T!=src)
					User << "You already have a tome equipped!"
					return
			else
				for(var/obj/Items/Gear/g in User)
					if(g.NoSaga || istype(g, /obj/Items/Gear/Prosthetic_Limb))
						continue
					else if(g.suffix=="*Equipped*")
						User << "You cannot equip a tome while you have gear(s) equipped."
						return
				if(src.Password)
					var/PassCheck=input(User, "Enter the password to access this secure knowledge.", "Tome Security") as text
					if(PassCheck!=src.Password)
						User << "Incorrect, you can't access the tome with that password."
						return
			src.AlignEquip(User)

		if(istype(src,/obj/Items/Enchantment/Magic_Crest))
			var/obj/Items/Enchantment/Magic_Crest/MC=User.EquippedCrest()
			if(MC)
				if(MC!=src)
					User << "You already have a Magic Crest equipped!"
					return
			var/obj/Items/W=src
			W.AlignEquip(User)
			if(src.suffix=="*Equipped*")
				if(src:Parasite)
					User.ModifyPrime=-1
					User.ModifyLate=-1
				if(src:Spells.len>0)
					for(var/x=1, x<=src:Spells.len, x++)
						var/obj/Skills/Tech=src:Spells[x]
						var/obj/Skills/o=new Tech.type
						if(!locate(o, User))
							if(!o.Copyable&&User.Saga)
								continue
							o.CrestGranted=1
							User.AddSkill(o)
			else
				for(var/obj/Skills/s in User)
					if(s.CrestGranted)
						User.contents-=s

		if(istype(src,/obj/Items/Enchantment/Flying_Device))
			var/obj/Items/Enchantment/Flying_Device/FD=User.EquippedFlyingDevice()
			if(FD)
				if(FD!=src)
					User << "You already have a flying device equipped!"
					return


			if(!src.suffix)
				for(var/mob/Player/AI/a in view(15, User))
					if(a.WoundIntent || a.Lethal)
						User << "You cannot use a flying device in the presence of hostiles!"
						return
				if(User.Health<75*(1-User.HealthCut))
					User << "You cannot use a flying device while below [75*(1-User.HealthCut)] health!"
					return
			var/obj/Items/Enchantment/Flying_Device/W=src
			W.AlignEquip(User)
			User.icon_state=W.CustomState
			if(src.suffix)
				User.Flying=1
				Flight(User, Start=1)
			else
				Flight(User, Land=1)

		if(istype(src,/obj/Items/Enchantment/Staff))
			var/obj/Items/Enchantment/Staff/staf=User.EquippedStaff()
			var/obj/Items/Sword/sord=User.EquippedSword()
			if(staf)
				if(staf!=src)
					User << "You already have a staff equipped."
					return
			if(src:Broken)
				User << "[src] is broken currently and can't be used."
				return
			if(sord)
				if(!User.ArcaneBladework&&User.Race!="Demon")
					User << "You can't use a sword and a staff at the same time!"
					return
			if(User.StanceBuff)
				if(User.StanceBuff.NeedsStaff||User.StanceBuff.MakesStaff||User.NeedSpellFocii(User.StanceBuff))
					User << "You can't remove your staff with [User.StanceBuff] active!"
					return
				if(User.StanceBuff.NoStaff&&User.NotUsingBattleMage())
					User << "You can't use a staff with [User.StanceBuff] active!"
					return
			if(User.StyleBuff)
				if(User.StyleBuff.NeedsStaff||User.StyleBuff.MakesStaff||User.NeedSpellFocii(User.StyleBuff))
					User << "You can't remove your staff with [User.StyleBuff] active!"
					return
				if(User.StyleBuff.NoStaff&&User.NotUsingBattleMage())
					User << "You can't use a staff with [User.StyleBuff] active!"
					return
			if(User.ActiveBuff)
				if(User.ActiveBuff.NeedsStaff||User.ActiveBuff.MakesStaff||User.NeedSpellFocii(User.ActiveBuff))
					User << "You can't remove your Staff with [User.ActiveBuff] active!"
					return
				if(User.ActiveBuff.NoStaff&&User.NotUsingBattleMage())
					User << "You can't use a staff with [User.ActiveBuff] active!"
					return
			if(User.SpecialBuff)
				if(User.SpecialBuff.NeedsStaff||User.SpecialBuff.MakesStaff||User.NeedSpellFocii(User.SpecialBuff))
					User << "You can't remove your staff with [User.SpecialBuff] active!"
					return
				if(User.SpecialBuff.NoStaff&&User.NotUsingBattleMage())
					User << "You can't use a staff with [User.SpecialBuff] active!"
					return
			if(User.SlotlessBuffs.len>0)
				for(var/obj/Skills/Buffs/b in User.SlotlessBuffs)
					if(b.NeedsStaff||b.MakesStaff||User.NeedSpellFocii(b))
						User << "You can't remove your staff with [b] active!"
						return
					if(b.NoStaff&&User.NotUsingBattleMage())
						User << "You can't use a staff with [b] active!"
						return
			var/obj/Items/W=src
			if(W.suffix)
				if(User.ActiveBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.ActiveBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
				if(User.SpecialBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.SpecialBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
			W.AlignEquip(User)

		if(istype(src,/obj/Items/Sword))
			var/obj/Items/Enchantment/Staff/staf=User.EquippedStaff()
			var/obj/Items/Sword/sord=User.EquippedSword()
			if(src.Broken)
				User << "[src] is broken; it can't be wielded right now."
				return
			if(sord)
				if(sord!=src)
					User << "You already have a sword equipped."
					return
			if(staf)
				if(!User.ArcaneBladework&&User.Race!="Demon")
					User << "You can't use a sword and a staff at the same time!"
					return
			if(User.StyleBuff)
				if(User.StyleBuff.NeedsSword||User.StyleBuff.MakesSword)
					User << "You can't remove your sword with [User.StyleBuff] active!"
					return
				if(User.StyleBuff.NoSword&&User.NotUsingChamploo())
					User << "You can't use a sword with [User.StyleBuff] active!"
					return
			if(User.ActiveBuff)
				if(User.ActiveBuff.NeedsSword||User.ActiveBuff.MakesSword)
					User << "You can't remove your sword with [User.ActiveBuff] active!"
					return
				if(User.ActiveBuff.NoSword&&User.NotUsingChamploo())
					User << "You can't use a sword with [User.ActiveBuff] active!"
					return
			if(User.SpecialBuff)
				if(User.SpecialBuff.NeedsSword||User.SpecialBuff.MakesSword)
					User << "You can't remove your sword with [User.SpecialBuff] active!"
					return
				if(User.SpecialBuff.NoSword&&User.NotUsingChamploo())
					User << "You can't use a sword with [User.SpecialBuff] active!"
					return
			if(User.SlotlessBuffs.len>0)
				for(var/obj/Skills/Buffs/b in User.SlotlessBuffs)
					if(b.NeedsSword||b.MakesSword)
						User << "You can't remove your sword with [b] active!"
						return
					if(b.NoSword&&User.NotUsingChamploo())
						User << "You can't use a sword with [b] active!"
						return
			var/obj/Items/W=src
			if(W.suffix)
				if(User.ActiveBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.ActiveBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
				if(User.SpecialBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.SpecialBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
			W.AlignEquip(User)

		if(istype(src,/obj/Items/Armor))
			var/obj/Items/Armor/A=User.EquippedArmor()
			if(src:Broken)
				User << "[src] is broken; it can't be worn right now."
				return
			if(A)
				if(A!=src)
					User << "You already have an armor equipped."
					return
			var/obj/Items/W=src
			if(W.suffix)
				if(User.ActiveBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.ActiveBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
				if(User.SpecialBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.SpecialBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
			W.AlignEquip(User)

		if(istype(src,/obj/Items/Symbiotic))
			var/obj/Items/W=src
			if(W.suffix)
				if(User.ActiveBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.ActiveBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
				if(User.SpecialBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.SpecialBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
			W.AlignEquip(User)

		if(istype(src,/obj/Items))
			if(src.LegendaryItem)
				var/obj/Items/W=src
				if(W.suffix=="*Equipped*")
					if(W.Techniques.len>0)
						for(var/x=1, x<=W.Techniques.len, x++)
							var/path=text2path("[W.Techniques[x]]")
							var/obj/Skills/o = new path
							if(!locate(o, User))
								User.AddSkill(o)
								o.AssociatedLegend=src
					if(User.Saga==W.Saga)
						if(W.TierTechniques.len>0)
							for(var/x=1, x<=User.SagaLevel, x++)
								var/Tech=W.TierTechniques[x]
								if(Tech)
									var/path=text2path("[Tech]")
									var/obj/Skills/o =new path
									if(!locate(o, User))
										User.AddSkill(o)
										o.AssociatedLegend=src
				else
					if(W.Techniques.len>0)
						if(!W.NoStrip)
							for(var/x=1, x<=W.Techniques.len, x++)
								var/path=text2path("[W.Techniques[x]]")
								for(var/obj/Skills/o in User)
									if(o.type == path)
										del o
					if(User.Saga==W.Saga)
						if(W.TierTechniques.len>0)
							for(var/x=1, x<=User.SagaLevel, x++)
								var/Tech=W.TierTechniques[x]
								if(Tech)
									var/path=text2path("[Tech]")
									for(var/obj/Skills/s in User)
										if(s.type==path)
											del s


		if(istype(src,/obj/Items/WeightedClothing))
			var/obj/Items/WeightedClothing/W=User.EquippedWeights()
			if(W)
				if(W!=src)
					User << "You already have weights applied to you!"
					return
				if(User.CheckSlotless("Unburdened")||User.CheckSlotless("Unrestrained"))
					User << "You are still experiencing the effects of previous training!"
					return
				if(W.suffix=="*Equipped*")
					if(User.Health<=75&&(W.InternalTimer<world.realtime)||User.CyberCancel)
						var/Choice=alert(User, "Are you ready to unleash the power gained from your weight training!? With your body used to the weights, they'll be abandoned.", "Weight Boost!", "No", "Yes")
						if(Choice=="Yes")
							W.AlignEquip(User)
							User.WeightRestricted=0
							if(W.Plated)
								var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Unrestrained/U=new
								if(User.Saga=="Eight Gates")
									U.PowerInvisible+=0.25
									U.Godspeed*=2
									U.Pursuer*=2
									U.KenWave*=2
									U.DustWave*=2
									U.TimerLimit*=2
								User.AddSkill(U)
							else
								var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Unburdened/U=new
								if(User.Saga=="Eight Gates")
									U.PowerInvisible+=0.25
									U.Godspeed*=2
									U.Pursuer*=2
									U.KenWave*=2
									U.DustWave*=2
									U.TimerLimit*=2
								User.AddSkill(U)
							spawn(10)
								del W
					else
						var/Choice=alert(User, "You haven't completed your weight training, do you still want to take your weights off now...?", "Remove Weights", "No", "Yes")
						if(Choice=="Yes")
							W.AlignEquip(User)
							W.Unwieldy=1
							User.WeightRestricted=0
			else
				if(User.CyberCancel)
					User << "Your converted body does not respond to training much."
					return
				var/Choice=alert(User, "Do you want to begin your weight training?  It will lower your power, but allow a burst of strength and mobility in a pinch!", "Weight Training", "No", "Yes")
				if(Choice=="Yes")
					var/obj/Items/Dis=src
					Dis.AlignEquip(User)
					Dis.InternalTimer=world.realtime+Day(2)
					Dis.Unwieldy=0
					User.WeightRestricted=1

		if(istype(src, /obj/Items/Plating))
			var/obj/Items/Plating/P=User.EquippedPlating()
			var/obj/Items/WeightedClothing/W=User.EquippedWeights()
			if(W)
				if(W.Plated)
					User << "You're already getting plating effects from your plated weights!"
					return
			if(P)
				if(P!=src)
					User << "You're already wearing plating!"
					return
			var/obj/Items/Dis=src
			Dis.AlignEquip(User)


		if(istype(src,/obj/Items/BlastShielding))
			var/obj/Items/BlastShielding/B=User.EquippedShielding()
			if(B)
				if(B!=src)
					User << "You're already using additional shielding!"
					return
			var/obj/Items/Bla=src
			Bla.AlignEquip(User)


		if(istype(src,/obj/Items/Tech/Scouter))
			for(var/obj/Items/Tech/Scouter/S in User) if(S.suffix&&S!=src)
				User<<"You already have a Scouter equipped"
				return
			AlignEquip(User)


		if(istype(src,/obj/Items/Tech/SpaceMask))
			for(var/obj/Items/Tech/SpaceMask/S in User)
				if(S.suffix&&S!=src)
					User<<"You already have a Space Mask equipped"
					return
				if(S.Oxygen<=0)
					User<<"You can't equip a mask if it's out of Oxygen!"
					return
			AlignEquip(User)


		if(istype(src,/obj/Items/Gear/Mobile_Suit))
			if(!src.suffix)
				var/GearCount=0
				if(get_dist(User, src) > 1)
					return //Too far.

				if(User.EquippedTome())
					User << "You can't have any tomes equipped while inside a Mobile Suit!"
					return

				for(var/obj/Items/Gear/g in User)
					if(g==src)
						continue
					if(g.suffix)
						if(istype(g,/obj/Items/Gear/Prosthetic_Limb))
							continue
						else
							GearCount++
					if(GearCount>=1)
						User << "You can't have any weapons equipped while inside a Mobile Suit!"
						return
					if(User.InfinityModule)
						User << "The radiation of your core unit disrupts the electronics of the Suit!"
						return
				if(src.Password)
					var/Unlocked=0
					for(var/obj/Items/Tech/Door_Pass/L in User)
						if(L.Password==src.Password)
							Unlocked=1
					for(var/obj/Items/Tech/Digital_Key/C in User)
						if(C.Password==src.Password||C.Password2==src.Password||C.Password3==src.Password)
							Unlocked=1
					if(!Unlocked)
						var/Pass=input(User, "Please enter startup code.", "Enter Code") as text
						if(src.Password!=Pass)
							usr << "That is not the correct password."
							return
				User.loc=src.loc
				User.dir=src.dir
				sleep(5)
			var/obj/Items/W=src
			W.AlignEquip(User)
			if(W.suffix=="*Equipped*")
				W.loc=User
				if(W.Techniques.len>0)
					for(var/x=1, x<=W.Techniques.len, x++)
						var/path=text2path("[W.Techniques[x]]")
						var/obj/Skills/o = new path
						o.CooldownStatic=1
						if(!locate(o, User))
							User.AddSkill(o)
							o.AssociatedGear=src
						for(var/obj/Skills/Buffs/ActiveBuffs/Gear/Mobile_Suit/MS in User)
							MS.NameFake=W.name
							if(User.Saga=="King of Braves")
								MS.SpecialBuffLock=0
							else
								MS.SpecialBuffLock=1
							if(!User.BuffOn(MS))
								MS.PowerReplacement=usr.Potential+(10*src.Level)
								MS.Trigger(User)
				if(W.PermEquip)
					User<<"The suit merges with your body!"
			else
				for(var/obj/Skills/Buffs/ActiveBuffs/Gear/Mobile_Suit/MS in User)
					if(User.BuffOn(MS))
						MS.Trigger(User)
				if(W.Techniques.len>0)
					for(var/x=1, x<=W.Techniques.len, x++)
						var/path=text2path("[W.Techniques[x]]")
						for(var/obj/Skills/o in User)
							if(o.type == path)
								del o
				W.loc=User.loc

		if(istype(src,/obj/Items/Gear)&&!istype(src,/obj/Items/Gear/Prosthetic_Limb)&&!istype(src,/obj/Items/Gear/Mobile_Suit))
			if(User.is_arcane_beast)
				User << "A magical force surrounding your body repels the gear."
				return
			if(!src.suffix)
				if(!src.NoSaga)
					if(User.EquippedTome())
						User << "You cannot equip a tome and gears at the same time."
						return
				var/GearCount=0
				for(var/obj/Items/Gear/g in User)
					if(g==src)
						continue
					if(g.suffix)
						if(istype(g,/obj/Items/Gear/Prosthetic_Limb))
							continue
						if(istype(g,/obj/Items/Gear/Mobile_Suit))
							User << "You can't equip gear inside a mobile suit!"
							return
						else
							GearCount++
					if(GearCount>=3)
						User << "You have 3 gears equipped already!"
						return
			var/obj/Items/W=src
			if(W.suffix=="*Equipped*")
				if(User.ActiveBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.ActiveBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
				for(var/obj/Skills/Buffs/SlotlessBuffs/Gear/G in User.SlotlessBuffs)
					for(var/x in src.Techniques)
						var/Path1=text2path("[G.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
			W.AlignEquip(User)
			sleep(1)
			if(W.suffix=="*Equipped*")
				if(W.Techniques.len>0)
					for(var/x=1, x<=W.Techniques.len, x++)
						var/path=text2path("[W.Techniques[x]]")
						var/obj/Skills/o = new path
						o.CooldownStatic=1
						if(!locate(o, User))
							User.AddSkill(o)
							o.AssociatedGear=src
				if(W.PermEquip)
					User<<"The item merges with your body!"
			else
				if(W.Techniques.len>0)
					for(var/x=1, x<=W.Techniques.len, x++)
						var/path=text2path("[W.Techniques[x]]")
						for(var/obj/Skills/o in User)
							if(o.type == path)
								del o

		if(istype(src,/obj/Items/Gear/Prosthetic_Limb))
			if(User.is_arcane_beast)
				User << "A magical force surrounding your body repels the prosthetic."
				return
			if(!src.suffix)
				var/LimbCount=User.GetProsthetics()
				if(LimbCount>=User.Maimed)
					User << "You have enough replacements equipped already!"
					return
			var/obj/Items/W=src
			if(W.suffix=="*Equipped*")
				if(User.ActiveBuff)
					for(var/x in src.Techniques)
						var/Path1=text2path("[User.ActiveBuff.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
				for(var/obj/Skills/Buffs/SlotlessBuffs/Gear/G in usr.SlotlessBuffs)
					for(var/x in src.Techniques)
						var/Path1=text2path("[G.type]")
						var/Path2=text2path("[x]")
						if(Path1==Path2)
							User << "You can't take off [src] while one of its techniques is being used!"
							return
			W.AlignEquip(User)
			sleep(1)
			if(W.suffix=="*Equipped*")
				if(W.Techniques.len>0)
					for(var/x=1, x<=W.Techniques.len, x++)
						var/path=text2path("[W.Techniques[x]]")
						var/obj/Skills/o = new path
						o.CooldownStatic=1
						if(!locate(o, User))
							User.AddSkill(o)
							o.AssociatedGear=src
				if(W.PermEquip)
					User<<"The item merges with your body!"
			else
				if(W.Techniques.len>0)
					for(var/x=1, x<=W.Techniques.len, x++)
						var/path=text2path("[W.Techniques[x]]")
						for(var/obj/Skills/o in User)
							if(o.type == path)
								del o

		Steal
		if(Looted)
			var/mob/Players/OldLoc=src.loc
			OMsg(usr, "[usr] steals [src] from [OldLoc]!")
			usr.contents+=src
			usr.Grid("Loot", Lootee=OldLoc)



obj/Items/verb
	Bolt()
		set src in oview(1)
		set category=null
		if(src.Pickable||istype(src,/obj/Items/Gear/Mobile_Suit))
			if(!src.AllowBolt)
				usr<<"You can't bolt this down."
				return

		if(!src.Grabbable)
			if(usr.ckey!=src.CreatorKey || ((src.CreatorSignature!=usr.EnergySignature) && src.CreatorSignature))
				usr<<"This doesn't belong to you..."
				return
			src.Grabbable=1
			view(10,usr)<<"[usr] unbolted [src]"
		else
			for(var/obj/Items/i in loc) if(!i.Grabbable)
				usr<<"There is already something else bolted here."
				return
			if(usr.ckey!=src.CreatorKey || ((src.CreatorSignature!=usr.EnergySignature) && src.CreatorSignature))
				usr<<"This doesn't belong to you..."
				return
			src.Grabbable=0
			view(10,usr)<<"[usr] bolted [src]"

			if(istype(src,/obj/Items/Tech/Door))
				src.Password=input(usr,"Do you wish to install a password lock?") as text
				if(!src)
					return

mob/var/tmp/Customizing