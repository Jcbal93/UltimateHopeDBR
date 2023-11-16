obj/Skills/Buffs
	Cooldown=1
//Stats
	var/PowerInvisible=1//multiplies stealth RPP
	var/PowerMult=1
	var/PowerReplacement=0
	var/StrReplace=0
	var/EndReplace=0
	var/SpdReplace=0
	var/ForReplace=0
	var/OffReplace=0
	var/DefReplace=0
	var/RegenReplace=0
	var/RecovReplace=0
	var/EnergyReplace=0
	var/StrMult=1
	var/EndMult=1
	var/SpdMult=1
	var/ForMult=1
	var/OffMult=1
	var/DefMult=1
	var/RegenMult=1
	var/RecovMult=1
	var/EnergyMult=1
//Slot definitions and requirements
	var/BuffName
	var/ActiveSlot//Takes active slots.
	var/SpecialSlot//Takes special slots.
	var/Slotless//Is it actually slotless?
	var/SlotlessOn=0//No slot to fill; this is how you keep track of slotless buffs.
	var/StanceSlot//Uses your stance slot.
	var/StyleSlot//Uses your style slot.
	var/UsesStance//Cant use basic stances with this.
	var/StanceActive//sets your active stance
	var/StyleActive//sets your style
	//NoSword//Can't use swords with this.
	//NeedsSword//Have to use swords with this.
	var/list/ABuffNeeded=null
	var/SBuffNeeded//special buff req
	var/UBuffNeeded//universal (slotless) buff req, not used/implemented yet
	var/NeedsAnger//Cant use the buff before youre angry.
	var/NeedsHealth//Cant use the buff before youre below x health.
	var/NeedsSSJ//defines if buff only can be used in SSJ and in what level
	var/NeedsTrans//same as above but for non-SSJ
	var/NeedsTier//you gotta be good enough in your Saga to use
	var/WarpZone//Tick this if it teleports you somewhere...
	var/mob/Players/WarpTarget//Keeps a copy of the key of the person warped.
	var/WarpX//then use these to determine where.
	var/WarpY
	var/WarpZ
	var/Fusion//Adds a whole bunch of restrictions.
	var/FusionFailure//...and if you fuck it up...
	var/OldLocX//These are used to return to the previous location.
	var/OldLocY
	var/OldLocZ
	var/UnrestrictedBuff//You can use this with ENNETHING.
	var/NoRevert=0//no reversion during thing.
	var/Range//only for targetted shit
	var/ForcedRange//you need to be -exactly- in the distance
//Costs, drains and timers
	//AllOutAttack - IGNORE COSTS, DO IT ANYWAY.
	//HealthCost - One time cost of health to activate buff.
	//ManaCost - One time cost of mana to activate buff.
	//WoundCost=0 // One time cost of wounds to activate.
	///FatigueCost=0// On time cost of fatigue to activate.
	var/RegenerateLimbs//DOES IT REGENERATE LIMBS?!
	var/StableHeal//does it care about your regen/recov
	var/HealthDrain=0//Subtracted every second the buff is up.
	var/HealthHeal=0
	var/HealthThreshold=0//Lowest health that the buff can be up at.
	var/EnergyDrain=0
	var/EnergyHeal=0
	var/EnergyThreshold=0
	var/ManaDrain=0
	var/ManaHeal=0
	var/ManaThreshold=0
	var/WoundDrain=0//Added every second a buff is active.
	var/WoundHeal=0
	var/WoundThreshold=0//Highest wound that the buff can be at before shutting off.
	var/FatigueDrain=0//Added every second a buff is active.
	var/FatigueHeal=0
	var/FatigueThreshold=0//Highest fatigue that the buff can be at before shutting off.
	var/CapacityDrain=0
	var/CapacityHeal=0
	var/CapacityThreshold=0
	var/TimerLimit//If the buff has a timer, this will be filled.
	var/Timer//How long youve been in the buff.  If this exceeds Timer Limit, it will snap you out of it.
	var/PhysicalHits//Unarmed or Sword hits
	var/PhysicalHitsLimit
	var/UnarmedHits//Just Unarmed
	var/UnarmedHitsLimit
	var/SwordHits//Just sword
	var/SwordHitsLimit
	var/SpiritHits//Ki attacks
	var/SpiritHitsLimit
	var/DashCount
	var/DashCountLimit
	var/CastingTime=0//how long does the buff take to perform
	var/ManaGlow
	var/ManaGlowSize
	var/ArmamentGlow
	var/ArmamentGlowSize

	var/BleedHit//Makes you deal damage to yourself when you hit.
	var/ManaLeak//Makes you spend mana when you hit
	var/EnergyLeak
	var/FatigueLeak//Makes you gain fatigue when you hit.
	var/WoundNerf//BP wounds
	var/OverClock//Gates level for things that arent gates.
	var/HealthCut//Permanently removes a portion of HP.  1=100%, 0.05=5%, and so on.
	var/EnergyCut//Reaching 1 with health/energy will kill you, btw.
	var/ManaCut//Reaching 1 with this will not.
	var/StrCut//These will not regenerate
	var/EndCut
	var/SpdCut
	var/ForCut
	var/OffCut
	var/DefCut
	var/RegenCut
	var/RecovCut
	var/StrTax//These will regenerate
	var/EndTax
	var/SpdTax
	var/ForTax
	var/OffTax
	var/DefTax
	var/RegenTax
	var/RecovTax
	//These variables will accumulate at [this value] per second
	var/StrTaxDrain
	var/StrCutDrain
	var/EndTaxDrain
	var/EndCutDrain
	var/SpdTaxDrain
	var/SpdCutDrain
	var/ForTaxDrain
	var/ForCutDrain
	var/OffTaxDrain
	var/OffCutDrain
	var/DefTaxDrain
	var/DefCutDrain
	var/RegenTaxDrain
	var/RegenCutDrain
	var/RecovTaxDrain
	var/RecovCutDrain
	var/TaxThreshold//If this is flagged, going over the value will start generating cuts rather than taxes.
	var/MaimCost
//Aesthetics
	icon='BLANK.dmi'//Normal icons
	//pixel x
	//pixel y
	var/PowerGlows
	var/StripEquip//LETS GET NAKED
	var/FlashChange
	var/DarkChange
	var/FlashFusion
	var/FlashDraw
	var/NameTrue
	var/NameFake
	var/IconLock//If this has a value, it is used for the icon always.
	var/IconLockBlend=1
	var/IconLayer=2//customization eventually
	var/LockX//These are used to make sure the locked icon is always in place.
	var/LockY
	var/IconUnder//places the lock as underlay instead
	var/IconApart//KEEP_APART the overlay alpha and color wise
	var/IconRelayer//if it needs to go under TopOverlay/hair
	var/TopOverlayLock//subs out the aura
	var/TopOverlayX
	var/TopOverlayY
	var/NoTopOverlay=0
	var/AuraLock//subs out the aura
	var/AuraUnder//specifically for underlay auras
	var/AuraX
	var/AuraY
	var/HairLock//subs out the aura
	var/HairBX
	var/HairBY
	var/Enlarge//Makes icon get fukcnig huge. TODO: Replace all functionalities with ProportionShift
	var/ProportionShift//uses transfrom matrix to fuck with proportions
	var/IconReplace//Icon replaces base icon.
	var/IconTransform//COMPLETE HENSHIN
	var/TransformX
	var/TransformY
	var/IconTint//tints the base icon + current hair
	var/ClientTint//just for checks
	var/OldIcon//Holds old base icon.
	var/OldX//Old pixels.
	var/OldY
	var/DropOverlays//Using buff erases overlays.
	var/Earthshaking//makes ppl screens go woozowyfp when u activate buff hehe
	var/KenWave//makes Kiai shockwaves
	var/KenWaveIcon='fevKiai.dmi'
	var/KenWaveSize=1
	var/KenWaveBlend=1
	var/KenWaveTime=12
	var/KenWaveX
	var/KenWaveY
	var/KKTWave//makes Kiai shockwaves UNDER YOU
	var/KKTWaveIcon='fevKiai.dmi'
	var/KKTWaveSize=1
	var/KKTWaveX
	var/KKTWaveY
	var/DustWave
	var/ActiveMessage//what do you think it does?!
	var/OffMessage
	var/TextColor//Makes messages appear a certain color.
	var/HitSpark
	var/HitX=0
	var/HitY=0
	var/HitTurn=0
	var/HitSize=1
	var/TargetOverlay//puts overlay on target
	var/TargetOverlayX
	var/TargetOverlayY
	var/OverlaySize=1//self-explanatory
//	var/TopOverlaySize=1//self-explanatory
	var/OverlayTransLock//forgo the above
	var/Connector//some sort of link between user and target
	var/IconShadow
	var/IconOutline
	var/TurfShift
	var/TurfShiftLayer
	var/TrailImage
	var/VanishImage
//PU modifiers
	var/PULock//No PU.
	var/AllowedPower//declares buffs to be used at low power levels
	var/PUForce//Minus levels from PUlock.
	var/ConstantPU//PU never slows.
	var/UnlimitedPU//Lets you PU forever.
	var/EffortlessPU//Sets a value that you don't drain while you're under.
	var/HighestPU//sets a value added to your PU threshold.
	var/PUDrainReduction=0//Only reduces drain by this amount.
	var/PUSpeedModifier=0//Reduces PU gain
	var/EnergyExpenditure
	var/PURestrictionRemove//Sets Spiral Energy var
	var/ManaPU//When this is flagged, you will burn mana while powering up instead of energy.
	var/HealthPU//when this is flagged, you will burn health while powering up instead of energy.
	var/PUSpike=0//Add this amount of PowerControl on activation, subtract it on deactivation.
	var/AllOutPU//When the buff is turned off, all PU is lost.
//Offense stuff
	//HolyMod//Adds holy mod.
	//AbyssMod//Adds abyss mod.
	//Purity//Can only damage what it's designed to damage (Abyss for holy, Holy for abyss, humans for slayer)
	var/KiBlade//its fooken ki blade m8
	var/SpiritStrike//Punches with FORCE only
	var/SpiritHand//Sunlight stance passive.
	var/SpiritFlow//Moonlight stance passive.
	var/HybridStrike//Punches with For/Str
	var/PridefulRage//Ignore defenses.
	var/NoWhiff//Melee attacks won't whiff.
	//NoForcedWhiff//THEY WON'T WHIFF EVEN HARDER NOW
	//Instinct - go away, AIS/WS
	var/Steady//Consistent damage.
	var/HotHundred//No nerf on light attacks.
	var/Extend//Autohits reach longer.
	var/CriticalChance//Sets the chance to inflict a critical attack.
	var/CriticalDamage//Sets the critical multiplier.
	var/SureHitTimerLimit//Causes a constant CD for sure hit moves to proc.
	var/Duelist//does more damage/take less damage if hitting the person youre targetting; you take more damage if someone youre not targetting hits you and do less damage to them
	var/Vanishing//make invisible and autocombo
	var/UnarmedDamage
	var/SpiritualDamage
	var/MovementMastery//1.x is added to effective PU percent.
//Defense stuff
	var/KBMult//Adds KB Mult to everything.
	var/KBRes//Sets knockback resistance.
	var/KBAdd//Adds KB Add to everything.
	var/FluidForm//Makes all attacks whiff.
	var/GiantForm//Makes all attacks roll low
	var/BioArmor//Honest Vaizard Health
	var/VaizardHealth//Triggers vaizard health passive.
	var/VaizardShatter//Shatters when Vai Health runs out.
	var/Siphon//Raijuu shit
	var/Juggernaut//no KB, harder to launch after stabilizing
	//var/NoDodge//everything hits you
	var/CriticalBlock//Holds the value of division
	var/BlockChance//Holds the chance of blocking.
	var/SureDodgeTimerLimit
	var/Flow//makes you dodge without AIS/WS
	var/CounterMaster//Punch people back with ur queus
	var/Unstoppable//regen through fatigue and injury
	var/DebuffImmune//idgaf about elements
	var/VenomImmune//idgaf about poison tiles
	var/InjuryImmune//duh
	var/FatigueImmune//duuh
//Mobility stuff
	var/Warp//Forces light attacks, but doesnt reduce damage as much.
	var/Godspeed//Adds godspeed.
	var/Afterimages//Makes afterimages.
	var/SpaceWalk//Gives spacewalk.
	var/StaticWalk//Gives staticwalk.
	var/WalkThroughHell//idgaf about lava tiles
	var/WaterWalk//idgaf about water tiles
	var/Warping//Makes you home.  Dear God...
	var/Flicker//makes you nothing personell kid...
	var/Incorporeal//Makes you vanish.
	var/Pursuer//gives low cd DDash
	var/QuickCast//Reduces casting times by this value
	var/DualCast//If you have this, your spells pop off once again
	var/MovingCharge//battlemage
	var/SuperDash//Longer, more aesthetic dragondash
	var/TechniqueMastery//Cooldowns are divided by 1.x this value
	var/SweepingStrike//wingblade style attack zone
//Staff stuff
	var/MakesStaff//Does the buff make a staff?
	var/StaffClass//Is it locked to a class?
	var/StaffIcon//Alt icon
	var/StaffX//Alt X
	var/StaffY//Alt Y
	var/StaffIconUnder
	var/StaffXUnder
	var/StaffYUnder
	var/StaffName//Name (for het l0lz)
	var/StaffAscension//
	var/StaffElement//Set an element to the conjured staff
//Armor stuff
	var/MakesArmor//Conjures armor which is then equipped.
	var/NeedsArmor
	var/ArmorElement
	var/ArmorClass
	var/ArmorIcon
	var/ArmorX
	var/ArmorY
	var/ArmorIconUnder
	var/ArmorXUnder
	var/ArmorYUnder
	var/ArmorName
	var/ArmorAccuracy
	var/ArmorDamage
	var/ArmorDelay
	var/ArmorAscension
	var/ArmorKill
//Sword stuff
	var/NeedsSecondSword//MOAR!!
	var/NeedsThirdSword//MOAAR!!
	var/MakesSword//Conjures a sword which is then equipped.
	var/MakesSecondSword//Conjures a second sword which is then equipped.
	var/MakesThirdSword
	//One day, we may need to make third swords.  But fuck that shit, for real, yo.
	var/SwordClass//Makes a class of sword.
	var/SwordClassOld//stores old class for wepaon transform shenanigans
	var/SwordIcon//Forces sword to have a particular icon.
	var/SwordIconOld//stores old icon for the sword
	var/SwordX//pixel_x and y for sword.
	var/SwordY
	var/SwordIconUnder
	var/SwordXUnder
	var/SwordYUnder
	var/SwordUnbreakable
	var/SwordElement
	var/SwordXOld//pixel_x and y for sword.
	var/SwordYOld
	var/SwordClassSecond
	var/SwordClassSecondOld
	var/SwordIconSecond
	var/SwordIconSecondOld
	var/SwordXSecond
	var/SwordYSecond
	var/SwordElementSecond
	var/SwordXSecondOld
	var/SwordYSecondOld
	var/SwordClassThird
	var/SwordClassThirdOld
	var/SwordIconThird
	var/SwordIconThirdOld
	var/SwordXThird
	var/SwordYThird
	var/SwordXThirdOld
	var/SwordYThirdOld
	var/SwordName
	var/SwordElementThird
	var/SwordNameSecond//gives the sword a particular name
	var/SwordNameThird//gives the sword a particular name
	var/SwordAccuracy//Adds to swords accuracy
	var/SwordAccuracySecond
	var/SwordAccuracyThird
	var/SwordDamage//Adds to swords damage
	var/SwordDamageSecond
	var/SwordDamageThird
	var/SwordDelay//Adds to swords delay
	var/SwordDelaySecond
	var/SwordDelayThird
	var/SwordAscension
	var/SwordAscensionSecond//ascension level buff. buffs everything and shatterproofs
	var/SwordAscensionThird//ascension level buff. buffs everything and shatterproofs
	var/SpiritSword//ACTUALLY MAKES A SPIRIT SWORD FFS
	var/MagicSword//sword is treated as a staff. only a staff. heh.
	var/MagicSwordSecond
	var/MagicSwordThird
	var/KillSword//Kills the sword when the buff is removed.
//Anger stuff
	var/AutoAnger//Flicks anger on
	var/AngerMult//Mults anger.
	var/AngerThreshold//If anger is lower than this, it will set your anger.
	var/CalmAnger//Adds your anger to power mult.
	var/AngerStorage//holds your anger so that calm anger doesnt bug you the FUCK out.
	var/WaveringAngerLimit//Every time this amount of seconds passes, there is a chance for your anger to fail for the same interval.
	var/WaveringAnger//This tallies how long the current increment is.
	var/NoAnger//Cant be mad about that...
	var/AngerMessage//modifies anger message
	var/OldAngerMessage//holds old anger message
//Mana stuff
	var/ManaCapMult//Times your maximum mana by this value.
	var/ManaAdd//Adds this mana when used, removes this amount when turned off.
	var/ManaStats//If mana is over cap, times all stats by 1.5x*This value.  i.e. 0.5 mana stats would give 1.25x
	var/DrainlessMana//You cant lose mana.  Seriously.
	var/LimitlessMagic//Nothing will stop you from casting, ever.
	var/MartialMagic//muscle wizardry
//Special stuff
	var/TransLock//lock transes
	var/TransMimic//adds to trans active value
	var/MaimMastery//ignore maims
	var/Reversal//counter autohits
	var/Desperation//Sets desperation value.  Does cool shit.
	var/Tension=0//Holds Tension value. Does cool shit.
	var/KiControl//will be used to make sure you dont drop PU percents and get your PU stats
	var/KiControlMastery//ticks KiControl var.
	//var/DarknessFlame//makes funny thing with fire
	var/GatesLevel//A tag for gates which sets the nerf and nerf time.
	var/ShuttingGates//This has to be flagged for gates nerf to trigger.
	var/WeaponBreaker//Adds weaponbreaker variable.
	var/StealsResources//Steals resources...come on...
	var/StealsStats//
	var/ManaSeal//Seals this amount per 1 damage delivered.
	var/ArcaneBladework//sets ArcaneBladework.
	var/BuffMastery//Reduce nerfs and buff buffs.
	var/Curse//sets your Cursed Wound Variable, maybe some other stuff later
	var/FusionPowered
	var/Overdrive//synergy with cyber bp, androids, fusion cores and cyber modules
	var/OldEffortlessPU
	var/Intimidation//showy power
	var/Transform//triggers Transformations
	var/ElementalOffense//changes your elemental offense
	var/ElementalDefense//likewise
	var/ElementalEnchantment//sets elements on unenchanted swords/staves
	var/Kaioken//ITS KAIOKEN, BITCH.
	var/InstantAffect//instantly dump all affects
	var/InstantAffected//binary to check if debuffs were dumped
	var/BurnAffected//it adds burn stacks
	var/SlowAffected
	var/ShockAffected
	var/ShatterAffected
	var/PoisonAffected//it adds poison stacks
	var/CrippleAffected
	var/ShearAffected
	var/StunAffected//adds stun stacks
	var/BurningShot//It increases stats which burn out as you do
	var/MirrorStats//It makes your stats the same as the enemys.
	var/Erosion//It gradually reduces the enemys buffstats to 1.
	var/EndYourself//doh
	var/ExplosiveFinish//explodes when over
	var/ExplosiveFinishIntensity
	var/FINISHINGMOVE//It knocks the user out after it wears off.
	var/Duel//actually calls for 1v1 me faggot
	var/Invisible//Makes u invisible.
	var/SeeInvisible//makes u see the above
	var/Hardening//Makes you trigger the Hardening buff when hit.
	var/DebuffReversal//Makes you eat debuffs like mmm thats some tasty fuck
	var/StunningStrike//This value * 2.5 chance of inflicting 1 second stun.
	var/SpecialStrike//projectile attack triggers of normal when outta melee range
	var/GodKi//This adds an amount of God Ki.
	var/SenseUnlocked//like GodKi with bit less straightforward progression
	var/DefianceRetaliate//makes you counterattack with power being scaled off your missing health
	var/AffectTarget//doh
	var/Ripple//Use Oxygen
	var/BulletKill//kill bullets, duh
	var/Deflection//10% * this value to autodeflect anything that can be deflected
	var/CyberLimb//pretends you have more cyber slots
	var/Skimming//pretends youre flying
	var/Flight//actually flying
	var/BetterAim
	//var/SoftStyle//Defense / Opponent Speed * this value = Extra fatigue percent gain when hit.  Also adds fatigue into damage
	var/list/BuffTechniques=list()//techniques gained only while the buff is active
	var/Void//becum void person
	var/SpiritForm//racial for yokai; flip str and force mods
	var/LoseDurability//Sword durability gets nuked by this amount.  TODO: armor version?
	var/Mechanized//no more magic
	var/Piloting//use that brain for something
	var/Possessive//or let something else use it
	var/Xenobiology//weird body stuffs
	var/Maki//demon stuff
	var/Infatuated//cant harm what you love...
	var/AdrenalBoost//getting whacked gives you BP
	var/PoseEnhancement
	var/MagicFocus//operates as a magic focus
	var/DebuffCrash//immediately deals debuff damage
//Imitation
	var/Imitate//guh!
	var/ImitateBadly//guuuuuh!!
	var/ImitateName="???"
	var/ImitateBase='Imitate.dmi'
	var/list/ImitateOverlays=list()
	var/ImitateProfile
	var/ImitateTextColor="777777"
	var/OldName//Holds old name
	var/OldBase//Old base
	var/list/OldOverlays=list()//Old clothes
	var/OldProfile//Old profile
	var/OldTextColor//Old text color
	var/FakePeace=0
//Autonomous activation variables
	var/Autonomous=0
	var/PotionCD=0
	var/NeedsVary=0//alters the health threshold of an autonomous buff to make it less reliable
	var/NeedsPassword=0//allows alteration of buffs that are applied on-hit only
	var/NeedsAlignment=0//trigger conditionally on being good/evil
	var/TooMuchHealth=0//Once this value is passed, the buff deactivates.
	var/TooLittleMana=0//Once this value is passed, the buff deactivates.
	var/AlwaysOn=0//If the object exists in the target, its always on.  When it gets turned off, delete it
	var/ActiveBuffLock=0//Prevents active buffs from being used
	var/SpecialBuffLock=0//Prevents special buffs from being used
	var/TensionDrain=0//TODO: rename to tension lock


	proc
		Trigger(var/mob/User, Override=0)
			if(!Override && User.BuffingUp)
				return
			if(!Override)
				User.BuffingUp++
			if(src.DashCountLimit)
				src.DashCount=0
			User.UseBuff(src, Override)
			User.BuffingUp=0
			if(!src.BuffName)
				src.BuffName="[src.name]"
			return 1
	ActiveBuffs
		ActiveSlot=1
//THE ONE, THE ONLY!
		Ki_Control
			BuffName="Ki Control"
			KiControl=1
			UnrestrictedBuff=1//for the poor monkey men
			Cooldown=1
			EnergyThreshold=10
			EnergyLeak=1
			KKTWave=3
			KKTWaveSize=0.5
			OverlayTransLock=0//AuraLock=1, skip everything custom.
			ActiveMessage="augments their body with excess energy!"
			OffMessage="loosens the control on their ki..."
			verb/Customize_Powered_State()
				set category="Utility"
				var/list/Options=list("Cancel", "Overlay", "Top Overlay", "Aura", "Hair", "Text")
				if(usr.Race=="Makyo")
					Options.Add("Base")
				var/Option=input("What aspect do you wish to customize?", "Ki Control Customize") in Options
				if(Option=="Cancel")
					return
				else
					switch(Option)
						if("Overlay")
							src.IconLock=input(usr, "What icon do you want to display when activating Ki Control?", "Ki Control") as icon|null
							src.LockX=input(usr, "X offset?", "Ki Control") as num|null
							src.LockY=input(usr, "Y offset?", "Ki Control") as num|null
							var/Under=alert(usr, "Should this icon be displayed under the base rather than as an overlay?", "Ki Control", "No", "Yes")
							if(Under=="Yes")
								src.IconUnder=1
							else
								src.IconUnder=0
							var/Layer=alert(usr, "Should this icon force a relayer to appear under Top Overlays?", "Ki Control", "Yes", "No")
							if(Layer=="Yes")
								src.IconRelayer=1
							else
								src.IconRelayer=0
						if("Top Overlay")
							src.TopOverlayLock=input(usr, "What Top Overlay do you want to display when using Ki Control?", "Ki Control") as icon|null
							src.TopOverlayX=input(usr, "X offset?", "Ki Control") as num|null
							src.TopOverlayY=input(usr, "Y offset?", "Ki Control") as num|null
						if("Aura")
							var/Lock=alert(usr, "Should the aura displayed be your standard one?", "Ki Control", "No", "Yes")
							if(Lock=="Yes")
								src.AuraLock=1
							else
								src.AuraLock=input(usr, "What aura should be forced to display when using Ki Control?", "Ki Control") as icon|null
								src.AuraX=input(usr, "X offset?", "Ki Control") as num|null
								src.AuraY=input(usr, "Y offset?", "Ki Control") as num|null
							var/Under=alert(usr, "Should this aura be displayed under the base rather than as an overlay?", "Ki Control", "No", "Yes")
							if(Under=="Yes")
								usr.AuraLockedUnder=1
							else
								usr.AuraLockedUnder=0
						if("Hair")
							src.HairLock=input(usr, "What hair should be forced to display when using Ki Control?", "Ki Control") as icon|null
							src.HairBX=input(usr, "X offset?", "Ki Control") as num|null
							src.HairBY=input(usr, "Y offset?", "Ki Control") as num|null
						if("Text")
							src.ActiveMessage=input(usr, "What text do you want to display when entering Ki Control? This will always have your character name at the start.", "Ki Control") as text
							src.OffMessage=input(usr, "What text do you want to display when exiting Ki Control? This will always have your character name at the start.", "Ki Control") as text
							src.TextColor=input(usr, "What text color do you want to display? Default is #0080FF.", "Ki Control") as text|null
						if("Base")
							var/HulkOut=alert(usr, "Should the powered up state alter your base?", "Ki Control", "No", "Yes")
							if(HulkOut=="No")
								src.IconReplace=0
							else
								var/Lock=alert(usr, "Should the powered up state use your default expanded state?", "Ki Control", "No", "Yes")
								if(Lock=="Yes")
									src.icon=usr.ExpandBase
								else
									src.icon=input(usr, "What icon should replace your base when using Ki Control?", "Ki Control") as icon|null
									src.pixel_x=input(usr, "X offset?", "Ki Control") as num|null
									src.pixel_y=input(usr, "Y offset?", "Ki Control") as num|null
								src.IconReplace=1
		Gear
			PULock=1
			Mechanized=1
			Power_Armor
				PowerMult=1.25
				StrMult=1.4
				ForMult=1.5
				EndMult=1.6
				SpdMult=0.5
				MakesArmor=1
				ArmorClass="Heavy"
				ArmorIcon='BLANK.dmi'
				HairLock='BLANK.dmi'
				ActiveMessage="powers up their prototype steel exoskeleton!"
				OffMessage="burns out the power cell on their steel armor..."
				verb/Powered_Exoskeleton()
					set category="Skills"
					src.Trigger(usr)
			Power_Armor_Burst
				PowerMult=1.5
				StrMult=1.3
				ForMult=1.7
				EndMult=1.5
				RecovMult=0.5
				MakesArmor=1
				ArmorClass="Heavy"
				ArmorIcon='BLANK.dmi'
				HairLock='BLANK.dmi'
				ActiveMessage="powers up their high firepower armor!"
				OffMessage="burns out the power cell on their burst armor..."
				verb/Power_Armor_Burst()
					set category="Skills"
					src.Trigger(usr)
			Power_Armor_Burly
				PowerMult=1.5
				StrMult=1.5
				ForMult=1.2
				EndMult=1.8
				RecovMult=0.5
				MakesArmor=1
				ArmorClass="Heavy"
				ArmorIcon='BLANK.dmi'
				HairLock='BLANK.dmi'
				ActiveMessage="powers up their bulky armor!"
				OffMessage="burns out the power cell on their bulwark..."
				verb/Power_Armor_Burly()
					set category="Skills"
					src.Trigger(usr)
			Power_Armor_Blitz
				PowerMult=1.5
				StrMult=1.2
				ForMult=1.2
				EndMult=1.4
				SpdMult=1.7
				RecovMult=0.5
				MakesArmor=1
				ArmorClass="Heavy"
				ArmorIcon='BLANK.dmi'
				HairLock='BLANK.dmi'
				ActiveMessage="powers up their speedy armor!"
				OffMessage="burns out the power cell on their blitz armor..."
				verb/Power_Armor_Blitz()
					set category="Skills"
					src.Trigger(usr)
			Mobile_Suit
				ManaHeal=100
				InstantAffect=1
				PowerReplacement=10
				GiantForm=1
				Piloting=1
				FusionPowered=1
				NoAnger=1
				SpecialBuffLock=1
				DebuffImmune=0.25
				BuffTechniques=list("/obj/Skills/Buffs/SlotlessBuffs/WeaponSystems/Skim","/obj/Skills/Projectile/Gear/Installed/Installed_Plasma_Gatling","/obj/Skills/Projectile/Gear/Installed/Installed_Missile_Launcher")
				ActiveMessage="powers up their giant mobile suit!"
				OffMessage="burns out the fusion cell in their mecha..."
//Tier S
		Eight_Gates
			StrMult=1.5
			SpdMult=1.5
			PULock=1
			KiControl=1
			NoSword=1
			InstantAffect=1
			StableHeal=1
			FatigueHeal=0
			EnergyHeal=100
			Flicker=0
			SuperDash=0
			AuraLock='BLANK.dmi'
			IconLock='BLANK.dmi'
			IconLockBlend=2
			IconUnder=1
			IconApart=1
			LockX=0
			LockY=0
			TimerLimit=600
			BuffName="Eight Gates"
			verb/Close_Gates()
				set category="Skills"
				if(usr.ActiveBuff&&usr.GatesActive)
					if(usr.GatesActive>=7)
						src.Cooldown=1500
					if(usr.GatesActive>=5)
						src.Cooldown=300
					if(usr.GatesActive<5)
						src.Cooldown=60
					src.OffMessage="shuts their Gates..."
					src.ShuttingGates=1
					src.Trigger(usr)
					src.ShuttingGates=0
				else
					usr << "You can't close the Gates because they aren't open!!"
			verb/Gate_One()
				set hidden=1
				if(usr.SagaLevel<1)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>1)
					usr << "You have a higher gate unlocked already!"
					return
				if(1>usr.GatesActive)
					src.Cooldown=0
					src.GatesLevel=1
					src.PUSpike=50
					src.PUDrainReduction=1.25
					src.Flicker=1
					src.Godspeed=1
					src.SuperDash=0
					src.FatigueHeal=0
					src.FatigueThreshold=0
					src.IconLock=null
					src.AuraLock='BLANK.dmi'
					src.KenWave=0
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Two()
				set hidden=1
				if(usr.SagaLevel<2)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>2)
					usr << "You have a higher gate unlocked already!"
					return
				if(2>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=2
					src.PUSpike=75
					src.PUDrainReduction=1.5
					src.Flicker=1
					src.Godspeed=1
					src.SuperDash=0
					src.FatigueHeal=30
					src.FatigueThreshold=0
					src.IconLock=null
					src.AuraLock='BLANK.dmi'
					src.KenWave=0
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Three()
				set hidden=1
				if(usr.SagaLevel<3)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>3)
					usr << "You have a higher gate unlocked already!"
					return
				if(3>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=3
					src.PUSpike=100
					src.PUDrainReduction=1.75
					src.Flicker=2
					src.Godspeed=2
					src.SuperDash=1
					src.FatigueHeal=40
					src.FatigueThreshold=0
					src.IconLock='GatesInner.dmi'
					src.LockX=-32
					src.LockY=-32
					src.KenWave=2
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Four()
				set hidden=1
				if(usr.SagaLevel<4)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>4)
					usr << "You have a higher gate unlocked already!"
					return
				if(4>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=4
					src.PUSpike=125
					src.PUDrainReduction=2
					src.Flicker=2
					src.Godspeed=2
					src.SuperDash=1
					src.FatigueHeal=50
					src.FatigueThreshold=0
					src.IconLock='GatesInner.dmi'
					src.LockX=-32
					src.LockY=-32
					src.KenWave=2
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Five()
				set hidden=1
				if(usr.SagaLevel<5)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>5)
					usr << "You have a higher gate unlocked already!"
					return
				if(5>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=5
					src.PUSpike=150
					src.PUDrainReduction=2.25
					src.Flicker=2
					src.Godspeed=2
					src.SuperDash=1
					src.FatigueHeal=60
					src.FatigueThreshold=0
					src.IconLock='GatesInner.dmi'
					src.LockX=-32
					src.LockY=-32
					src.KenWave=4
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Six()
				set hidden=1
				if(usr.SagaLevel<6)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>6)
					usr << "You have a higher gate unlocked already!"
					return
				if(6>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=6
					src.PUSpike=175
					src.PUDrainReduction=2.5
					src.Flicker=3
					src.Godspeed=3
					src.SuperDash=1
					src.FatigueHeal=70
					src.FatigueThreshold=0
					src.IconLock='GatesInner.dmi'
					src.LockX=-32
					src.LockY=-32
					src.KenWave=4
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Seven()
				set hidden=1
				if(usr.SagaLevel<7)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>7)
					usr << "You have a higher gate unlocked already!"
					return
				if(7>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=7
					src.PUSpike=200
					src.PUDrainReduction=2.75
					src.Flicker=3
					src.Godspeed=3
					src.SuperDash=1
					src.FatigueHeal=80
					src.FatigueThreshold=0
					src.IconLock='FlameGlowHades.dmi'
					src.LockX=-16
					src.LockY=-4
					src.KenWave=4
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Gate_Eight()
				set hidden=1
				if(usr.SagaLevel<8)
					usr << "This gate isn't unlocked!"
					return
				if(usr.GatesActive>8)
					usr << "You have a higher gate unlocked already!"
					return
				if(8>usr.GatesActive)
					if(usr.CheckActive("Eight Gates"))
						src.Trigger(usr)
					src.Cooldown=0
					src.GatesLevel=8
					src.PUSpike=900
					src.PUDrainReduction=10
					src.Flicker=4
					src.Godspeed=4
					src.SuperDash=2
					src.FatigueHeal=90
					src.FatigueThreshold=0
					src.IconLock='FlameGlowHerc.dmi'
					src.LockX=-16
					src.LockY=-4
					src.KenWave=6
					src.ActiveMessage=0
					src.OffMessage=0
					src.Trigger(usr)
				else
					return
			verb/Open_Gates()
				set category="Skills"
				var/NextGate=usr.GatesActive+1
				if(NextGate>8 || NextGate > usr.SagaLevel)
					if(NextGate > usr.SagaLevel && !(NextGate>8)) src << "You do not have any higher levels of gates unlocked."
					return
				switch(NextGate)
					if(1)
						src.Gate_One()
					if(2)
						src.Gate_Two()
					if(3)
						src.Gate_Three()
					if(4)
						src.Gate_Four()
					if(5)
						src.Gate_Five()
					if(6)
						src.Gate_Six()
					if(7)
						src.Gate_Seven()
					if(8)
						src.Gate_Eight()


		Weapon_Soul
			PULock=1
			NeedsSword=1
			BuffName="Soul Resonance"
			verb/Resonant_Weapon()
				set hidden=1
				if(!usr.BuffOn(src))
					src.PowerMult=1.5
					src.StrMult=1.3
					src.EndMult=1
					src.ForMult=1.2
					src.OffMult=1.3
					src.DefMult=1.2
					src.RegenMult=1
					src.HolyMod=0
					src.AbyssMod=0
					src.Purity=0
					src.Steady=0
					src.SpiritSword=0
					src.EnergyGeneration=0
					src.EnergySteal=0
					src.LifeGeneration=0
					src.LifeSteal=0
					src.HealthDrain=0
					src.BleedHit=0
					src.Curse=0
					src.WeaponBreaker=0
					src.SwordIcon=null
					src.SwordIconOld=null
					src.SwordName=null
					src.ActiveMessage="imbues their weapon with their own soul!"
					src.OffMessage="severs the connection..."
				src.Trigger(usr)
			verb/Ascended_Resonant_Weapon()
				set hidden=1
				if(usr.SagaLevel<4)return
				if(!usr.BuffOn(src))
					var/UsedType
					if(locate(/obj/Skills/Queue/Holy_Blade, usr))
						UsedType="Holy Blade"
					if(locate(/obj/Skills/Queue/Darkness_Blade, usr))
						UsedType="Corrupt Edge"
					switch(UsedType)
						if("Holy Blade")
							src.PowerMult=1.5
							src.StrMult=1.3
							src.EndMult=1.2
							src.ForMult=1
							src.OffMult=1.2
							src.DefMult=1.3
							src.RegenMult=1
							src.HolyMod=1
							src.Purity=0
							src.Steady=0
							src.NoWhiff=0
							src.SpiritSword=0
							src.EnergyGeneration=0
							src.LifeGeneration=0
							src.BleedHit=0
							src.SwordIcon=null
							src.SwordIconOld=null
							src.SwordName=null
							src.ActiveMessage="combines the radiance of their own soul with the power of their blade!"
							src.OffMessage="releases the power of their holy soul..."
						if("Corrupt Edge")
							src.PowerMult=1.5
							src.StrMult=1.4
							src.EndMult=1
							src.ForMult=1.3
							src.OffMult=1.3
							src.DefMult=1
							src.RegenMult=1
							src.AbyssMod=1
							src.Steady=0
							src.EnergyGeneration=0
							src.LifeGeneration=0
							src.LifeSteal=0
							src.Curse=0
							src.BleedHit=0
							src.SwordIcon=null
							src.SwordIconOld=null
							src.SwordName=null
							src.ActiveMessage="combines the corruption of their own soul with the might of their sword!"
							src.OffMessage="releases the power of their dark spirit..."
				src.Trigger(usr)
			verb/Legendary_Weapon()
				set hidden=1
				if(usr.SagaLevel<6)return
				if(!usr.BuffOn(src))
					var/WeaponSoulType=usr.GetWeaponSoulType()
					switch(WeaponSoulType)
						if("Caledfwlch")
							if(locate(/obj/Skills/Queue/Holy_Blade, usr))
								src.PowerMult=1.5
								src.StrMult=1.3
								src.EndMult=1
								src.ForMult=1.3
								src.OffMult=1.4
								src.DefMult=1
								src.RegenMult=1
								src.HolyMod=3
								src.AbyssMod=0
								src.SpiritSword=0.25
								src.NoWhiff=0
								src.NoForcedWhiff=0
								src.SwordName="Caledfwlch"
								src.SwordIcon='Caledfwlch-True.dmi'
								src.ActiveMessage="calls forth the true form of Caledfwlch, the Sword of Glory!"
								src.OffMessage="conceals Caledfwlch's glory..."
							else if(locate(/obj/Skills/Queue/Darkness_Blade, usr))
								src.PowerMult=1.5
								src.StrMult=1.5
								src.EndMult=1
								src.ForMult=1.5
								src.OffMult=1.5
								src.DefMult=1.1
								src.RegenMult=0.5
								src.HolyMod=0
								src.AbyssMod=3
								src.SpiritSword=0.25
								src.NoWhiff=0
								src.NoForcedWhiff=0
								src.SwordName="Caledfwlch"
								src.SwordIcon='Caledfwlch-Morgan.dmi'
								src.ActiveMessage="calls forth the true form of Caledfwlch Morgan, the Shadow Sword of Glory!"
								src.OffMessage="conceals Caledfwlch's glory..."
						if("Kusanagi")
							src.PowerMult=1.5
							src.StrMult=1.1
							src.EndMult=1.1
							src.ForMult=1.2
							src.OffMult=1.3
							src.DefMult=1.3
							src.RegenMult=1
							src.HolyMod=3
							src.ManaGeneration=100
							src.SwordName="Kusanagi"
							src.ActiveMessage="calls forth the true form of Kusanagi, the Sword of Faith!"
							src.OffMessage="seals Kusanagi's faith..."
						if("Durendal")
							src.PowerMult=1.5
							src.StrMult=1.7
							src.EndMult=1.4
							src.ForMult=0.8
							src.OffMult=1.1
							src.DefMult=1
							src.RegenMult=1
							src.HolyMod=3
							src.LifeGeneration=30
							src.SwordName="Durendal"
							src.ActiveMessage="calls forth the true form of Durendal, the Sword of Hope!"
							src.OffMessage="hides the hope of Durendal..."
						if("Masamune")
							src.PowerMult=1.5
							src.StrMult=1
							src.StrMult=1
							src.EndMult=1.5
							src.ForMult=1
							src.OffMult=1
							src.DefMult=1.5
							src.RegenMult=1
							src.HolyMod=5
							src.Purity=1//Can only hurt evil things.
							src.Steady=9//Always 100% damage.
							src.SwordName="Masamune"
							src.ActiveMessage="calls forth the true form of Masamune, the Sword of Purity!"
							src.OffMessage="relaxes the light of Masamune..."
						if("Soul Calibur")
							if(locate(/obj/Skills/Queue/Holy_Blade, usr))
								src.PowerMult=1.5
								src.StrMult=1.1
								src.EndMult=1.4
								src.ForMult=1
								src.OffMult=1.3
								src.DefMult=1.3
								src.RegenMult=1
								src.HolyMod=3
								src.LifeGeneration=10
								src.Steady=5//Always 50% damage.
								src.SwordName="Soul Calibur"
								src.SwordIcon='SoulCalibur.dmi'
								src.ActiveMessage="calls forth the true form of Soul Calibur, the Purified Blade of Order!"
								src.OffMessage="restricts Soul Calibur's order..."
							if(locate(/obj/Skills/Queue/Darkness_Blade, usr))
								src.PowerMult=1.5
								src.StrMult=1.1
								src.EndMult=1.7
								src.ForMult=1
								src.OffMult=1.2
								src.DefMult=1.3
								src.RegenMult=0.5
								src.AbyssMod=3
								src.LifeGeneration=10
								src.Steady=5//Always 50% damage.
								src.SwordName="Soul Calibur"
								src.SwordIcon='SoulCalibur-Crystal.dmi'
								src.ActiveMessage="calls forth the true form of Soul Calibur, the Crystal Blade of Order!"
								src.OffMessage="restricts Soul Calibur's order..."
						if("Soul Edge")
							src.PowerMult=1.5
							src.StrMult=2
							src.EndMult=1.2
							src.ForMult=1
							src.OffMult=1.5
							src.DefMult=0.8
							src.RegenMult=0.5
							src.AbyssMod=5
							src.Steady=8
							src.Extend=1
							src.BleedHit=1
							src.SwordName="Soul Edge"
							src.ActiveMessage="calls forth the true form of Soul Edge, the Blade of Chaos!"
							src.OffMessage="releases Soul Edge's chaos..."
						if("Muramasa")
							src.PowerMult=1.5
							src.StrMult=1.3
							src.EndMult=1
							src.ForMult=1.3
							src.OffMult=1.6
							src.DefMult=1.3
							src.RegenMult=0.5
							src.AbyssMod=3
							src.EnergySteal=40//if 100 damage is done, regenerate 40% energy.
							src.WeaponBreaker=2
							src.SwordName="Muramasa"
							src.ActiveMessage="calls forth the true form of Muramasa, the Bane of Blades!"
							src.OffMessage="casts Muramasa back into the darkness..."
						if("Dainsleif")
							src.PowerMult=1.5
							src.StrMult=1.5
							src.EndMult=1.4
							src.ForMult=1
							src.OffMult=1.4
							src.DefMult=1.2
							src.RegenMult=0.5
							src.AbyssMod=3
							src.HealthDrain=0.3
							src.LifeSteal=100
							src.Curse=1
							src.SwordName="Dainsleif"
							src.ActiveMessage="calls forth the true form of Dainsleif, the Blade of Ruin!"
							src.OffMessage="dissolves Dainsleif's ruinous power..."
				src.Trigger(usr)
			verb/Weapon_Soul()
				set category="Skills"
				if(!usr.BuffOn(src))
					var/list/WeaponSoul=list()
					WeaponSoul.Add("Resonant Weapon")
					if(usr.SagaLevel>=4&&usr.Saga=="Weapon Soul")
						WeaponSoul.Add("Ascended Resonant Weapon")
					if(usr.SagaLevel>=6&&usr.Saga=="Weapon Soul"&&usr.GetWeaponSoulType()==usr.BoundLegend)
						WeaponSoul.Add("Legendary Weapon")
					WeaponSoul.Add("Cancel")
					var/WeaponType=input(usr, "What level of power of your weapon do you wish to release?", "Weapon Invocation") in WeaponSoul
					if(WeaponType=="Cancel")
						if(WeaponSoul.len<2)
							usr << "Your soul cannot resonate with this weapon..."
						return
					switch(WeaponType)
						if("Resonant Weapon")
							PowerMult=1.5
							StrMult=1.3
							EndMult=1
							ForMult=1.2
							OffMult=1.3
							DefMult=1.2
							RegenMult=1
							HolyMod=0
							AbyssMod=0
							Purity=0
							Steady=0
							NoWhiff=0
							NoForcedWhiff=0
							SpiritSword=0
							EnergyGeneration=0
							EnergySteal=0
							LifeGeneration=0
							LifeSteal=0
							HealthDrain=0
							Curse=0
							src.BleedHit=0
							WeaponBreaker=0
							SwordIcon=null
							SwordName=null
							ActiveMessage="imbues their weapon with their own soul!"
							OffMessage="severs the connection..."
						if("Ascended Resonant Weapon")
							var/UsedType
							if(locate(/obj/Skills/Queue/Holy_Blade, usr))
								UsedType="Holy Blade"
							else if(locate(/obj/Skills/Queue/Darkness_Blade, usr))
								UsedType="Corrupt Edge"
							switch(UsedType)
								if("Holy Blade")
									PowerMult=1.5
									StrMult=1.3
									EndMult=1.2
									ForMult=1
									OffMult=1.2
									DefMult=1.3
									RegenMult=1
									HolyMod=1
									AbyssMod=0
									Purity=0
									Steady=0
									SpiritSword=0
									EnergyGeneration=0
									EnergySteal=0
									LifeGeneration=0
									LifeSteal=0
									HealthDrain=0
									Curse=0
									WeaponBreaker=0
									src.BleedHit=0
									SwordIcon=null
									SwordName=null
									ActiveMessage="combines the radiance of their own soul with the legendary power of their blade!"
									OffMessage="releases the power of their holy soul..."
									for(var/mob/m in view(10, usr))
										if(m.UBWTrace)
											if(!m.HolyBladeProject)
												m.HolyBladeProject=1
												m<<"You learn to project a holy blade!"
								if("Corrupt Edge")
									PowerMult=1.5
									StrMult=1.4
									EndMult=1
									ForMult=1.3
									OffMult=1.3
									DefMult=1
									RegenMult=1
									HolyMod=0
									AbyssMod=1
									Purity=0
									Steady=0
									SpiritSword=0
									EnergyGeneration=0
									EnergySteal=0
									LifeGeneration=0
									LifeSteal=0
									HealthDrain=0
									Curse=0
									WeaponBreaker=0
									src.BleedHit=0
									SwordIcon=null
									SwordName=null
									ActiveMessage="combines the corruption of their own soul with the legendary might of their sword!"
									OffMessage="releases the power of their dark spirit..."
									for(var/mob/m in view(10, usr))
										if(m.UBWTrace)
											if(!m.CorruptEdgeProject)
												m.CorruptEdgeProject=1
												m<<"You learn to project a corrupt edge!"
						if("Legendary Weapon")
							var/WeaponSoulType=usr.GetWeaponSoulType()
							switch(WeaponSoulType)
								if("Caledfwlch")
									if(locate(/obj/Skills/Queue/Holy_Blade, usr))
										PowerMult=1.5
										StrMult=1.3
										EndMult=1
										ForMult=1.3
										OffMult=1.4
										DefMult=1
										RegenMult=1
										HolyMod=3
										AbyssMod=0
										SpiritSword=0.25
										NoWhiff=0
										NoForcedWhiff=0
										SwordName="Caledfwlch"
										SwordIcon='Caledfwlch-True.dmi'
										ActiveMessage="calls forth the true form of Caledfwlch, the Sword of Glory!"
										OffMessage="conceals Caledfwlch's glory..."
									else if(locate(/obj/Skills/Queue/Darkness_Blade, usr))
										PowerMult=1.5
										StrMult=1.5
										EndMult=1
										ForMult=1.5
										OffMult=1.5
										DefMult=1
										RegenMult=0.5
										HolyMod=0
										AbyssMod=3
										SpiritSword=0.25
										NoWhiff=0
										NoForcedWhiff=0
										SwordName="Caledfwlch"
										SwordIcon='Caledfwlch-Morgan.dmi'
										ActiveMessage="calls forth the true form of Caledfwlch Morgan, the Blackened Sword of Glory!"
										OffMessage="conceals Caledfwlch's glory..."
								if("Kusanagi")
									PowerMult=1.5
									StrMult=1.1
									EndMult=1.1
									ForMult=1.2
									OffMult=1.3
									DefMult=1.3
									RegenMult=1
									HolyMod=3
									ManaGeneration=100
									SwordName="Kusanagi"
									ActiveMessage="calls forth the true form of Kusanagi, the Sword of Faith!"
									OffMessage="seals Kusanagi's faith..."
								if("Durendal")
									PowerMult=1.5
									StrMult=1.7
									EndMult=1.4
									ForMult=0.8
									OffMult=1.1
									DefMult=1
									RegenMult=1
									HolyMod=3
									LifeGeneration=30
									SwordName="Durendal"
									ActiveMessage="calls forth the true form of Durendal, the Sword of Hope!"
									OffMessage="hides the hope of Durendal..."
								if("Masamune")
									PowerMult=1.5
									StrMult=1
									StrMult=1
									EndMult=1.5
									ForMult=1
									OffMult=1
									DefMult=1.5
									RegenMult=1
									HolyMod=5
									Purity=1//Can only hurt evil things.
									Steady=9//Always 100% damage.
									SwordName="Masamune"
									ActiveMessage="calls forth the true form of Masamune, the Sword of Purity!"
									OffMessage="relaxes the light of Masamune..."
								if("Soul Calibur")
									if(locate(/obj/Skills/Queue/Holy_Blade, usr))
										PowerMult=1.5
										StrMult=1.1
										EndMult=1.4
										ForMult=1
										OffMult=1.2
										DefMult=1.3
										RegenMult=1
										HolyMod=3
										LifeGeneration=10
										Steady=5//Always 50% damage.
										SwordName="Soul Calibur"
										ActiveMessage="calls forth the true form of Soul Calibur, the Purified Blade of Order!"
										OffMessage="restricts Soul Calibur's order..."
									if(locate(/obj/Skills/Queue/Darkness_Blade, usr))
										PowerMult=1.5
										StrMult=1.2
										EndMult=1.8
										ForMult=1
										OffMult=1.2
										DefMult=1.3
										RegenMult=0.5
										AbyssMod=3
										LifeGeneration=10
										Steady=5//Always 50% damage.
										SwordName="Soul Calibur"
										SwordIcon='SoulCalibur-Crystal.dmi'
										ActiveMessage="calls forth the true form of Soul Calibur, the Crystal Blade of Order!"
										OffMessage="restricts Soul Calibur's order..."
								if("Soul Edge")
									PowerMult=1.5
									StrMult=2
									EndMult=1.2
									ForMult=1
									OffMult=1.5
									DefMult=0.8
									RegenMult=0.5
									AbyssMod=5
									Steady=8
									Extend=1
									BleedHit=1
									SwordName="Soul Edge"
									ActiveMessage="calls forth the true form of Soul Edge, the Blade of Chaos!"
									OffMessage="releases Soul Edge's chaos..."
								if("Muramasa")
									PowerMult=1.5
									StrMult=1.3
									EndMult=1
									ForMult=1.3
									OffMult=1.6
									DefMult=1.3
									RegenMult=0.5
									AbyssMod=3
									EnergySteal=40//if 100 damage is done, regenerate 40% energy.
									WeaponBreaker=2
									SwordName="Muramasa"
									ActiveMessage="calls forth the true form of Muramasa, the Bane of Blades!"
									OffMessage="casts Muramasa back into the darkness..."
								if("Dainsleif")
									PowerMult=1.5
									StrMult=1.5
									EndMult=1.4
									ForMult=1
									OffMult=1.4
									DefMult=1.2
									RegenMult=0.5
									AbyssMod=3
									HealthDrain=0.3
									LifeSteal=100
									Curse=1
									SwordName="Dainsleif"
									ActiveMessage="calls forth the true form of Dainsleif, the Blade of Ruin!"
									OffMessage="dissolves Dainsleif's ruinous power..."
				src.Trigger(usr)


		Kamui
			KiControl=1
			HealthPU=1
			BleedHit=1
			StripEquip=1
			FlashChange=1
			HairLock=1
			IconLayer=3
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=5
			KenWaveTime=30
			KenWaveX=105
			KenWaveY=105
			KamuiSenketsu
				HealthThreshold=5
				PowerMult=1.5
				StrMult=1.25
				EndMult=1.25
				SpdMult=1.5
				Cooldown=60
				IconLock='Kamui_Uniform_stage_1.dmi'
				TopOverlayLock='Kamui_Uniform_stage_1_headpiece.dmi'
				TopOverlayX=0
				TopOverlayY=0
				ActiveMessage="feeds blood into their Kamui, drawing on its full power.  Life Fiber Synchronize!"
				OffMessage="runs out of blood to feed their Kamui, releasing the transformed state..."
				BuffName="Life Fiber Synchronize"
				verb/Life_Fiber_Synchronize()
					set category="Skills"
					if(!usr.BuffOn(src))
						if(usr.SagaLevel<1||usr.Saga!="Kamui")
							src.PowerMult=1.5
							src.StrMult=1.25
							src.EndMult=1.25
							src.SpdMult=0.1
							src.RegenMult=0.1
							src.ActiveMessage="attempts to wear a Kamui which they have no connection to!"
							src.OffMessage="has their strepower stolen from them..."
						else if(usr.Saga=="Kamui")
							src.PowerMult=1.5
							src.StrMult=1.25
							src.EndMult=1.25
							src.SpdMult=1.5
							src.HealthCost=15
							src.WoundCost=15
							src.VaizardHealth=1.5
							src.RegenMult=1
							src.ActiveMessage="feeds blood into their Kamui, drawing on its full power.  Life Fiber Synchronize!"
							src.OffMessage="runs out of blood to feed their Kamui, releasing the transformed state..."
							if(usr.KamuiType=="Impulse")
								switch(usr.SagaLevel)
									if(2)
										src.HealthThreshold=5
										src.PowerMult=1.5
										src.WoundCost=10
										src.HealthCost=10
										src.VaizardHealth=1
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="feeds blood into their Kamui, drawing on its full power.  Life Fiber Synchronize!"
										src.OffMessage="runs out of blood to feed their Kamui, releasing the transformed state..."
									if(3)
										src.HealthThreshold=5
										src.PowerMult=1.5
										src.WoundCost=5
										src.HealthCost=5
										src.VaizardHealth=0.5
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="feeds blood into their Kamui, drawing on its full power.  Life Fiber Synchronize!"
										src.OffMessage="runs out of blood to feed their Kamui, releasing the transformed state..."
									if(4)
										src.HealthThreshold=5
										src.PowerMult=1.5
										src.WoundCost=0
										src.HealthCost=0
										src.VaizardHealth=0
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="feeds blood into their Kamui, drawing on its full power.  Life Fiber Synchronize!"
										src.OffMessage="runs out of blood to feed their Kamui, releasing the transformed state..."
									if(5)
										src.HealthThreshold=5
										src.PowerMult=1.5
										src.WoundCost=0
										src.HealthCost=0
										src.VaizardHealth=0
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="feeds blood into their Kamui, drawing on its full power.  Life Fiber Synchronize!"
										src.OffMessage="runs out of blood to feed their Kamui, releasing the transformed state..."
									if(6)
										src.HealthThreshold=0
										src.TechniqueMastery=5
										src.EnergyMult=1.5 //Counteract PowerMult drains. Perfect Syncronization!!!1111
										src.PowerMult=1.5
										src.WoundCost=0
										src.HealthCost=0
										src.VaizardHealth=0
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="synchronizes perfectly with their Kamui!"
										src.OffMessage="separates from their Kamui..."
									if(7)
										src.HealthThreshold=0
										src.TechniqueMastery=5
										src.EnergyMult=1.5
										src.PowerMult=1.5
										src.WoundCost=0
										src.HealthCost=0
										src.VaizardHealth=0
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="synchronizes perfectly with their Kamui!"
										src.OffMessage="separates from their Kamui..."
									if(8)
										src.HealthThreshold=0
										src.TechniqueMastery=5
										src.EnergyMult=1.5
										src.PowerMult=1.5
										src.WoundCost=0
										src.HealthCost=0
										src.VaizardHealth=0
										src.IconLock='Kamui_Uniform_stage_2.dmi'
										src.TopOverlayLock='Kamui_Uniform_stage_2_headpiece.dmi'
										src.TopOverlayX=0
										src.TopOverlayY=0
										src.ActiveMessage="synchronizes perfectly with their Kamui!"
										src.OffMessage="separates from their Kamui..."
					src.Trigger(usr)
			KamuiJunketsu
				PowerMult=1.5
				OverClock=0.25
				StrMult=1.5
				EndMult=1.5
				SpdMult=1.5
				RegenMult=0.5
				Cooldown=5
				IconLock='JunKamui_Stage_1.dmi'
				TopOverlayLock='JunKamui_Stage_1_Pauldrons-Headpiece.dmi'
				TopOverlayX=0
				TopOverlayY=0
				BuffName="Life Fiber Override"
				ActiveMessage="forces their blood into their Kamui, making use of its full power.  Life Fiber Override!"
				OffMessage="relaxes their bloodflow, allowing the Kamui they wear to revert..."
				verb/Life_Fiber_Override()
					set category="Skills"
					if(!usr.BuffOn(src))
						if(usr.SagaLevel<1||usr.Saga!="Kamui")
							src.PowerMult=2
							src.OverClock=1
							src.StrMult=1.5
							src.EndMult=1.5
							src.SpdMult=0.1
							src.RegenMult=0.1
							src.ActiveMessage="is having the life sucked out of them by a Kamui!"
							src.OffMessage="manages to take the Kamui off..."
						else if(usr.Saga=="Kamui")
							switch(usr.SagaLevel)
								if(3)
									src.PowerMult=1.5
									src.OverClock=0.15
									src.StrMult=1.5
									src.EndMult=1.5
									src.SpdMult=1.5
									src.RegenMult=0.5
								if(4)
									src.PowerMult=1.5
									src.OverClock=0.15
									src.StrMult=1.5
									src.EndMult=1.5
									src.SpdMult=1.5
									src.RegenMult=0.5
								if(5)
									src.PowerMult=1.5
									src.OverClock=0.05
									src.StrMult=1.5
									src.EndMult=1.5
									src.SpdMult=1.5
									src.RegenMult=0.5
								if(6)
									src.PowerMult=1.5
									src.OverClock=0.05
									src.StrMult=1.5
									src.EndMult=1.5
									src.SpdMult=1.5
									src.RegenMult=0.5
								if(7)
									src.PowerMult=1.5
									src.OverClock=0.05
									src.StrMult=1.5
									src.EndMult=1.5
									src.SpdMult=1.5
									src.RegenMult=0.5
								if(8)
									src.PowerMult=2
									src.OverClock=0.05
									src.StrMult=1.5
									src.EndMult=1.5
									src.SpdMult=1.5
									src.RegenMult=0.5
						if(usr.KamuiType=="Impulse")
							src.IconLock='JunKamui_Stage_2_RyuVer.dmi'
							src.TopOverlayLock='JunKamui_Stage_2_RyuVer_Pauldrons-Headpiece.dmi'
							src.TopOverlayX=0
							src.TopOverlayY=0
					src.Trigger(usr)
		Persona

		Keyblade
			ActiveMessage="draws forth a weapon shaped like a key from a flurry of light!"
			OffMessage="releases their Keyblade back to the light..."
			MakesSword=1
			FlashDraw=1
			MagicSword=1
			SwordClass="Wooden"
			SwordAscension=2
			SwordName="Keyblade"
			PULock=1
			PowerMult=1.5
			SwordX=-32
			SwordY=-32
			Cooldown=30
			verb/Summon_Keyblade()
				set category="Skills"
				if(!usr.BuffOn(src))
					src.SwordClass=GetKeychainClass(usr.KeychainAttached)
					src.SwordDamage=GetKeychainDamage(usr.KeychainAttached)
					src.SwordAccuracy=GetKeychainAccuracy(usr.KeychainAttached)
					src.SwordDelay=GetKeychainDelay(usr.KeychainAttached)
					src.SwordElement=GetKeychainElement(usr.KeychainAttached)
					src.SwordIcon=GetKeychainIcon(usr.KeychainAttached)
					if(usr.KeychainAttached=="Way To Dawn")
						src.HolyMod=3
						src.AbyssMod=3
					else
						src.HolyMod=0
						src.AbyssMod=0
					if(usr.KeychainAttached=="Fenrir")
						src.Steady=8
					else
						src.Steady=0
					if(usr.KeychainAttached=="Chaos Ripper")
						src.Burning=1
						src.Scorching=1
						src.DarknessFlame=1
					else
						src.Burning=0
						src.Scorching=0
						src.DarknessFlame=0
					if(usr.KeychainAttached=="No Name")
						src.StealsStats=0
					else
						src.StealsStats=0
					switch(usr.KeybladeType)
						if("Sword")
							src.StrMult=1.3
							src.ForMult=1.3
							src.EndMult=0.8
							src.SpdMult=1.4
							src.OffMult=1.2
						if("Shield")
							src.StrMult=1.4
							src.EndMult=1.5
							src.ForMult=0.5
							src.OffMult=1.2
							src.DefMult=1.4
						if("Staff")
							src.StrMult=0.8
							src.ForMult=1.5
							src.SpdMult=1.2
							src.OffMult=1.3
							src.DefMult=1.2
				src.Trigger(usr)


	SpecialBuffs
		SpecialSlot=1
//Racial
		Giant_Form//for Dragon Nameks instead!
			NeedsHealth=75
			StrMult=1.5
			EndMult=2
			DefMult=0.5
			Enlarge=2
			GiantForm=1
			ActiveMessage="channels their regenerative abilities into a bout of monstrous growth!"
			OffMessage="shrinks to normal size..."
			Cooldown=180
			verb/Giant_Form()
				set category="Skills"
				for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in usr)
					if(r.Using&&!usr.BuffOn(src))
						return
					if(usr.BuffOn(r))
						r.Trigger(usr)
					if(!r.Using)
						r.Cooldown()
				src.Trigger(usr)
		OneHundredPercentPower
			SignatureTechnique=3
			BuffName="One Hundred Percent Power"
			UnrestrictedBuff=1
			NeedsTrans=3
			NeedsHealth=50
			StrMult=1.5
			ForMult=1.5
			AuraLock=1
			Flicker=1
			Pursuer=1
			Cooldown=600
			KKTWave=3
			KKTWaveSize=2
			AllOutPU=1
			ActiveMessage="bulks up greatly and erupts with power!"
			OffMessage="tires out..."
		FifthForm
			SignatureTechnique=3
			BuffName="Fifth Form"
			UnrestrictedBuff=1
			NeedsTrans=3
			NeedsHealth=50
			EndMult=1.5
			DefMult=1.5
			BioArmor=50
			Juggernaut=2
			Enlarge=2
			AllOutPU=1
			Cooldown=600
			ActiveMessage="grows and transforms parts of their armor!"
			OffMessage="tires out..."
		Wrathful
			SignatureTechnique=3
			UnrestrictedBuff=1
			NeedsHealth=75
			StrMult=1.5
			SpdMult=1.5
			PowerReplacement=5
			AngerThreshold=2
			AutoAnger=1
			GiantForm=1
			Enlarge=2
			KenWave=3
			KenWaveSize=4
			KenWaveIcon='KenShockwaveGold.dmi'
			IconLock='EyesSage.dmi'
			ActiveMessage="turns completely feral, their massive power running out of control!"
			OffMessage="tires out..."
			verb/Wrathful()
				set category="Skills"
				src.Trigger(usr)

		SuperSaiyanGrade2
			SignatureTechnique=3
			UnrestrictedBuff=1
			NeedsSSJ=1
			PowerMult=1.25
			EnergyExpenditure=1.5
			StrMult=1.25
			ForMult=1.25
			EndMult=1.25
			SpdMult=1.25
			AuraLock=1
			FlashChange=1
			KenWave=3
			KenWaveSize=0.5
			KenWaveIcon='KenShockwaveGold.dmi'
			ActiveMessage="bulks up greatly and erupts with power!"
			OffMessage="tires out..."
			verb/Super_Saiyan_Grade2()
				set category="Skills"
				if(usr.HasGodKi()&&usr.masteries["4mastery"]!=100)
					usr << "You're already utilizing your energy to the fullest."
					return
				if(usr.ExpandBase)
					IconReplace=1
					icon=usr.ExpandBase
				src.NeedsSSJ=usr.TransUnlocked()
				src.HairLock=usr.Hair_SSJ2
				src.Trigger(usr)
		SuperSaiyanGrade3
			SignatureTechnique=3
			UnrestrictedBuff=1
			NeedsSSJ=1
			PowerMult=1.5
			EnergyExpenditure=2
			StrMult=1.5
			ForMult=1.5
			EndMult=1.5
			OffMult=0.5
			DefMult=0.5
			IconLock='SS2Sparks.dmi'
			AuraLock=1
			FlashChange=1
			ProportionShift=matrix(1.2, 0, 0, 0, 1, 0)
			KenWave=5
			KenWaveSize=0.5
			KenWaveIcon='KenShockwaveGold.dmi'
			ActiveMessage="bulks up enormously and explodes with power!"
			OffMessage="loses steam..."
			verb/Super_Saiyan_Grade3()
				set category="Skills"
				if(usr.HasGodKi()&&usr.masteries["4mastery"]!=100)
					usr << "You're already utilizing your energy to the fullest."
					return
				if(usr.ExpandBase)
					IconReplace=1
					icon=usr.ExpandBase
				src.NeedsSSJ=usr.TransUnlocked()
				src.HairLock=usr.Hair_SSJ3
				src.Trigger(usr)
		SuperSaiyanPerfected
			SignatureTechnique=3
			Mastery=-1
			UnrestrictedBuff=1
			StrMult=1.2
			ForMult=1.2
			EndMult=1.3
			SpdMult=1.3
			MovementMastery=10
			PowerInvisible=1.5
			Intimidation=1.5
			PUSpeedModifier=2
			PureDamage=2
			PureReduction=2
			Flicker=2
			AuraLock='SSJ2Aura.dmi'
			AuraX=-32
			FlashChange=1
			KenWave=5
			KenWaveSize=1
			KenWaveIcon='KenShockwaveGold.dmi'
			ActiveMessage="prepares to display immense, mastered power!"
			OffMessage="releases their perfected form..."
			verb/Super_Saiyan_Perfected()
				set category="Skills"
				if(!usr.BuffOn(src))
					src.NeedsSSJ=min(usr.TransActive(),src.Mastery)
				src.Trigger(usr)

		LegendarySuperSaiyan
			SignatureTechnique=3
			Transform="Force"
			UnrestrictedBuff=1
			StrMult=1.2
			ForMult=1.2
			EndMult=1.3
			SpdMult=1.3
			PureReduction=5
			GiantForm=1
			EnergyHeal=1
			FatigueHeal=1
			KenWave=5
			KenWaveSize=5
			KenWaveIcon='KenShockwaveLegend.dmi'
			Enlarge=2
			AuraLock='Amazing LSSj Aura.dmi'
			AuraX=-32
			TextColor=rgb(255, 231, 108)
			ActiveMessage="roars and bulks up enormously as their power shatters reason!"
			OffMessage="releases their legendary power..."
			verb/Legendary_Super_Saiyan()
				set category="Skills"
				HairLock=usr.Hair_SSJ2
				if(usr.ExpandBase)
					IconReplace=1
					icon=usr.ExpandBase
				src.Trigger(usr)

		Kaioken
			SignatureTechnique=3
			EnergyThreshold=10
			UnrestrictedBuff=1
			Kaioken=1
			Pursuer=2
			SuperDash=1
			Flicker=1
			Instinct=1
			EnergyMult=2
			IconLock='Kaioken.dmi'
			LockX=-32
			LockY=0
			IconApart=1
			IconTint=list(0.8,0,0, 0.2,0.55,0.05, 0.2,0.02,0.58, 0,0,0)
			TextColor=rgb(204, 0, 0)
			ActiveMessage="erupts with immense intensity!!"
			AllOutPU=1
			verb/Kaioken()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.ActiveBuff)
						if(usr.ActiveBuff.PULock==1)
							usr << "Your energy is too focused to ignite the Kaioken."
							return
					usr << "Use Power Up to increase your Kaioken level."
					for(var/obj/Skills/Buffs/ActiveBuffs/Ki_Control/KC in usr)
						if(!usr.BuffOn(KC))
							usr.UseBuff(KC)
				usr.Auraz("Remove")
				src.Trigger(usr)
		Rekkaken
			SignatureTechnique=3
			UnrestrictedBuff=1
			EnergyMult=2
			BurnAffected=2
			BurningShot=1
			NoWhiff=1
			SuperDash=1
			Pursuer=1
			IconLock='SSGAura.dmi'
			IconLockBlend=4
			LockX=-32
			LockY=-32
			ActiveMessage="ignites their life-force into a sacrifical pyre!!"
			OffMessage="burns out..."
			TextColor=rgb(255, 55, 0)
			verb/Burning_Shot()
				set name="Rekkaken"
				set category="Skills"
				src.Trigger(usr)
		Kyoukaken//wet wet fist
			SignatureTechnique=3
			HealthThreshold=50
			UnrestrictedBuff=1
			EnergyMult=2
			MirrorStats=1
			Flow=1
			Instinct=1
			ActiveMessage="reflects their opponent's power like a still lake!"
			OffMessage="returns to their own movements, unable to hold the simulacrum..."
			TextColor=rgb(65, 177, 218)
			verb/Kyoukaken()
				set category="Skills"
				src.Trigger(usr)
		Toppuken//wind wind fist
			SignatureTechnique=3
			EnergyMult=2
			UnrestrictedBuff=1
			Erosion=0.5
			ManaSeal=1
			SoulFire=1
			WeaponBreaker=2
			DeathField=5
			VoidField=5
			ActiveMessage="gently erodes everything..."
			OffMessage="recalls their eroding aura..."
			TextColor=rgb(224, 224, 235)
			verb/Toppuken()
				set category="Skills"
				src.Trigger(usr)
//General
		Adrenaline_Rush
			SignatureTechnique=3
			NeedsHealth=50
			WoundThreshold=2
			FatigueThreshold=2
			FINISHINGMOVE=1
			OverClock=0.5
			EnergyMult=0.5
			StrMult=1.5
			EndMult=2
			SpdMult=1.5
			DefMult=0.5
			AdrenalBoost=1
			BleedHit=1
			FatigueLeak=1
			ManaGlow=rgb(0,255,0)
			ManaGlowSize=4
			IconTint=list(0.8,0,0, 0.2,0.55,0.05, 0.2,0.02,0.58, 0,0,0)
			LockX=-32
			LockY=-32
			TextColor=rgb(0,255,0)
			ActiveMessage="feeds their pain into the fires of determination!"
			OffMessage="runs out of gumption..."
			verb/Adrenaline_Rush()
				set category="Skills"
				src.Trigger(usr)
		Cursed
			Maki=1
			Curse=1
			PreRequisite=list("/obj/Skills/Utility/Summon_Absurdity")
			Jagan_Eye
				SignatureTechnique=3
				FatigueThreshold=90
				StrMult=1.75
				ForMult=1.75
				EndMult=0.5
				IconLock='Third Eye.dmi'
				LockX=0
				LockY=0
				CalmAnger=1
				Instinct=1
				Flow=1
				Godspeed=1
				ActiveMessage="draws on the power of Demon World through their Jagan Eye!"
				OffMessage="shuts their Jagan Eye..."
				TextColor="#666666"
				verb/Jagan_Eye()
					set category="Skills"
					src.Trigger(usr)
			Jinchuuriki
				SignatureTechnique=3
				NeedsHealth=50
				TooMuchHealth=75
				WoundThreshold=95
				LifeGeneration=25
				Deflection=2
				Reversal=1
				Intimidation=1.25
				AutoAnger=1
				ActiveMessage="overflows with berserk demon chakra!"
				OffMessage="can no longer bear the strain of channelling demon chakra..."
				TextColor="#FF7700"
				IconLock='BijuuV1.dmi'
				LockX=-32
				LockY=-32
				verb/Jinchuuriki()
					set category="Skills"
					if(!usr.BuffOn(src))
						src.NeedsHealth=50+(12.5*src.Mastery)
						src.TooMuchHealth=75+(6.25*src.Mastery)
						if(Mastery >= 4)
							src.TooMuchHealth=null
						if(Mastery >= 3)
							AutoAnger=0
							CalmAnger=1
						else
							AutoAnger=1
							CalmAnger=0
					if(src.Mastery==1)
						usr << "You don't have enough of a rapport to manipulate your demon at will!"
						return
					src.Trigger(usr)
			Vaizard_Mask
				SignatureTechnique=3
				ManaThreshold=1
				Cooldown=120
				Instinct=2
				Pursuer=2
				AngerMult=2
				Flicker=2
				AutoAnger=1
				VaizardHealth=1
				ActiveMessage="is taken over by a violent rage as a mask forms on their face!"
				OffMessage="violently rips off their mask as it shatters into fragments..."
				verb/Don_Mask()
					set category="Skills"
					if(!usr.BuffOn(src))
						src.Cooldown=120/src.Mastery
					if(src.Mastery==1)
						usr << "You cannot willfully control your dark instinct..."
						return
					src.Trigger(usr)

		Aphotic_Shield
			PreRequisite=list("/obj/Skills/AutoHit/Magic/Stop")
			MagicNeeded=1
			SignatureTechnique=3
			NeedsHealth=50
			TooMuchHealth=75
			StrMult=1.3
			ForMult=1.3
			EndMult=1.4
			Siphon=5
			FluidForm=1
			PureReduction=2.5
			SpaceWalk=1
			StaticWalk=1
			Void=1
			IconLock='zekkai.dmi'
			IconLockBlend=1
			IconUnder=1
			OverlaySize=1.3
			TopOverlayLock='DarknessGlow.dmi'
			TopOverlayX=-32
			TopOverlayY=-32
			ActiveMessage="consumes all light around them to form an orb of darkness!"
			OffMessage="stops absorbing light..."
			verb/Aphotic_Shield()
				set category="Skills"
				src.Trigger(usr)
		Titan_Form
			PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Golem_Form")
			MagicNeeded=1
			SignatureTechnique=3
			NeedsHealth=50
			TooMuchHealth=75
			StrMult=1.5
			EndMult=1.5
			Enlarge=3
			KBMult=3
			KBRes=3
			GiantForm=1
			NoDodge=1
			SweepingStrike=1
			ActiveMessage="explodes into a mountain of flesh that weaves itself into an enormous body!"
			OffMessage="sheds the excess flesh..."
			verb/Titan_Form()
				set category="Skills"
				src.Trigger(usr)
		Spirit_Pulse
			SignatureTechnique=3
			FatigueThreshold=50
			RecovMult=2
			Flow=2
			MovementMastery=10
			PureReduction=2
			ActiveMessage="is enveloped in a cascading glow!!"
			OffMessage="dissipates the glow..."
			verb/Spirit_Pulse()
				set category="Skills"
				src.Trigger(usr)
		Spirit_Burst
			SignatureTechnique=3
			FatigueThreshold=50
			RecovMult=2
			Instinct=1
			Flicker=1
			PureDamage=2
			PUSpike=50
			ActiveMessage="spikes their energy in sudden bursts!"
			OffMessage="quells their energy..."
			verb/Spirit_Burst()
				set category="Skills"
				src.Trigger(usr)
		Unbound_Mode
			SignatureTechnique=3
			MovementMastery=5
			TechniqueMastery=5
			BuffMastery=5
			ManaThreshold=1
			ManaLeak=1.5
			StrMult=1.2
			EndMult=1.2
			SpdMult=1.2
			ForMult=1.2
			RecovMult=1.2
			FlashChange=1
			KenWaveIcon='Unbound.dmi'
			KenWave=1
			KenWaveSize=1
			KenWaveX=72
			KenWaveY=72
			KenWaveBlend=2
			KenWaveTime=5
			ActiveMessage="unleashes their complete self!"
			OffMessage="returns to their old self..."
			verb/Unbound_Mode()
				set category="Skills"
				src.Trigger(usr)
		Sparking_Blast
			SignatureTechnique=3
			NeedsHealth=25
			TimerLimit=25
			WoundHeal=1
			FatigueHeal=1
			StableHeal=1
			CapacityHeal=1
			LifeSteal=100
			EnergyGeneration=100
			ManaSeal=1
			ManaGeneration=100
			PureDamage=2
			PureReduction=2
			EndMult=1.5
			RecovMult=1.5
			IconLock='SparkingBlastSparks.dmi'
			IconLockBlend=2
			OverlaySize=0.7
			LockY=-4
			FlashChange=1
			KenWaveIcon='SparkingBlast.dmi'
			KenWave=1
			KenWaveSize=1
			KenWaveX=72
			KenWaveY=72
			KenWaveBlend=2
			KenWaveTime=5
			Cooldown=-1
			verb/Sparking_Blast()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(!src.Using)
						usr.Activate(new/obj/Skills/AutoHit/Knockoff_Wave)
				src.Trigger(usr)

		Limit_Breaker
			SignatureTechnique=3
			FatigueHeal=100
			EnergyHeal=100
			InstantAffect=1
			StableHeal=1
			NeedsHealth=50
			TooMuchHealth=51
			OverClock=0.1
			AutoAnger=1
			Desperation=1
			SpdMult=2
			Cooldown=-1
			ActiveMessage="goes beyonds their limits!"
			OffMessage="cannot push themselves any further..."
			verb/Limit_Breaker()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.Health<=50)
						src.PowerInvisible=1.25
						src.OverClock=0.1
					if(usr.Health<=25)
						src.PowerInvisible=1.5
						src.OverClock=0.3
					if(usr.Health<=10)
						src.PowerInvisible=2
						src.OverClock=0.5
				src.Trigger(usr)

		Trance_Form
			SignatureTechnique=3
			Cooldown=-1
			MagicFocus=1
			verb/Trance_Form()
				set category="Skills"
				var/Highest=0
				var/Class
				if((usr.StrMod+usr.StrAscension)*usr.StrChaos>Highest)
					Class="Knight"
					Highest=(usr.StrMod+usr.StrAscension)*usr.StrChaos
				if((usr.ForMod+usr.ForAscension)*usr.ForChaos>Highest)
					Class="Magus"
					Highest=(usr.ForMod+usr.ForAscension)*usr.ForChaos
				if((usr.EndMod+usr.EndAscension)*usr.EndChaos>Highest)
					Class="Holy"
					Highest=(usr.EndMod+usr.EndAscension)*usr.EndChaos
				if((usr.SpdMod+usr.SpdAscension)*usr.SpdChaos>Highest)
					Class="Beast"
					Highest=(usr.SpdMod+usr.SpdAscension)*usr.SpdChaos
				if(!usr.SpecialBuff)
					switch(Class)
						if("Knight")
							if(!locate(/obj/Skills/Buffs/SpecialBuffs/Knight_Trance, usr))
								usr.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Knight_Trance)
							for(var/obj/Skills/Buffs/SpecialBuffs/Knight_Trance/KT in usr)
								KT.Trigger(usr)
						if("Magus")
							if(!locate(/obj/Skills/Buffs/SpecialBuffs/Magus_Trance, usr))
								usr.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Magus_Trance)
							for(var/obj/Skills/Buffs/SpecialBuffs/Magus_Trance/KT in usr)
								KT.Trigger(usr)
						if("Holy")
							if(!locate(/obj/Skills/Buffs/SpecialBuffs/Holy_Trance, usr))
								usr.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Holy_Trance)
							for(var/obj/Skills/Buffs/SpecialBuffs/Holy_Trance/KT in usr)
								KT.Trigger(usr)
						if("Beast")
							if(!locate(/obj/Skills/Buffs/SpecialBuffs/Beast_Trance, usr))
								usr.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Beast_Trance)
							for(var/obj/Skills/Buffs/SpecialBuffs/Beast_Trance/KT in usr)
								KT.Trigger(usr)
				else
					usr.SpecialBuff.Trigger(usr)
		Knight_Trance
			MagicNeeded=1
			MagicFocus=1
			NeedsHealth=50
			TooMuchHealth=75
			Cooldown=-1
			TimerLimit=120
			PowerMult=1.5
			StrMult=1.5
			OffMult=1.3
			DefMult=1.2
			Mechanized=1
			Extend=1
			HybridStrike=1
			Instinct=1
			TechniqueMastery=10
			DropOverlays=1
			HairLock='BLANK.dmi'
			IconLock='TranceArmor.dmi'
			TopOverlayLock='TranceHelm.dmi'
			FlashChange=1
			KenWave=1
			KenWaveSize=1
			KenWaveBlend=2
			KenWaveIcon='Trance.dmi'
			KenWaveX=25
			KenWaveY=25
			ActiveMessage="erupts with magical force, becoming a valiant Knight!"
			OffMessage="seals off the magical might..."
		Magus_Trance
			MagicNeeded=1
			MagicFocus=1
			NeedsHealth=50
			TooMuchHealth=75
			Cooldown=-1
			TimerLimit=120
			PowerMult=1.5
			ForMult=1.5
			OffMult=1.3
			DefMult=1.2
			SpiritStrike=1
			DrainlessMana=1
			DualCast=1
			QuickCast=2
			FlashChange=1
			KenWave=1
			KenWaveSize=1
			KenWaveBlend=2
			KenWaveIcon='Trance.dmi'
			KenWaveX=25
			KenWaveY=25
			ActiveMessage="erupts with magical force, becoming a skilled Magus!"
			OffMessage="seals off the magical might..."
		Holy_Trance
			MagicNeeded=1
			MagicFocus=1
			NeedsHealth=50
			TooMuchHealth=75
			Cooldown=-1
			TimerLimit=120
			PowerMult=1.5
			EndMult=1.5
			OffMult=1.2
			DefMult=1.3
			DebuffImmune=1
			FluidForm=1
			GiantForm=1
			LifeGeneration=30
			WoundHeal=1
			StableHeal=1
			FlashChange=1
			KenWave=1
			KenWaveSize=1
			KenWaveBlend=2
			KenWaveIcon='Trance.dmi'
			KenWaveX=25
			KenWaveY=25
			ActiveMessage="erupts with magical force, becoming a resilient Wiseman!"
			OffMessage="seals off the magical might..."
		Beast_Trance
			MagicNeeded=1
			MagicFocus=1
			NeedsHealth=50
			TooMuchHealth=75
			Cooldown=-1
			TimerLimit=120
			PowerMult=1.5
			SpdMult=1.5
			OffMult=1.2
			DefMult=1.3
			DoubleStrike=1
			TripleStrike=1
			Flicker=1
			Pursuer=3
			DropOverlays=1
			HairLock=1
			PowerGlows=list(0.7,0.3,0.5, 0.99,0.59,0.78, 0.51,0.11,0.3, 0,0,0)
			IconLock='Overlay SSJ4 Pink.dmi'
			TopOverlayLock='Tail SSJ4 Pink.dmi'
			FlashChange=1
			KenWave=1
			KenWaveSize=1
			KenWaveBlend=2
			KenWaveIcon='Trance.dmi'
			KenWaveX=25
			KenWaveY=25
			ActiveMessage="erupts with magical force, becoming a passionate Beast!"
			OffMessage="seals off the magical might..."

		High_Tension
			SignatureTechnique=3
			NeedsHealth=50
			TooMuchHealth=75
			Cooldown=60
			CooldownStatic=1
			FlashChange=1
			KenWave=2
			KenWaveSize=0.5
			KenWaveBlend=2
			KenWaveIcon='KenShockwavePurple.dmi'
			IconTint=list(0.7,0.3,0.6, 0.99,0.59,0.88, 0.51,0.11,0.4, 0,0,0)
			AuraLock=1
			Transform="Tension"
			OffMessage="releases their tension..."
			verb/Psych_Up()
				set category="Skills"
				set name="Psych Up!"
				if(!usr.BuffOn(src))
					if(src.Using)
						usr << "You cannot build up Tension so rapidly!"
						return
					KenShockwave2(usr, icon='SparkleViolet.dmi', Size=3, PixelX=105, PixelY=100, Blend=2, Time=12)
					if(src.Tension<20)
						src.Tension=20
					else if(src.Tension==20)
						src.Tension=50
					else if(src.Tension==50)
						src.Tension=100
					usr << "<font color='#FF00FF'>You build up Tension!</font>"

					src.Cooldown()
				else
					if(usr.Health>50)
						usr << "You don't feel pressed enough to build up any tension!"
						return
					else
						usr << "You are already in ascended state!"
						return
			verb/Release_Tension()
				set category="Skills"
				set name="Release Tension!"
				if(src.Tension||usr.BuffOn(src))
					src.Trigger(usr, Override=1)
				else
					usr << "Build up Tension first!"
					return
		Universal
			NoSword=0
			NoStaff=0
			Ultra_Instinct
				SignatureTechnique=4
				OffMult=1.5
				DefMult=1.5
				MovementMastery=10
				TechniqueMastery=10
				Instinct=3
				Flow=3
				WeaponBreaker=3
				HybridStrike=1
				Reversal=1
				MovingCharge=1
				MartialMagic=1
				SuperDash=1
				Pursuer=1
				Flicker=1
				GodKi=1
				FlashChange=1
				HairLock=1
				AuraLock='BLANK.dmi'
				IconLock='UltraInstinct.dmi'
				IconUnder=1
				LockX=-18
				LockY=-21
				TopOverlayLock='UltraInstinctSpark.dmi'
				IconTint=list(1,0.15,0.15, 0.15,1,0.15, 0,0,1, 0,0,0)
				verb/Ultra_Instinct()
					set category="Skills"
					src.Trigger(usr)

		Unarmed
			NoSword=1
			NoStaff=1
			Ghost_Install
				SignatureTechnique=3
				Afterimages=1
				DoubleStrike=1
				SpdMult=1.5
				OffMult=1.25
				DefMult=1.25
				ActiveMessage="traces their attacks with the force of a fighter's soul!"
				OffMessage="exhausts their multiplied assault..."
				verb/Ghost_Install()
					set category="Skills"
					src.ManaCost=usr.ManaAmount
					if(src.ManaCost>=100)
						src.TimerLimit=90
						src.ManaGeneration=40
						src.Duelist=2
						src.Godspeed=2
						src.Pursuer=2
						src.TripleStrike=1
					else
						src.TimerLimit=60
						src.ManaGeneration=20
						src.Duelist=1
						src.Godspeed=1
						src.Pursuer=2
						src.TripleStrike=0
					src.Trigger(usr)

			Way_of_the_Stripe//true tiger
				SignatureTechnique=3
				PreRequisite=list("/obj/Skills/Buffs/NuStyle/UnarmedStyle/Cat_Style")
				TechniqueMastery=5
				NeedsHealth=50
				TooMuchHealth=75
				HardStyle=1
				Pursuer=2
				Flicker=1
				StrMult=1.4
				SpdMult=1.2
				OffMult=1.4
				ActiveMessage="bristles with unmitigated aggression as they take up the Way of the Stripe!"
				OffMessage="relaxes their mastery of Tiger style..."
				verb/Way_of_the_Stripe()
					set category="Skills"
					src.Trigger(usr)
			Constricting_Coil_Dance//true dragon
				SignatureTechnique=3
				PreRequisite=list("/obj/Skills/Buffs/NuStyle/UnarmedStyle/Snake_Style")
				NeedsHealth=50
				TooMuchHealth=75
				TechniqueMastery=5
				SoftStyle=1
				CounterMaster=2
				SpiritHand=1
				Deflection=1
				ForMult=1.3
				SpdMult=1.5
				DefMult=1.2
				ActiveMessage="embraces patient harmony as they assume the Constricting Coil Dance!"
				OffMessage="relaxes their mastery of Dragon style..."
				verb/Constricting_Coil_Stance()
					set category="Skills"
					src.Trigger(usr)
			Hollow_Shell_Kata//true tortoise
				SignatureTechnique=3
				PreRequisite=list("/obj/Skills/Buffs/NuStyle/UnarmedStyle/Turtle_Style")
				NeedsHealth=50
				TooMuchHealth=75
				TechniqueMastery=5
				Erosion=0.5
				KiControlMastery=1
				Void=1
				FluidForm=1
				StrMult=1.2
				EndMult=1.5
				DefMult=1.3
				ActiveMessage="empties their heart of emotion as they practice the Hollow Shell Kata!"
				OffMessage="relaxes their mastery of Tortoise style..."
				verb/Hollow_Shell_Kata()
					set category="Skills"
					src.Trigger(usr)
			Sky_Emperor_Walk//true phoenix
				SignatureTechnique=3
				PreRequisite=list("/obj/Skills/Buffs/NuStyle/UnarmedStyle/Crane_Style")
				NeedsHealth=50
				TooMuchHealth=75
				TechniqueMastery=5
				PureDamage=2.5
				Skimming=2
				Flow=1
				SpiritFlow=1
				ForMult=1.5
				SpdMult=1.3
				OffMult=1.2
				ActiveMessage="ascends with serene grace as they ascend into the Sky Emperor's Walk!"
				OffMessage="relaxes their mastery of Phoenix style..."
				verb/Sky_Emperor_Walk()
					set name="Sky Emperor's Walk"
					set category="Skills"
					src.Trigger(usr)
			Sacred_Energy
				SignatureTechnique=4
				StrMult=1.25
				EndMult=1.25
				OffMult=1.25
				DefMult=1.25
				GodKi=1
				ActiveMessage="ascends into martial and spiritual perfection!"
				OffMessage="releases their unearthly focus..."
				verb/Sacred_Energy()
					set category="Skills"
					src.Trigger(usr)
			Sacred_Energy_Armor
				SignatureTechnique=4
				GodKi=1
				verb/Sacred_Energy_Armor_Offense()
					set category="Skills"
					set name="Sacred Energy Armor: Offense"
					if(!usr.BuffOn(src))
						src.Instinct=2
						src.NoWhiff=1
						src.Flicker=2
						src.Pursuer=2
						src.Steady=9
						src.StrMult=1.5
						src.EndMult=1
						src.OffMult=1.5
						src.DefMult=1
						src.FluidForm=0
						src.GiantForm=0
						src.Flow=0
						src.Reversal=0
						src.ActiveMessage="manifests regalia of offense: Sacred Energy Armor!"
						src.OffMessage="casts away the power to change the world..."
						src.IconLock=usr.SEAOffense
						src.LockX=0
						src.LockY=0
					src.Trigger(usr)
				verb/Sacred_Energy_Armor_Defense()
					set category="Skills"
					set name="Sacred Energy Armor: Defense"
					if(!usr.BuffOn(src))
						src.Instinct=0
						src.NoWhiff=0
						src.Flicker=0
						src.Pursuer=0
						src.Steady=0
						src.StrMult=1
						src.EndMult=1.5
						src.OffMult=1
						src.DefMult=1.5
						src.FluidForm=1
						src.GiantForm=1
						src.Flow=2
						src.Reversal=1
						src.ActiveMessage="manifests regalia of defense: Sacred Energy Armor!"
						src.OffMessage="casts away the power to change the world..."
						src.IconLock=usr.SEADefense
						src.LockX=0
						src.LockY=0
					src.Trigger(usr)
		Sword
			NeedsSword=1
			SwordSaint
				SignatureTechnique=3
				SagaSignature=1
				NeedsHealth=50
				TooMuchHealth=75
				StrMult=1.5
				OffMult=1.3
				DefMult=1.2
				CriticalChance=10
				BlockChance=10
				CriticalDamage=2
				CriticalBlock=2
				Flicker=1
				Reversal=1
				SwordAscension=1
				IconLock='EyeFlameC.dmi'
				ActiveMessage="begins to handle their weapon with endless dedication!"
				OffMessage="loses their extreme focus..."
				verb/Sword_Saint()
					set category="Skills"
					src.Trigger(usr)
			PranaBurst
				SignatureTechnique=3
				SagaSignature=1
				ManaThreshold=0.01
				ManaLeak=1.5
				SpdMult=2
				SpiritHand=1
				Extend=1
				SwordAscension=1
				SuperDash=1
				IconLock='GentleDivine.dmi'
				IconLockBlend=2
				LockX=-32
				LockY=-34
				HitSpark='Slash - Power.dmi'
				HitSize=1.2
				HitX=-32
				HitY=-32
				HitTurn=1
				ActiveMessage="begins to pour immense energy into every strike of their blade!"
				OffMessage="seals their immense output..."
				verb/Prana_Burst()
					set category="Skills"
					src.Trigger(usr)
			Final_Getsuga_Tenshou
				SignatureTechnique=4
				TimerLimit=300
				EnergyCut=0.99
				ManaCut=0.99
				StrCut=0.5
				EndCut=0.5
				ForCut=0.5
				OffMult=1.5
				DefMult=1.5
				SpdMult=2
				SureDodgeTimerLimit=10
				SureHitTimerLimit=10
				CriticalChance=10
				BlockChance=10
				CriticalDamage=3
				CriticalBlock=3
				Flicker=2
				Reversal=1
				SuperDash=2
				SwordAscension=2
				SwordDamage=2
				SwordAccuracy=2
				SwordDelay=2
				Extend=2
				SpiritHand=1
				Steady=9
				GiantForm=1
				FluidForm=1
				GodKi=1
				IconLock='DarknessFlame.dmi'
				HitSpark='Slash - Black.dmi'
				HitSize=1.5
				HitX=-32
				HitY=-32
				HitTurn=1
				KenWave=4
				KenWaveIcon='DarkKiai.dmi'
				ActiveMessage="dedicates their entire existence to their blade!"
				OffMessage="sacrifices their potential completely..."
				verb/Final_Getsuga_Tenshou()
					set category="Skills"
					src.Trigger(usr)
					if(usr.BuffOn(src))
						usr.AddSkill(new/obj/Skills/AutoHit/Mugetsu)
					if(!usr.BuffOn(src))//once you turn it off
						for(var/obj/Skills/AutoHit/Mugetsu/MGS in usr.contents)
							del MGS
						for(var/obj/Skills/Buffs/SpecialBuffs/Sword/Final_Getsuga_Tenshou/FGT in usr.contents)
							del FGT
//Cybernetics and Enchantment
		MilitaryFrames
			Overdrive
				SignatureTechnique=3
				KiControl=1
				ManaThreshold=0.001
				ManaLeak=2
				SpdMult=1.5
				RecovMult=1.5
				Overdrive=1
				OverClock=0.2
				AllOutPU=1
				AuraLock=1
				LockX=0
				LockY=0
				TextColor=rgb(0, 200, 0)
				ActiveMessage="overloads their cybernetics!"
				OffMessage="suffers a circuitry breakdown!"
				verb/Overdrive()
					set category="Skills"
					switch(usr.Race)
						if("Android")
							src.ManaLeak=0
							src.NeedsHealth=50
							src.TooMuchHealth=75
							src.OverClock=0.05
							src.ActiveMessage="overloads their systems!"
							src.OffMessage="experiences a temporary shutdown of their systems!"
					src.Trigger(usr)
			Ripper_Mode
				SignatureTechnique=3
				ManaThreshold=0.001
				ManaLeak=1
				SpdMult=1.5
				OffMult=1.8
				DefMult=0.7
				Steady=8
				Godspeed=1
				Pursuer=1
				Flicker=1
				IconLock='RipperMode.dmi'
				IconLockBlend=2
				LockX=0
				LockY=0
				ActiveMessage="is overtaken by a more sadistic personality as they overclock their cybernetics!"
				OffMessage="falters as their cyber-sadism is repressed..."
				verb/Ripper_Mode()
					set category="Skills"
					switch(usr.Race)
						if("Android")
							src.ManaLeak=0
							src.NeedsHealth=50
							src.TooMuchHealth=75
							src.ActiveMessage="shuts off their empathy circuit as they overclock their systems!"
					src.Trigger(usr)
			Armstrong_Augmentation
				SignatureTechnique=3
				ManaThreshold=0.001
				ManaLeak=1
				StrMult=1.7
				EndMult=1.8
				DefMult=0.5
				WeaponBreaker=1
				Juggernaut=1
				Hardening=2
				CriticalDamage=2
				CriticalChance=5
				IconLock='BusoKoka.dmi'
				LockX=0
				LockY=0
				ActiveMessage="laughs haughtily as they bolster their defenses with the best technology in the world!"
				OffMessage="stumbles as their arrogant bulwark fades away..."
				verb/Armstrong_Augmentation()
					set category="Skills"
					switch(usr.Race)
						if("Android")
							src.ManaLeak=0
							src.NeedsHealth=50
							src.TooMuchHealth=75
							src.ActiveMessage="sheens metallically as they bolster their defenses with the best technology in the world!"
					src.Trigger(usr)
			Ray_Gear
				SignatureTechnique=3
				ManaThreshold=0.001
				ManaLeak=1
				ForMult=2
				EndMult=1.3
				SpdMult=0.7
				SpecialStrike=1
				Instinct=1
				QuickCast=3
				SureHitTimerLimit=30
				ActiveMessage="arms themselves with enormous firepower, a weapon to surpass all!"
				OffMessage="ditches the excess weaponry..."
				verb/Ray_Gear()
					set category="Skills"
					switch(usr.Race)
						if("Android")
							src.ManaLeak=0
							src.NeedsHealth=50
							src.TooMuchHealth=75
							src.ActiveMessage="becomes a weapon to surpass all!"
					src.Trigger(usr)


//Tier S
		Saint_Cloth
			HairLock='BLANK.dmi'
			FlashChange=1
			MakesArmor=1
			StripEquip=2
			Cooldown=-1
			verb/Toggle_Helmet()
				set category="Roleplay"
				var/image/im=image(icon=src.TopOverlayLock, pixel_x=src.TopOverlayX, pixel_y=src.TopOverlayY, layer=FLOAT_LAYER-1)
				im.blend_mode=src.IconLockBlend
				im.transform*=src.OverlaySize
				if(src.OverlaySize>=2)
					im.appearance_flags+=512

				var/image/im2=image(icon='goldsaintlibra_staff.dmi', layer=FLOAT_LAYER)
				if(usr.BuffOn(src))
					if(!src.NoTopOverlay)
						if(usr.CheckSpecial("Libra Cloth"))
							usr.overlays-=im2
						if(usr.HairLocked)
							usr.HairLock=null
							usr.HairLocked=null
						usr.overlays-=im
						usr.Hairz("Add")
						if(usr.CheckSpecial("Libra Cloth"))
							usr.overlays+=im2
						usr << "You remove your helmet!"
						src.NoTopOverlay=1
					else
						if(usr.CheckSpecial("Libra Cloth"))
							usr.overlays-=im2
						if(src.HairLock!=1)
							usr.HairLock=src.HairLock
							usr.HairLocked=1
						usr.Hairz("Add")
						usr.overlays+=im
						if(usr.CheckSpecial("Libra Cloth"))
							usr.overlays+=im2
						usr << "You put your helmet back on!"
						src.NoTopOverlay=0
			Bronze_Cloth
				PUSpeedModifier=0.5
				MovementMastery=5
				ArmorClass="Light"
				ArmorAscension=1
				Pegasus_Cloth
					StrMult=1.5
					SpdMult=1.5
					Desperation=1
					Godspeed=1
					ArmorIcon='saintpegasus_armor.dmi'
					TopOverlayLock='saintpegasus_helmet.dmi'
					ActiveMessage="dons the Cloth of the Pegasus, embracing its rebelious ascent!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Pegasus"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.Desperation=0
							src.Godspeed=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Dragon_Cloth
					StrMult=1.2
					EndMult=1.6
					DefMult=1.2
					CriticalBlock=2
					BlockChance=10
					Reversal=1
					ArmorIcon='saintdragon_armor.dmi'
					TopOverlayLock='saintdragon_helmet.dmi'
					ActiveMessage="dons the Cloth of the Dragon, embracing its unflinching pride!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Dragon"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.Deflection=0
							src.Reversal=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Cygnus_Cloth
					ForMult=1.7
					OffMult=1.1
					DefMult=1.2
					HairLock=1
					VenomImmune=1
					WalkThroughHell=1
					Chilling=1
					ArmorIcon='saintcygnus_armor.dmi'
					TopOverlayLock='saintcygnus_helmet.dmi'
					ActiveMessage="dons the Cloth of the Swan, embracing its stoic and cold grace!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Cygnus"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.VenomImmune=0
							src.WalkThroughHell=0
							src.Chilling=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Andromeda_Cloth
					EndMult=1.4
					SpdMult=1.1
					OffMult=1.2
					DefMult=1.3
					BuffTechniques=list("/obj/Skills/Buffs/SlotlessBuffs/Andromeda_Chain")
					ArmorIcon='saintandromeda_armor.dmi'
					TopOverlayLock='saintandromeda_helmet.dmi'
					ActiveMessage="dons the Cloth of Andromeda, embracing its gentle sacrifice..."
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Andromeda"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.BuffTechniques=list()
							src.Extend=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Phoenix_Cloth
					MovementMastery=10
					ArmorAscension=2
					StrMult=1.4
					ForMult=1.4
					OffMult=1.2
					BuffTechniques=list("/obj/Skills/Projectile/Phoenix_Feathers")
					ArmorIcon='saintphoenix_armor.dmi'
					TopOverlayLock='saintphoenix_helmet.dmi'
					ActiveMessage="dons the Cloth of the Phoenix, embracing its inextinguishable passion!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Phoenix"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.BuffTechniques=list()
							src.ArmorAscension=1
						src.NoTopOverlay=0
						src.Trigger(usr)
			Bronze_Cloth_V2
				MovementMastery=10
				ArmorClass="Medium"
				ArmorAscension=2
				HairLock=1
				Pegasus_Cloth
					StrMult=1.5
					SpdMult=1.5
					Desperation=1
					Godspeed=1
					ArmorElement="Light"
					ArmorIcon='saintpegasusv3_armor.dmi'
					TopOverlayLock='saintpegasusv3_helmet.dmi'
					ActiveMessage="dons the renewed Cloth of the Pegasus, embracing its rebelious ascent!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Pegasus"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.Desperation=0
							src.Godspeed=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Dragon_Cloth
					StrMult=1.2
					EndMult=1.6
					DefMult=1.2
					CriticalBlock=2
					BlockChance=20
					Reversal=1
					ArmorIcon='saintdragonv3_armor.dmi'
					TopOverlayLock='saintdragonv3_helmet.dmi'
					ActiveMessage="dons the renewed Cloth of the Dragon, embracing its unflinching pride!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Dragon"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.BlockChance=0
							src.Reversal=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Cygnus_Cloth
					ForMult=1.7
					OffMult=1.1
					DefMult=1.2
					HairLock=1
					VenomImmune=1
					WalkThroughHell=1
					Freezing=1
					ArmorIcon='saintcygnusv3_armor.dmi'
					TopOverlayLock='saintcygnusv3_helmet.dmi'
					ActiveMessage="dons the renewed Cloth of the Swan, embracing its stoic and cold grace!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Cygnus"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.VenomImmune=0
							src.WalkThroughHell=0
							src.Freezing=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Andromeda_Cloth
					EndMult=1.4
					SpdMult=1.1
					OffMult=1.2
					DefMult=1.3
					BuffTechniques=list("/obj/Skills/Buffs/SlotlessBuffs/Andromeda_Chain")
					ArmorIcon='saintandromedav3_armor.dmi'
					TopOverlayLock='saintandromedav3_helmet.dmi'
					ActiveMessage="dons the renewed Cloth of Andromeda, embracing its gentle sacrifice..."
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Andromeda"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.Deflection=0
							src.Extend=0
						src.NoTopOverlay=0
						src.Trigger(usr)
				Phoenix_Cloth
					MovementMastery=15
					ArmorClass="Medium"
					ArmorAscension=3
					StrMult=1.4
					ForMult=1.4
					OffMult=1.2
					BuffTechniques=list("/obj/Skills/Projectile/Phoenix_Feathers")
					ArmorIcon='saintphoenixv3_armor.dmi'
					TopOverlayLock='saintphoenixv3_helmet.dmi'
					ActiveMessage="dons the reborn Cloth of the Phoenix, embracing its inextinguishable passion!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						if(usr.ClothBronze!="Phoenix"||src.AssociatedLegend.BoundEquip!=usr)
							usr << "You aren't attuned to this Cloth!"
							src.MovementMastery=-5
							src.ArmorAscension=2
						src.NoTopOverlay=0
						src.Trigger(usr)
			Gold_Cloth
				MovementMastery=20
				DebuffImmune=1
				SpaceWalk=1//gold
				StaticWalk=1
				ArmorClass="Heavy"
				ArmorElement="Light"
				ArmorAscension=3
				var/NoExtraOverlay=1
				verb/Toggle_Cape()
					set category="Roleplay"
					var/image/im=image(icon='goldsaint_cape.dmi', layer=FLOAT_LAYER-3)
					if(usr.SagaLevel<7)
						usr << "You're not worthy of a cape yet!"
						return
					if(usr.BuffOn(src))
						if(!src.NoExtraOverlay)
							usr.overlays-=im
							usr << "You remove your cape!"
							src.NoExtraOverlay=1
						else
							usr.overlays+=im
							usr.Hairz("Add")
							usr << "You put your cape on!"
							src.NoExtraOverlay=0
				Aries_Cloth
					ForMult=1.3
					EndMult=1.3
					DefMult=1.4
					SpiritFlow=1
					SpiritHand=1
					TechniqueMastery=5
					ArmorIcon='goldsaintaries_armor.dmi'
					TopOverlayLock='goldsaintaries_helmet.dmi'
					TopOverlayX=-32
					TopOverlayY=-32
					ActiveMessage="dons the Gold Cloth of Aries, embracing its elusive wisdom!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Gemini_Cloth
					StrMult=1.2
					ForMult=1.2
					EndMult=1.2
					OffMult=1.2
					DefMult=1.2
					BuffMastery=1
					HolyMod=2
					AbyssMod=2
					ArmorIcon='goldsaintgemini_armor.dmi'
					TopOverlayLock='goldsaintgemini_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Gemini, embracing its mystic duality!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Cancer_Cloth
					ForMult=1.4
					OffMult=1.4
					DefMult=1.2
					HairLock=1
					MartialMagic=1
					AbyssMod=3
					ArmorIcon='goldsaintcancer_armor.dmi'
					TopOverlayLock='goldsaintcancer_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Cancer, embracing its cunning tenacity!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Leo_Cloth
					StrMult=1.2
					ForMult=1.1
					SpdMult=1.7
					HairLock=1
					DoubleStrike=1
					TripleStrike=1
					Godspeed=1
					Intimidation=1.25
					ArmorIcon='goldsaintleo_armor.dmi'
					TopOverlayLock='goldsaintleo_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Leo, embracing its intimidating ferocity!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Virgo_Cloth
					ForMult=1.4
					OffMult=1.2
					DefMult=1.4
					HybridStrike=1
					FluidForm=1
					HolyMod=3
					ArmorIcon='goldsaintvirgo_armor.dmi'
					TopOverlayLock='goldsaintvirgo_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Virgo, embracing its unapproachable purity!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Libra_Cloth
					OffMult=1.3
					DefMult=1.3
					SpdMult=1.4
					BlockChance=40
					CriticalBlock=2
					Deflection=2
					BuffTechniques=list("/obj/Skills/Buffs/SlotlessBuffs/Libra_Armory","/obj/Skills/Projectile/Beams/Big/Saint_Seiya/Beam_of_Libra")
					ArmorIcon='goldsaintlibra_armor.dmi'
					TopOverlayLock='goldsaintlibra_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Libra, embracing its fluid equilibrium!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						if(usr.BuffOn(src))
							var/image/st=image(icon='goldsaintlibra_staff.dmi', layer=FLOAT_LAYER)
							usr.overlays+=st
				Scorpio_Cloth
					ForMult=1.5
					OffMult=1.3
					SpdMult=1.2
					HairLock=1
					HardStyle=1
					Curse=1
					Shearing=1
					ArmorIcon='goldsaintscorpio_armor.dmi'
					TopOverlayLock='goldsaintscorpio_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Scorpio, embracing its cruel precision!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Capricorn_Cloth
					StrMult=1.3
					ForMult=1.3
					OffMult=1.4
					SureDodgeTimerLimit=10
					SureHitTimerLimit=10
					SwordAscension=1
					ArmorIcon='goldsaintcapricorn_armor.dmi'
					TopOverlayLock='goldsaintcapricorn_helmet.dmi'
					TopOverlayX=-32
					TopOverlayY=-32
					ActiveMessage="dons the Gold Cloth of Capricorn, embracing its boundless chivalry!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Aquarius_Cloth
					ForMult=1.7
					OffMult=1.1
					DefMult=1.2
					HairLock=1
					SoftStyle=1
					Freezing=1
					Erosion=0.3
					ArmorIcon='goldsaintaquarius_armor.dmi'
					TopOverlayLock='goldsaintaquarius_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Aquarius, embracing its overflowing calmness!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()
				Pisces_Cloth
					ForMult=1.2
					OffMult=1.1
					DefMult=1.5
					Toxic=1
					ArmorElement="Poison"
					DeathField=5
					ArmorIcon='goldsaintpisces_armor.dmi'
					TopOverlayLock='goldsaintpisces_helmet.dmi'
					ActiveMessage="dons the Gold Cloth of Pisces, embracing its deceptive gleam!"
					OffMessage="discards the Cloth..."
					verb/Don_Cloth()
						set category="Skills"
						src.NoTopOverlay=0
						src.Trigger(usr)
						src.Toggle_Cape()

		Valor_Form
			FlashChange=1
			ABuffNeeded=list("Keyblade")
			MakesSecondSword=1
			SwordClassSecond="Wooden"
			SwordAscensionSecond=2
			SwordIconSecond='KingdomKey.dmi'
			SwordXSecond=-32
			SwordYSecond=-32
			ManaLeak=1
			ManaThreshold=1
			Pursuer=1
			Flicker=1
			StunningStrike=1
			DoubleStrike=1
			StrMult=1.5
			OffMult=1.5
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=3
			KenWaveX=105
			KenWaveY=105
			ActiveMessage="glows with limitless valor!"
			OffMessage="de-syncs their keyblades..."
			Cooldown=60
			verb/Valor_Form()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.CheckActive("Keyblade"))
						if(!src.Using)
							if(prob(7.5*usr.LimitCounter) && usr.SagaLevel < 8)
								usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/AntiForm)
								usr.LimitCounter=0
								return
							src.SwordClassSecond=GetKeychainClass(usr.SyncAttached)
							src.SwordDamageSecond=GetKeychainDamage(usr.SyncAttached)
							src.SwordAccuracySecond=GetKeychainAccuracy(usr.SyncAttached)
							src.SwordDelaySecond=GetKeychainDelay(usr.SyncAttached)
							src.SwordElementSecond=GetKeychainElement(usr.SyncAttached)
							src.SwordIconSecond=GetKeychainIconReversed(usr.SyncAttached)
							if(usr.SyncAttached=="Way To Dawn")
								src.HolyMod=3
								src.AbyssMod=3
							else
								src.HolyMod=0
								src.AbyssMod=0
							if(usr.SyncAttached=="Fenrir")
								src.Steady=8
							else
								src.Steady=0
							if(usr.SyncAttached=="Chaos Ripper")
								src.Burning=1
								src.Scorching=1
								src.DarknessFlame=1
							else
								src.Burning=0
								src.Scorching=0
								src.DarknessFlame=0
							if(usr.SyncAttached=="No Name")
								src.StealsStats=0
							else
								src.StealsStats=0
							usr.LimitCounter+=1
				src.Trigger(usr)
		Wisdom_Form
			FlashChange=1
			ABuffNeeded=list("Keyblade")
			ManaLeak=1
			ManaThreshold=1
			QuickCast=1
			Skimming=1
			SpecialStrike=1
			MovingCharge=1//Battlemage passive
			ForMult=1.5
			DefMult=1.5
			KenWave=1
			KenWaveIcon='SparkleBlue.dmi'
			KenWaveSize=3
			KenWaveX=105
			KenWaveY=105
			ActiveMessage="glows with limitless wisdom!"
			OffMessage="de-syncs their keyblade..."
			Cooldown=60
			verb/Wisdom_Form()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.CheckActive("Keyblade"))
						if(!src.Using)
							if(prob(5*usr.LimitCounter) && usr.SagaLevel < 8)
								usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/AntiForm)
								usr.LimitCounter=0
								return
							usr.LimitCounter+=1
				src.Trigger(usr)
		Master_Form
			FlashChange=1
			ABuffNeeded=list("Keyblade")
			ManaLeak=2
			ManaThreshold=1
			MakesSecondSword=1
			SwordClassSecond="Bokken"
			SwordAscensionSecond=2
			SwordIconSecond='KingdomKey.dmi'
			SwordXSecond=-32
			SwordYSecond=-32
			PowerMult=1.5
			TechniqueMastery=5
			Pursuer=1
			QuickCast=1
			Flicker=1
			DoubleStrike=1
			MovingCharge=1
			StrMult=1.25
			ForMult=1.25
			OffMult=1.25
			DefMult=1.25
			KenWave=1
			KenWaveIcon='SparkleYellow.dmi'
			KenWaveSize=3
			KenWaveX=105
			KenWaveY=105
			ActiveMessage="glows with limitless unity!"
			OffMessage="de-syncs their keyblades..."
			Cooldown=60
			verb/Master_Form()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.CheckActive("Keyblade"))
						if(!src.Using)
							if(prob(7.5*usr.LimitCounter) && usr.SagaLevel < 8)
								usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/AntiForm)
								usr.LimitCounter=0
								return
							src.SwordClassSecond=GetKeychainClass(usr.SyncAttached)
							src.SwordDamageSecond=GetKeychainDamage(usr.SyncAttached)
							src.SwordAccuracySecond=GetKeychainAccuracy(usr.SyncAttached)
							src.SwordDelaySecond=GetKeychainDelay(usr.SyncAttached)
							src.SwordElementSecond=GetKeychainElement(usr.SyncAttached)
							src.SwordIconSecond=GetKeychainIconReversed(usr.SyncAttached)
							if(usr.SyncAttached=="Way To Dawn")
								src.HolyMod=3
								src.AbyssMod=3
							else
								src.HolyMod=0
								src.AbyssMod=0
							if(usr.SyncAttached=="Fenrir")
								src.Steady=8
							else
								src.Steady=0
							if(usr.SyncAttached=="Chaos Ripper")
								src.Burning=1
								src.Scorching=1
								src.DarknessFlame=1
							else
								src.Burning=0
								src.Scorching=0
								src.DarknessFlame=0
							if(usr.SyncAttached=="No Name")
								src.StealsStats=0
							else
								src.StealsStats=0
							usr.LimitCounter+=2
				src.Trigger(usr)

		Final_Form
			FlashChange=1
			ABuffNeeded=list("Keyblade")
			ManaLeak=0.5
			ManaThreshold=1
			MakesSecondSword=1
			SwordClassSecond="Bokken"
			SwordAscensionSecond=2
			SwordIconSecond='KingdomKey.dmi'
			SwordXSecond=-32
			SwordYSecond=-32
			TechniqueMastery=10
			GodKi=0.25
			Intimidation=2
			AngerMult=2
			QuickCast=2
			Godspeed=2
			Pursuer=2
			Flicker=2
			Skimming=2
			DoubleStrike=1
			TripleStrike=1
			MovingCharge=1
			CalmAnger=1
			StrMult=1.25
			ForMult=1.25
			OffMult=1.25
			DefMult=1.25
			KenWave=1
			KenWaveIcon='SparkleFinal.dmi'
			KenWaveSize=3
			KenWaveX=105
			KenWaveY=105
			ActiveMessage="glows with limitless heart!"
			OffMessage="de-syncs with their heart..."
			Cooldown=10800
			verb/Final_Form()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.CheckActive("Keyblade"))
						if(!src.Using)
							src.SwordClassSecond=GetKeychainClass(usr.SyncAttached)
							src.SwordDamageSecond=GetKeychainDamage(usr.SyncAttached)
							src.SwordAccuracySecond=GetKeychainAccuracy(usr.SyncAttached)
							src.SwordDelaySecond=GetKeychainDelay(usr.SyncAttached)
							src.SwordElementSecond=GetKeychainElement(usr.SyncAttached)
							src.SwordIconSecond=GetKeychainIconReversed(usr.SyncAttached)
							if(usr.SyncAttached=="Way To Dawn")
								src.HolyMod=3
								src.AbyssMod=3
							else
								src.HolyMod=0
								src.AbyssMod=0
							if(usr.SyncAttached=="Fenrir")
								src.Steady=8
							else
								src.Steady=0
							if(usr.SyncAttached=="Chaos Ripper")
								src.Burning=1
								src.Scorching=1
								src.DarknessFlame=1
							else
								src.Burning=0
								src.Scorching=0
								src.DarknessFlame=0
							if(usr.SyncAttached=="No Name")
								src.StealsStats=0
							else
								src.StealsStats=0
							usr.LimitCounter+=3
				src.Trigger(usr)

		KamuiSenjin
			FlashChange=1
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=2
			KenWaveTime=5
			KenWaveX=105
			KenWaveY=105
			ABuffNeeded=list("Life Fiber Synchronize")
			ActiveMessage="augments their Kamui with powerful blades!"
			OffMessage="shrinks the blades back into their uniform..."
			StrMult=1.5
			OffMult=1.5
			PureDamage=3
			DeathField=3
			HardStyle=1
			Juggernaut=1
			IconLock='Kamui_Uniform_stage_3.dmi'
			TopOverlayLock='Kamui_Uniform_stage_3_headpiece.dmi'
			TopOverlayX=0
			TopOverlayY=0
			verb/Kamui_Senjin()
				set category="Skills"
				src.Trigger(usr)
		KamuiShippu
			FlashChange=1
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=2
			KenWaveTime=5
			KenWaveX=105
			KenWaveY=105
			ABuffNeeded=list("Life Fiber Synchronize")
			ActiveMessage="augments their Kamui to become a streamlined aerial form!"
			OffMessage="relaxes the aerodynamics of their uniform..."
			SpdMult=1.5
			DefMult=1.5
			Pursuer=3
			Skimming=2
			Flicker=1
			IconLock='Kamui_Uniform_stage_4.dmi'
			LockX=-16
			LockY=-16
			TopOverlayLock='Kamui_Uniform_stage_4_headpiece.dmi'
			TopOverlayX=-16
			TopOverlayY=-16
			verb/Kamui_Shippu()
				set category="Skills"
				src.Trigger(usr)
		KamuiSenjinShippu
			FlashChange=1
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=2
			KenWaveTime=5
			KenWaveX=105
			KenWaveY=105
			ABuffNeeded=list("Life Fiber Synchronize")
			ActiveMessage="balances destructive capability and quick movement with a new fierce Kamui form!"
			OffMessage="returns their Kamui to its usual configuration..."
			StrMult=1.25
			SpdMult=1.25
			DefMult=1.25
			OffMult=1.25
			PureDamage=3
			DeathField=3
			HardStyle=1
			Juggernaut=1
			Pursuer=3
			Skimming=2
			Flicker=1
			IconLock='Kamui_Uniform_stage_5.dmi'
			LockX=-16
			LockY=-16
			TopOverlayLock='Kamui_Uniform_stage_5_headpiece.dmi'
			TopOverlayX=-16
			TopOverlayY=-16
			verb/Kamui_Senjin_Shippu()
				set category="Skills"
				src.Trigger(usr)
		KamuiSenpu
			KiControl=1
			PUSpike=100
			FlashChange=1
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=2
			KenWaveTime=5
			KenWaveX=105
			KenWaveY=105
			ABuffNeeded=list("Life Fiber Override")
			ActiveMessage="forces their Kamui to assume a more aerodynamic form!"
			OffMessage="allows their Kamui to rest..."
			SpdMult=1.5
			EndMult=1.5
			Pursuer=3
			Skimming=2
			Flicker=1
			IconLock='JunKamui_Stage_3.dmi'
			LockX=-16
			LockY=-16
			TopOverlayLock='JunKamui_Stage_3_Pauldrons-Headpiece.dmi'
			TopOverlayX=-16
			TopOverlayY=-16
			verb/Kamui_Senpu()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.PowerControl>100)
						usr << "You cannot risk pouring that amount of blood into the Kamui!"
						return
				src.Trigger(usr)
		KamuiSenpuZanken
			KiControl=1
			PUSpike=100
			FlashChange=1
			KenWave=1
			KenWaveIcon='SparkleRed.dmi'
			KenWaveSize=2
			KenWaveTime=5
			KenWaveX=105
			KenWaveY=105
			ABuffNeeded=list("Life Fiber Override")
			ActiveMessage="forces their Kamui to assume a dangerous and agile form!"
			OffMessage="allows their Kamui to rest..."
			StrMult=1.25
			SpdMult=1.5
			EndMult=1.25
			PureDamage=3
			DeathField=3
			HardStyle=1
			Juggernaut=1
			Pursuer=3
			Skimming=2
			Flicker=1
			IconLock='JunKamui_Stage_4.dmi'
			LockX=-16
			LockY=-16
			TopOverlayLock='JunKamui_Stage_4_Pauldrons-_Head_piece.dmi'
			TopOverlayX=-16
			TopOverlayY=-16
			verb/Kamui_Senpu_Zanken()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.PowerControl>100)
						usr << "You cannot risk pouring that amount of blood into the Kamui!"
						return
				src.Trigger(usr)
		Kamui_Unite
			HardStyle=5
			Juggernaut=2
			DeathField=10
			Pursuer=5
			Flicker=3
			StrMult=1.5
			EndMult=1.5
			SpdMult=1.5
			ActiveMessage="unites with their Kamui!"
			Cooldown=60//just to force using
			verb/Kamui_Unite()
				set category="Skills"
				if(usr.KamuiType=="Impulse")
					src.ABuffNeeded=list("Life Fiber Synchronize")
				else
					src.ABuffNeeded=list("Life Fiber Override")
				src.Trigger(usr)
				if(src.Using)
					usr.GodKi=0
					if(usr.KamuiType=="Impulse")
						OMsg(usr, "<font color='red'>Senketsu says: [usr] ... There comes a time when every girl has to put away their sailor suit...</font color>")
						OMsg(usr, "<font color='red'>Senketsu crumbles away due to the batshit insane strain on his fibers...")
						usr.KamuiBuffLock=1
					if(usr.KamuiType=="Purity")
						OMsg(usr, "<font color='cyan'>[usr] says: At last ... My empire is fulfilled...</font color>")
						OMsg(usr, "<font color='cyan'>Junketsu screams one last time before its life fibers are completely subjugated...")
						usr.KamuiBuffLock=1
					usr.ActiveBuff.Trigger(usr)
					for(var/obj/Items/Symbiotic/Kamui/KamuiSenketsu/ks in usr)
						if(ks.suffix)
							ks.AlignEquip(usr)
						del ks
					for(var/obj/Items/Symbiotic/Kamui/KamuiJunketsu/ks in usr)
						if(ks.suffix)
							ks.AlignEquip(usr)
						del ks

		Resolve//Purity Kamui special slot
			EndMult=2
			AllOutPU=1
			KKTWave=3
			KKTWaveSize=0.8
			OffMessage="relaxes their resolve..."
			FatigueThreshold=90
			FatigueLeak=2
			verb/Resolve()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.PowerControl>100)
						usr << "You need to steel your resolve first!"
						return
					switch(usr.SagaLevel)
						if(2)
							src.ActiveMessage="draws on the resolve to fulfill their goals!"
							src.MovementMastery=5
							src.BuffMastery=2
							FatigueLeak=2
						if(3)
							src.ActiveMessage="draws on the resolve to fulfill their goals!"
							src.MovementMastery=6
							src.BuffMastery=2.5
							FatigueLeak=2
						if(4)
							src.ActiveMessage="sharpens the resolve to mercilessly fulfill their goals!"
							src.MovementMastery=7
							src.BuffMastery=3
							src.Pursuer=1
							src.Flicker=1
							src.FatigueLeak=2
						if(5)
							src.ActiveMessage="sharpens the resolve to mercilessly fulfill their goals!"
							src.MovementMastery=8
							src.BuffMastery=3
							src.Pursuer=1
							src.Flicker=1
							src.PureDamage=1
							src.DeathField=3
							src.HardStyle=0.5
							FatigueLeak=2
						if(6)
							src.ActiveMessage="sharpens the resolve to extend their empire!"
							src.MovementMastery=9
							src.BuffMastery=4
							src.Pursuer=2
							src.Flicker=1
							src.PureDamage=2
							src.DeathField=4
							src.HardStyle=1
							FatigueLeak=2
						if(7)
							src.ActiveMessage="sharpens the resolve to extend their empire!"
							src.MovementMastery=10
							src.BuffMastery=5
							src.Pursuer=3
							src.Flicker=2
							src.PureDamage=3
							src.PureReduction=3
							src.DeathField=5
							src.HardStyle=2
							src.SureHitTimerLimit=10
							src.SureDodgeTimerLimit=10
							FatigueLeak=1
						if(8)
							src.ActiveMessage="sharpens the resolve to extend their empire!"
							src.MovementMastery=10
							src.BuffMastery=5
							FatigueLeak=0
							FatigueThreshold=null
				src.Trigger(usr)

		Denjin_Renki
			ManaCost=100
			ForMult=2
			SoftStyle=2
			StunningStrike=1
			SpiritHand=1
			Paralyzing=1
			IconLock='Ripple Arms.dmi'
			LockX=0
			LockY=0
			TimerLimit=60
			Cooldown=120
			ActiveMessage="projects a disciplined aura as their fists crackle with lightning!"
			OffMessage="releases their tremendous focus..."
			verb/Denjin_Renki()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.SagaLevel<7)
						src.ManaCost=100
					if(usr.SagaLevel==7)
						src.ManaCost=50
					if(usr.SagaLevel>=8)
						src.ManaCost=0
				src.Trigger(usr)

		King_Of_Braves
			PowerGlows=list(1,0.8,0.8, 0,1,0, 0.8,0.8,1, 0,0,0)
			Desperation=1
			OffMessage="deactivates the green energy..."
			verb/King_Of_Braves()
				set category="Skills"
				if(!usr.SpecialBuff)
					var/list/Options=list("Offense", "Defense")
					if(usr.SagaLevel>=6)
						Options.Add("Genesic")
					Options.Add("Cancel")
					var/Type=input(usr, "What will you focus your courage on?", "King of Braves") in Options
					if(Type=="Cancel")
						return
					switch(Type)
						if("Offense")
							src.StrMult=1.5
							src.EndMult=1
							src.ForMult=1.5
							src.RegenMult=1
							src.BuffName="Broken Brave"
						if("Defense")
							src.StrMult=1
							src.EndMult=1.5
							src.ForMult=1
							src.RegenMult=1.5
							src.BuffName="Protect Brave"
						if("Genesic")
							src.StrMult=1.25
							src.EndMult=1.25
							src.ForMult=1.25
							src.RegenMult=1.25
							src.BuffName="Genesic Brave"
					if(usr.SagaLevel>=3)
						src.AutoAnger=1
					src.ActiveMessage="surrounds their body in a faint green aura!"
					if(usr.SagaLevel>1&&usr.SagaLevel<6)
						src.ActiveMessage="draws power from their courage as they pulse with green light!"
					if(usr.SagaLevel>=6)
						src.ActiveMessage="roars with the ferocity of a lion!!  They embody true courage!!"
						src.AngerMult=2
				src.Trigger(usr)

		OverSoul
			Cooldown=10800
			NeedsSword=1
			StrMult=1.5
			OffMult=1.3
			DefMult=1.2
			SpdMult=2
			TransMimic=1
			NeedsHealth=50
			TooMuchHealth=75
			Transform="Weapon"
			ABuffNeeded=list("Soul Resonance")
			verb/OverSoul()
				set category="Skills"
				if(src.TransMimic<usr.TransUnlocked())
					src.TransMimic=usr.TransUnlocked()
				if(usr.SagaLevel<8)
					src.TimerLimit=90
					NeedsHealth=50
					TooMuchHealth=75
				else
					src.TimerLimit=0
					src.NeedsHealth=0
					src.TooMuchHealth=0
				if(usr.BoundLegend=="Caledfwlch")
					HealthHeal=0.25
					WoundHeal=1
					EnergyHeal=1
					FatigueHeal=1
					ManaHeal=1
					StableHeal=1
					OffMessage="loses the sheath once again..."
				else
					OffMessage="seals the blade once again..."
				if(!usr.BuffOn(src) && !src.Using)
					usr.Stasis=7
				src.Trigger(usr)

		Sharingan
			OffMult=1.5
			DefMult=1.5
			Maki=1
			IconLock='SharinganEyes.dmi'
			LockX=0
			LockY=0
			ActiveMessage="is filled with cold rage as their eyes turn red and one tomoe appears in their iris!"
			OffMessage="relaxes their hatred as their eyes return to a normal coloration..."
			verb/Sharingan()
				set category="Skills"
				if(!usr.BuffOn(src))
					switch(usr.SagaLevel)
						if(1)
							src.OffMult=1.5
							src.DefMult=1.5
							src.SureDodgeTimerLimit=30
							src.Instinct=0
							src.Flow=1
							src.FatigueDrain=0.1
							ActiveMessage="is filled with cold rage as their eyes turn red and one tomoe appears in their iris!"
						if(2)
							src.OffMult=1.5
							src.DefMult=1.5
							src.SureDodgeTimerLimit=20
							src.Instinct=1
							src.Flow=1
							src.FatigueDrain=0.05
							ActiveMessage="is filled with cold rage as their eyes turn red and two tomoe appear in their iris!"
					if(usr.SagaLevel>=3)
						src.OffMult=1.5
						src.DefMult=1.5
						src.SureDodgeTimerLimit=10
						src.Instinct=2
						src.Flow=2
						src.FatigueDrain=0
						ActiveMessage="is filled with blinding hatred as their eyes turn red and three tomoe appear in their iris!"
				src.Trigger(usr)

		Symbiote_Evolution
			EnergyMult=1.5
			RegenMult=1.25
			RecovMult=1.25
			BuffTechniques = list("/obj/Skills/Buffs/SlotlessBuffs/Regeneration")
			ActiveMessage="forces their symbiote out!"
			OffMessage="restrains their symbiotic companion..."
			verb/Total_Symbiosis()
				set category="Skills"
				src.Trigger(usr)
				if(usr.BuffOn(src))
					for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/s in usr)
						s.NeedsHealth=101
						s.NeedsVary=0
						s.TooMuchHealth=0
						s.VaizardShatter=0
						s.Curse=0
				else
					for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/s in usr)
						s.NeedsHealth=25
						s.NeedsVary=1
						s.TooMuchHealth=75
						s.VaizardShatter=1
						if(usr.AscensionsAcquired>=2)
							s.Curse=1

	SlotlessBuffs
		Slotless=1
//Racials
		Regeneration
			UnrestrictedBuff=1
			Cooldown=600
			CooldownStatic=1
			CooldownScaling=1
			ActiveMessage="begins to regenerate rapidly!"
			OffMessage="stops regenerating..."
			verb/Regenerate()
				set category="Skills"
				if(!usr.BuffOn(src))
					src.FatigueCost=15
					src.HealthHeal=0.5
					src.TimerLimit=20
					if(usr.Secret=="Werewolf")
						src.Cooldown=300
					else if(usr.Race=="Djinn")
						src.Cooldown=150
						if(usr.AscensionsAcquired>=1&&usr.AscensionsAcquired<3)
							src.HealthHeal=1
							src.TimerLimit=10
							src.ActiveMessage="regenerates nigh instantly!"
						else
							src.HealthHeal=10
							src.TimerLimit=1
							src.ActiveMessage="regenerates instantly!"
					else if(usr.Symbiote)
						src.FatigueCost=0
						src.WoundCost=15
				src.Trigger(usr)
				if(usr.BuffOn(src))
					if(!usr.Sheared)
						if(usr.BPPoisonTimer>1&&usr.BPPoison<1)
							usr.BPPoison=1
							usr.BPPoisonTimer=1
							OMsg(usr, "[usr] regenerates all serious injury!")
						if(usr.MortallyWounded)
							usr.MortallyWounded-=1
							if(usr.MortallyWounded<0)
								usr.MortallyWounded=0
							OMsg(usr, "[usr] forces their bleeding to slow down!")
						if(usr.SenseRobbed)
							usr.SenseRobbed=0
							usr.TsukiyomiTime=1
							OMsg(usr, "[usr] regains use of their senses!")
						if(src.RegenerateLimbs)
							if(usr.Maimed)
								usr.Maimed-=1
								if(usr.Maimed<0)
									usr.Maimed=0
								OMsg(usr, "[usr] recovers from being maimed!")

		Elemental_Infusion
			ActiveMessage="infuses their weaponry with elemental energy!"
			EndYourself=1
			Cooldown=10800
			verb/Elemental_Infusion()
				set category="Skills"
				if(!usr.EquippedSword()&&!usr.EquippedStaff())
					usr << "There's nothing to infuse."
					return
				if(!usr.Attunement)
					usr << "You aren't attuned to any element to infuse into your weapon."
					return
				if(!usr.BuffOn(src))
					var/obj/Items/Sword/s
					var/obj/Items/Enchantment/Staff/s2
					if(usr.EquippedSword())
						NeedsSword=1
						s=usr.EquippedSword()
					else
						NeedsSword=0
					if(usr.EquippedStaff())
						NeedsStaff=1
						s2=usr.EquippedStaff()
					else
						NeedsStaff=0

					if(s && s.Element!="Ultima")
						s.Element=usr.Attunement
					if(s2 && s2.Element!= "Ultima")
						s2.Element=usr.Attunement
				src.Trigger(usr)

		Camouflage
			PULock=1
			AllowedPower=0.5
			Invisible=70
			Cooldown=150
			ActiveMessage="blends in with their surroundings..."
			OffMessage="reveals themselves!"
			verb/Camouflage()
				set category="Skills"
				src.Trigger(usr)

		Saiyan_Dominance
			NeedsHealth=75
			HealthThreshold=50
			TimerLimit=60
			AutoAnger=1
			PridefulRage=1
			TextColor=rgb(230, 230, 100)
			Cooldown=300
			SpdTax=0.25
			ActiveMessage="displays their superiority by crushing those who rose their hand at them!"
			OffMessage="ends their ruthless display of superiority..."
			verb/Saiyan_Dominance()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.Oozaru)
						usr << "Your precision is lacking in beastly form!"
						return
				src.Trigger(usr)

		Saiyan_Grit
			TextColor=rgb(230, 230, 100)
			Cooldown=300
			EndTax=0.25
			ActiveMessage="decides to stand their ground under the rain of attacks!!"
			OffMessage="finally gives in to the pain..."
			verb/Saiyan_Grit()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.DefianceCounter<6)
						usr << "Your rage hasn't spiked high enough yet!"
						return
					else
						src.VaizardHealth=(usr.DefianceCounter/8)
						src.VaizardShatter=1
						src.FINISHINGMOVE=1
						src.DefianceRetaliate=1
				src.Trigger(usr)

		Saiyan_Soul
			EnergyThreshold=30
			TextColor=rgb(230, 230, 100)
			Cooldown=300
			RecovTax=0.25
			ActiveMessage="pushes themselves even further to overwhelm their opponent!!"
			OffMessage="releases their power spike, incredibly exhausted..."
			verb/Saiyan_Soul()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.AdaptationCounter<1)
						usr << "You didn't get a good enough of a read on your opponent yet!"
						return
				src.Trigger(usr)


		Spirit_Form
			SpiritForm=1
			ActiveMessage="shifts into their spiritual body!"
			OffMessage="becomes fully physical once more..."
			Cooldown=5
			verb/Spirit_Form()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.Form1Base)
						src.IconReplace=1
						src.icon=usr.Form1Base
					if(usr.Form1Hair)
						src.HairLock=usr.Form1Hair
						src.HairBX=usr.Form1HairX
						src.HairBY=usr.Form1HairY
					if(usr.Form1Overlay)
						src.IconLock=usr.Form1Overlay
						src.LockX=usr.Form1OverlayX
						src.LockY=usr.Form1OverlayY
					if(usr.Form1TopOverlay)
						src.TopOverlayLock=usr.Form1TopOverlay
						src.TopOverlayX=usr.Form1TopOverlayX
						src.TopOverlayY=usr.Form1TopOverlayY
					if(usr.Form1Aura)
						src.AuraLock=usr.Form1Aura
						src.AuraX=usr.Form1AuraX
						src.AuraY=usr.Form1AuraY
					if(usr.Form1ActiveText)
						if(src.ActiveMessage!=usr.Form1ActiveText)
							src.ActiveMessage=usr.Form1ActiveText
					if(usr.Form1RevertText)
						if(src.OffMessage!=usr.Form1RevertText)
							src.OffMessage=usr.Form1RevertText
				src.Trigger(usr)


		Dragon_Fusion
			ActiveMessage="combines a fellow fraction to become closer to their original form!"
			AffectTarget=1
			Range=1
			EndYourself=1
			verb/Dragon_Fusion()
				set category="Skills"
				if(!usr.BuffOn(src))
					var/Confirm
					if(usr.Target.KO)
						Confirm="Yes"
					else if(usr.AscensionsAcquired>usr.Target.AscensionsAcquired&&usr.Race=="Dragon"&&usr.Target.Race=="Dragon")
						Confirm="Yes"
					else
						Confirm=alert(usr.Target, "[usr] is trying to merge your consciousness with theirs permanently!  Do you accept?", "Dragon Fusion", "No", "Yes")
					if(Confirm=="No")
						return
					if(usr.Target!=usr&&usr.Target.Race=="Dragon")
						if(usr.AngerMax<2&&usr.Target.AngerMax>=2)
							usr.AngerMax=2
						if(usr.AngerPoint<75&usr.Target.AngerPoint>=75)
							usr.AngerPoint=75
						if(usr.Fishman<1&usr.Target.Fishman>=1)
							usr.Fishman+=1
						if(usr.Hardening<1&usr.Target.Hardening>=1)
							usr.Hardening+=1
						if(usr.Godspeed<1&usr.Target.Godspeed>=1)
							usr.Godspeed+=1
						if(usr.VenomResistance<2&usr.Target.VenomResistance>=2)
							usr.VenomResistance+=2
						if(usr.Intelligence<2&usr.Target.Intelligence>=2)
							usr.Intelligence+=1
							usr.EconomyMult*=1.25
						if(usr.PowerBoost<1.5&&usr.Target.PowerBoost>=1.5)
							usr.PowerBoost=1.5

						if(locate(/obj/Skills/AutoHit/Fire_Breath, usr.Target))
							usr.AddSkill(new/obj/Skills/AutoHit/Fire_Breath)
						if(locate(/obj/Skills/Projectile/Beams/Ice_Dragon, usr.Target))
							usr.AddSkill(new/obj/Skills/Projectile/Beams/Ice_Dragon)
						if(locate(/obj/Skills/Projectile/Shard_Storm, usr.Target))
							usr.AddSkill(new/obj/Skills/Projectile/Shard_Storm)
						if(locate(/obj/Skills/Projectile/Beams/Static_Stream, usr.Target))
							usr.AddSkill(new/obj/Skills/Projectile/Beams/Static_Stream)
						if(locate(/obj/Skills/AutoHit/Poison_Gas, usr.Target))
							usr.AddSkill(new/obj/Skills/AutoHit/Poison_Gas)
						if(locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Force, usr.Target))
							usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Force)

						if(usr.Target.StrAscension&&!usr.StrAscension)
							usr.StrAscension+=0.25
						if(usr.Target.EndAscension&&!usr.EndAscension)
							usr.EndAscension+=0.25
						if(usr.Target.ForAscension&&!usr.ForAscension)
							usr.ForAscension+=0.25
						if(usr.Target.OffAscension&&!usr.OffAscension)
							usr.OffAscension+=0.25
						if(usr.Target.DefAscension&&!usr.DefAscension)
							usr.DefAscension+=0.25
						if(usr.Target.RecovAscension&&!usr.RecovAscension)
							usr.RecovAscension+=0.25
						var/Unlock=max(usr.Target.AscensionsAcquired-usr.AscensionsAcquired, 1)
						usr.AscensionsUnlocked+=Unlock
						while(usr.AscensionsUnlocked>usr.AscensionsAcquired)
							usr.CheckAscensions()

						var/list/DenyVars=list("client", "key", "loc", "x", "y", "z", "type", "locs", "parent_type", "verbs", "vars", "contents", "Transform", "appearance")
						for(var/obj/Skills/s in usr.Target)
							if(s.AssociatedGear)
								continue
							if(s.AssociatedLegend)
								continue
							if(!locate(s, usr))
								var/obj/Skills/NewS=new s.type
								for(var/x in s.vars)
									if(x in DenyVars)
										continue
									NewS.vars[x]=s.vars[x]
								usr.AddSkill(NewS)


						usr.ArmamentEnchantmentUnlocked=usr.Target.ArmamentEnchantmentUnlocked
						usr.CrestCreationUnlocked=usr.Target.CrestCreationUnlocked
						usr.SummoningMagicUnlocked=usr.Target.SummoningMagicUnlocked

						for(var/x in usr.Target.UnlockedTechnology)
							if(x in usr.UnlockedTechnology)
								continue
							usr.AddUnlockedTechnology(x)//this adds 1 to relevant technology and then adds it to usr.unlockedtechnology list

						for(var/obj/Items/x in usr.Target)
							x.suffix=0
							usr.AddItem(x)

						animate(usr, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1), time=10)
						animate(usr.Target, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1), time=10)
						sleep(20)
						animate(usr.Target, alpha=0, time=5)
						animate(usr, color = null, time=20)
						sleep(20)
						OMsg(usr, "[usr.Target] is consumed by [usr] completely!!", "[usr] used Dragon Fusion on [usr.Target] and deleted their save.")
						usr.Target.Savable=0
						if(istype(usr.Target, /mob/Players))
							fdel("Saves/Players/[usr.Target.ckey]")
						del usr.Target
					else
						usr << "This is to be used on dragons only!  Also, not yourself!!"
						return
				src.Trigger(usr)
				if(!usr.BuffOn(src))
					del src

		Namekian_Fusion
			ActiveMessage="combines two existences into one!"
			AffectTarget=1
			Range=1
			EndYourself=1
			KenWave=5
			KenWaveIcon='fevKiaiG.dmi'
			verb/Namekian_Fusion()
				set category="Skills"
				if(usr.TransUnlocked())
					usr << "You can't fuse with more namekians!"
					return
				if(usr.Target && usr.Target.TransUnlocked())
					usr << "You can't fuse with [usr.Target] because they have already fused!"
					return
				if(!usr.BuffOn(src))
					var/Confirm
					if(usr.Target.KO)
						Confirm="Yes"
					else
						Confirm=alert(usr.Target, "[usr] is trying to merge your consciousness with theirs permanently!  Do you accept?", "Namekian Fusion", "No", "Yes")
					if(Confirm=="No")
						return
					if(usr.Target!=usr&&usr.Target.Race=="Namekian")
						switch(usr.Target.Class)
							if("Warrior")
								if(usr.Class!=usr.Target.Class)
									usr.Intimidation*=2
							if("Dragon")
								if(usr.Class!=usr.Target.Class)
									usr.Intelligence=1.5
									usr.Imagination=1*(4/3)

						if(usr.Target.StrAscension&&!usr.StrAscension)
							usr.StrAscension=usr.Target.StrAscension
						if(usr.Target.EndAscension&&!usr.EndAscension)
							usr.EndAscension=usr.Target.EndAscension
						if(usr.Target.ForAscension&&!usr.ForAscension)
							usr.ForAscension=usr.Target.ForAscension
						if(usr.Target.SpdAscension&&!usr.SpdAscension)
							usr.SpdAscension=usr.Target.SpdAscension
						if(usr.Target.OffAscension&&!usr.OffAscension)
							usr.OffAscension=usr.Target.OffAscension
						if(usr.Target.DefAscension&&!usr.DefAscension)
							usr.DefAscension=usr.Target.DefAscension
						if(usr.Target.RecovAscension&&!usr.RecovAscension)
							usr.RecovAscension=usr.Target.RecovAscension
						if(usr.Target.AngerMax>usr.AngerMax)
							usr.AngerMax=usr.Target.AngerMax
						if(usr.Target.ManaCapMult>usr.ManaCapMult)
							usr.ManaCapMult=usr.Target.ManaCapMult
						if(usr.Target.HellPower>usr.HellPower)
							usr.HellPower=usr.Target.HellPower
						var/Unlock=max(usr.Target.AscensionsAcquired-usr.AscensionsAcquired, 1)
						usr.AscensionsUnlocked+=Unlock
						while(usr.AscensionsUnlocked>usr.AscensionsAcquired)
							usr.CheckAscensions()

						var/list/DenyVars=list("client", "key", "loc", "x", "y", "z", "type", "locs", "parent_type", "verbs", "vars", "contents", "Transform", "appearance")
						for(var/obj/Skills/s in usr.Target)
							if(s.AssociatedGear)
								continue
							if(s.AssociatedLegend)
								continue
							if(!locate(s, usr))
								var/obj/Skills/NewS=new s.type
								for(var/x in s.vars)
									if(x in DenyVars)
										continue
									NewS.vars[x]=s.vars[x]
								usr.AddSkill(NewS)

						usr.ForgingUnlocked=usr.Target.ForgingUnlocked
						usr.RepairAndConversionUnlocked=usr.Target.RepairAndConversionUnlocked
						usr.MedicineUnlocked=usr.Target.MedicineUnlocked
						usr.ImprovedMedicalTechnologyUnlocked=usr.Target.ImprovedMedicalTechnologyUnlocked
						usr.TelecommunicationsUnlocked=usr.Target.TelecommunicationsUnlocked
						usr.AdvancedTransmissionTechnologyUnlocked=usr.Target.AdvancedTransmissionTechnologyUnlocked
						usr.EngineeringUnlocked=usr.Target.EngineeringUnlocked
						usr.CyberEngineeringUnlocked=usr.Target.CyberEngineeringUnlocked
						usr.MilitaryTechnologyUnlocked=usr.Target.MilitaryTechnologyUnlocked
						usr.MilitaryEngineeringUnlocked=usr.Target.MilitaryEngineeringUnlocked

						usr.AlchemyUnlocked=usr.Target.AlchemyUnlocked
						usr.ImprovedAlchemyUnlocked=usr.Target.ImprovedAlchemyUnlocked
						usr.ToolEnchantmentUnlocked=usr.Target.ToolEnchantmentUnlocked
						usr.ArmamentEnchantmentUnlocked=usr.Target.ArmamentEnchantmentUnlocked
						usr.TomeCreationUnlocked=usr.Target.TomeCreationUnlocked
						usr.CrestCreationUnlocked=usr.Target.CrestCreationUnlocked
						usr.SummoningMagicUnlocked=usr.Target.SummoningMagicUnlocked
						usr.SealingMagicUnlocked=usr.Target.SealingMagicUnlocked
						usr.SpaceMagicUnlocked=usr.Target.SpaceMagicUnlocked
						usr.TimeMagicUnlocked=usr.Target.TimeMagicUnlocked

						usr.UnlockedTechnology=usr.Target.UnlockedTechnology

						usr.trans["unlocked"]=1
						usr.RecovChaos+=0.5

						animate(usr, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1), time=10)
						animate(usr.Target, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1), time=10)
						sleep(20)
						animate(usr.Target, alpha=0, time=5)
						animate(usr, color = null, time=20)
						sleep(20)
						Log("Admin", "[ExtractInfo(usr)] ([usr.client.address]) has namekian fused with [ExtractInfo(usr.Target)] ([usr.Target.client.address])!")
						OMsg(usr, "[usr.Target] melds into [usr] completely!!", "[usr] used Namekian Fusion on [usr.Target] and deleted their save.")
						usr.Target.Savable=0
						if(istype(usr.Target, /mob/Players))
							fdel("Saves/Players/[usr.Target.ckey]")
						del usr.Target
					else
						usr << "This is to be used on Namekians only!  Also, not yourself!!"
						return
				src.Trigger(usr)
				if(!usr.BuffOn(src))
					del src

//Skill Tree
		Ki_Blade
			Copyable=3
			SkillCost=0
			NoSword=1
			NoStaff=1
			KiBlade=1
			SpiritSword=0.5
			TimerLimit=10
			Cooldown=5
			IconLock='Ki-Blade.dmi'
			OffMessage="dispels their Ki blade..."
			TextColor="#FF66CC"
			verb/Customize_Ki_Blade()
				set category="Other"
				set name="Customize: Ki Blade"
				if(usr.BuffOn(src))
					usr << "You can't customize ki blade while using it!"
					return
				src.IconLock=input(usr, "What blade icon do you want to use?", "Customize Ki Blade") as icon|null
				src.LockX=input(usr, "What pixel x offset do you want to use?", "Customize Ki Blade") as num|null
				src.LockY=input(usr, "What pixel y offset do you want to use?", "Customize Ki Blade") as num|null
				if(src.IconLock==null)
					src.IconLock='Ki-Blade.dmi'
					src.LockX=0
					src.LockY=0
			verb/Ki_Blade()
				set category="Skills"
				src.ActiveMessage="sharpens a shell of Ki around their hand!"
				if(usr.StyleActive=="Black Leg" || usr.StyleActive=="Devil Leg")
					src.ActiveMessage="sharpens a shell of Ki around their foot!"
				src.Trigger(usr)

		Ki_Shield
			Copyable=3
			SkillCost=0
			Deflection=1
			NoDodge=1
			TimerLimit=10
			Cooldown=5
			IconLock='Android Shield.dmi'
			IconLockBlend=2
			IconLayer=-1
			IconApart=1
			OverlaySize=1.2
			ActiveMessage="creates a shell of Ki around their body!"
			OffMessage="lowers their shield..."
			verb/Customize_Ki_Shield()
				set category="Other"
				set name="Customize: Ki Shield"
				if(usr.BuffOn(src))
					usr << "You can't customize ki shield while using it!"
					return
				src.IconLock=input(usr, "What shield icon do you want to use?", "Customize Ki Shield") as icon|null
				src.LockX=input(usr, "What pixel x offset do you want to use?", "Customize Ki Shield") as num|null
				src.LockY=input(usr, "What pixel y offset do you want to use?", "Customize Ki Shield") as num|null
			verb/Ki_Shield()
				set category="Skills"
				src.Trigger(usr)
		Ki_Armor


		Magic
			MagicNeeded=1

			Reinforce_Object
				ElementalClass="Earth"
				SkillCost=40
				Copyable=1
				ManaCost=5
				TimerLimit=90
				Cooldown=30
				verb/Reinforce_Weapon()
					set category="Skills"
					if(!usr.BuffOn(src))
						if(usr.EquippedSword()&&usr.EquippedStaff())
							src.SwordAscension=0.5
							src.StaffAscension=0.5
							src.ManaCost=10
							ActiveMessage="feeds mana into their sword and staff at once!"
							OffMessage="cuts off the flow of mana to their weapons..."
						else if(usr.EquippedSword())
							src.SwordAscension=0.5
							src.StaffAscension=0
							src.ManaCost=10
							ActiveMessage="feeds mana into their sword to reinforce it!"
							OffMessage="cuts off the flow of mana to their sword..."
						else if(usr.EquippedStaff())
							src.SwordAscension=0
							src.StaffAscension=0.5
							src.ManaCost=10
							ActiveMessage="feeds mana into their magic focus to reinforce it!"
							OffMessage="stops focusing their mana flow..."
						else
							src << "You can't use this without anything to reinforce!"
							return
					src.Trigger(usr)
			Broken_Phantasm
				ElementalClass="Earth"
				SkillCost=40
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Reinforce_Object")
				Copyable=2
				SwordAscension=1
				StaffAscension=1
				KillSword=1
				PureDamage=10
				ExplosiveFinish=3
				Destructive=-1
				ExplosiveFinishIntensity=10
				ManaCost=10
				PhysicalHitsLimit=1
				SpiritHitsLimit=1
				TextColor=rgb(180, 120, 60)
				Cooldown=30
				ActiveMessage="overcharges their weapon with a ridiculous amount of mana!"
				OffMessage="can hold their weapon no longer; it explodes!"
				verb/Broken_Phantasm()
					set category="Skills"
					if(!usr.EquippedSword()&&!usr.EquippedStaff())
						usr << "There's nothing to infuse."
						return
					else
						if(usr.EquippedSword())
							NeedsSword=1
						else
							NeedsSword=0
						if(usr.EquippedStaff())
							NeedsStaff=1
						else
							NeedsStaff=0
					if(!usr.BuffOn(src))
						if(usr.Attunement)
							src.ElementalEnchantment=usr.Attunement
					src.Trigger(usr)
			Reinforce_Self
				ElementalClass="Earth"
				SkillCost=40
				Copyable=3
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Broken_Phantasm")
				PureDamage=1
				PureReduction=1
				ManaCost=15
				ManaLeak=2
				TimerLimit=30
				Cooldown=30
				ActiveMessage="feeds mana into their limbs to reinforce them!"
				OffMessage="stops overloading their limbs with mana..."
				verb/Reinforce_Self()
					set category="Skills"
					src.Trigger(usr)

			Water_Walk
				ElementalClass="Wind"
				SkillCost=40
				Copyable=1
				ManaCost=5
				TimerLimit=90
				WaterWalk=1
				TextColor=rgb(0, 255, 255)
				ActiveMessage="uses a spell to grant themselves the miracle of waterwalk!"
				OffMessage="dissipates their miraculous walk..."
				Cooldown=30
				verb/Water_Walk()
					set category="Utility"
					src.Trigger(usr)
			Swift_Walk
				ElementalClass="Wind"
				SkillCost=40
				Copyable=2
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Water_Walk")
				ManaCost=10
				WaterWalk=1
				Godspeed=1
				TimerLimit=90
				KenWave=1
				KenWaveIcon='Magic Time circle.dmi'
				KenWaveSize=5
				KenWaveX=105
				KenWaveY=105
				ActiveMessage="casts a spell to become fleet on foot!"
				OffMessage="dissipates their enchanted speed..."
				Cooldown=30
				verb/Swift_Walk()
					set category="Utility"
					src.Trigger(usr)
			Wind_Walk
				ElementalClass="Wind"
				SkillCost=40
				Copyable=3
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Swift_Walk")
				ManaCost=15
				TimerLimit=90
				Skimming=1
				Godspeed=1
				TextColor=rgb(140, 255, 140)
				KenWave=1
				KenWaveIcon='Magic Time circle.dmi'
				KenWaveSize=5
				KenWaveX=105
				KenWaveY=105
				ActiveMessage="uses a spell to give themselves the alacrity of the wind!"
				OffMessage="dissipates their aerial speed..."
				Cooldown=30
				verb/Wind_Walk()
					set category="Utility"
					src.Trigger(usr)

			Magic_Trick
				ElementalClass="Water"
				SkillCost=40
				Copyable=1
				EndYourself=1
				ActiveMessage="performs a stunning magic trick!"
				ManaCost=5
				Cooldown=30
				verb/Magic_Trick()
					set category="Utility"
					if(!src.Using)
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(20))
								m.AddConfuse(20)
								OMsg(m, "[m] tries to work out the logistics of the trick! How can this be?!")
							else if(prob(10))
								Stun(m,5)
								OMsg(m, "[m] is stunned by the trick!")
							else if(prob(5))
								m.AddPacifying(5)
								OMsg(m, "[m] is rendered stupified by the trick!")
							else
								usr << "[m] didn't appear impressed by your trick."
					src.Trigger(usr)
			Magic_Act
				ElementalClass="Water"
				SkillCost=40
				Copyable=2
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Magic_Trick")
				ManaCost=10
				Cooldown=30
				verb/Alter_Disguise()
					set category="Utility"
					if(src.Using==1||usr.BuffOn(src))
						return
					src.Using=1
					src.ImitateBase=input(usr,"Choose a base icon.","Imitate Base")as icon
					src.ImitateOverlays=list()
					src.ImitateOverlays+=input(usr,"Choose a lower clothing icon.","Imitate Overlay")as icon
					src.ImitateOverlays+=input(usr,"Choose a hair icon.","Imitate Hair")as icon
					src.ImitateOverlays+=input(usr,"Choose an upper clothing icon.","Imitate Overlay")as icon
					src.ImitateName=input(usr,"Choose a name.","Imitate Name") as text
					src.ImitateProfile=input(usr, "Please input a description for the disguise.", "Imitate Description") as message
					src.ImitateTextColor=input(usr, "Choose a color for Say.","Imitate Color") as color
					src.Using=0
				verb/Disguise()
					set hidden=1
					if(!usr.BuffOn(src))
						src.BuffName="Imitate"
						src.Imitate=1
						src.PhysicalHitsLimit=1
						src.SpiritHitsLimit=1
						src.EndYourself=0
						src.FakePeace=1
						src.ActiveMessage="changes their appearance!"
						src.OffMessage="returns to their previous shape..."
						usr.BreakViewers()
					src.Trigger(usr)
				verb/Confusing_Act()
					set hidden=1
					if(!usr.BuffOn(src))
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=1
						src.ActiveMessage="performs a confusing act!"
						src.OffMessage=0
						src.FakePeace=0
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(30))
								m.AddConfuse(20)
								OMsg(m, "[m] tries to work out the logstics of the act! How can this be?!")
							else
								OMsg(m, "[m] isn't impressed by [usr]'s act.")
					src.Trigger(usr)
				verb/Stunning_Act()
					set hidden=1
					if(!usr.BuffOn(src))
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=1
						src.ActiveMessage="performs a stunning act!"
						src.OffMessage=0
						src.FakePeace=0
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(20))
								Stun(m, 5)
								OMsg(m, "[m] is stunned by the act!")
							else
								OMsg(m, "[m] isn't impressed by [usr]'s act.")
					src.Trigger(usr)
				verb/Pacifying_Act()
					set hidden=1
					if(!usr.BuffOn(src))
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=1
						src.ActiveMessage="performs a pacifying act!"
						src.OffMessage=0
						src.FakePeace=0
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(10))
								m.AddPacifying(5)
								OMsg(m, "[m] is rendered stupified by the act!")
							else
								OMsg(m, "[m] isn't impressed by [usr]'s act.")
					src.Trigger(usr)
				verb/Magic_Act()
					set category="Utility"
					if(!usr.BuffOn(src))
						var/Choices=list("Cancel", "Disguise", "Confuse", "Stun", "Pacify")
						var/Mode=input(usr, "What act do you perform?", "Magic Act") in Choices
						switch(Mode)
							if("Cancel")
								return
							if("Disguise")
								src.BuffName="Imitate"
								src.Imitate=1
								src.PhysicalHitsLimit=1
								src.SpiritHitsLimit=1
								src.EndYourself=0
								src.FakePeace=1
								src.ActiveMessage="changes their appearance!"
								src.OffMessage="returns to their previous shape..."
								usr.BreakViewers()
							if("Confuse")
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=1
								src.ActiveMessage="performs a confusing act!"
								src.OffMessage=0
								src.FakePeace=0
								for(var/mob/Players/m in oviewers(5,usr))
									if(prob(30))
										m.AddConfuse(20)
										OMsg(m, "[m] tries to work out the logistics of the act! How can this be?!")
									else
										OMsg(m, "[m] isn't impressed by [usr]'s act.")
							if("Stun")
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=1
								src.ActiveMessage="performs a stunning act!"
								src.OffMessage=0
								src.FakePeace=0
								for(var/mob/Players/m in oviewers(5,usr))
									if(prob(20))
										Stun(m, 5)
										OMsg(m, "[m] is stunned by the act!")
									else
										OMsg(m, "[m] isn't impressed by [usr]'s act.")
							if("Pacify")
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=1
								src.ActiveMessage="performs a pacifying act!"
								src.OffMessage=0
								src.FakePeace=0
								for(var/mob/Players/m in oviewers(5,usr))
									if(prob(10))
										m.AddPacifying(5)
										OMsg(m, "[m] is rendered stupified by the act!")
									else
										OMsg(m, "[m] isn't impressed by [usr]'s act.")
					src.Trigger(usr)

			Magic_Show
				ElementalClass="Water"
				SkillCost=40
				Copyable=3
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Magic_Act")
				ManaCost=15
				TextColor=rgb(153, 51, 0)
				Cooldown=30
				verb/Alter_Disguise()
					set category="Utility"
					if(src.Using==1||usr.BuffOn(src))
						return
					src.Using=1
					src.ImitateBase=input(usr,"Choose a base icon.","Imitate Base")as icon
					src.ImitateOverlays=list()
					src.ImitateOverlays+=input(usr,"Choose a lower clothing icon.","Imitate Overlay")as icon
					src.ImitateOverlays+=input(usr,"Choose a hair icon.","Imitate Hair")as icon
					src.ImitateOverlays+=input(usr,"Choose an upper clothing icon.","Imitate Overlay")as icon
					src.ImitateName=input(usr,"Choose a name.","Imitate Name") as text
					src.ImitateProfile=input(usr, "Please input a description for the disguise.", "Imitate Description") as message
					src.ImitateTextColor=input(usr, "Choose a color for Say.","Imitate Color") as color
					src.Using=0
				verb/Disappear()
					set hidden=1
					if(!usr.BuffOn(src))
						src.BuffName="Invisibility"
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=0
						src.Invisible=70
						src.AllowedPower=0.2
						src.FakePeace=0
						ActiveMessage="uses a spell to hide their existence!"
						OffMessage="dissipates their invisibility..."
					src.Trigger(usr)
				verb/Disguise()
					set hidden=1
					if(!usr.BuffOn(src))
						src.BuffName="Imitate"
						src.Imitate=1
						src.PhysicalHitsLimit=1
						src.SpiritHitsLimit=1
						src.EndYourself=0
						src.Invisible=0
						src.AllowedPower=0
						src.FakePeace=1
						src.ActiveMessage="changes their appearance!"
						src.OffMessage="returns to their previous shape..."
						usr.BreakViewers()
					src.Trigger(usr)
				verb/Confusing_Show()
					set hidden=1
					if(!usr.BuffOn(src))
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=1
						src.Invisible=0
						src.AllowedPower=0
						src.FakePeace=0
						src.ActiveMessage="performs a confusing show!"
						src.OffMessage=0
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(50))
								m.AddConfuse(20)
								OMsg(m, "[m] tries to work out the logistics of the show! How could this be?!")
							else
								OMsg(m, "[m] isn't impressed by [usr]'s show.")
					src.Trigger(usr)
				verb/Stunning_Show()
					set hidden=1
					if(!usr.BuffOn(src))
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=1
						src.Invisible=0
						src.AllowedPower=0
						src.FakePeace=0
						src.ActiveMessage="performs a stunning show!"
						src.OffMessage=0
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(40))
								Stun(m, 5)
								OMsg(m, "[m] is stunned by the show!")
							else
								OMsg(m, "[m] isn't impressed by [usr]'s show.")
					src.Trigger(usr)
				verb/Pacifying_Show()
					set hidden=1
					if(!usr.BuffOn(src))
						src.Imitate=0
						src.PhysicalHitsLimit=0
						src.SpiritHitsLimit=0
						src.EndYourself=1
						src.Invisible=0
						src.AllowedPower=0
						src.FakePeace=0
						src.ActiveMessage="performs a pacifying show!"
						src.OffMessage=0
						for(var/mob/Players/m in oviewers(5,usr))
							if(prob(30))
								m.AddPacifying(5)
								OMsg(m, "[m] is rendered stupified by the show!")
							else
								OMsg(m, "[m] isn't impressed by [usr]'s show.")
					src.Trigger(usr)
				verb/Magic_Show()
					set category="Utility"
					if(!usr.BuffOn(src))
						var/Choices=list("Cancel", "Disappear", "Disguise", "Confuse", "Stun", "Pacify")
						var/Mode=input(usr, "What show do you perform?", "Magic Show") in Choices
						switch(Mode)
							if("Cancel")
								return
							if("Disappear")
								src.BuffName="Invisibility"
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=0
								src.Invisible=70
								src.AllowedPower=0.2
								src.FakePeace=0
								src.ActiveMessage="uses a spell to hide their existence!"
								src.OffMessage="dissipates their invisibility..."
							if("Disguise")
								src.BuffName="Imitate"
								src.Imitate=1
								src.PhysicalHitsLimit=1
								src.SpiritHitsLimit=1
								src.EndYourself=0
								src.Invisible=0
								src.AllowedPower=0
								src.FakePeace=1
								src.ActiveMessage="changes their appearance!"
								src.OffMessage="returns to their previous shape..."
								usr.BreakViewers()
							if("Confuse")
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=1
								src.Invisible=0
								src.AllowedPower=0
								src.ActiveMessage="performs a confusing show!"
								src.OffMessage=0
								src.FakePeace=0
								for(var/mob/Players/m in oviewers(5,usr))
									if(prob(50))
										m.AddConfuse(20)
										OMsg(m, "[m] tries to work out the logistics of the show the show! How could this be?!")
									else
										OMsg(m, "[m] isn't impressed by [usr]'s show.")
							if("Stun")
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=1
								src.Invisible=0
								src.AllowedPower=0
								src.ActiveMessage="performs a stunning show!"
								src.OffMessage=0
								src.FakePeace=0
								for(var/mob/Players/m in oviewers(5,usr))
									if(prob(40))
										Stun(m, 5)
										OMsg(m, "[m] is stunned by the show!")
									else
										OMsg(m, "[m] isn't impressed by [usr]'s show.")
							if("Pacify")
								src.Imitate=0
								src.PhysicalHitsLimit=0
								src.SpiritHitsLimit=0
								src.EndYourself=1
								src.Invisible=0
								src.AllowedPower=0
								src.ActiveMessage="performs a pacifying show!"
								src.OffMessage=0
								src.FakePeace=0
								for(var/mob/Players/m in oviewers(5,usr))
									if(prob(30))
										m.AddPacifying(5)
										OMsg(m, "[m] is rendered stupified by the show!")
									else
										OMsg(m, "[m] isn't impressed by [usr]'s show.")
					src.Trigger(usr)

			Stone_Skin
				ElementalClass="Earth"
				SkillCost=120
				Copyable=3
				ManaCost=10
				Hardening=3
				ActiveMessage="uses a spell to give themselves the endurance of the earth!"
				OffMessage="dissipates their earth protection..."
				TextColor=rgb(153, 51, 0)
				TimerLimit=60
				Cooldown=90
				verb/Stone_Skin()
					set category="Skills"
					src.Trigger(usr)
			True_Effort
				ElementalClass="Earth"
				SkillCost=120
				Copyable=4
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Stone_Skin")
				ManaCost=20
				Instinct=1
				Pursuer=1
				Hardening=3
				TextColor=rgb(255, 0, 0)
				ActiveMessage="uses a spell to draw out their highest effort!"
				OffMessage="dissipates their extra effort..."
				TimerLimit=60
				Cooldown=90
				verb/True_Effort()
					set category="Skills"
					src.Trigger(usr)
			Heroic_Will
				ElementalClass="Earth"
				SkillCost=120
				Copyable=5
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/True_Effort")
				ManaCost=30
				TimerLimit=60
				Flow=1
				Instinct=1
				Pursuer=1
				Hardening=3
				TextColor=rgb(255, 0, 0)
				ActiveMessage="uses a spell to mimic the will of a hero!"
				OffMessage="dissipates their heroic will..."
				Cooldown=90
				verb/Heroic_Will()
					set category="Skills"
					src.Trigger(usr)

			Mage_Armor
				ElementalClass="Earth"
				SkillCost=120
				Copyable=3
				MakesArmor=1
				ArmorAscension=1
				ArmorIcon='LancelotArmor.dmi'
				ArmorClass="Light"
				CastingTime=3
				ActiveMessage="weaves an aetheric armor around themselves!"
				OffMessage="releases the invoked armor..."
				TimerLimit=120
				ManaCost=10
				Cooldown=90
				verb/Mage_Armor()
					set category="Skills"
					src.Trigger(usr)
				verb/Customize_Mage_Armor()
					set category="Utility"
					var/Choice
					if(!usr.BuffOn(src))
						var/Lock=alert(usr, "Do you wish to alter the icon used?", "Weapon Icon", "No", "Yes")
						if(Lock=="Yes")
							src.ArmorIcon=input(usr, "What icon will your Mage Armor use?", "Mage Armor Icon") as icon|null
							src.ArmorX=input(usr, "Pixel X offset.", "Mage Armor Icon") as num
							src.ArmorY=input(usr, "Pixel Y offset.", "Mage Armor Icon") as num
						Choice=input(usr, "What class of armor do you want your Mage Armor to be?", "Customize Mage Armor") in list("Light", "Medium", "Heavy")
						switch(Choice)
							if("Light")
								src.ArmorClass="Light"
							if("Medium")
								src.ArmorClass="Medium"
							if("Heavy")
								src.ArmorClass="Heavy"
						usr << "Mage Armor class set as [Choice]!"
					else
						usr << "You can't set this while using Mage Armor."
			Perfect_Warrior
				ElementalClass="Earth"
				SkillCost=120
				Copyable=4
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Mage_Armor")
				StrMult=1.2
				EndMult=1.2
				OffMult=1.3
				ForMult=0.3
				CriticalChance=5
				BlockChance=5
				CriticalDamage=2
				CriticalBlock=2
				MakesArmor=1
				ArmorAscension=1
				ActiveMessage="enters a martial trance, sacrificing their magical abilities!"
				OffMessage="regains their magicality..."
				TimerLimit=120
				ManaCost=20
				Cooldown=90
				verb/Perfect_Warrior()
					set category="Skills"
					if(!usr.BuffOn(src))
						src.ManaCapMult=(-0.75)
						src.ManaAdd=(-1)*(usr.ManaAmount*0.75)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Magic/Mage_Armor/MA in usr)
						src.ArmorIcon=MA.ArmorIcon
						src.ArmorClass=MA.ArmorClass
						src.ArmorX=MA.ArmorX
						src.ArmorY=MA.ArmorY
					src.Trigger(usr)
			Golem_Form
				ElementalClass="Earth"
				SkillCost=120
				Copyable=5
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Perfect_Warrior")
				Enlarge=2
				Mechanized=1
				Xenobiology=1
				InjuryImmune=1
				FatigueImmune=1
				StrMult=1.2
				EndMult=1.2
				OffMult=1.3
				ForMult=0.3
				CriticalChance=5
				BlockChance=5
				CriticalDamage=2
				CriticalBlock=2
				SweepingStrike=1
				MakesArmor=1
				ArmorAscension=1
				IconTint=list(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11, 0,0,0)
				ActiveMessage="channels magic power to force their body to transform into an artifical fighter!"
				OffMessage="releases the magical transformation..."
				TimerLimit=120
				ManaCost=30
				Cooldown=90
				verb/Golem_Form()
					set category="Skills"
					set name="Golem Form"
					if(!usr.BuffOn(src))
						src.ManaCapMult=(-1)
						src.ManaAdd=(-1)*(usr.ManaAmount*1)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Magic/Mage_Armor/MA in usr)
						src.ArmorIcon=MA.ArmorIcon
						src.ArmorClass=MA.ArmorClass
						src.ArmorX=MA.ArmorX
						src.ArmorY=MA.ArmorY
					src.Trigger(usr)

			Binding
				ElementalClass="Poison"
				SkillCost=120
				Copyable=3
				CastingTime=2
				ManaCost=10
				EndYourself=1
				AffectTarget=1
				Range=10
				SlowAffected=10
				CrippleAffected=10
				TargetOverlay='StormArmor 2.dmi'
				ActiveMessage="restrains their target's movements with binding magic!"
				OffMessage="completes their bind..."
				Cooldown=90
				verb/Binding()
					set category="Skills"
					src.Trigger(usr)
			Infect
				ElementalClass="Poison"
				SkillCost=120
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Binding")
				Copyable=4
				CastingTime=5
				ManaCost=20
				EndYourself=1
				AffectTarget=1
				Range=10
				PoisonAffected=2
				ShearAffected=2
				SlowAffected=10
				CrippleAffected=10
				TargetOverlay='Overdrive.dmi'
				ActiveMessage="fills their target's veins with a venomous curse!"
				OffMessage="completes their curse..."
				Cooldown=90
				verb/Infect()
					set category="Skills"
					src.Trigger(usr)
			Curse
				ElementalClass="Poison"
				SkillCost=120
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Infect")
				Copyable=5
				ManaCost=30
				CastingTime=10
				EndYourself=1
				AffectTarget=1
				SpdTaxDrain=0.03
				RecovTaxDrain=0.03
				PoisonAffected=2
				ShearAffected=2
				SlowAffected=5
				CrippleAffected=5
				Range=5
				TargetOverlay='StormArmor.dmi'
				ActiveMessage="saps their target's lifeforce with a malicious curse!"
				OffMessage="finishes the cursing ritual..."
				Cooldown=90
				verb/Curse()
					set category="Skills"
					if(usr.Target.SpdTax||usr.Target.RecovTax)
						return
					src.Trigger(usr)



			Barrier
				ElementalClass="Earth"
				SkillCost=160
				Copyable=4
				DebuffImmune=0.5
				CastingTime=2
				IconLock='Android Shield.dmi'
				IconLockBlend=3
				IconLayer=-1
				OverlaySize=1.2
				ActiveMessage="invokes: <font size=+1>BARRIER!</font size>"
				OffMessage="releases the magic protecting them..."
				TimerLimit=90
				ManaCost=20
				Cooldown=120
				verb/Barrier()
					set category="Skills"
					src.Trigger(usr)
			Protect
				ElementalClass="Earth"
				SkillCost=160
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Barrier")
				Copyable=5
				PureReduction=2
				DebuffImmune=0.5
				CastingTime=2
				IconLock='Bubble Shield.dmi'
				IconLockBlend=4
				IconLayer=-1
				OverlaySize=1.2
				ActiveMessage="invokes: <font size=+1>PROTECT!</font size>"
				OffMessage="releases the magic protecting them..."
				TimerLimit=90
				ManaCost=30
				Cooldown=120
				verb/Protect()
					set category="Skills"
					src.Trigger(usr)
			Resilient_Sphere
				ElementalClass="Earth"
				SkillCost=160
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Protect")
				Copyable=6
				PureDamage=-90
				PureReduction=2
				DebuffImmune=0.5
				NoDodge=1
				VaizardHealth=0.5
				VaizardShatter=1
				IconLock='zekkai.dmi'
				IconLayer=-1
				IconLockBlend=2
				IconApart=1
				OverlaySize=1.3
				ActiveMessage="invokes: <font size=+1>SHELL!</font size>"
				OffMessage="releases the magic protecting them..."
				ManaCost=40
				Cooldown=120
				verb/Resilient_Sphere()
					set category="Skills"
					src.Trigger(usr)



//Appable

			Protega
				ElementalClass="Earth"
				SignatureTechnique=2
				SignatureName="Advanced Defense Magic"
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Protect")
				PureReduction=4
				CastingTime=1.5
				IconLock='Bubble Shield.dmi'
				IconLockBlend=2
				IconLayer=-1
				IconApart=1
				OverlaySize=1.2
				ActiveMessage="invokes: <font size=+1>PROTEGA!</font size>"
				OffMessage="releases the magic protecting them..."
				TimerLimit=90
				ManaCost=60
				Cooldown=180
				verb/Protega()
					set category="Skills"
					src.Trigger(usr)

			Esuna
				ElementalClass="Water"
				SignatureTechnique=1
				SagaSignature=1
				SignatureName="White Magic"
				AffectTarget=1
				StableHeal=1
				FatigueHeal=10
				BurnAffected=-10
				SlowAffected=-10
				ShockAffected=-10
				ShatterAffected=-10
				PoisonAffected=-10
				ShearAffected=-10
				CastingTime=4
				EndYourself=1
				Range=7
				KenWave=1
				KenWaveIcon='SparkleGreen.dmi'
				KenWaveSize=3
				KenWaveX=105
				KenWaveY=105
				ActiveMessage="invokes: <font size=+1>ESUNA!</font size>"
				OffMessage="releases the cure magic..."
				ManaCost=15
				TimerLimit=4
				Cooldown=150
				verb/Esuna()
					set category="Skills"
					src.Trigger(usr)
			Esunaga
				ElementalClass="Water"
				SignatureTechnique=2
				SagaSignature=1
				SignatureName="Advanced White Magic"
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Esuna")
				EndYourself=1
				AffectTarget=1
				StableHeal=1
				FatigueHeal=20
				BurnAffected=-20
				SlowAffected=-20
				ShockAffected=-20
				ShatterAffected=-20
				PoisonAffected=-20
				ShearAffected=-20
				CastingTime=4
				Range=12
				KenWave=1
				KenWaveIcon='SparkleGreen.dmi'
				KenWaveSize=5
				KenWaveX=105
				KenWaveY=105
				ActiveMessage="invokes: <font size=+1>ESUNAGA!</font size>"
				OffMessage="releases the potent cure magic..."
				ManaCost=20
				TimerLimit=4
				Cooldown=180
				verb/Esunaga()
					set category="Skills"
					src.Trigger(usr)

			Cure
				ElementalClass="Water"
				SignatureTechnique=1
				SagaSignature=1
				SignatureTechnique="White Magic"
				EndYourself=1
				AffectTarget=1
				StableHeal=1
				HealthHeal=5
				CastingTime=2
				Range=7
				KenWave=1
				KenWaveIcon='SparkleYellow.dmi'
				KenWaveSize=3
				KenWaveX=105
				KenWaveY=105
				ActiveMessage="invokes: <font size=+1>CURE!</font size>"
				OffMessage="completes their spell..."
				ManaCost=15
				TimerLimit=2
				Cooldown=-1
				verb/Cure()
					set category="Skills"
					src.Trigger(usr)
			Curaga
				ElementalClass="Water"
				SignatureTechnique=2
				SagaSignature=1
				SignatureName="Advanced White Magic"
				PreRequisite=list("/obj/Skills/Buffs/SlotlessBuffs/Magic/Cure")
				EndYourself=1
				AffectTarget=1
				StableHeal=1
				HealthHeal=5
				CastingTime=4
				Range=7
				KenWave=1
				KenWaveIcon='SparkleYellow.dmi'
				KenWaveSize=5
				KenWaveX=105
				KenWaveY=105
				ActiveMessage="invokes: <font size=+1>CURAGA!</font size>"
				OffMessage="completes their spell..."
				ManaCost=20
				TimerLimit=4
				Cooldown=-1
				verb/Curaga()
					set category="Skills"
					src.Trigger(usr)


//NOT MAGIC BUT STILL APPABLE


//TECHNOLOGY
		Gear
			Hazard_Suit
				VenomImmune=1
				WalkThroughHell=1
				TimerLimit=3600
				ActiveMessage="engages their all-terrain environment suit!"
				OffMessage="burns out a power cell on their suit..."
				verb/Hazard_Suit()
					set category="Skills"
					src.Trigger(usr)
			Sealed_Suit
				StaticWalk=1
				SpaceWalk=1
				VenomImmune=1
				WalkThroughHell=1
				TimerLimit=3600
				HairLock='BLANK.dmi'
				IconLock='SealedHelmet.dmi'
				ActiveMessage="engages their perfect containment unit!"
				OffMessage="removes the sealed suit..."
				verb/Sealed_Suit()
					set category="Skills"
					src.Trigger(usr)
			Deflector_Shield
				Deflection=1
				TimerLimit=20
				Cooldown=120
				ActiveMessage="activates a tactical shield!"
				OffMessage="overloads their shield..."
				verb/Deflector_Shield()
					set category="Skills"
					src.Trigger(usr)
			Bubble_Shield
				NoDodge=1
				VaizardHealth=0.5
				VaizardShatter=1
				TimerLimit=5
				Cooldown=300
				IconLock='Bubble Shield.dmi'
				IconLockBlend=2
				IconLayer=-1
				OverlaySize=1.2
				ActiveMessage="protects their body in a technological bubble!"
				OffMessage="exceeds the capacity of their shield..."
				verb/Bubble_Shield()
					set category="Skills"
					if(usr.Race=="Android"||usr.Mechanized)
						src.IconLock='Android Shield.dmi'
					src.Trigger(usr)
			Jet_Boots
				SuperDash=1
				Skimming=1
				Pursuer=1
				ActiveMessage="engages their jet boots!"
				OffMessage="disengages their jet boots..."
				TimerLimit=150
				HealthThreshold=0.01
				verb/Jet_Boots()
					set category="Skills"
					src.Trigger(usr)
			Jet_Pack
				SuperDash=1
				Skimming=2
				Pursuer=2
				ActiveMessage="engages their jet pack!"
				OffMessage="disengages their jet pack..."
				TimerLimit=300
				verb/Jet_Pack()
					set category="Skills"
					src.Trigger(usr)
			Progressive_Blade
				SpiritSword=0.75
				MakesSword=1
				FlashDraw=1
				SwordClass="Light"
				SwordIcon='ProgressiveBlade.dmi'
				SwordX=-32
				SwordY=-32
				TimerLimit=180
				ActiveMessage="swings forth a Progressive Blade made from energy!"
				OffMessage="runs out of energy for their Progressive Blade..."
				verb/Progressive_Blade()
					set category="Skills"
					src.Trigger(usr)
			Lightsaber
				SpiritSword=0.75
				MakesSword=1
				FlashDraw=1
				Deflection=1
				SwordAscension=1
				SwordClass="Light"
				SwordIcon='LightsaberBlue.dmi'
				SwordX=-32
				SwordY=-32
				Cooldown=30
				ActiveMessage="ignites an elegant lightsaber!"
				OffMessage="extinguishes the plasma of their lightsaber..."
				verb/Lightsaber_Color()
					if(!usr.BuffOn(src))
						var/Choice=input(usr, "What color would you like for your lightsaber?", "Set Color") in list("Blue", "Green", "Purple", "Red")
						switch(Choice)
							if("Blue")
								SwordIcon='LightsaberBlue.dmi'
							if("Green")
								SwordIcon='LightsaberGreen.dmi'
							if("Purple")
								SwordIcon='LightsaberPurple.dmi'
							if("Red")
								SwordIcon='LightsaberRed.dmi'
				verb/Lightsaber()
					set category="Skills"
					src.Trigger(usr)
			Double_Lightsaber
				SpiritSword=0.75
				MakesSword=1
				FlashDraw=1
				Deflection=1
				SwordAscension=1
				SwordClass="Double"
				SwordIcon='LightsaberBlueDouble.dmi'
				SwordX=-32
				SwordY=-32
				Cooldown=30
				ActiveMessage="ignites an elegant lightsaber!"
				OffMessage="extinguishes the plasma of their lightsaber..."
				verb/Double_Lightsaber_Color()
					if(!usr.BuffOn(src))
						var/Choice=input(usr, "What color would you like for your lightsaber?", "Set Color") in list("Blue", "Green", "Purple", "Red")
						switch(Choice)
							if("Blue")
								SwordIcon='LightsaberBlueDouble.dmi'
							if("Green")
								SwordIcon='LightsaberGreenDouble.dmi'
							if("Purple")
								SwordIcon='LightsaberPurpleDouble.dmi'
							if("Red")
								SwordIcon='LightsaberRedDouble.dmi'
				verb/Double_Lightsaber()
					set category="Skills"
					src.Trigger(usr)
			Blast_Fist
				NoSword=1
				NoStaff=1
				PhysicalHitsLimit=6
				SpiritHand=1
				Scorching=1
				HitSpark='fevExplosion.dmi'
				HitX=-32
				HitY=-32
				HitSize=0.5
				Cooldown=60
				ActiveMessage="loads up their Blast Fists; punches will now discharge shotgun blasts!"
				OffMessage="runs their Blast Fists empty..."
				verb/Blast_Fist()
					set category="Skills"
					src.Trigger(usr)
			Chainsaw
				NoSword=1
				NoStaff=1
				PhysicalHitsLimit=12
				SpiritHand=1
				Shearing=1
				Cooldown=60
				IconLock='Chainsaw.dmi'
				ActiveMessage="deploys a chainsaw blade and revs it to life!"
				OffMessage="runs out of fuel in the chainsaw..."
				verb/Chainsaw()
					set category="Skills"
					src.Trigger(usr)
			Integrated
				Integrated=1
				Integrated_Deflector_Shield
					Deflection=1
					TimerLimit=20
					Cooldown=120
					ActiveMessage="activates a tactical shield!"
					OffMessage="overloads their shield..."
					verb/Deflector_Shield()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Bubble_Shield
					NoDodge=1
					VaizardHealth=0.5
					VaizardShatter=1
					TimerLimit=5
					Cooldown=240
					IconLock='Bubble Shield.dmi'
					IconLayer=-1
					OverlaySize=1.2
					ActiveMessage="protects their body in a technological bubble!"
					OffMessage="exceeds the capacity of their shield..."
					verb/Bubble_Shield()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Jet_Boots
					SuperDash=1
					Skimming=1
					Pursuer=1
					ActiveMessage="engages their jet boots!"
					OffMessage="disengages their jet boots..."
					TimerLimit=150
					HealthThreshold=0.01
					verb/Jet_Boots()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Jet_Pack
					SuperDash=1
					Skimming=2
					Pursuer=2
					ActiveMessage="engages their jet pack!"
					OffMessage="disengages their jet pack..."
					TimerLimit=300
					verb/Jet_Pack()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Progressive_Blade
					SpiritSword=0.75
					MakesSword=1
					FlashDraw=1
					SwordClass="Light"
					SwordIcon='ProgressiveBlade.dmi'
					SwordX=-32
					SwordY=-32
					TimerLimit=180
					ActiveMessage="swings forth a Progressive Blade made from energy!"
					OffMessage="runs out of energy for their Progressive Blade..."
					verb/Progressive_Blade()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Lightsaber
					SpiritSword=0.75
					MakesSword=1
					FlashDraw=1
					Deflection=1
					SwordAscension=1
					SwordClass="Light"
					SwordIcon='LightsaberBlue.dmi'
					SwordX=-32
					SwordY=-32
					Cooldown=30
					ActiveMessage="ignites an elegant lightsaber!"
					OffMessage="extinguishes the plasma of their lightsaber..."
					verb/Lightsaber_Color()
						if(!usr.BuffOn(src))
							var/Choice=input(usr, "What color would you like for your lightsaber?", "Set Color") in list("Blue", "Green", "Purple", "Red")
							switch(Choice)
								if("Blue")
									SwordIcon='LightsaberBlue.dmi'
								if("Green")
									SwordIcon='LightsaberGreen.dmi'
								if("Purple")
									SwordIcon='LightsaberPurple.dmi'
								if("Red")
									SwordIcon='LightsaberRed.dmi'
					verb/Lightsaber()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Blast_Fist
					NoSword=1
					NoStaff=1
					PhysicalHitsLimit=6
					SpiritHand=1
					Scorching=1
					HitSpark='fevExplosion.dmi'
					HitX=-32
					HitY=-32
					HitSize=0.5
					Cooldown=60
					ActiveMessage="loads up their Blast Fists; punches will now discharge shotgun blasts!"
					OffMessage="runs their Blast Fists empty..."
					verb/Blast_Fist()
						set category="Skills"
						src.Trigger(usr)
				Integrated_Chainsaw
					NoSword=1
					NoStaff=1
					PhysicalHitsLimit=12
					SpiritHand=1
					Shearing=1
					Cooldown=60
					ActiveMessage="deploys a chainsaw blade and revs it to life!"
					OffMessage="runs out of fuel in the chainsaw..."
					verb/Chainsaw()
						set category="Skills"
						src.Trigger(usr)




//Cybernetics and Enchantment
		Implants
			Stun_Chip
				TimerLimit=1
				FlashChange=1
				StunAffected=5
				CrippleAffected=50
				ShockAffected=50
				Cooldown=200
				TextColor=rgb(255, 0, 0)
				OffMessage="is jolted by an internal electric shock!"
			Failsafe_Chip
				EndYourself=1
				FINISHINGMOVE=1
				Cooldown=20000
				TextColor=rgb(255, 0, 0)
				OffMessage="suddenly falls over motionlessly!"
			Internal_Explosive
				TimerLimit=10
				Curse=1
				FlashChange=1
				ExplosiveFinish=30
				ExplosiveFinishIntensity=50
				Cooldown=20000
				TextColor=rgb(255, 0, 0)
				ActiveMessage="has had their internal explosive triggered! They'll explode soon!"
				OffMessage="explodes with violent force!"

		WeaponSystems
			Decapitation_Mode
				NeedsHealth=50
				NeedsSword=1
				Extend=1
				TextColor=rgb(255, 0, 0)
				ActiveMessage="transforms their weapon into a deadlier form!"
				OffMessage="restores their weapon to its previous form!"
				verb/Decapitation_Mode()
					set category="Skills"
					if(!usr.BuffOn(src))
						var/obj/Items/Sword/s=usr.EquippedSword()
						src.SwordIcon=s.iconAlt
						src.SwordX=s.iconAltX
						src.SwordY=s.iconAltY
						src.SwordClass=s.ClassAlt
					src.Trigger(usr)
			Alternate_Mode
				NeedsSword=1
				TextColor=rgb(255, 0, 0)
				ActiveMessage="transforms their weapon into an alternate form!"
				OffMessage="restores their weapon to its previous form!"
				verb/Alternate_Mode()
					set category="Skills"
					if(!usr.BuffOn(src))
						var/obj/Items/Sword/s=usr.EquippedSword()
						src.SwordIcon=s.iconAlt
						src.SwordX=s.iconAltX
						src.SwordY=s.iconAltY
						src.SwordClass=s.ClassAlt
					src.Trigger(usr)
			Skim
				TimerLimit=120
				Skimming=2
				KKTWave=2
				TextColor=rgb(140, 255, 140)
				ActiveMessage="activates jet thrusters to skim!"
				OffMessage="hits the brakes..."
				Cooldown=60
				verb/Skim()
					set category="Mecha"
					src.Trigger(usr)


		Grimoire
			UnrestrictedBuff=1
			MagicNeeded=1
			NoTransplant=1
			Time_Skip
				Cooldown=10
				desc="Manipulate time for everyone in view."
				verb/Time_Skip()
					set category="Skills"
					usr.SkillX("Time Skip",src)
			Time_Stop
				Cooldown=40
				Mastery=1
				var/tmp/TimeStopped=0//holds how long TW has been active for in this usage
				desc="Freeze time for everyone in view."
				verb/Time_Stop()
					set category="Utility"
					usr.SkillX("Time Stop",src)
			Time_Alter
				SignatureTechnique=3
				SpecialSlot=1
				ManaCost=20
				Afterimages=1
				ClientTint=1
				OffMessage="releases their time magic..."
				verb/Time_Alter_Double_Accel()
					set name="Time Alter: Double Accel"
					set category="Skills"
					if(!usr.BuffOn(src))
						src.BleedHit=1/src.Mastery
						src.SpdMult=2
						src.Instinct=1
						src.Flow=1
						src.IconTint=list(0.75,0.3,0, 0.4,0.3,0, 0.25,0.15,0, 0,0,0)
						src.ActiveMessage="yells: <b>Time Alter: Double Accel!</b>"
					src.Trigger(usr)
					if(usr.BuffOn(src))
						animate(usr.client, color = list(0.7,0.7,0.71, 0.79,0.79,0.8, 0.31,0.31,0.32, 0,0,0), time = 3)
				verb/Time_Alter_Triple_Accel()
					set name="Time Alter: Triple Accel"
					set category="Skills"
					if(!usr.BuffOn(src))
						src.BleedHit=2/src.Mastery
						src.SpdMult=3
						src.RecovMult=0.5
						src.Instinct=2
						src.Flow=2
						src.IconTint=list(0.75,0.3,0, 0.4,0.3,0, 0.25,0.15,0, 0,0,0)
						src.ActiveMessage="yells: <b>Time Alter: Triple Accel!</b>"
					src.Trigger(usr)
					if(usr.BuffOn(src))
						animate(usr.client, color = list(0.7,0.7,0.71, 0.79,0.79,0.8, 0.31,0.31,0.32, 0,0,0), time = 3)
				verb/Time_Alter_Square_Accel()
					set name="Time Alter: Square Accel"
					set category="Skills"
					if(!usr.BuffOn(src))
						src.BleedHit=4/src.Mastery
						src.SpdMult=4
						src.RecovMult=0.25
						src.EnergyExpenditure=2
						src.Instinct=3
						src.Flow=3
						IconTint=list(0.75,0.3,0, 0.4,0.3,0, 0.25,0.15,0, 0,0,0)
						ActiveMessage="yells: <b>Time Alter: Square Accel!</b>"
					src.Trigger(usr)
					if(usr.BuffOn(src))
						animate(usr.client, color = list(0.7,0.7,0.71, 0.79,0.79,0.8, 0.31,0.31,0.32, 0,0,0), time = 3)
			Azure_Grimoire//increases mana amount over cap, artifical SageMode? drains HP
				SignatureTechnique=3
				SpecialSlot=1
				OffMult=2
				DrainlessMana=1
				ManaStats=0.5
				BleedHit=1
				LifeSteal=20
				MagicFocus=1
				IconLock='DarknessGlow.dmi'
				IconUnder=1
				IconLockBlend=2
				LockX=-32
				LockY=-32
				KenWave=1
				KenWaveIcon='Azure Crest.dmi'
				KenWaveSize=0.2
				KenWaveX=-785
				KenWaveY=-389
				TextColor=rgb(22, 149, 255)
				ActiveMessage="releases the restrictions on their Grimoire, tapping into a limitless font of mana!"
				OffMessage="seals their Grimoire to prevent it from consuming them..."
				Cooldown=-1
				verb/Azure_Grimoire()
					set category="Skills"
					src.Trigger(usr)
			Azure_Grimoire_True//as above but gives life drain instead of draining life, weaker Sage boost
				SignatureTechnique=3
				SpecialSlot=1
				DefMult=2
				DrainlessMana=1
				ManaStats=0.5
				MagicFocus=1
				LifeSteal=20//healed for a fifth of damage.
				KenWave=1
				KenWaveIcon='Azure Crest.dmi'
				KenWaveSize=0.2
				KenWaveX=-785
				KenWaveY=-389
				TextColor=rgb(0, 233, 115)
				ActiveMessage="releases the restrictions on their Grimoire, tapping into a perfect font of mana!"
				OffMessage="seals their Grimoire to prevent it from consuming everything..."
				Cooldown=-1
				verb/Azure_Grimoire()
					set category="Skills"
					src.Trigger(usr)
			Azure_Flame_Grimoire
				SignatureTechnique=4
				SpecialSlot=1
				OffMult=2
				DefMult=2
				DrainlessMana=1
				MagicFocus=1
				ManaStats=1
				Cooldown=-1
				GodKi=1
				KenWave=1
				KenWaveIcon='Azure Crest.dmi'
				KenWaveSize=0.3
				KenWaveX=-785
				KenWaveY=-389
				TextColor=rgb(22, 233, 255)
				ActiveMessage="releases the restrictions on the True Grimoire, tapping into an omnipotent font of mana!"
				OffMessage="seals their Grimoire to prevent reality from shattering..."
				verb/Azure_Flame_Grimoire()
					set category="Skills"
					src.Trigger(usr)
			Mafuba
				WarpZone=1
				EndYourself=1
				FINISHINGMOVE=1
				IconLock='TornadoDirectedBrave.dmi'
				LockX=-8
				LockY=0
				OverlaySize=5
				HealthDrain=15
				WoundDrain=15
				CastingTime=5
				Range=5
				Cooldown=-1
				ActiveMessage="conjures an evil-sealing wave!!"
				OffMessage="collapses from the strain of the evil-sealing wave..."
				verb/Mafuba()
					set category="Skills"
					if(!usr.Target)
						usr << "You need a target to seal demons!"
						return
					if(usr.Target==usr)
						usr << "PLEASE DO NOT SEAL YOURSELF WITH THE MAFUBA..."
						return
					if(!src.WarpX||!src.WarpY||!src.WarpZ)
						usr << "Your demon containment area is not set..."
						return
					src.Trigger(usr)
					if(src.Using)
						src.Mastery++
						if(usr.EraBody=="Elder"||usr.EraBody=="Senile"||src.Mastery>=3)
							if(!usr.EraDeathClock)
								var/DeathClock=Minute(30)
								usr.EraDeathClock=world.realtime+DeathClock
								usr << "You will die from overexertion soon. Use your remaining time well."
			Crimson_Grimoire
				LimitlessMagic=1
				TimerLimit=90
				Cooldown=180
				MagicFocus=1
				TextColor=rgb(255, 0, 127)
				ActiveMessage="no longer requires mana to access true magic!"
				OffMessage="blocks out the limitless knowledge of the Grimoire..."
				var/tmp/database_synced = 0
				verb/Crimson_Grimoire()
					set category="Skills"
					BuffTechniques = general_magic_database
					src.Trigger(usr)
			Pure_Grimoire
				BuffMastery=2.5
				Cooldown=4
				TextColor=rgb(255, 240, 245)
				ActiveMessage="fills their blank Grimoire with their power, greatly enhancing it!"
				OffMessage="seals their Grimoire..."
				verb/Pure_Grimoire()
					set category="Skills"
					src.Trigger(usr)
			Blood_Grimoire
				IconLock='Demon_Blood_Talismans Active.dmi'
				LockX=0
				LockY=0
				ManaCapMult=1
				ManaAdd=100
				ForMult=1.5
				MagicFocus=1
				TimerLimit=15
				Cooldown=60
				TextColor=rgb(127, 0, 0)
				ActiveMessage="draws on the power of Old Blood to enhance their spellcasting!"
				OffMessage="releases their demonic blessing..."
				verb/Blood_Grimoire()
					set category="Skills"
					src.Trigger(usr)
			OverDrive
				Frost_End
					TimerLimit=30
					Cooldown=-1
					StunningStrike=2
					Freezing=1
					Chilling=1
					ActiveMessage="overloads their Drive, turning their swordsmanship into a slicing blizzard - <b>Frost End</b>!"
					OffMessage="seals the frost of Yukianesa..."
					verb/Frost_End()
						set category="Skills"
						src.Trigger(usr)
				Chain_Quasar
					TimerLimit=30
					Cooldown=120
					Godspeed=2
					Afterimages=1
					SweepingStrike=1
					Warp=1
					SpiritStrike=1
					HitSpark='Hit Effect Ripple.dmi'
					HitX=-32
					HitY=-32
					ActiveMessage="overloads their Drive, turning their movement into a dancelike flow - <b>Chain Quasar</b>!"
					OffMessage="seals the accuracy of Bolverk..."
					verb/Chain_Quasar()
						set category="Skills"
						src.Trigger(usr)
				Fierce_God
					TimerLimit=30
					Cooldown=-1
					TechniqueMastery=10
					EnergyHeal=3
					ManaHeal=3
					ActiveMessage="overloads their Drive, entering a tireless frenzy - <b>Kishin</b>!"
					OffMessage="seals the justice of Ookami..."
					verb/Fierce_God()
						set category="Skills"
						src.Trigger(usr)
			Slaying_God
				Cooldown=30
				PhysicalHitsLimit=1
				CounterMaster=10
				KenWave=2
				KenWaveIcon='KenShockwaveGold.dmi'
				KenWaveSize=0.2
				KenWaveTime=5
				ActiveMessage="prepares to counter attacks with divine clarity - <b>Zanshin</b>!"
				verb/Slaying_God()
					set category="Skills"
					src.Trigger(usr)

//General
		Posture//for custom shit
			verb/Posture()
				set category="Roleplay"
				src.Trigger(usr)

		Unbound_Mode
			SignatureTechnique=3
			SpecialSlot=1
			MovementMastery=5
			TechniqueMastery=5
			BuffMastery=5
			ManaThreshold=1
			ManaLeak=1
			FlashChange=1
			KenWaveIcon='Unbound.dmi'
			KenWave=1
			KenWaveSize=1
			KenWaveX=72
			KenWaveY=72
			KenWaveBlend=2
			KenWaveTime=5
			ActiveMessage="unleashes their complete self!"
			OffMessage="returns to their old self..."
			Cooldown=-1
			verb/Unbound_Mode()
				set category="Skills"
				src.Trigger(usr)
		Sparking_Blast
			SignatureTechnique=3
			SpecialSlot=1
			LifeGeneration=50
			EnergyGeneration=50
			ManaGeneration=50
			Pursuer=3
			PureDamage=2
			Instinct=2
			Flicker=2
			IconLock='SparkingBlastSparks.dmi'
			IconLockBlend=2
			OverlaySize=0.7
			LockY=-4
			FlashChange=1
			KenWaveIcon='SparkingBlast.dmi'
			KenWave=1
			KenWaveSize=1
			KenWaveX=72
			KenWaveY=72
			KenWaveBlend=2
			KenWaveTime=5
			Cooldown=-1
			verb/Sparking_Blast()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.Health>50)
						src.TimerLimit=10
					if(usr.Health<=50)
						src.TimerLimit=20
					if(usr.Health<=25)
						src.TimerLimit=30
					if(!src.Using)
						usr.Activate(new/obj/Skills/AutoHit/Knockoff_Wave)
				src.Trigger(usr)
		Fusion_Dance
			SignatureTechnique=3
			ActiveMessage="performs a dance with their partner to combine into a single entity!"
			Range=2
			ForcedRange=1
			Fusion="Dance"
			IconLock='Fusion Vest.dmi'
			Cooldown=-1
			CooldownStatic=1
			verb/Fusion_Dance()
				set category="Skills"
				src.FusionFailure=0
				if(!usr.BuffOn(src))
					var/Confirm
					Confirm=alert(usr.Target, "[usr] is trying to merge your consciousness with theirs!  Do you accept?", "Fusion Dance", "No", "Yes")
					if(Confirm=="No")
						return
					if(usr.party)
						usr.party.remove_member(usr)
					if(usr.Target.party)
						usr.Target.party.remove_member(usr.Target)
				src.Trigger(usr)
		Divine_Fusion
			Range=7
			Fusion="Potara"
			TopOverlayLock='Potara Earrings.dmi'
			Cooldown=-1
			CooldownStatic=1
			verb/Zap_Earring()
				set category="Skills"
				if(usr.party)
					usr.party.remove_member(usr)
				if(usr.Target.party)
					usr.Target.party.remove_member(usr.Target)
				src.Trigger(usr)
		God_Ki
			SignatureTechnique=4
			Cooldown=10
			Transform="God"
			ActiveMessage="unleashes their godly power!"
			OffMessage="restrains their godly power..."
			verb/God_Ki()
				set category="Skills"
				src.Trigger(usr)
		Embrace_Legend
			LegendaryPower=1
			ActiveMessage="roars as they embrace their legendary power!"
			OffMessage="regains their senses..."
			verb/Embrace_Legend()
				set category="Skills"
				src.Trigger(usr)
		Shatter_Sanity
			HellPower=1
			ActiveMessage="screams as their sanity shatters!"
			OffMessage="simmers back down..."
			verb/Shatter_Sanity()
				set category="Skills"
				src.Trigger(usr)

		Devil_Arm
			SignatureTechnique=3
			Mastery=0
			Copyable=0
			MakesSword=1
			FlashDraw=1
			SwordName="Demon Blade"
			SwordIcon='SwordBroad.dmi'
			StaffName="Demon Rod"
			StaffIcon='MageStaff.dmi'
			ArmorName="Demon Scales"
			StaffIcon='DevilScale.dmi'
			TextColor="#adf0ff"
			ActiveMessage=null
			OffMessage=null
			verb/Devil_Arm_Evolution()
				set category="Utility"
				var/Choice
				if(src.Mastery>usr.AscensionsAcquired)
					usr << "Your Devil Arm is fully evolved currently!"
					return
				if(!usr.BuffOn(src))
					while(src.Mastery<=usr.AscensionsAcquired)
						src.Mastery++
						switch(input("What type of armament would you like your Devil Arm ([src.Mastery]) to be?") in list("Sword","Staff","Armor","Cancel"))
							if("Sword")
								MakesSword=1
								MakesArmor=0
								MakesStaff=0
								SwordName=input(usr, "What will it be named?", "Transfigure Devil Arm") as text|null
								Choice=input(usr, "What class of weapon do you want your Devil Arm to be?", "Transfigure Devil Arm") in list("Saber", "Longsword", "Greatsword")
								switch(Choice)
									if("Saber")
										src.SwordClass="Light"
									if("Longsword")
										src.SwordClass="Medium"
									if("Greatsword")
										src.SwordClass="Heavy"
								usr << "Devil Arm sword class set as [Choice]!"
							if("Staff")
								MakesStaff=1
								MakesArmor=0
								MakesSword=0
								StaffName=input(usr, "What will it be named?", "Transfigure Devil Arm") as text|null
								Choice=input(usr, "What class of staff do you want your Devil Arm to be?", "Transfigure Devil Arm") in list("Wand", "Rod", "Staff")
								switch(Choice)
									if("Wand")
										src.StaffClass="Wand"
									if("Rod")
										src.StaffClass="Rod"
									if("Staff")
										src.StaffClass="Staff"
								usr << "Devil Arm staff class set as [Choice]!"
							if("Armor")
								MakesArmor=1
								MakesSword=0
								MakesStaff=0
								ArmorName=input(usr, "What will it be named?", "Transfigure Devil Arm") as text|null
								Choice=input(usr, "What class of armor do you want your Devil Arm to be?", "Transfigure Devil Arm") in list("Light", "Medium", "Heavy")
								switch(Choice)
									if("Light")
										src.ArmorClass="Light"
									if("Medium")
										src.ArmorClass="Medium"
									if("Heavy")
										src.ArmorClass="Heavy"
								usr << "Devil Arm armor class set as [Choice]!"
							if("Cancel")
								src.Mastery--
								return
						var/Element=input("What element would you like your Devil Arm to use?") in list("Water","Fire","Wind","Earth")
						if(MakesSword)
							SwordElement = Element
						else if(MakesStaff)
							StaffElement = Element
						else if(MakesArmor)
							ArmorElement = Element
						usr << "Devil Armor element set as [Element]"
						var/Lock=alert(usr, "Do you wish to alter the icon used?", "Devil Arm Icon", "No", "Yes")
						if(Lock=="Yes")
							var dIcon=input(usr, "What icon will your Devil Arm uses?", "Devil Arm Icon") as icon|null
							var dX=input(usr, "Pixel X offset.", "Devil Arm Icon") as num
							var dY=input(usr, "Pixel Y offset.", "Devil Arm Icon") as num
							if(MakesSword)
								SwordIcon = dIcon
								SwordX= dX
								SwordY = dY
							else if(MakesStaff)
								StaffIcon = dIcon
								StaffX= dX
								StaffY = dY
							else if(MakesArmor)
								ArmorIcon = dIcon
								ArmorX= dX
								ArmorY = dY
						else
							if(MakesSword)
								SwordIcon='SwordBroad.dmi'
							else if(MakesStaff)
								StaffIcon='MageStaff.dmi'
							else if(MakesArmor)
								StaffIcon='DevilScale.dmi'
						if(src.Mastery>1)
							if(src.MakesSword)
								var/Enhancement=alert(usr, "You can now coat your weapon with your demonic miasma, either empowering its reach or infusing its slices with your mystic power.", "Devil Arm", "Extend", "Emit")
								if(Enhancement=="Extend")
									src.Extend=1
								if(Enhancement=="Emit")
									src.SpiritSword=1
							if(src.MakesStaff)
								var/Enhancement=alert(usr, "You can now coat your weapon with your demonic miasma, either reinforcing its casting speed or making it an inexhaustible source of mana.", "Devil Arm", "Speed", "Sustain")
								if(Enhancement=="Speed")
									src.QuickCast=2
									src.TechniqueMastery=5
								if(Enhancement=="Sustain")
									src.ManaHeal=2
									src.CapacityHeal=0.02
							if(src.MakesArmor)
								var/Enhancement=alert(usr, "You can now coat your weapon with your demonic miasma, either turning yourself into an wicked juggernaut or a frenzied striker.", "Devil Arm", "Fortress", "Fierce")
								if(Enhancement=="Fortress")
									src.Juggernaut=1
									src.DebuffImmune=1
								if(Enhancement=="Fierce")
									src.DoubleStrike=1
									src.Godspeed=1
						if(src.Mastery>2)
							if(src.MakesSword)
								var/Enhancement=alert(usr, "The miasma infusing your weapon thickens, allowing you to deal even more pain to your opponent's body or spirit.", "Devil Arm", "Carve", "Corrupt")
								if(Enhancement=="Carve")
									src.HardStyle=2
								if(Enhancement=="Corrupt")
									src.SoftStyle=2
							if(src.MakesStaff)
								var/Enhancement=alert(usr, "The miasma infusing your weapon thickens, allowing you to burn away lifeforce from people you strike or dismantle and absorb their own spiritual attacks.", "Devil Arm", "Soulfire", "Siphon")
								if(Enhancement=="Soulfire")
									src.SoulFire=1
								if(Enhancement=="Siphon")
									src.Siphon=4
							if(src.MakesArmor)
								var/Enhancement=alert(usr, "The miasma infusing your weapon thickens, allowing you to swiftly counter all manner of attacks or simply march through weaker ones.", "Devil Arm", "Riposte", "Repel")
								if(Enhancement=="Riposte")
									src.CounterMaster=2
									src.Flow=2
								if(Enhancement=="Repel")
									src.Deflection=1
									src.Reversal=1
						if(MakesSword)
							SwordAscension=min(src.Mastery,4)
						if(MakesStaff)
							StaffAscension=min(src.Mastery,4)
						if(MakesArmor)
							ArmorAscension=min(src.Mastery,4)
				else
					usr << "You can't set this while using Devil Arm."
			verb/Summon_Devil_Arm()
				set category="Skills"
				src.Trigger(usr)
		Majin
			SignatureTechnique=3
			AutoAnger=1
			AngerThreshold=2
			IconLock='DarknessGlow.dmi'
			LockX=-32
			LockY=-32
			FlashChange=1
			KenWave=2
			KenWaveIcon='KenShockwaveBloodlust.dmi'
			KenWaveSize=0.2
			KenWaveTime=5
			KenWaveBlend=2
			NeedsHealth=50
			TooMuchHealth=75
			Cooldown=-1
			ActiveMessage="begins channeling the dreadful power of Makai!"
			verb/Majin_Form()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(!usr.HasHellPower())
						usr.HellPower=1
					src.PowerReplacement=(DaysOfWipe()*global.PotentialDaily+5)
				src.Trigger(usr)

		Duel
			WarpZone=1
			Duel=1
			ActiveMessage="declares a duel!"
			OffMessage="accepts the outcome of the duel..."
			verb/Duel()
				set category="Skills"
				if(usr.Target==usr)
					usr << "Can't duel yourself."
					return
				if(src.WarpTarget)
					var/found=0
					for(var/mob/Players/m in world)
						if(m==src.WarpTarget)
							usr.Target=m
							found=1
					if(!found)
						usr << "Your duel opponent isn't in the world...So you're stuck here for now."
						return
				src.Trigger(usr)

		Spirit_Bow
			SignatureTechnique=2
			MakesStaff=1
			FlashDraw=1
			StaffName="Spirit Bow"
			StaffIcon='Aether Bow.dmi'
			ActiveMessage="draws spirit energy into their hand to form a bow!"
			OffMessage="dispels their Spirit Bow!"
			SpecialStrike=1
			StaffAscension=2
			verb/Transfigure_Spirit_Bow()
				set category="Utility"
				var/Choice
				if(!usr.BuffOn(src))
					var/Lock=alert(usr, "Do you wish to alter the icon used?", "Weapon Icon", "No", "Yes")
					if(Lock=="Yes")
						src.StaffIcon=input(usr, "What icon will your Spirit Bow use?", "Spirit Bow Icon") as icon|null
						src.StaffX=input(usr, "Pixel X offset.", "Spirit Bow Icon") as num
						src.StaffY=input(usr, "Pixel Y offset.", "Spirit Bow Icon") as num
					Choice=input(usr, "What class of bow do you want your Spirit Bow to be?", "Transfigure Spirit Bow") in list("Short", "Recurve", "Long")
					switch(Choice)
						if("Short")
							src.StaffClass="Wand"
						if("Recurve")
							src.StaffClass="Rod"
						if("Long")
							src.StaffClass="Staff"
					usr << "Spirit Bow class set as [Choice]!"
				else
					usr << "You can't set this while using Spirit Bow."
			verb/Spirit_Bow()
				set category="Skills"
				src.Trigger(usr)

		Spirit_Sword//t2
			MakesSword=3
			FlashDraw=1
			SwordName="Spirit Sword"
			SwordIcon='Aether Blade.dmi'
			SwordX=-32
			SwordY=-32
			SpiritSword=1
			SwordAscension=2
			SwordNameSecond="Spirit Sword"
			SwordIconSecond='Aether Blade Alternate.dmi'
			SwordAscensionSecond=2
			SwordXSecond=-32
			SwordYSecond=-32
			SwordNameThird="Spirit Sword"
			SwordAscensionThird=2
			ActiveMessage="draws spirit energy into their hand to form a blade!"
			OffMessage="dispels their Spirit Sword!"
			verb/Transfigure_Spirit_Sword()
				set category="Utility"
				var/Choice
				if(!usr.BuffOn(src))
					var/modify_sword_num = 1
					if((locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Dual_Wield_Style) in usr) || (locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Trinity_Style) in usr))
						var/list/options = list("Primary","Secondary")
						if((locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Trinity_Style) in usr)) options += "Tertiary"
						switch(input("Which sword would you like to modify?") in options)
							if("Secondary") modify_sword_num=2
							if("Tertiary") modify_sword_num=3
					var/Lock=alert(usr, "Do you wish to alter the icon used?", "Weapon Icon", "No", "Yes")
					if(Lock=="Yes")
						switch(modify_sword_num)
							if(1)
								src.SwordIcon=input(usr, "What icon will your Spirit Sword use?", "Spirit Sword Icon") as icon|null
								src.SwordX=input(usr, "Pixel X offset.", "Spirit Sword Icon") as num
								src.SwordY=input(usr, "Pixel Y offset.", "Spirit Sword Icon") as num
							if(2)
								src.SwordIconSecond=input(usr, "What icon will your Spirit Sword use?", "Spirit Sword Icon") as icon|null
								src.SwordXSecond=input(usr, "Pixel X offset.", "Spirit Sword Icon") as num
								src.SwordYSecond=input(usr, "Pixel Y offset.", "Spirit Sword Icon") as num
							if(3)
								src.SwordIconThird=input(usr, "What icon will your Spirit Sword use?", "Spirit Sword Icon") as icon|null
								src.SwordXThird=input(usr, "Pixel X offset.", "Spirit Sword Icon") as num
								src.SwordYThird=input(usr, "Pixel Y offset.", "Spirit Sword Icon") as num
					Choice=input(usr, "What class of blade do you want your Spirit Sword to be?", "Transfigure Spirit Sword") in list("Blunt", "Saber", "Longsword", "Greatsword")
					switch(Choice)
						if("Blunt")
							switch(modify_sword_num)
								if(1) src.SwordClass="Wooden"
								if(2) src.SwordClassSecond="Wooden"
								if(3) src.SwordClassThird="Wooden"
						if("Saber")
							switch(modify_sword_num)
								if(1) src.SwordClass="Light"
								if(2) src.SwordClassSecond="Light"
								if(3) src.SwordClassThird="Light"
						if("Longsword")
							switch(modify_sword_num)
								if(1) src.SwordClass="Medium"
								if(2) src.SwordClassSecond="Medium"
								if(3) src.SwordClassThird="Medium"
						if("Greatsword")
							switch(modify_sword_num)
								if(1) src.SwordClass="Heavy"
								if(2) src.SwordClassSecond="Heavy"
								if(3) src.SwordClassThird="Heavy"
					usr << "Spirit Sword class set as [Choice]!"
				else
					usr << "You can't set this while using Spirit Sword."
			verb/Spirit_Sword()
				set category="Skills"
				src.Trigger(usr)
		Dimension_Sword//t4
			MakesSword=3
			FlashDraw=1
			SwordName="Dimension Sword"
			SwordIcon='Aether Blade.dmi'
			SpiritSword=1
			PridefulRage=1
			BulletKill=1
			Extend=1
			SwordAscension=4
			ActiveMessage="draws spirit energy into their hand to form a spacetime-rending blade!"
			OffMessage="dispels their Dimension Sword!"
			verb/Transfigure_Dimension_Sword()
				set category="Utility"
				var/Choice
				if(!usr.BuffOn(src))
					var/modify_sword_num = 1
					if((locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Dual_Wield_Style) in src) || (locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Trinity_Style) in src))
						var/list/options = list("Primary","Secondary")
						if((locate(/obj/Skills/Buffs/NuStyle/SwordStyle/Trinity_Style) in src)) options += "Tertiary"
						switch(input("Which sword would you like to modify?") in options)
							if("Secondary") modify_sword_num=2
							if("Tertiary") modify_sword_num=3
					var/Lock=alert(usr, "Do you wish to alter the icon used?", "Weapon Icon", "No", "Yes")
					if(Lock=="Yes")
						switch(modify_sword_num)
							if(1)
								src.SwordIcon=input(usr, "What icon will your Spirit Sword use?", "Spirit Sword Icon") as icon|null
								src.SwordX=input(usr, "Pixel X offset.", "Spirit Sword Icon") as num
								src.SwordY=input(usr, "Pixel Y offset.", "Spirit Sword Icon") as num
							if(2)
								src.SwordIconSecond=input(usr, "What icon will your Spirit Sword use?", "Spirit Sword Icon") as icon|null
								src.SwordXSecond=input(usr, "Pixel X offset.", "Spirit Sword Icon") as num
								src.SwordYSecond=input(usr, "Pixel Y offset.", "Spirit Sword Icon") as num
							if(3)
								src.SwordIconThird=input(usr, "What icon will your Spirit Sword use?", "Spirit Sword Icon") as icon|null
								src.SwordXThird=input(usr, "Pixel X offset.", "Spirit Sword Icon") as num
								src.SwordYThird=input(usr, "Pixel Y offset.", "Spirit Sword Icon") as num
					Choice=input(usr, "What class of blade do you want your Spirit Sword to be?", "Transfigure Spirit Sword") in list("Blunt", "Saber", "Longsword", "Greatsword")
					switch(Choice)
						if("Blunt")
							switch(modify_sword_num)
								if(1) src.SwordClass="Wooden"
								if(2) src.SwordClassSecond="Wooden"
								if(3) src.SwordClassThird="Wooden"
						if("Saber")
							switch(modify_sword_num)
								if(1) src.SwordClass="Light"
								if(2) src.SwordClassSecond="Light"
								if(3) src.SwordClassThird="Light"
						if("Longsword")
							switch(modify_sword_num)
								if(1) src.SwordClass="Medium"
								if(2) src.SwordClassSecond="Medium"
								if(3) src.SwordClassThird="Medium"
						if("Greatsword")
							switch(modify_sword_num)
								if(1) src.SwordClass="Heavy"
								if(2) src.SwordClassSecond="Heavy"
								if(3) src.SwordClassThird="Heavy"
					usr << "Spirit Sword class set as [Choice]!"
				else
					usr << "You can't set this while using Spirit Sword."
			verb/Dimension_Sword()
				set category="Skills"
				src.Trigger(usr)

		Legend_of_Black_Heaven
			SignatureTechnique=3
			SwordName="Richtenbacher"
			BuffTechniques=list("/obj/Skills/Projectile/Sword/Bard/Bardic_Riff", "/obj/Skills/Projectile/Sword/Bard/Bardic_Scream", "/obj/Skills/Queue/Bad_Luck")
			MakesSword=1
			NeedsSword=0
			MagicSword=1
			SpiritStrike=1
			SwordAscension=3
			TechniqueMastery=10
			SwordClass="Medium"
			SwordIcon='Bass.dmi'
			SwordX=-3
			SwordY=0
			ActiveMessage="strikes a pose with their Richtenbacher bass to the adoration of millions!"
			OffMessage="drops the bass..."
			verb/Pick_Instrument()
				set category="Skills"
				var/Lock=alert(usr, "Do you wish to alter the icon used?", "Weapon Icon", "No", "Yes")
				if(Lock=="Yes")
					src.SwordIcon=input(usr, "What icon will your instrument use?", "Instrument Icon") as icon|null
					src.SwordX=input(usr, "Pixel X offset.", "Instrument Icon") as num
					src.SwordY=input(usr, "Pixel Y offset.", "Instrument Icon") as num
				var/Choice
				var/Confirm
				while(Confirm!="Yes")
					Choice=input("Pick a type.") in list ("Acoustic", "Electric", "Bass")
					switch(Choice)
						if("Acoustic")
							Confirm=alert(usr, "Riffs from an acoustic guitar are subtle, but precise in reaching the crowd. Is it your choice?", "Instrument Type", "Yes", "No")
						if("Electric")
							Confirm=alert(usr, "Riffs from an electric guitar are powerful and quick, but harder to control. Is it your choice?", "Instrument Type", "Yes", "No")
						if("Bass")
							Confirm=alert(usr, "Riffs from a bass guitar are heavy, but easy to miss by most audiences. Is it your choice?", "Instrument Type", "Yes", "No")
				switch(Choice)
					if("Acoustic")
						src.SwordClass="Light"
					if("Electric")
						src.SwordClass="Medium"
					if("Bass")
						src.SwordClass="Heavy"
				usr << "Done."
			verb/Legend_Of_Black_Heaven()
				set category="Skills"
				src.Trigger(usr)

		SwordOfDarknessFlame
			NeedsSword=1
			ElementalOffense="Fire"
			DarknessFlame=1
			SpiritSword=0.75
			KenWave=1
			KenWaveIcon='fevExplosion - Hellfire.dmi'
			KenWaveSize=2
			KenWaveX=73
			KenWaveY=73
			HitSpark='Slash - Hellfire.dmi'
			HitX=-32
			HitY=-32
			HitSize=1
			HitTurn=1
			TextColor=rgb(102, 102, 102)
			ActiveMessage="wraps their weapon with the flames of Hell!"
			OffMessage="releases the dark flames..."
			verb/Sword_of_Darkness_Flame()
				set category="Skills"
				src.Trigger(usr)
		Jagan_Expert
			SBuffNeeded="Jagan Eye"
			Cooldown=-1
			TimerLimit=180
			FINISHINGMOVE=1
			Intimidation=1.5
			KenWave=4
			KenWaveIcon='DarkKiai.dmi'
			IconTransform='Jagan Transformation.dmi'
			Transform="Jagan"
			TextColor=rgb(102, 102, 102)
			ActiveMessage="utilizes their mastery of Jagan to warp their flesh and sprout countless eyes!!!"
			OffMessage="is overwhelmed by the strain of otherworldly power..."
			verb/Jagan_Expert_Mode()
				set category="Skills"
				src.Trigger(usr)
		Darkness_Dragon_Master
			SBuffNeeded="Jagan Eye"
			Cooldown=-1
			NeedsHealth=25
			FatigueLeak=1
			FatigueThreshold=95
			KenWave=4
			KenWaveIcon='DarkKiai.dmi'
			SpiritSword=0.25
			EndMult=1.5//remove end nerfs from jagan
			Flow=1
			Instinct=1
			Intimidation=2
			PowerInvisible=2
			IconLock='DarknessFlame.dmi'
			IconLockBlend=2
			LockX=-32
			LockY=-34
			ActiveMessage="unites perfectly with the Dragon of Darkness Flame!"
			OffMessage="releases the shackles on the Dragon..."
			verb/Darkness_Dragon_Master()
				set category="Skills"
				src.Trigger(usr)



//Tier S

///Saint Seiya

		Andromeda_Chain
			MakesSword=2
			FlashDraw=1
			SwordClass="Light"
			SwordAscension=2
			SwordUnbreakable=1
			Extend=1
			Deflection=1
			SBuffNeeded="Andromeda Cloth"
			SwordName="Andromeda's Chains"
			SwordIcon='saintandromeda_chains.dmi'
			HitSpark='Slash - Zero.dmi'
			HitX=-32
			HitY=-32
			HitTurn=1
			HitSize=0.9
			BuffTechniques=list("/obj/Skills/Projectile/Beams/Saint_Seiya/Nebula_Chain","/obj/Skills/Queue/Thunder_Wave")
			Cooldown=150
			verb/Andromeda_Chain()
				set category="Skills"
				src.Trigger(usr)

////Gold Cloth
		Crystal_Wall
			FlashChange=1
			TimerLimit=5
			Juggernaut=5
			IconLock='CrystalWall.dmi'
			OverlaySize=5
			ActiveMessage="unleashes their full might, separating the space between them and their enemies!"
			OffMessage="calms their invincible Cosmo..."
			Cooldown=-1
			verb/Crystal_Wall()
				set category="Skills"
				src.Trigger(usr)
		Heavenly_Ring_Dance
			NeedsHealth=50
			FatigueDrain=0.75
			CastingTime=2
			TurfShift='Mandala.dmi'
			KenWave=1
			SpecialStrike=1
			KenWaveIcon='KenShockwaveGold.dmi'
			KenWaveSize=5
			ActiveMessage="unleashes their full might, trapping the opponents in their grasp!"
			OffMessage="calms their godlike Cosmo..."
			Cooldown=-1
			verb/Heavenly_Ring_Dance()
				set category="Skills"
				set name="Tenbu Horin"
				src.Trigger(usr)
		Libra_Armory
			FlashDraw=1
			verb/Libra_Sword()
				set hidden=1
				if(usr.BuffOn(src))
					src.Trigger(usr)
					src.Using=0
				if(!usr.BuffOn(src))
					MakesSword=1
					SwordClass="Medium"
					SwordAscension=3
					SwordElement="Light"
					MakesSecondSword=0
					SwordClassSecond=0
					SwordAccuracySecond=0
					SwordDamageSecond=0
					SwordDelaySecond=0
					SwordAscensionSecond=0
					DoubleStrike=0
					Extend=0
					MagicSword=1
					SpecialStrike=1
					SwordIcon='goldsaintlibra_sword_r.dmi'
					SwordX=-32
					SwordY=-32
					SwordIconSecond=null
					SwordXSecond=null
					SwordYSecond=null
					ActiveMessage="draws a legendary longsword from their armory!"
					OffMessage="sheathes their blade..."
				src.Trigger(usr)
			verb/Libra_Dual()
				set hidden=1
				if(usr.BuffOn(src))
					src.Trigger(usr)
					src.Using=0
				if(!usr.BuffOn(src))
					MakesSword=1
					MakesSecondSword=1
					SwordClass="Light"
					SwordElement="Light"
					SwordClassSecond="Light"
					SwordElementSecond="Light"
					SwordAscension=3
					SwordAscensionSecond=3
					DoubleStrike=1
					Extend=0
					MagicSword=0
					SpecialStrike=0
					SwordIcon='goldsaintlibra_sword_r.dmi'
					SwordX=-32
					SwordY=-32
					SwordIconSecond='goldsaintlibra_sword_l.dmi'
					SwordXSecond=-32
					SwordYSecond=-32
					ActiveMessage="draws a pair of legendary blades from their armory!"
					OffMessage="sheathes their dual blades..."
				src.Trigger(usr)
			verb/Libra_Spear()
				set hidden=1
				if(usr.BuffOn(src))
					src.Trigger(usr)
					src.Using=0
				if(!usr.BuffOn(src))
					MakesSword=1
					SwordAscension=3
					SwordClass="Heavy"
					Extend=1
					MagicSword=0
					MakesSecondSword=0
					SwordClassSecond=0
					SwordAccuracySecond=0
					SwordDamageSecond=0
					SwordDelaySecond=0
					SwordAscensionSecond=0
					SwordElement="Light"
					DoubleStrike=0
					SpecialStrike=0
					SwordIcon='goldsaintlibra_trident.dmi'
					SwordX=-32
					SwordY=-32
					SwordIconSecond=null
					SwordXSecond=null
					SwordYSecond=null
					ActiveMessage="draws a legendary spear from their armory!"
					OffMessage="compacts their spear..."
				src.Trigger(usr)
			verb/Libra_Armory()
				set category="Skills"
				if(!usr.BuffOn(src))
					var/list/Options=list("Sword", "Dual Swords", "Spear")
					var/Choice=input(usr, "What legendary artifact do you draw?", "Libra Armory") in Options
					switch(Choice)
						if("Sword")
							MakesSword=1
							SwordClass="Medium"
							SwordAscension=3
							SwordElement="Light"
							MakesSecondSword=0
							SwordClassSecond=0
							SwordAccuracySecond=0
							SwordDamageSecond=0
							SwordDelaySecond=0
							SwordAscensionSecond=0
							DoubleStrike=0
							Extend=0
							MagicSword=1
							SpecialStrike=1
							SwordIcon='goldsaintlibra_sword_r.dmi'
							SwordX=-32
							SwordY=-32
							SwordIconSecond=null
							SwordXSecond=null
							SwordYSecond=null
							ActiveMessage="draws a legendary longsword from their armory!"
							OffMessage="sheathes their blade..."
						if("Dual Swords")
							MakesSword=1
							MakesSecondSword=1
							SwordClass="Light"
							SwordClassSecond="Light"
							SwordAscension=3
							SwordAscensionSecond=3
							SwordElement="Light"
							SwordElementSecond="Light"
							DoubleStrike=1
							Extend=0
							MagicSword=0
							SpecialStrike=0
							SwordIcon='goldsaintlibra_sword_r.dmi'
							SwordX=-32
							SwordY=-32
							SwordIconSecond='goldsaintlibra_sword_l.dmi'
							SwordXSecond=-32
							SwordYSecond=-32
							ActiveMessage="draws a pair of legendary blades from their armory!"
							OffMessage="sheathes their short swords..."
						if("Spear")
							MakesSword=1
							SwordAscension=3
							SwordClass="Heavy"
							Extend=1
							MagicSword=0
							MakesSecondSword=0
							SwordClassSecond=0
							SwordAccuracySecond=0
							SwordDamageSecond=0
							SwordDelaySecond=0
							SwordAscensionSecond=0
							SwordElement="Light"
							DoubleStrike=0
							SpecialStrike=0
							SwordIcon='goldsaintlibra_trident.dmi'
							SwordX=-32
							SwordY=-32
							SwordIconSecond=null
							SwordXSecond=null
							SwordYSecond=null
							ActiveMessage="draws a legendary spear from their armory!"
							OffMessage="sheathes their spear..."
				src.Trigger(usr)
		Katekao
		Excalibur
			NoSword=1
			NoStaff=1
			KiBlade=1
			SwordAscension=3
			HybridStrike=1
			IconLock='LightningArm.dmi'
			IconLockBlend=2
			IconLayer=1
			IconApart=1
			HitSpark='Slash - Zan.dmi'
			HitX=-16
			HitY=-16
			HitTurn=1
			ActiveMessage="imbues their arm with the power of the legendary Excalibur!"
			OffMessage="dulls their sharpened Cosmo..."
			verb/Excalibur()
				set category="Skills"
				src.Trigger(usr)
		Kolco
			TimerLimit=25
			AffectTarget=1
			AbsoluteZero=1
			Range=10
			SlowAffected=5
			TargetOverlay='SnowRing.dmi'
			ActiveMessage="entraps their opponent with a ring of frigid air!"
			OffMessage="calms their freezing Cosmo..."
			Cooldown=-1
			verb/Kolco()
				set category="Skills"
				set name="Kol'co"
				src.Trigger(usr)

		Attach_Keychain
			verb/Attach_Keychain()
				set category="Skills"
				if(!usr.CheckActive("Keyblade"))
					var/list/Chains=list()
					if(usr.KeybladeColor=="Light")
						Chains.Add("Kingdom Key")
					if(usr.KeybladeColor=="Darkness")
						Chains.Add("Kingdom Key D")
					if(usr.Keychains.len>0)
						Chains.Add(usr.Keychains)
					if(Chains.len<2)
						return
					var/Choice=input(usr, "What keychain are you equipping?", "Attach Keychain") in Chains
					var/KeySlot="Main"
					if(locate(/obj/Skills/Buffs/SpecialBuffs/Valor_Form, usr))
						KeySlot=alert(usr, "Which Keyblade are you setting this keychain to?", "Attach Keychain", "Main", "Sync")
					if(KeySlot=="Main")
						usr.KeychainAttached=Choice
						usr << "[Choice] set to keyblade!"
					else if(KeySlot=="Sync")
						usr.SyncAttached=Choice
						usr << "[Choice] set to sync blade!"
					if(usr.KeychainAttached==usr.SyncAttached)
						if(usr.KeybladeColor=="Light")
							usr.SyncAttached="Kingdom Key"
						else
							usr.SyncAttached="Kingdom Key D"
						usr << "You can't equip the same keyblade in both hands, so your sync blade has been reset to the default."

		Totsuka_no_Tsurugi//t2
			NeedsSword=1
			FlashDraw=1
			MakesSecondSword=1
			ABuffNeeded=list("Soul Resonance")
			SwordNameSecond="Totsuka"
			SwordIconSecond='Totsuka.dmi'
			SwordAscensionSecond=3
			SwordXSecond=-32
			SwordYSecond=-32
			SwordElementSecond="Fire"
			SoulFire=1
			DoubleStrike=1
			ActiveMessage="manifests the spiritual form of the predecesor of Kusanagi!"
			OffMessage="releases the blade of Totsuka back into the legend!"
			Cooldown=-1
			verb/Manifest_Totsuka()
				set category="Skills"
				src.Trigger(usr)
		Eye_of_Chaos
			NeedsSword=1
			TaxThreshold=0.5
			EndTaxDrain=0.0025
			SpdTaxDrain=0.0025
			RecovTaxDrain=0.0025
			FatigueDrain=0.05
			ABuffNeeded=list("Soul Resonance")
			NeedsHealth=50
			FINISHINGMOVE=1
			Curse=1
			PureDamage=8
			Pursuer=2
			Flicker=2
			TextColor="#FF3333"
			ActiveMessage="becomes a living nightmare, twisted by the destructive might of chaos!"
			OffMessage="can no longer sustain the true power of Soul Edge..."
			Cooldown=-1
			verb/Eye_of_Chaos()
				set category="Skills"
				src.Trigger(usr)
		Fate_of_Blood
			NeedsSword=1
			ABuffNeeded=list("Soul Resonance")
			LifeStealTrue=1//But you can steal it from others
			NoDodge=1//at the cost of user opening themselves up
			Instinct=5//never
			SureHitTimerLimit=5
			TimerLimit=120
			KenWave=5
			KenWaveSize=4
			KenWaveBlend=2
			KenWaveIcon='KenShockwaveBloodlust.dmi'
			TextColor="#FF6666"
			ActiveMessage="unseals the <font size=+2>grim fate of their blade</font size>..."
			OffMessage="has satisfied Dainsleif's cruel thirst for life..."
			Cooldown=-1
			verb/Fate_of_Blood()
				set category="Skills"
				//This has to happen when the buff turns ON, otherwise I'd use the built in variable.
				if(usr.CheckActive("Soul Resonance"))
					if(!src.Using)//If this weren't here, you could nerf yourself even if it didn't activate...
						if(!usr.BuffOn(src))
							usr.AddHealthCut(0.1)//lose 10% health permanently but it can be stolen back by true lifesteal.
				src.Trigger(usr)

		Will_Knife
			MakesSword=1
			SwordName="Will Knife"
			SwordIcon='WillKnife.dmi'
			SwordX=0
			SwordY=0
			SwordAscension=1
			SpiritSword=0.5
			SwordClass="Wooden"
			ActiveMessage="condenses their bravery into a weapon!"
			verb/Modify_Will_Knife()
				set category="Skills"
				src.SwordIcon=input(usr, "What icon will your Will Knife use?", "Will Knife Icon") as icon|null
				src.SwordX=input(usr, "Pixel X offset.", "Will Knife Icon") as num
				src.SwordY=input(usr, "Pixel Y offset.", "Will Knife Icon") as num
			verb/Will_Knife()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.SagaLevel>=3)
						src.SpiritSword=0.75
						src.SwordAscension=2
					if(usr.SagaLevel>=5)
						src.SpiritSword=1
						src.SwordAscension=3
				src.Trigger(usr)
		Protect_Shade
			TimerLimit=5
			VaizardHealth=0.5
			VaizardShatter=1
			IconLock='Android Shield.dmi'
			IconLockBlend=2
			IconLayer=-1
			IconApart=1
			OverlaySize=1.2
			ActiveMessage="projects an unbreakable barrier!"
			OffMessage="collapses their barrier..."
			Cooldown=300
			SBuffNeeded="Protect Brave"
			verb/Protect_Shade()
				set category="Skills"
				if(usr.SpecialBuff)
					if(usr.SpecialBuff.BuffName!="Genesic Brave"&&src.SBuffNeeded!="Protect Brave")
						src.SBuffNeeded="Protect Brave"
					else if(usr.SpecialBuff.BuffName=="Genesic Brave")
						src.SBuffNeeded="Genesic Brave"
				src.Trigger(usr)
		Protect_Wall
			TimerLimit=5
			VaizardHealth=10
			VaizardShatter=1
			IconLock='wall.dmi'
			IconLayer=-1
			IconLockBlend=2
			IconApart=1
			OverlaySize=2
			ActiveMessage="projects an absolutely unbreakable barrier!"
			OffMessage="collapses their barrier..."
			Cooldown=600
			SBuffNeeded="Protect Brave"
			verb/Protect_Wall()
				set category="Skills"
				if(usr.SpecialBuff)
					if(usr.SpecialBuff.BuffName!="Genesic Brave"&&src.SBuffNeeded!="Protect Brave")
						src.SBuffNeeded="Protect Brave"
					else if(usr.SpecialBuff.BuffName=="Genesic Brave")
						src.SBuffNeeded="Genesic Brave"
				src.Trigger(usr)
		Plasma_Hold
			TimerLimit=10
			TargetOverlay='Overdrive.dmi'
			TargetOverlayX=0
			TargetOverlayY=0
			Connector='BE.dmi'
			StunAffected=1
			AffectTarget=1
			Range=7
			ActiveMessage="shoots crackling plasma at their target!"
			OffMessage="releases their hold..."
			Cooldown=450
			SBuffNeeded="Protect Brave"
			verb/Plasma_Hold()
				set category="Skills"
				if(usr.SpecialBuff)
					if(usr.SpecialBuff.BuffName!="Genesic Brave"&&src.SBuffNeeded!="Protect Brave")
						src.SBuffNeeded="Protect Brave"
					else if(usr.SpecialBuff.BuffName=="Genesic Brave")
						src.SBuffNeeded="Genesic Brave"
				src.Trigger(usr)
		Dividing_Driver
			WarpZone=1
			Duel=1
			CastingTime=2
			KenWave=3
			KenWaveSize=3
			Range=5
			KenWaveIcon='KenShockwaveLegend.dmi'
			TurfShift='StarPixel.dmi'
			Cooldown=-1
			ActiveMessage="drives away the space between them and their target, drawing the fight into a secured dimension!"
			OffMessage="allows the divided space to collapse upon itself..."
			verb/Dividing_Driver()
				set category="Skills"
				if(usr.Target==usr)
					usr << "Can't target yourself."
					return
				if(src.WarpTarget)
					var/found=0
					for(var/mob/Players/m in world)
						if(m==src.WarpTarget)
							usr.Target=m
							found=1
					if(!found)
						usr << "You can't seal the target inside the divide."
						return
				src.Trigger(usr)

		Mangekyou_Sharingan
			TaxThreshold=0.2
			OffTaxDrain=0.002
			DefTaxDrain=0.002
			SBuffNeeded="Sharingan"
			BuffMastery=5
			Cooldown=150
			ActiveMessage="gives into hatred; their tomoe twist into a kaleidoscope pattern!"
			OffMessage="closes their eyes with a pained look..."
			verb/Mangekyou_Sharingan()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.SagaLevel>=6)
						src.OffTaxDrain=0
						src.DefTaxDrain=0
						if(usr.OffTax)
							usr.OffTax=0
						if(usr.OffCut)
							usr.OffCut=0
						if(usr.DefTax)
							usr.DefTax=0
						if(usr.DefCut)
							usr.DefCut=0
						src.OffMessage="unravels the kaleidoscope form of their tomoe..."
					switch(usr.SharinganEvolution)
						if("Sacrifice")
							src.BuffTechniques=list("/obj/Skills/AutoHit/Tsukiyomi","/obj/Skills/AutoHit/Amaterasu")
							src.Flow=1
						if("Hatred")
							src.BuffTechniques=list("/obj/Skills/AutoHit/Amaterasu2","/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Kagutsuchi")
							src.Flow=1
							src.Instinct=1
						if("Resolve")
							src.Flow=2
							src.Instinct=2
				src.Trigger(usr)
		Susanoo
			PULock=1
			DarkChange=1
			FlashChange=1
			WoundCost=30
			VaizardHealth=1.5
			VaizardShatter=1
			Cooldown=-1
			NoDodge=1
			GiantForm=1
			IconLockBlend=2
			LockX=-32
			LockY=-32
			ActiveMessage="summons an etheral ribcage around them!"
			OffMessage="dissipates the etheral protection..."
			verb/Susanoo()
				set category="Skills"
				if(!usr.BuffOn(src))
					if(usr.SagaLevel>=6)
						src.WoundCost=15
						src.VaizardHealth=2
						src.Cooldown=-1
						src.ActiveMessage="conjures a partially humanoid figure around them!"
						src.OffMessage="dissipates the mighty avatar..."
					if(usr.SagaLevel>=7)
						src.PULock=0
						src.WoundCost=0
						src.NoDodge=0
						src.VaizardHealth=3
						src.SweepingStrike=1
						src.Cooldown=-1
						src.ActiveMessage="conjures a fully humanoid, titanic figure around them!"
						src.OffMessage="dissipates the divine avatar..."
					switch(usr.SharinganEvolution)
						if("Sacrifice")
							src.IconLock='Susano-I.dmi'
							if(usr.SagaLevel>=7)
								src.OverlaySize=3
								src.IconLock='Susano Itachi.dmi'
								src.LockX=-5
								src.LockY=-5
						if("Hatred")
							src.IconLock='Susano-S.dmi'
							if(usr.SagaLevel>=7)
								src.OverlaySize=3
								src.IconLock='Susano Sasuke.dmi'
								src.LockX=-5
								src.LockY=-5
						if("Resolve")
							src.PureDamage=2
							src.PureReduction=2
							src.IconLock='Susano-M.dmi'
							if(usr.SagaLevel>=7)
								src.OverlaySize=3
								src.IconLock='Susano Madara.dmi'
								src.LockX=-5
								src.LockY=-5
				src.Trigger(usr)
		Rinnegan
			SBuffNeeded="Sharingan"
			WoundDrain=0.05
			GodKi=0.5
			Cooldown=-1
			IconLock='RinneganEyes.dmi'
			BuffTechniques=list("/obj/Skills/Six_Paths_of_Pain")
			ActiveMessage="ascends into enlightment as their eyes perceive all six paths of Samsara!"
			OffMessage="closes their eyes to the truth of the world..."
			verb/Rinnegan()
				set category="Skills"
				src.Trigger(usr)

		Dance_Of_The_Full_Moon
			StyleNeeded="Hiten Mitsurugi"
			SpecialBuffLock=1
			NeedsSecondSword=1
			DoubleStrike=2
			Reversal=1
			Deflection=2
			Godspeed=2
			Flow=1
			ActiveMessage="draws a second blade in display of mastery of their style!"
			OffMessage="sheathes their second blade..."
			verb/Dance_Of_The_Full_Moon()
				set category="Skills"
				src.Trigger(usr)

		Celestial_Ascension
			Purity=1
			BeyondPurity=1
			ActiveMessage="reveals their true celestial nature!"
			OffMessage="represses their celestial nature..."
			verb/Celestial_Ascension()
				set category="Skills"
				src.Trigger(usr)

		Boss_Form
			GiantForm=1
			NoDodge=1
			Enlarge=2
			ActiveMessage="expands to become the monster they are meant to be!"
			OffMessage="represses their monstrous size..."
			verb/Boss_Form()
				set category="Skills"
				src.Trigger(usr)

//Secrets
		Haki
			Cooldown=0
			Haki_Armament
				Hardening=1
				NoForcedWhiff=1
			Haki_Armor//Specialized
				TimerLimit=15
				StrMult=1.5
				EndMult=1.5
				Hardening=2
				KBRes=2
				KBMult=2
				ActiveMessage="darkens their entire body with indomitable willpower!"
			Haki_Armor_Lite//Not specialized
				TimerLimit=7
				StrMult=1.25
				EndMult=1.25
				ActiveMessage="bolsters their entire body with willpower!"
			Haki_Shield//Specialized
				TimerLimit=15
				PureReduction=2
				Deflection=1
				CounterMaster=3
				KBAdd=3
				ActiveMessage="reflects every attack against them with enormous willpower!"
			Haki_Shield_Lite//Not specialized
				TimerLimit=7
				PureReduction=2.5
				Deflection=1
				ActiveMessage="shields their body from attack with their willpower!"
			Haki_Observation
				Instinct=1
				Flow=1
			Haki_Future_Flash
				TimerLimit=50
				OffMult=1.5
				DefMult=1.5
				SureHitTimerLimit=15
				SureDodgeTimerLimit=15
				ActiveMessage="peers into the future to grasp their ambitions!"
			Haki_Future_Flash_Lite
				TimerLimit=25
				OffMult=1.25
				DefMult=1.25
				SureHitTimerLimit=20
				SureDodgeTimerLimit=20
				ActiveMessage="gains a small glimpse of their future!"
			Haki_Relax
				TimerLimit=30
				Flow=2
				ActiveMessage="weaves through every incoming attacks!"
			Haki_Relax_Lite
				TimerLimit=15
				Flow=1
				ActiveMessage="determines trajectories of incoming strikes at a glance!"

		Senjutsu
			Senjutsu_Focus
				BuffName="Senjutsu Focus"//Used to gain mana beyond 100 while medding
				ActiveMessage="extends their focus outward, drawing on the natural power of the world!"
				OffMessage="cuts off their perception of the world's energy..."
				verb/Senjutsu_Focus()
					set category="Skills"
					if(usr.BuffOn(src))
						if(usr.ManaDeath)
							usr << "You can't stop focusing when you're overloaded with natural energy!"
							return
					src.Trigger(usr)

		Ripple
			Ripple_Breathing
				HolyMod=2
				PUDrainReduction=2
				ActiveMessage="begins to channel the power of the Sun!"
				OffMessage="relaxes their breathing..."
				TextColor=rgb(255, 250, 120)
				HitSpark='Hit Effect Ripple.dmi'
				HitX=-32
				HitY=-32
				Ripple=1//SO NO CHI* NO SADAME...
				verb/Ripple_Breathing()
					set category="Skills"
					src.Trigger(usr)
			Life_Magnetism_Overdrive
				VaizardHealth=0.5
				VaizardShatter=1
				TimerLimit=10//lasts for 10 seconds.
				IconLock='Ripple Barrier.dmi'
				ActiveMessage="throws a handful of Ripple-conductive debris to form a barrier <b>Life Magnetism Overdrive</b>!"
				OffMessage="stops channeling the Ripple through the debris..."
		Vampire
			Frenzy
				Curse=1
				NeedsHealth=25
				Godspeed=1
				Intimidation=1.5
				LifeSteal=10
				IconLock='SharinganEyes.dmi'
				IconLockBlend=2
				IconApart=1
				IconLayer=1
				ActiveMessage="indulges in their bloodlust!"
				OffMessage="regains their sanity..."
				Cooldown=600
				TextColor=rgb(153, 0, 0)
				var/TrueVampire=0
				verb/Vampire_Frenzy()
					set category="Skills"
					if(!usr.BuffOn(src))
						//Secret stuff
						if(usr.BloodPower==1)
							if(usr.RecovMod<2)
								usr.RecovMod=2
							if(!usr.SpaceWalk)
								usr.SpaceWalk=1
								usr << "You no longer need to breathe!"
							if(!usr.EnhancedHearing)
								usr.EnhancedHearing=1
								usr << "Your hearing sharpens to that of a predator!"
							if(!usr.EnhancedSmell)
								usr.EnhancedSmell=1
								usr << "You can smell the blood in your prey..."
							if(usr.LifeSteal<10)
								usr.LifeSteal=10
								usr << "You're always capable of drawing lifeforce from imbibing blood..."
						else if(usr.BloodPower>1&&!src.TrueVampire)
							if(usr.RecovMod<3)
								usr.RecovMod=3
							for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in src)
								if(!r.RegenerateLimbs)
									r.RegenerateLimbs=1
									usr << "Your regenerative prowess can restore lost limbs!"
							if(!locate(/obj/Skills/Telekinesis, usr))
								usr.AddSkill(new/obj/Skills/Telekinesis)
								usr << "Your dark powers have grown strong enough to be able to telekinetically manipulate objects!"
							if(!locate(/obj/Skills/Utility/Telepathy, usr))
								usr.AddSkill(new/obj/Skills/Utility/Telepathy)
								usr << "You can communicate through blood..."
							if(!usr.StaticWalk)
								usr.StaticWalk=1
								usr << "You can traverse cursed realms!"
							if(usr.LifeSteal<25)
								usr.LifeSteal=25
								usr << "Your innate ability to access sustenance from blood grows larger!"
							src.NeedsHealth=null
							src.Godspeed=2
							src.Intimidation=2
							src.LifeSteal=25
							src.ActiveMessage="becomes a blood-craving creature of shadows!"
							src.OffMessage="restrains their craving for blood..."
							src.TrueVampire=1
					src.Trigger(usr)
					if(usr.BuffOn(src))
						if(usr.BloodPower>=2)
							if(usr.BPPoisonTimer>1&&usr.BPPoison<1)
								usr.BPPoison=1
								usr.BPPoisonTimer=1
								OMsg(usr, "[usr] recovers from their injuries!")
							if(usr.Maimed)
								usr.Maimed=0
								OMsg(usr, "[usr] regrows their limbs!")
		Werewolf
			New_Moon_Form
				HairLock=1
				AutoAnger=1
				Pursuer=1
				ActiveMessage="discards their humanity, their jaws stretching into a bloodthirsty maw!"
				OffMessage="conceals their bloodthirsty nature..."
				TextColor=rgb(153, 0, 0)
				IconLock='NewMoon.dmi'
				verb/New_Moon_Frenzy()
					set category="Skills"
					src.Trigger(usr)
			Half_Moon_Form
				HealthThreshold=0.1
				StrMult=2
				EndMult=2
				SpdMult=1.25
				ForMult=0.2
				OffMult=1.5
				DefMult=0.5
				RegenMult=0.1
				RecovMult=0.1
				Godspeed=1
				Intimidation=1.5
				HairLock='BLANK.dmi'
				HitSpark='WolfFF.dmi'
				HitX=0
				HitY=0
				HitTurn=1
				HitSize=0.8
				ActiveMessage="abandons rationality and transforms into a hulking beast of prey!"
				OffMessage="restrains their inner beast..."
				TextColor=rgb(153, 0, 0)
				IconTransform='HalfMoon.dmi'
			Full_Moon_Form
				HealthThreshold=0.1
				StrMult=1.5
				EndMult=1.5
				SpdMult=1.25
				ForMult=0.5
				OffMult=1.5
				DefMult=1.5
				RegenMult=2
				RecovMult=0.2
				AutoAnger=1
				Pursuer=2
				Godspeed=2
				Intimidation=1.5
				Curse=1
				KenWave=4
				KenWaveIcon='DarkKiai.dmi'
				HairLock='BLANK.dmi'
				HitSpark='Hit Effect Vampire.dmi'
				HitX=-32
				HitY=-32
				TimerLimit=600
				NameFake="Wolf"
				ActiveMessage="becomes the incarnation of wild nature itself!"
				OffMessage="retains their humanity..."
				TextColor=rgb(153, 0, 0)
				IconTransform='FullMoon.dmi'
				TransformX=-7
				TransformY=-4
				ActiveBuffLock=1
				SpecialBuffLock=1


//Self Triggering Buffs
		Autonomous
			Autonomous=1
			UnrestrictedBuff=1
			AllOutAttack=1

//General (?)

			Curse
				NeedsPassword=1
				MagicNeeded=1
			Infection
				NeedsPassword=1
			Dragon_Clash
				HotHundred=1
				Warping=3
				Steady=6
				TimerLimit=3
			Dragon_Clash_Defensive
				HotHundred=1
				Warping=3
				Steady=3
				TimerLimit=3
			Transcendant
				//this will add god ki for a few seconds for a special attack ; )
				TimerLimit=5
				GodKi=0.25//usually its 0.25 for seint seiya stuff
			Vanish
				HotHundred=1
				Warping=3
				Steady=3
				TimerLimit=3
				Incorporeal=1
				ActiveMessage="vanishes in the wake of their attack!"
//QUEUE FINISHERS
			QueueBuff/*All triggered by queues*/
				NeedsPassword=1//all triggered by buffself queues
				TimerLimit=15
				AlwaysOn=1
				Cooldown=4

				Finisher
					IconLock='AuraSlowTensionBlue.dmi'
					LockX=0
					LockY=0
					TensionDrain=1
					NoWhiff=1
					Generic_Finisher
						OffMult=1.5
						DefMult=1.5
						ActiveMessage="is getting fired up!"
						OffMessage="falls back in sync with the fight..."
						//no verb to activate

					Turtle_Martial_Mastery
						StyleNeeded="Turtle"
						StrMult=1.2
						EndMult=1.5
						DefMult=1.3
						Erosion=0.5
						KiControlMastery=1
						Void=1
						FluidForm=1
						ActiveMessage="begins a flawless Turtle Kata!"
						OffMessage="completes the Turtle Kata..."
					Crane_Martial_Mastery
						StyleNeeded="Crane"
						ForMult=1.5
						SpdMult=1.3
						OffMult=1.2
						PureDamage=2.5
						Skimming=1
						Flow=1
						SpiritFlow=1
						ActiveMessage="begins a flawless Crane Kata!"
						OffMessage="completes the Crane Kata..."
					Snake_Martial_Mastery
						StyleNeeded="Snake"
						ForMult=1.3
						SpdMult=1.5
						DefMult=1.2
						SoftStyle=1
						CounterMaster=10
						SpiritHand=1
						Deflection=1
						ActiveMessage="begins a flawless Snake Kata!"
						OffMessage="completes the Snake Kata..."
					Cat_Martial_Mastery
						StyleNeeded="Cat"
						StrMult=1.4
						SpdMult=1.2
						OffMult=1.4
						HardStyle=1
						Pursuer=1
						Flicker=1
						ActiveMessage="begins a flawless Cat Kata!"
						OffMessage="completes the Cat Kata..."

					//t1 sig styles
					Ki_Flow_Mastery
						StyleNeeded="Gentle Fist"
						ForMult=1.5
						EndMult=1.5
						SoftStyle=2
						Erosion=0.5
						KiControlMastery=1
						FluidForm=1
						PureDamage=2.5
						Flow=1
						SpiritFlow=1
						ActiveMessage="perceives the flow of ki perfectly!"
						OffMessage="finds their perception clouded once more..."
					Body_Mastery
						StyleNeeded="Strong Fist"
						HardStyle=2
						StrMult=1.5
						EndMult=1.25
						OffMult=1.25
						Pursuer=1
						Flicker=1
						KiControlMastery=1
						FluidForm=1
						ActiveMessage="circulates blood throughout their body perfectly!"
						OffMessage="loses their intense focus..."
					Spirit_Mastery
						StyleNeeded="Black Leg"
						StrMult=1.25
						ForMult=1.25
						SpdMult=1.5
						Pursuer=3
						QuickCast=3
						CounterMaster=10
						SpiritHand=1
						SpiritFlow=1
						Deflection=2
						ActiveMessage="ignites their chivalrous spirit!"
						OffMessage="burns out their manly spirit..."
					Rush_Mastery
						StyleNeeded="Lightning Kickboxing"
						MovementMastery=10
						Flicker=3
						PureDamage=2
						Flow=2
						CounterMaster=10
						Deflection=2
						ForMult=1.5
						SpdMult=1.5
						OffMult=1.25
						DefMult=1.25
						ActiveMessage="chases their enemy down with rapid kicks and punches!"
						OffMessage="runs out of energy..."

					//t2 signature martial
					Drunken_Mastery
						StyleNeeded="Drunken Fist"
						ForMult=1.5
						SpdMult=1.25
						EndMult=1.25

						SoftStyle=3
						SpiritFlow=1
						MovementMastery=5
						PureDamage=2
						Flow=2
						Deflection=2

						ActiveMessage="stumbles around drunkenly..."
						OffMessage="resumes normal motion..."
					Strength_Mastery
						StyleNeeded="Golden Kirin"
						StrMult=1.5
						EndMult=1.1
						OffMult=1.1
						ForMult=1.1
						SpdMult=1.3

						HardStyle=3
						UnarmedDamage=2.5
						Pursuer=3
						CounterMaster=10
						SpiritHand=1
						SpiritFlow=1
						Deflection=2

						ActiveMessage="enters the ultimate hard-style martial arts stance!"
						OffMessage="drops their stance..."
					Dire_Empowerment
						StyleNeeded="Dire Wolf"
						ManaGlow="#c66"
						ManaGlowSize=2
						StrMult=1.25
						EndMult=1.35
						OffMult=1.15
						DefMult=1.25
						ElementalOffense="Dark"
						ElementalDefense="Dark"
						Pursuer=2
						SuperDash=1
						Flicker=1
						KiControlMastery=1
						PureReduction=5
						TechniqueMastery=5
						ActiveMessage="enters a Dire Trance!!"
						OffMessage="loses their magical rage..."
					Astral_Empowerment
						StyleNeeded="Moonlight"
						ManaGlow="#66c"
						ManaGlowSize=2
						LifeSteal=100
						EnergySteal=100
						ManaSeal=1
						SoulFire=1
						StrMult=1.5
						ForMult=1.5
						ElementalOffense="Void"
						ElementalDefense="Void"
						ActiveMessage="draws command over their foe's energy!"
						OffMessage="blocks out their astral ascension..."
					Chaos_Empowerment
						StyleNeeded="Entropy"
						ManaGlow="#cc6"
						ManaGlowSize=2
						ElementalOffense="Ultima"
						ElementalDefense="Ultima"
						StrMult=1.25
						EndMult=1.25
						ForMult=1.25
						SpdMult=1.25
						ActiveMessage="divines the ultimate energy through the nous of chaos!"
						OffMessage="forgets how to access to the ultimate energy?!"
					Devil_Luck
						StyleNeeded="Devil Leg"
						ManaGlow="#F00"
						ManaGlowSize=2
						PureDamage=2.5
						Attracting=3
						OffMult=2
						ActiveMessage="beckons their luckless foe into an inescapable showdown!"
						OffMessage="runs out of their Devil's Luck..."
					Reversal_Mastery
						StyleNeeded="Flow Reversal"
						ManaGlow="#369"
						ManaGlowSize=2
						CyberStigma=3
						PureReduction=2.5
						CounterMaster=10
						Attracting=3
						DefMult=2
						ActiveMessage="reads the flow of the fight perfectly, ready to counter!"
						OffMessage="loses their absolute clarity..."
					Death_Mastery
						StyleNeeded="Phage"
						ManaGlow="#000"
						ManaGlowSize=2
						Toxic=2
						MaimStrike=1
						Curse=1
						VoidField=5
						DeathField=5
						StrMult=1.5
						ForMult=1.5
						ActiveMessage="radiates a miasma of death!"
						OffMessage="represses their deathly aura..."


					Mystic_Empowerment
						StrMult=1.5
						ForMult=1.5
						ActiveMessage="channels mystic forces through their Elemental Kata!"
						OffMessage="completes the Elemental Kata..."
					Earth_Empowerment
						StyleNeeded="Earth"
						ManaGlow="#c60"
						ManaGlowSize=1
						IconLock=null
						StrMult=1.25
						ForMult=1.25
						EndMult=1.5
						ActiveMessage="channels mystic forces through their Earth Kata!"
						OffMessage="completes the Earth Kata..."
					Fire_Empowerment
						StyleNeeded="Fire"
						ManaGlow="#c06"
						ManaGlowSize=1
						IconLock=null
						StrMult=1.5
						ForMult=1.5
						ActiveMessage="channels mystic forces through their Fire Kata!"
						OffMessage="completes the Fire Kata..."
					Water_Empowerment
						StyleNeeded="Water"
						ManaGlow="#06c"
						ManaGlowSize=1
						IconLock=null
						StrMult=1.25
						ForMult=1.25
						OffMult=1.5
						ActiveMessage="channels mystic forces through their Water Kata!"
						OffMessage="completes the Water Kata..."
					Wind_Empowerment
						StyleNeeded="Wind"
						ManaGlow="#0c6"
						ManaGlowSize=1
						IconLock=null
						StrMult=1.25
						ForMult=1.25
						SpdMult=1.5
						ActiveMessage="channels mystic forces through their Wind Kata!"
						OffMessage="completes the Wind Kata..."

					Cyber_Crusher
						StyleNeeded="Circuit Break"
						ManaGlow="#6cc"
						ManaGlowSize=2
						IconLock=null
						StrMult=2
						CyberStigma=2
						ActiveMessage="is ready to destroy all machines!"
						OffMessage="runs out of brainpower to destroy machines..."
					Toxic_Crash
						StyleNeeded="Inverse Poison"
						ManaGlow="#c6c"
						ManaGlowSize=2
						IconLock=null
						SpdMult=2
						Toxic=2
						ActiveMessage="accelerates their poison flow!"
						OffMessage="relaxes their toxic nature..."
					Corona_Splash
						StyleNeeded="Sunlight"
						ManaGlow="#cc6"
						ManaGlowSize=2
						IconLock=null
						StrMult=1.5
						ForMult=1.5
						PureDamage=2
						ActiveMessage="suffuses their arm with radiant sunlight!"
						OffMessage="relaxes their brilliance..."
					Stillness
						StyleNeeded="Tranquil Dove"
						ManaGlow="#66c"
						EndMult=1.5
						DefMult=1.5
						PureReduction=2
						ActiveMessage="radiates a peaceful stillness!"
						OffMessage="loses their vibe..."

					//t3 signature martial
					Tenryu_Kokyu_Ho //TODO: REMOVE
					North_Strength
						StyleNeeded="North Star"
						ManaGlow="#fff"
						ManaGlowSize=2
						PureDamage=2.5
						PureReduction=2.5
						MovementMastery=10
						Pursuer=2
						Curse=1
						HardStyle=2
						SoftStyle=2
						StrMult=1.5
						OffMult=1.5
						ActiveMessage="taps into all of their latent strength!"
						OffMessage="releases their gathered strength..."
					East_Strength
						StyleNeeded="East Star"
						ManaGlow="#fff"
						ManaGlowSize=2
						SoftStyle=2
						PureDamage=5
						PureReduction=(-5)
						StrMult=1.5
						ForMult=1.5
						SuperDash=1
						DashMaster=1
						DashCountLimit=4
						ActiveMessage="abandons all defensive posturing! You're in for a wild ride now!"
						OffMessage="disperses their immense wind pressure..."

					Battle_Strength //North Star / South Star
						PureDamage=2.5
						PureReduction=2.5
						MovementMastery=10
						EnergyHeal=3
						FatigueHeal=1
						ManaGlow="#ffffff"
						ManaGlowSize=2
						ActiveMessage="taps into all of their latent strength!"
						OffMessage="releases their gathered strength..."
					Battle_Focus //East Star / West Star
						Instinct=2
						Flow=2
						MovementMastery=10
						EnergyHeal=3
						FatigueHeal=1
						ManaGlow="#ffffff"
						ManaGlowSize=2
						ActiveMessage="attains perfect focus through battle!"
						OffMessage="loses their perfect battle focus..."

					//ansatsuken
					Hado_Kakusei
						StyleNeeded="Ansatsuken"
						ManaGlow=rgb(102, 153, 204)
						ManaGlowSize=2
						StrMult=1.5
						ForMult=1.5

						MovementMastery=10
						TechniqueMastery=5
						ManaHeal=2.5
					Heat_Rush
						StyleNeeded="Ansatsuken"
						ManaGlow=rgb(204, 153, 102)
						ManaGlowSize=2
						StrMult=1.5
						ForMult=1.5

						MovementMastery=10
						TechniqueMastery=5
						ManaHeal=2.5
					Violent_Personality
						StyleNeeded="Ansatsuken"
						ManaGlow=rgb(153, 51, 153)
						ManaGlowSize=2
						StrMult=1.5
						ForMult=1.5

						MovementMastery=10
						TechniqueMastery=5
						ManaHeal=2.5

					//hiten
					Shunshin
						SpdMult=2
						Warping=2
						HotHundred=1
						TimerLimit=5
						PhysicalHitsLimit=10
						Afterimages=1
						ActiveMessage="moves at godspeed for a rapid attack!"
						OffMessage="restrains their godspeed..."
					Shunshin_Shin
						SpdMult=2
						Warping=3
						HotHundred=2
						TimerLimit=5
						Afterimages=1
						ActiveMessage="unleashes their godspeed for a short burst!"
						OffMessage="falls back in step..."

					//keyblades
					Fever_Pitch
						StrMult=1.5
						OffMult=1.5
						Warping=2
						HotHundred=1
						Steady=2
						TimerLimit=3
					Fatal_Mode
						StrMult=2
						Steady=6
						FlashChange=1
						ManaGlow=rgb(255, 255, 204)
						ManaGlowSize=2
					Magic_Wish
						ForMult=1.25
						OffMult=1.25
						SpdMult=1.25
						DefMult=1.25
						BetterAim=1
					Fire_Storm
						FlashChange=1
						ManaGlow=rgb(255, 204, 204)
						ManaGlowSize=2
						SpiritHand=1
						StrMult=1.5
						ForMult=1.5
					Diamond_Dust
						FlashChange=1
						ManaGlow=rgb(204, 204, 255)
						ManaGlowSize=2
						AbsoluteZero=1
						Freezing=1
						ForMult=1.5
						OffMult=1.5
					Thunderbolt
						FlashChange=1
						ManaGlow=rgb(255, 255, 204)
						ManaGlowSize=2
						Paralyzing=1
						StunningStrike=2
						SpdMult=1.5
						OffMult=1.5
						Warping=2
						HotHundred=1
						Steady=2
						TimerLimit=5
					Wing_Blade
						FlashChange=1
						ManaGlow=rgb(255, 255, 255)
						ManaGlowSize=2
						PridefulRage=1
						OffMult=2
					Cyclone
						FlashChange=1
						ManaGlow=rgb(153, 255, 153)
						ManaGlowSize=2
						Erosion=0.5
						StrMult=2
					Rock_Breaker
						FlashChange=1
						ManaGlow=rgb(153, 102, 51)
						ManaGlowSize=2
						Shattering=5
						ElementalDefense="Void"
						Warping=2
						HotHundred=1
						TimerLimit=5
					Dark_Impulse
						FlashChange=1
						ManaGlow=rgb(153, 102, 51)
						ManaGlowSize=2
						ElementalOffense="Void"
						AngerMult=2
						AutoAnger=1
						TimerLimit=60
					Ghost_Drive
						FlashChange=1
						ManaGlow=rgb(153, 153, 153)
						ManaGlowSize=2
						Godspeed=3
						Flicker=2
						SuperDash=2
						PridefulRage=1
					Blade_Charge
						FlashChange=1
						ManaGlow=rgb(255, 0, 255)
						ManaGlowSize=2
						SpiritHand=1
						SpiritSword=0.5//this will average out to 1.5 spirit sord
						Extend=1


					Machine_Gun_Slash
						SwordHitsLimit=3
						HotHundred=1
						OffMult=2
						SlayerMod=5
						ActiveMessage="readies an Iaido Kata: Machine Gun Slash!"
						OffMessage="flicks their blade to clean it of blood before resheathing it..."
					Flurry_Fleur
						Crippling=5
						SureHitTimerLimit=2
						SureDodgeTimerLimit=2
						ActiveMessage="begins to move through a cruel and beautiful duelling form!"
						OffMessage="finishes their form with a flourish..."
					Overbearing_Strength
						StunningStrike=2
						Intimidation=1.5
						ActiveMessage="continues their adrenaline high, throwing all of their strength into each attack!"
						OffMessage="overexerts their strength, returning to their baseline..."
					Artificial_Sword_God
						StrMult=1.25
						EndMult=1.25
						OffMult=1.25
						DefMult=1.25
						ActiveMessage="sharpens the edges of their limbs to become more swordlike!"
						OffMessage="releases their concentrated edge..."

					//tier 1 sig style
					Dual_Mastery
						DoubleStrike=2
						SwordHits=6
						ActiveMessage="flows through a Dual Wielding Kata!"
						OffMessage="finishes their kata..."
					Flowing_Slash_Follow_Up
						Warping=2
						PhysicalHitsLimit=1
						PureDamage=10
						Instinct=2
						KBAdd=5
						KBMult=10
						ActiveMessage="brings their sword back..."
						OffMessage="strikes through their opponent suddenly!"
					Crippling_Blows
						Crippling=5
						PhysicalHitsLimit=3
						ActiveMessage="whips a knife in a crippling butterfly pattern!"
						OffMessage="finishes their cuts and hides the knife again..."
					Unhinged_Ferocity
						Intimidation=1.5
						StrMult=1.5
						SpdMult=1.5
						ActiveMessage="cast away any restrictions to their style!"
						OffMessage="slows their pace up and begins regular motions..."

					//t2 sig styles
					Trinity_Mastery
						DoubleStrike=3
						TripleStrike=3
						PhysicalHitsLimit=18
						ActiveMessage="flows through a Tri Wielding Kata!"
						OffMessage="finishes their kata..."
					Maim_Mastery
						MaimStrike=1
						CursedWounds=1
						ActiveMessage="embraces their murderous nature!"
						OffMessage="calms down from their murderous high..."
					Mana_Blitz
						BetterAim=3
						ForMult=2
						SpiritHitsLimit=10
						ActiveMessage="radiates potent mana!"
						OffMessage="runs dry their surplus of mana..."
					Endurance_Negation
						PridefulRage=1
						PhysicalHitsLimit=1
						SpiritHitsLimit=1
						ActiveMessage="scythes through any resistance with keenly honed wisdom!"
						OffMessage="reels from their magical expenditure..."

					War_God
						StyleNeeded="Five Rings"
						ManaGlow=rgb(255, 0, 0)
						ManaGlowSize=2
						CursedWounds=1
						PureDamage=5
						Instinct=4
						SpiritFlow=1
						HitSpark='Slash - Ragna.dmi'
						HitX=-32
						HitY=-32
						HitTurn=1
						OffMessage="represses their destructive instinct..."


					Bestial_Accuracy
						StrMult=1.5
						EndMult=1.5
						ActiveMessage="becomes empowered by instinct!"
						OffMessage="regains reason..."
					Martial_Flow
						OffMult=1.5
						DefMult=1.5
						ActiveMessage="enters a flow state!"
						OffMessage="loses their flow state..."
					Anti_Material_Augment
						BuffName="Anti-Material Augment"
						StrMult=2
						ActiveMessage="focuses their power to destroy any material!"
						OffMessage="loses their focus..."
					Speed_Break
						Afterimages=1
						SpdMult=2
						Pursuer=5//3 ddash
						ActiveMessage="removes the limits on their speed!"
						OffMessage="remembers their speed limit..."

					//t1 sig styles
					Sure_Shot
						StyleNeeded="Soul Crushing"
						PureDamage=5
						ForMult=2
						ActiveMessage="focuses their power into a precise line!"
						OffMessage="releases their aim..."
					Seeking_Spirits
						StyleNeeded="Spirit"
						BetterAim=2
						ForMult=1.5
						OffMult=1.5
						ActiveMessage="converses with their energy to track down their target!"
						OffMessage="disables the tracking spirits..."
					Fortunate_Fate
						StyleNeeded="Balance"
						StrMult=2
						EndMult=2
						PureDamage=2
						PureReduction=2
						ActiveMessage="is blessed by a turn of fortune!"
						OffMessage="uses up their karma..."
					Speed_of_Sound
						StyleNeeded="Resonance"
						SpdMult=2
						Disorienting=1
						Godspeed=2
						Warping=2
						Steady=1
						ActiveMessage="resonates with the speed of sound!"
						OffMessage="stops vibrating..."

					//t2 style
					Flash_Cry
						StyleNeeded="Shunko"
						Afterimages=1
						StrMult=1.5
						ForMult=1.5
						PureDamage=5
						PureReduction=(-5)
						ActiveMessage="enhances every movement with ki to allow for rapid destruction!!"
						OffMessage="exhausts their ki enhancement..."
					What_Must_Be_Done
						StyleNeeded="Metta Sutra"
						TensionDrain=0
						Mastery=0//will immediately be incremented
						TimerLimit=1000
						OffMessage="dissipates their spiritual intensity..."
						Cooldown=0
					Self_Mastery
						StyleNeeded="Shaolin"
						StrMult=1.25
						EndMult=1.25
						OffMult=1.25
						DefMult=1.25
						WeaponBreaker=3
						SoftStyle=3
						HardStyle=3
						ActiveMessage="becomes the perfect weapon!"
						OffMessage="relaxes their martial frenzy..."
					Dance_Mastery
						StyleNeeded="Blade Singing"
						SpdMult=2
						Warping=1
						HotHundred=1
						Steady=4
						Flow=2
						Instinct=2
						Godspeed=2
						CounterMaster=10
						ActiveMessage="steps between attacks and counters with effortless grace!"
						OffMessage="quiets their rhythmic dance..."

					Flowing_River
						StyleNeeded="West Star"
						ManaGlow=rgb(0, 0, 255)
						ManaGlowSize=2
						StrMult=1.25
						EndMult=1.25
						SpdMult=2
						OffMult=1.25
						DefMult=1.25
						WeaponBreaker=6
						SoftStyle=2
						HardStyle=2
						Warping=1
						HotHundred=1
						Flow=2
						Instinct=2
						Godspeed=2
						CounterMaster=10
						ActiveMessage="flows through every defense with calm precision!"
						OffMessage="runs dry their well of fluidity..."







				Brolic_Grip
					ActiveMessage="flexes their arm with brolic strength!"
					OffMessage="relaxes their vicious power..."

				Shell_Shattered
					PureReduction=-2.5
				Cat_Cowed
					Intimidation=0.5

				//these last for 10 seconds so they will stack about 30 of their elemental debuffs.
				Crystal_Crumbling
					IconTint=rgb(153,75,0)
					EndMult=0.8
					StrMult=0.8
					ShatterAffected=3
				Constant_Cyclone
					IconTint=rgb(0,153,75)
					SpdMult=0.8
					DefMult=0.8
					ShockAffected=3
				Continued_Conflagration
					IconTint=rgb(153,0,75)
					EndMult=0.8
					DefMult=0.8
					BurnAffected=3
				Corrosive_Chill
					IconTint=rgb(0,75, 153)
					SlowAffected=3
					EndMult=0.8
					ForMult=0.8

				Astral_Drain
					IconTint=rgb(0, 75, 153)
					SlowAffected=3
					ShatterAffected=3
					ShockAffected=3
					RecovMult=0.5
				Ultima_Break
					IconTint=rgb(153, 153, 75)
					StrMult=0.6
					EndMult=0.6
					SpdMult=0.6
				Devil_Fire
					KenWave=1
					KenWaveIcon='fevExplosion - Hellfire.dmi'
					KenWaveSize=5
					KenWaveX=76
					KenWaveY=76
					BurnAffected=10
					PoisonAffected=10
					DebuffCrash=list("Fire", "Poison")
				Bio_Break
					IconTint=rgb(51, 204, 102)
					RegenMult=0.1
					PoisonAffected=20
					DebuffCrash="Poison"

				//sword finisher debuffs
				Off_Balance
					IconLock='Stun.dmi'
					IconApart=1
					SpdMult=0.8
					DefMult=0.8
					ActiveMessage="can't get into the rhythm of combat!"
					OffMessage="regains their combat sense!"
				Attack_Break
					IconLock='Stun.dmi'
					IconApart=1
					StrMult=0.8
					OffMult=0.8
					ActiveMessage="can't mount a counter attack!"
					OffMessage="shakes off their anxiety!"
				Overwhelmed
					IconLock='Stun.dmi'
					IconApart=1
					StrMult=0.8
					ForMult=0.8
					ActiveMessage="feels their attacks aren't doing anything!"
					OffMessage="regains confidence!"
				Debilitated
					IconLock='Stun.dmi'
					IconApart=1
					SpdMult=0.8
					OffMult=0.8
					ActiveMessage="is shook down to their bones!"
					OffMessage="regains their vitality!"

				Tri_Break
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.6
					ForMult=0.6
					ActiveMessage="has lost all offensive potential!"
					OffMessage="regains their aggression!"
				Mana_Break
					IconTint=rgb(51, 102, 204)
					StrMult=0.6
					ForMult=0.6
					ManaDrain=1
					ActiveMessage="has had their mana flow inverted!"
					OffMessage="regains control of their magical reserves..."
				Evasion_Negation
					IconLock='SweatDrop.dmi'
					IconApart=1
					SpdMult=0.6
					DefMult=0.6
					ActiveMessage="feels their body locked in time!..."
					OffMessage="shakes off the evasion negation spell!"

				South_Break
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.5
					EndMult=0.5
					SpdMult=0.5
					ForMult=0.5
					OffMult=0.5
					DefMult=0.5
					ActiveMessage="feels their body betray them!"
					OffMessage="regains control of their body..."
				Useless
					IconTint=list(0.15,0,0, 0.05,0.25,0.15, 0.05,0.05,0.35, 0,0,0)
					IconLock='SweatDrop.dmi'
					IconApart=1
					NoDodge=1
					PureDamage=(-2.5)
					BleedHit=1
					FatigueDrain=3.5
					ManaDrain=2.5
					BurnAffected=2
					SlowAffected=2
					ShatterAffected=2
					PoisonAffected=2
					ShockAffected=2
					ShearAffected=2
					CrippleAffected=2
					ActiveMessage="knows that they are absolute trash..."
					OffMessage="remembers that they are a garbage can, not a garbage cannot!"
				Radioactive
					IconTint=rgb(0, 255, 0)
					ManaGlow=rgb(0, 255, 0)
					ManaGlowSize=2
					BleedHit=1
					BurnAffected=10
					PoisonAffected=10
					ShearAffected=10
					CrippleAffected=10
					DebuffCrash=list("Fire", "Poison")
					ActiveMessage="is sickened by their radioactive exposure!"
					OffMessage="shakes off their radiation sickness!"
				Moelach_Weezing
					IconTint=list(0.15,0,0, 0.05,0.25,0.15, 0.05,0.05,0.35, 0,0,0)
					IconLock='SweatDrop.dmi'
					IconApart=1
					NoDodge=1
					PureReduction=(-5)
					Afterimages=1
					SpdMult=0.25
					ActiveMessage="feels the wheezing breath of Moelach tickling at their mind..."
					OffMessage="doesn't know what that was all about!!"

				Godspeed_Assaulted
					IconLock='SweatDrop.dmi'
					IconApart=1
					Afterimages=1
					SpdMult=0.5
					NoDodge=1
					ActiveMessage="fears for their life against a hyperspeed opponent!"
					OffMessage="regains courage!"

				Dual_Break
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.8
					ForMult=0.8
					DefMult=0.6
					ActiveMessage="feels overwhelmed! They can't muster an attack or a defense!"
					OffMessage="regains their sense!"
				Technique_Break
					IconLock='SweatDrop.dmi'
					IconApart=1
					OffMult=0.6
					DefMult=0.6
					ActiveMessage="knows that they have been beat!"
					OffMessage="shakes off the feeling of being outclassed!"
				Desiccated
					IconLock='SweatDrop.dmi'
					IconApart=1
					EndMult=0.6
					SpdMult=0.6
					ActiveMessage="grasps for their torso ... They've been torn to shreds..."
					OffMessage="steels themselves for more battle!"
				Feral_Fear
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.8
					EndMult=0.8
					SpdMult=0.8
					ForMult=0.8
					ActiveMessage="can't even begin to think about how to deal with their opponent!"
					OffMessage="comes to the realization their opponent is probably just a moron!"


				//universal finisher debuffs
				Locked_On
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.8
					EndMult=0.8
					NoMiss=1
					NoDodge=1
					ActiveMessage="knows they are being hunted!"
					OffMessage="shakes off their pursuer!"
				Disoriented
					IconLock='Stun.dmi'
					IconApart=1
					SpdMult=0.8
					ForMult=0.8
					PowerInvisible=0.75
					ActiveMessage="can't get their bearings on their opponent!"
					OffMessage="regains focus!"
				Broken_Bones
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.8
					EndMult=0.8
					SpdMult=0.8
					DefMult=0.8
					PureReduction=(-2.5)
					ActiveMessage="yelps as a blow shatters their bones!"
					OffMessage="manages the pain of the shattered bones..."
				Slow_Motion
					IconLock='SweatDrop.dmi'
					IconApart=1
					Afterimages=1
					SpdMult=0.6
					PureDamage=(-2.5)
					ActiveMessage="can't...get...moving..."
					OffMessage="regains their speed!"

				Traced
					IconLock='SweatDrop.dmi'
					IconApart=1
					NoDodge=1
					ShatterAffected=10
					SlowAffected=10
					CrippleAffected=10
					ActiveMessage="knows that they're in for some pain! They have to escape!"
					OffMessage="stands their ground!"
				Ineffective_Fate
					IconLock='SweatDrop.dmi'
					IconApart=1
					StrMult=0.8
					ForMult=0.8
					EndMult=0.8
					PureDamage=(-2)
					PureReduction=(-2)
					ActiveMessage="knows that karma is against them!"
					OffMessage="feels more sure of their luck!"
				Shattered
					IconLock='SweatDrop.dmi'
					IconApart=1
					EndMult=0.6
					PureReduction=(-5)
					ActiveMessage="feels their internals shatter under the sonic assault!"
					OffMessage="regains their vitality!"

				Self_Shattered
					EnergyDrain=10
					BleedHit=1
					FatigueLeak=1
					ManaLeak=1
					HardStyle=1
					SoftStyle=1
					SpdMult=0.6
					ActiveMessage="has had their sense of self destroyed!"
					OffMessage="regains their ego!"



				Forced_Mechanize
					Mechanized=1
					ManaDrain=2
					IconTint=list(0.3,0.3,0.3, 0.59,0.59,0.59, 0.11,0.11,0.11, 0,0,0)
					OffMessage="breaks through the mechanization!"
				Venom_Break
					DebuffCrash="Poison"
					IconTint=rgb(153, 0, 153)
					TimerLimit=5
					PoisonAffected=10
					OffMessage="feels the poison boil through their body in an instant!"
				Solar_Break
					DebuffCrash="Fire"
					IconTint=rgb(153, 153, 0)
					TimerLimit=5
					BurnAffected=10
					PureReduction=(-2.5)
					OffMessage="is consumed by flames!!"
				Anger_Break
					IconTint=rgb(153, 153, 153)
					NoAnger=1
					NoDodge=1
					OffMessage="regains their conscienceness!"




//Augmented Gears
			CursedGear

				Calamity_Gear
				Berserk_Gear
				Atrocity_Gear
				Sinister_Gear
				Atavism_of_the_Maou


//Meant for NPC only
			Turns_Red
				NeedsHealth=50
				TooMuchHealth=75
				PowerInvisible=1.5
				TechniqueMastery=10
				TextColor=rgb(255, 0, 0)
				IconTint=list(0.8,0,0, 0.2,0.55,0.05, 0.2,0.02,0.58, 0,0,0)
				Cooldown=-1
				ActiveMessage="turns red!!"
			Swell_Up
				NeedsHealth=50
				TooMuchHealth=75
				GiantForm=1
				FluidForm=1
				DebuffImmune=1
				Enlarge=2
				TextColor=rgb(255, 255, 0)
				Cooldown=-1
				ActiveMessage="swells up!!"
			Round_Two
				NeedsHealth=10
				TooMuchHealth=100
				FlashChange=1
				StableHeal=1
				TimerLimit=10
				HealthHeal=5
				TextColor=rgb(255, 0, 255)
				Cooldown=-1
				ActiveMessage="catches a second wind!!"
			Metal_Coat
				NeedsHealth=10
				TooMuchHealth=100
				DarkChange=1
				VaizardHealth=5
				PureDamage=1
				PureReduction=1
				TextColor=rgb(0, 255, 255)
				IconTint=list(0.3,0.3,0.3, 0.39,0.39,0.39, 0.11,0.11,0.11, 0,0,0)
				Cooldown=-1
				ActiveMessage="grows out a metallic coat!!"
			Heartless
				SignatureTechnique=3
				DarkChange=1
				AlwaysOn=1
				SpdMult=2
				OffMult=2
				PowerMult=2
				AngerMult=2
				AutoAnger=1
				AuraLock='AntiAura.dmi'
				AuraX=-18
				AuraY=-22
				KenWave=3
				KenWaveIcon='DarkKiai.dmi'
				ActiveBuffLock=1
				SpecialBuffLock=1
				IconTint=list(0.15,0,0, 0.05,0.25,0.15, 0.05,0.05,0.35, 0,0,0)
				IconLock='AntiEyes.dmi'
				IconApart=1
				ActiveMessage="is transformed by their inner darkness!"
				OffMessage="exhausts the dark energy..."
				Cooldown=-1

//Cybernetic
			Blade_Mode
				Warping=2
				Steady=2
				HotHundred=1
				TimerLimit=5
				ClientTint=1
				Cooldown=10

//Enchant
			Sensing
				AlwaysOn=1
				TimerLimit=300
				SeeInvisible=70
				KenWaveIcon='KenShockwaveGod.dmi'
				KenWave=1
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=6
				Cooldown=1
			Potion_Power
				MagicNeeded=1
				ActiveMessage="quaffs a mysterious potion!"
				TextColor=rgb(0, 153, 255)
				AlwaysOn=1
				Cooldown=1
			Empowered
				AlwaysOn=1
				TimerLimit=90
				LifeGeneration=40
				EnergyGeneration=40
				ManaGeneration=40
				WoundHeal=0.1
				FatigueHeal=1
				PowerMult=1.5
				Steady=9
				Pursuer=1
				Flicker=1
				Godspeed=1
				IconLock='CommandSparks.dmi'
				IconLockBlend=2
				OverlaySize=0.7
				LockY=-4
				ActiveMessage="is miraculously empowered by the Command Seal! Almost nothing seems impossible anymore!"
				OffMessage="feels the effects of the Seal fade..."
				KenWave=3
				KenWaveBlend=2
				KenWaveIcon='KenShockwaveDivine.dmi'
				Cooldown=1
			Shackled
				AlwaysOn=1
				TimerLimit=180000
				Infatuated=100
				ActiveMessage="is forced into complete obedience by the Command Seal! They cannot harm their master anymore!"
				OffMessage="feels the effects of the Seal fade..."
				KenWave=3
				KenWaveBlend=2
				KenWaveIcon='KenShockwaveBloodlust.dmi'
				Cooldown=1
			Disturbed
				AlwaysOn=1
				TimerLimit=3600
				HealthDrain=0.025
				EnergyDrain=0.025
				ManaDrain=0.025
				IconLock='BraveSparks.dmi'
				IconLockBlend=2
				OverlaySize=0.7
				ActiveMessage="feels the energies animating their body rebel against it!"
				OffMessage="feels their necrotic energy stabilize..."
				Cooldown=1

//Racial
			Berserk
				NeedsHealth=5
				TooMuchHealth=50
				AngerMult=2
				TextColor=rgb(255, 0, 0)
				Cooldown=180
				ActiveMessage="enters a berserk fury!!"
				OffMessage="calms their bestial rage..."
			Dragon_Force
				NeedsHealth=50
				TooMuchHealth=75
				TextColor=rgb(95, 60, 95)
				IconLock='EyesDragon.dmi'
				KenWave=5
				KenWaveSize=3
				KenWaveIcon='DarkKiai.dmi'
				ActiveMessage="unleashes their ceaseless anger..."
				OffMessage="calms the rage of the eons..."
				Cooldown=10800
				//doubles god ki values
			Symbiote_Infection
				NeedsHealth=25
				NeedsVary=1
				TooMuchHealth=75
				VaizardHealth=2
				VaizardShatter=1
				Unstoppable=1
				Possessive=1
				TextColor=rgb(75, 0, 85)
				IconLock='RaginPart.dmi'
				IconApart=1
				IconTint=list(0.15,0.11,0.3, 0.15,0.11,0.3, 0.15,0.11,0.3, 0,0,0)
				DarkChange=1
				HitSpark='Slash - Hellfire.dmi'
				HitX=-32
				HitY=-32
				HitSize=1
				HitTurn=1
				Cooldown=-1
				ActiveMessage="is coated by a frenzied symbiotic organism!!"
			Rage_Form
				DarkChange=1
				StrMult=1.5
				SpdMult=1.5
				AutoAnger=1
				Intimidation=1.25
				Curse=1
				Pursuer=1
				Flicker=1
				StunningStrike=1
				DoubleStrike=1
				NeedsHealth=25
				TooMuchHealth=50
				AuraLock='AntiAura.dmi'
				AuraX=-18
				AuraY=-22
				KenWave=3
				KenWaveIcon='DarkKiai.dmi'
				SpecialBuffLock=1
				IconTint=list(0.15,0,0, 0.05,0.25,0.15, 0.05,0.05,0.35, 0,0,0)
				IconLock='AntiEyes.dmi'
				IconApart=1
				ActiveMessage="draws on the full force of darkness!"
				OffMessage="runs dry their dark power..."
				Cooldown=-1
			Devil_Arm_Refinement
				NeedsTrans=1


//Skill Tree...from knowledge side.
			Unburdened
				AlwaysOn=1
				PowerInvisible=1.25
				Pursuer=1
				Godspeed=1
				TimerLimit=10800
				ActiveMessage="drops their weights to the ground with a heavy impact!"
				KenWave=1
				DustWave=1
				Cooldown=1
			Unrestrained
				AlwaysOn=1
				PowerInvisible=1.25
				Flicker=1
				Pursuer=1
				Godspeed=1
				TimerLimit=10800
				ActiveMessage="drops their immensely heavy weights to the ground with a shattering impact!"
				KenWave=2
				DustWave=2
				Cooldown=1
//TS
			Demon_Illusion
				AlwaysOn=1
				NeedsPassword=1
				OffMult=0.8
				SpdMult=0.8
				RecovMult=0.8
				ActiveMessage="finds their mind gripped by a demonic illusion!"
				OffMessage="feels the effects of the nightmare fading away..."
				KenWave=1
				KenWaveSize=0.7
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwaveFocus.dmi'
				TimerLimit=180
				Cooldown=1
			Demon_Grasp
				AlwaysOn=1
				NeedsPassword=1
				Infatuated=2
				ActiveMessage="has their mind trapped by a demonic illusion! They need to witness death to regain freedom!"
				OffMessage="feels the effects of the curse fading away..."
				KenWave=3
				KenWaveSize=0.7
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwavePurple.dmi'
				Cooldown=1
			Punishment_of_Hell
				AlwaysOn=1
				KenWave=1
				WoundDrain=0.1
				ActiveMessage="experiences the suffering of Hell Realm - constant pain and injury!"
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwavePurple.dmi'
				TimerLimit=30
				Cooldown=1
			Punishment_of_Spectres
				AlwaysOn=1
				KenWave=1
				FatigueDrain=0.2
				ActiveMessage="experiences the suffering of Specter Realm - nagging emptiness and hunger!"
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwaveDivine.dmi'
				TimerLimit=30
				Cooldown=1
			Punishment_of_Beasts
				AlwaysOn=1
				TechniqueMastery=-3
				ActiveMessage="experiences the suffering of Beast Realm - instincts taking away from developing reason!"
				KenWave=1
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwaveFocus.dmi'
				TimerLimit=30
				Cooldown=1
			Punishment_of_Humans
				AlwaysOn=1
				PowerMult=0.75
				ActiveMessage="experiences the suffering of Human Realm - lack of power to fulfil ones ambition!"
				KenWave=1
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwaveLegend.dmi'
				TimerLimit=30
				Cooldown=1
			Punishment_of_Demons
				AlwaysOn=1
				AutoAnger=1
				MovementMastery=-3
				ActiveMessage="experiences the suffering of Demon Realm - boundless fury leading into peril!"
				KenWave=1
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwaveBloodlust.dmi'
				TimerLimit=30
				Cooldown=1
			Punishment_of_Heaven
				AlwaysOn=1
				FlashChange=1
				ExplosiveFinish=-1
				ExplosiveFinishIntensity=5
				ActiveMessage="experiences the suffering of Heavenly Realm - inevitability of death!"
				OffMessage="feels their death approaching!"
				KenWave=1
				KenWaveSize=1
				KenWaveBlend=2
				KenWaveTime=3
				KenWaveIcon='KenShockwaveGold.dmi'
				TimerLimit=30
				Cooldown=1

			AntiForm
				DarkChange=1
				AlwaysOn=1
				PowerMult=1.5
				StrMult=2
				SpdMult=1.5
				RecovMult=1.5
				Intimidation=2
				Godspeed=1
				AutoAnger=1
				Curse=1
				ManaLeak=2
				TooLittleMana=1
				AuraLock='AntiAura.dmi'
				AuraX=-18
				AuraY=-22
				KenWave=3
				KenWaveIcon='DarkKiai.dmi'
				ActiveBuffLock=1
				SpecialBuffLock=1
				IconTint=list(0.15,0,0, 0.05,0.25,0.15, 0.05,0.05,0.35, 0,0,0)
				IconLock='AntiEyes.dmi'
				IconApart=1
				ActiveMessage="is overwhelmed by their inner darkness!"
				OffMessage="exhausts the dark energy..."
				Cooldown=1//Just in case

			Satsui_Infected
				name="Satsui no Hado"
				NeedsAnger=1
				SpecialBuffLock=1
				StrMult=2
				ForMult=1.5
				RegenMult=0.5
				VaizardHealth=1
				Curse=1
				Pursuer=2
				HardStyle=2
				HitSpark='Hit Effect Satsui.dmi'
				HitX=-32
				HitY=-32
				Cooldown=-1
				ManaGlow="#911919"
				ManaGlowSize=4
				TextColor=rgb(215, 0, 0)
				ActiveMessage="is overcome by a demonic impulse to win at any cost!"
				OffMessage="manages to repress their urges..."

			Hitokiri_Battosai
				StyleNeeded="Hiten Mitsurugi"
				SpecialBuffLock=1
				NeedsHealth=50
				TooMuchHealth=75
				TechniqueMastery=5
				MovementMastery=5
				Instinct=2
				Flicker=2
				Curse=1
				IconLock='SlayerEyes.dmi'
				LockX=0
				LockY=0
				Cooldown=-1
				TextColor=rgb(215, 0, 0)
				BuffName="Battosai"
				ActiveMessage="becomes the embodiment of battoujutsu, an unstoppable manslayer Battosai!"
				OffMessage="restrains their nature as a killer..."

			Kagutsuchi
				NeedsHealth=50
				TooMuchHealth=75
				ElementalOffense="Fire"
				ElementalDefense="Fire"
				DarknessFlame=1
				DeathField=5
				DarkChange=1
				IconLock='DarknessFlameAura.dmi'
				LockX=-32
				LockY=-32
				IconLayer=-1
				HitSpark='fevExplosion - Hellfire.dmi'
				HitX=-32
				HitY=-32
				HitSize=1
				HitTurn=1
				TextColor=rgb(102, 102, 102)
				ActiveMessage="shapes the dark flames into a protective cage!"
				OffMessage="releases the dark flames..."
			Absorbtion_Shield
				AlwaysOn=1
				Siphon=1
				FlashChange=1
				IconLock='preta.dmi'
				IconLayer=-1
				IconLockBlend=2
				IconApart=1
				OverlaySize=1.3
				TimerLimit=30
				ActiveMessage="begins consuming all types of energy!"
				Cooldown=1
			Godly_Empowerment
				AlwaysOn=1
				GiantForm=1
				Juggernaut=1
				DebuffImmune=1
				Enlarge=3
				Cooldown=1

//Secret
			Ripple_Enhancement
				AlwaysOn=1
				BuffName="Sparkling Ripple"
				IconLock='Ripple Aura.dmi'
				IconLockBlend=2
				PoseEnhancement=1
				TimerLimit=30
			Senjutsu_Imbued
				AlwaysOn=1
				BuffName="Senjutsu Focus"//Used to gain mana beyond 100 while medding
				TimerLimit=180
			Restraint_Release
				AlwaysOn=1
				DarkChange=1
				PoseEnhancement=1
				FluidForm=1
				IconTint=list(0.08,0,0, 0,0,0, 0.06,0,0, 0,0,0)
				IconLock='Vampire Transformation.dmi'
				IconApart=1
				TimerLimit=90
				ActiveMessage="momentarily releases their restraints and becomes a creature of darkness!"
			Sennin_Mode
				BuffName="Sage Mode"
				ManaThreshold=200
				TooLittleMana=100
				ManaLeak=2
				ManaStats=1
				DrainlessMana=1
				MagicFocus=1
				PoseEnhancement=1
				AllOutAttack=1
				SuperDash=1
				TextColor=rgb(235, 230, 40)
				IconLock='EyesSage.dmi'
				IconLayer=4
				ActiveMessage="integrates the natural energy in their body; subtle markings appear around their eyes!"
				OffMessage="loses their markings as the natural energy runs dry..."

mob
	proc
		UseBuff(var/obj/Skills/Buffs/B, var/Override=0)
			if(src.BuffOn(B))
				if(B.MakesArmor)
					if(src.ActiveBuff)
						if(src.ActiveBuff.NeedsArmor)
							src << "[src.ActiveBuff] can no longer be used without armor!"
							src.ActiveBuff.Trigger(src, Override=1)
					if(src.SpecialBuff)
						if(src.SpecialBuff.NeedsArmor)
							src << "[src.SpecialBuff] can no longer be used without armor!"
							src.SpecialBuff.Trigger(src, Override=1)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.NeedsArmor)
								src << "[sb] can no longer be used without armor!"
								sb.Trigger(src, Override=1)
					if(src.StanceBuff)
						if(src.StanceBuff.NeedsArmor)
							src << "[src.StanceBuff] can no longer be used without armor!"
							src.StanceBuff.Trigger(src, Override=1)
					if(src.StyleBuff)
						if(src.StyleBuff.NeedsArmor)
							src << "[src.StyleBuff] can no longer be used without armor!"
							src.StyleBuff.Trigger(src, Override=1)
				if(B.MakesStaff)
					if(src.ActiveBuff)
						if(src.ActiveBuff.NeedsStaff)
							src << "[src.ActiveBuff] can no longer be used without a staff!"
							src.ActiveBuff.Trigger(src, Override=1)
					if(src.SpecialBuff)
						if(src.SpecialBuff.NeedsStaff)
							src << "[src.SpecialBuff] can no longer be used without a staff!"
							src.SpecialBuff.Trigger(src, Override=1)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.NeedsStaff)
								src << "[sb] can no longer be used without a staff!"
								sb.Trigger(src, Override=1)
					if(src.StanceBuff)
						if(src.StanceBuff.NeedsStaff)
							src << "[src.StanceBuff] can no longer be used without a staff!"
							src.StanceBuff.Trigger(src, Override=1)
					if(src.StyleBuff)
						if(src.StyleBuff.NeedsStaff)
							src << "[src.StyleBuff] can no longer be used without a staff!"
							src.StyleBuff.Trigger(src, Override=1)
				if(B.MakesSword || B.KiBlade)
					if(src.ActiveBuff)
						if(src.ActiveBuff.NeedsSword)
							src << "[src.ActiveBuff] can no longer be used without a sword!"
							src.ActiveBuff.Trigger(src, Override=1)
					if(src.SpecialBuff)
						if(src.SpecialBuff.NeedsSword)
							src << "[src.SpecialBuff] can no longer be used without a sword!"
							src.SpecialBuff.Trigger(src, Override=1)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.NeedsSword)
								src << "[sb] can no longer be used without a sword!"
								sb.Trigger(src, Override=1)
					if(src.StanceBuff)
						if(src.StanceBuff.NeedsSword)
							src << "[src.StanceBuff] can no longer be used without a sword!"
							src.StanceBuff.Trigger(src, Override=1)
					if(src.StyleBuff)
						if(src.StyleBuff.NeedsSword)
							src << "[src.StyleBuff] can no longer be used without a sword!"
							src.StyleBuff.Trigger(src, Override=1)
				if(B.type==/obj/Skills/Buffs/NuStyle/SwordStyle/Champloo_Style)
					if(src.ActiveBuff)
						if(!src.ActiveBuff.KiBlade && (src.ActiveBuff.NoSword||src.ActiveBuff.UsesStance))
							src << "[src.ActiveBuff] cannot be used with a sword and no Champloo Style."
							src.ActiveBuff.Trigger(src, Override=1)
					if(src.SpecialBuff)
						if(!src.SpecialBuff.KiBlade && (src.SpecialBuff.NoSword||src.SpecialBuff.UsesStance))
							src << "[src.SpecialBuff] cannot be used with a sword and no Champloo Style."
							src.SpecialBuff.Trigger(src, Override=1)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(!sb.KiBlade && (sb.NoSword||sb.UsesStance))
								src << "[sb] cannot be used with a sword and no Champloo Style."
								sb.Trigger(src, Override=1)
					if(src.StanceBuff)
						src << "[src.StanceBuff] cannot be used with a sword and no Champloo Style."
						src.StanceBuff.Trigger(src)
				if(B.type==/obj/Skills/Buffs/NuStyle/SwordStyle/Battle_Mage_Style)
					if(src.ActiveBuff)
						if(src.ActiveBuff.NoStaff&&src.HasStaff())
							src << "[src.ActiveBuff] cannot be used with a staff and no Battle Mage."
							src.ActiveBuff.Trigger(src, Override=1)
					if(src.SpecialBuff)
						if(src.SpecialBuff.NoStaff&&src.HasStaff())
							src << "[src.SpecialBuff] cannot be used with a staff and no Battle Mage."
							src.SpecialBuff.Trigger(src, Override=1)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.NoStaff&&src.HasStaff())
								src << "[sb] cannot be used with a staff and no Battle Mage."
								sb.Trigger(src)
					if(src.StanceBuff)
						if(src.StanceBuff.NoStaff&&src.HasStaff())
							src << "[src.StanceBuff] cannot be used with a staff and no Battle Mage."
							src.StanceBuff.Trigger(src, Override=1)
				if(B.type==/obj/Skills/Buffs/NuStyle/SwordStyle/Swordless_Style)
					if(src.ActiveBuff)
						if(src.ActiveBuff.NeedsSword)
							src << "[src.ActiveBuff] cannot be used without a sword and no Living Weapon stance."
							src.ActiveBuff.Trigger(src, Override=1)
					if(src.SpecialBuff)
						if(src.SpecialBuff.NeedsSword)
							src << "[src.SpecialBuff] cannot be used without a sword and no Living Weapon stance."
							src.SpecialBuff.Trigger(src, Override=1)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.NeedsSword)
								src << "[sb] cannot be used without a sword and no Living Weapon stance."
								sb.Trigger(src, Override=1)
					if(src.StyleBuff)
						if(src.StyleBuff.NeedsSword)
							src << "[src.StyleBuff] cannot be used without a sword and no Living Weapon stance."
							src.StyleBuff.Trigger(src, Override=1)
			if(!src.BuffOn(B))
				if(B.AssociatedGear)
					if(!B.AssociatedGear.InfiniteUses)
						if(B.Integrated)
							if(B.AssociatedGear.IntegratedUses<=0)
								src << "Your [B.AssociatedGear] doesn't have any power!"
								if(src.ManaAmount>=10)
									src << "Your [B] automatically draws on new power to reload!"
									src.LoseMana(10)
									B.AssociatedGear.IntegratedUses=B.AssociatedGear.IntegratedMaxUses
								return
						else
							if(B.AssociatedGear.Uses<=0)
								src << "Your [B.AssociatedGear] doesn't have any power!"
								return
				if(B.AffectTarget)
					if(!src.Target)
						src << "You don't have a target to capture!"
						return
				if(B.Range)//This one doesn't apply to rushes.
					if(!src.Target)
						src << "You need a target to use this skill!"
						if(!B.Using)
							B.Trigger(src, Override=1)
						return
					if(B.ForcedRange)
						if(get_dist(src,src.Target)!=B.Range)
							src << "They're not in range!"
							return
					else
						if(get_dist(src,src.Target)>B.Range||src.z!=src.Target.z)
							src << "They're out of range!"
							return
				if(B.Fusion)
					if(!src.Target)
						src << "You need a target to use this!"
						return
					if(src.Target==src)
						src << "You can't target yourself for fusion!"
						return
					if(src.Target)
						if(src.Fused||src.Target.Fused)
							src << "You can't fuse with a fused person!"
							src.Target << "You can't fuse with a fused person!"
							return
						if(src.Saga||src.Target.Saga)
							src << "You can't fuse with a destined person!"
							src.Target << "You can't fuse with a destined person!"
							return
						if(src.Secret||src.Target.Secret)
							src << "You can't fuse with an awakened person!"
							src.Target << "You can't fuse with an awakened person!"
							return
						if(src.ActiveBuff||src.Target.ActiveBuff)
							src << "Active Buffs can't be used with fusion!"
							src.Target << "Active Buffs can't be used with fusion!"
							return
						if(src.SpecialBuff||src.Target.SpecialBuff)
							src << "Special Buffs can't be used with fusion!"
							src.Target << "Special Buffs can't be used with fusion!"
							return
						if(src.SlotlessBuffs.len>0||src.Target.SlotlessBuffs.len>0)
							src << "Slotless Buffs can't be used with fusion!"
							src.Target << "Slotless Buffs can't be used with fusion!"
							return
						if(src.StanceBuff || src.Target.StanceBuff)
							src << "Stance Buffs can't be used with fusion!"
							src.Target << "Stance Buffs can't be used with fusion!"
						if(src.StyleBuff || src.Target.StyleBuff)
							src << "Style Buffs can't be used with fusion!"
							src.Target << "Style Buffs can't be used with fusion!"
							return
						if(src.HasKiControl())
							src << "Stop powering up or down before using Fusion!"
							return
						if(src.Target.HasKiControl())
							src << "Stop powering up or down before using Fusion!"
							return
						if(src.ssj["active"]>0 || src.Target.ssj["active"]>0)
							src << "You can't fuse while transformed!"
							src.Target << "You can't fuse while transformed!"
							return
						if(src.trans["active"]>0 || src.Target.trans["active"]>0)
							src << "You can't fuse while transformed!"
							src.Target << "You can't fuse while transformed!"
							return
						if(B.Fusion=="Dance")
							if(src.Race!=src.Target.Race)
								src << "You must be the same race to fuse!"
								src.Target << "You must be the same race to fuse!"
								return

							if(src.Gender!=src.Target.Gender)
								src << "You must be the same sex to fuse!"
								src.Target << "You must be the same sex to fuse!"
								return

							if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance, src.Target))
								src << "You can't fuse with someone who doesn't know the fusion dance!"
								src.Target << "You can't fuse with someone who doesn't know the fusion dance!"
								return

							var/BPComparision=src.Get_Sense_Reading(src.Target)
							if(BPComparision!="[src.Target.name] - Equal")
								src << "[src.Target]'s battle power is too different!"
								src.Target << "[src]'s battle power is too different!"
								B.FusionFailure=100*abs( ((src.Power*src.EnergyUniqueness*src.Intimidation)-(src.Target.Power*src.Target.EnergyUniqueness*src.Target.Intimidation))/(src.Power*src.EnergyUniqueness*src.Intimidation) )

						if(B.Fusion=="Potara")
							var/obj/Items/Symbiotic/Potara_Earrings/Right_Earring/RE
							var/obj/Items/Symbiotic/Potara_Earrings/Left_Earring/LE
							var/foundright=0
							var/foundleft=0
							for(RE in src)
								if(RE.suffix)
									foundright=1
									for(LE in src.Target)
										if(LE.suffix)
											foundleft=1
							for(LE in src)
								if(LE.suffix)
									foundleft=2
									for(RE in src.Target)
										if(RE.suffix)
											foundright=2
							if(!foundright||!foundleft||foundleft!=foundright)
								src << "You can't fuse with someone who doesn't wear a Potara to match!"
								src.Target << "You can't fuse with someone who doesn't wear a Potara to match!"
								return

				if(B.MagicNeeded&&!B.LimitlessMagic&&!src.HasLimitlessMagic())
					if(src.HasMechanized()&&src.HasLimitlessMagic()!=1)
						src << "You lack the ability to use magic!"
						if(istype(B, /obj/Skills/Buffs/SlotlessBuffs/Autonomous))
							del B
						return
					if((B.Copyable>=3||!B.Copyable)&&!(istype(B, /obj/Skills/Buffs/SlotlessBuffs/Autonomous)))
						if(!src.HasSpellFocus(B) && !B.MagicFocus)
							src << "You need a spell focus to use [B]."
							return
				if(B.StyleNeeded)
					if(src.StyleActive!=B.StyleNeeded)
						src << "You can't trigger [B] without [B.StyleNeeded] active!"
						return
				if(B.ActiveSlot)
					if(src.HasActiveBuffLock()||src.KamuiBuffLock)
						src << "Your active buffs are locked out!"
						return
				if(B.SpecialSlot)
					if(src.HasSpecialBuffLock()||src.KamuiBuffLock)
						src << "Your special buffs are locked out!"
						return
				if(B.ActiveBuffLock)
					if(src.ActiveBuff)
						if(src.CheckActive("Eight Gates"))
							src.ActiveBuff:Close_Gates()
						else
							src.ActiveBuff.Trigger(src, Override=1)
				if(B.SpecialBuffLock)
					if(src.SpecialBuff)
						src.SpecialBuff.Trigger(src, Override=1)
				if(src.Oozaru)
					if(!B.StanceSlot&&!B.StyleSlot&&!B.Autonomous)
						src << "You can't use buffs in Great Ape Mode!"
						return
				if(src.CheckSlotless("Full Moon Form")&&!B.UnrestrictedBuff)
					if(!B.StanceSlot&&!B.StyleSlot&&!B.Autonomous)
						src << "You can't use buffs in Full Moon Frenzy!"
						return
				if(B.Using&&!Override)
					if(!(src.CheckSlotless("Libra Armory")&&istype(B, /obj/Skills/Buffs/NuStyle)))
						src << "It's too soon to use [B] yet!"
						return
				if(B.NeedsStaff)
					var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
					if(!st)
						src << "You need a staff to use [B]."
						return
				if(B.ClassNeeded)
					var/obj/Items/Sword/s=src.EquippedSword()
					if(s.Class!=B.ClassNeeded && (istype(B.ClassNeeded, /list) && !(s.Class in B.ClassNeeded)))
						src << "You need a [istype(B.ClassNeeded, /list) ? B.ClassNeeded[1] : B.ClassNeeded]-class weapon to use this technique."
						return
				if(B.NeedsSword)
					var/obj/Items/Sword/s=src.EquippedSword()
					if(!s)
						if(src.NotUsingLiving())
							src << "You must be using a sword to use [B]."
							return
				if(B.NeedsSecondSword)
					var/found=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix=="*Equipped*")
							continue
						else
							found=1
					if(!found)
						var/obj/Skills/Buffs/make_another
						if(ActiveBuff && ActiveBuff.MakesSword == 3) make_another = ActiveBuff
						if(SpecialBuff && SpecialBuff.MakesSword == 3) make_another = SpecialBuff
						if(StanceBuff && StanceBuff.MakesSword == 3) make_another = StanceBuff
						if(StyleBuff && StyleBuff.MakesSword == 3) make_another = StyleBuff
						for(var/obj/Skills/Buffs/b in SlotlessBuffs)
							if(b.MakesSword == 3)
								make_another = b
						if(make_another)
							var/obj/Items/Sword/s
							if(make_another.SwordClassSecond) switch(make_another.SwordClassSecond)
								if("Wooden")
									s=new/obj/Items/Sword/Wooden
								if("Light")
									s=new/obj/Items/Sword/Light
								if("Medium")
									s=new/obj/Items/Sword/Medium
								if("Heavy")
									s=new/obj/Items/Sword/Heavy
								else
									s=new/obj/Items/Sword/Medium
							else switch(make_another.SwordClass)
								if("Wooden")
									s=new/obj/Items/Sword/Wooden
								if("Light")
									s=new/obj/Items/Sword/Light
								if("Medium")
									s=new/obj/Items/Sword/Medium
								if("Heavy")
									s=new/obj/Items/Sword/Heavy
								else
									s=new/obj/Items/Sword/Medium
							//no need to stack icons if they don't have 2nd/3rd icons
							if(make_another.SwordIconSecond)
								s.icon=make_another.SwordIconSecond
								if(make_another.SwordXSecond)
									s.pixel_x=make_another.SwordXSecond
								if(make_another.SwordYSecond)
									s.pixel_y=make_another.SwordYSecond
							if(make_another.SwordNameSecond)
								s.name=make_another.SwordNameSecond
							src.contents+=s
							if(make_another.SwordAscension)
								s.InnatelyAscended=make_another.SwordAscensionSecond ? make_another.SwordAscensionSecond : make_another.SwordAscension
							if(make_another.MagicSword)
								s.MagicSword+=make_another.MagicSwordSecond ? make_another.MagicSwordSecond : make_another.MagicSword
							if(make_another.SpiritSword)
								s.SpiritSword+=make_another.SpiritSword
							if(make_another.Extend)
								s.Extend+=make_another.Extend
							s.Conjured=1
							s.Cost=0
							s.Stealable=0
							if(make_another.FlashDraw)
								var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
								if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
									si.transform*=3
								animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
								world << si
								spawn()
									animate(si, alpha=0, time=3)
									sleep(3)
									del si
							s.AlignEquip(src)
						//	s.suffix="*Equipped (Second)*"
						else
							src << "You need another sword in order to use [B]!"
							return
				if(B.NeedsThirdSword)
					var/found2=0
					var/found3=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix=="*Equipped*")
							continue
						if(!found2)
							found2=s
							continue
						if(!found3)
							if(s==found2)
								continue
							else
								found3=s
					if(!found2||!found3)
						var/obj/Skills/Buffs/make_another
						if(ActiveBuff && ActiveBuff.MakesSword == 3) make_another = ActiveBuff
						if(SpecialBuff && SpecialBuff.MakesSword == 3) make_another = SpecialBuff
						if(StanceBuff && StanceBuff.MakesSword == 3) make_another = StanceBuff
						if(StyleBuff && StyleBuff.MakesSword == 3) make_another = StyleBuff
						for(var/obj/Skills/Buffs/b in SlotlessBuffs)
							if(b.MakesSword == 3)
								make_another = b
						if(make_another)
							if(!found2)
								var/obj/Items/Sword/s
								if(make_another.SwordClassSecond) switch(make_another.SwordClassSecond)
									if("Wooden")
										s=new/obj/Items/Sword/Wooden
									if("Light")
										s=new/obj/Items/Sword/Light
									if("Medium")
										s=new/obj/Items/Sword/Medium
									if("Heavy")
										s=new/obj/Items/Sword/Heavy
									else
										s=new/obj/Items/Sword/Medium
								else switch(make_another.SwordClass)
									if("Wooden")
										s=new/obj/Items/Sword/Wooden
									if("Light")
										s=new/obj/Items/Sword/Light
									if("Medium")
										s=new/obj/Items/Sword/Medium
									if("Heavy")
										s=new/obj/Items/Sword/Heavy
									else
										s=new/obj/Items/Sword/Medium
								//no need to stack icons if they don't have 2nd/3rd icons
								if(make_another.SwordIconSecond)
									s.icon=make_another.SwordIconSecond
									if(make_another.SwordXSecond)
										s.pixel_x=make_another.SwordXSecond
									if(make_another.SwordYSecond)
										s.pixel_y=make_another.SwordYSecond
								if(make_another.SwordNameSecond)
									s.name=make_another.SwordNameSecond
								src.contents+=s
								if(make_another.SwordAscension)
									s.InnatelyAscended=make_another.SwordAscensionSecond ? make_another.SwordAscensionSecond : make_another.SwordAscension
								if(make_another.MagicSword)
									s.MagicSword+=make_another.MagicSwordSecond ? make_another.MagicSwordSecond : make_another.MagicSword
								if(make_another.SpiritSword)
									s.SpiritSword+=make_another.SpiritSword
								if(make_another.Extend)
									s.Extend+=make_another.Extend
								s.Conjured=1
								s.Cost=0
								s.Stealable=0
								s.AlignEquip(src)
							//	s.suffix="*Equipped (Second)*"


							var/obj/Items/Sword/s
							if(make_another.SwordClassThird) switch(make_another.SwordClassThird)
								if("Wooden")
									s=new/obj/Items/Sword/Wooden
								if("Light")
									s=new/obj/Items/Sword/Light
								if("Medium")
									s=new/obj/Items/Sword/Medium
								if("Heavy")
									s=new/obj/Items/Sword/Heavy
							else switch(make_another.SwordClass)
								if("Wooden")
									s=new/obj/Items/Sword/Wooden
								if("Light")
									s=new/obj/Items/Sword/Light
								if("Medium")
									s=new/obj/Items/Sword/Medium
								if("Heavy")
									s=new/obj/Items/Sword/Heavy
								else
									s=new/obj/Items/Sword/Medium
							//no need to stack icons if they don't have 2nd/3rd icons
							if(make_another.SwordIconThird)
								s.icon=make_another.SwordIconThird
								if(make_another.SwordXThird)
									s.pixel_x=make_another.SwordXThird
								if(make_another.SwordYThird)
									s.pixel_y=make_another.SwordYThird
							if(make_another.SwordNameThird)
								s.name=make_another.SwordNameThird
							src.contents+=s
							if(make_another.SwordAscension)
								s.InnatelyAscended=make_another.SwordAscensionThird ? make_another.SwordAscensionThird : make_another.SwordAscension
							if(make_another.MagicSword)
								s.MagicSword+=make_another.MagicSwordThird ? make_another.MagicSwordThird : make_another.MagicSword
							if(make_another.SpiritSword)
								s.SpiritSword+=make_another.SpiritSword
							if(make_another.Extend)
								s.Extend+=make_another.Extend
							s.Conjured=1
							s.Cost=0
							s.Stealable=0
							if(make_another.FlashDraw)
								var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
								if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
									si.transform*=3
								animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
								world << si
								spawn()
									animate(si, alpha=0, time=3)
									sleep(3)
									del si
							s.AlignEquip(src)
						//	s.suffix="*Equipped (Third)*"

						else
							src << "You need two unequipped swords in order to use [B]!"
							return
				if(B.ABuffNeeded)
					if(B.ABuffNeeded.len>0)
						if(!src.ActiveBuff||!(src.ActiveBuff.BuffName in B.ABuffNeeded))
							var/List="("
							var/Place=0
							for(var/x in B.ABuffNeeded)
								Place++
								if(Place!=B.ABuffNeeded.len)
									List+="[x], "
								else
									List+="[x])"
							src << "You don't have the proper active buff active! [List]"
							return
				if(B.SBuffNeeded)
					if(!src.SpecialBuff||src.SpecialBuff.BuffName!=B.SBuffNeeded)
						src << "You have to be in [B.SBuffNeeded] state!"
						return
				if(B.NeedsSSJ)
					if(B.NeedsSSJ<0)
						if(src.ssj["active"])
							src << "You need to be in base form to use this!"
							return
					else
						if(src.ssj["active"]!=B.NeedsSSJ)
							src << "You need to be in Super Saiyan [B.NeedsSSJ] to use this!"
							return
				if(B.NeedsTrans)
					if(B.NeedsTrans<0)
						if(src.trans["active"])
							src << "You need to be in base form to use this!"
							return
					else
						if(src.trans["active"]!=B.NeedsTrans)
							src << "You need to be in Super Form [B.NeedsTrans] to use this!"
							return
				if(B.NeedsTier)
					if(src.SagaLevel<B.NeedsTier)
						src << "You are not advanced enough to use this!"
						return
				if(!B.AllOutAttack)
					if(B.HealthThreshold)
						if(src.Health<B.HealthThreshold*(1-src.HealthCut))
							src << "You don't have enough health to use [B]."
							return
					if(B.WoundDrain&&B.WoundThreshold)
						if(src.TotalInjury>=B.WoundThreshold)
							src << "You have too many wounds to use [B] right now."
							return
					if(B.EnergyThreshold)
						if(src.Energy<B.EnergyThreshold*(1-src.EnergyCut))
							src << "You don't have enough energy to use [B]."
							return
					if(B.FatigueDrain&&B.FatigueThreshold)
						if(src.TotalFatigue>=B.FatigueThreshold)
							src << "You are too fatigued to use [B] right now."
							return
					if(B.ManaThreshold)
						if(src.ManaAmount<B.ManaThreshold)
							src << "You don't have enough mana to use [B]."
							return
					if(B.CapacityDrain&&B.CapacityThreshold)
						if(src.TotalCapacity>=B.CapacityThreshold)
							src << "You don't have enough mana capacity to use [B] right now."
							return
					if(B.HealthCost)
						if(src.Health<B.HealthCost)
							src << "You don't have enough health to activate [B]."
							return
					if(B.EnergyCost)
						if(src.Energy<B.EnergyCost)
							src << "You don't have enough energy to activate [B]."
							return
					if(B.ManaCost && !src.HasDrainlessMana())
						if(!src.TomeSpell(B))
							if(src.ManaAmount<B.ManaCost)
								src << "You don't have enough mana to activate [B]."
								return
						else
							if(src.ManaAmount<B.ManaCost*(1-(0.45*src.TomeSpell(B))))
								src << "You don't have enough mana to activate [B]."
								return
					if(B.WoundCost)
						if(src.TotalInjury+B.WoundCost>100)
							src << "You have too many wounds to activate [B]."
							return
					if(B.FatigueCost)
						if(src.TotalFatigue+B.FatigueCost>100)
							src << "You have too much fatigue to activate [B]."
							return
					if(B.CapacityCost)
						if(src.TotalCapacity+B.CapacityCost>100)
							src << "You don't have enough mana capacity to activate [B]."
							return
				if(B.MakesArmor)
					var/obj/Items/Armor/S=src.EquippedArmor()
					if(S)
						src << "You can't use this while wearing armor because it makes a set!"
						return
				if(B.MakesSword)
					var/obj/Items/Sword/S=src.EquippedSword()
					var/obj/Items/Enchantment/Staff/T=src.EquippedStaff()
					if(S)
						src << "You can't use this while using a sword because it makes one!"
						return
					if(T)
						if(!src.ArcaneBladework&&src.Race!="Demon")
							src <<"You cannot create a blade while holding a staff!"
							return
					if(src.HasNoSword())
						if(src.NotUsingChamploo())
							src << "You cannot create a sword while using something that requires you to have no sword!"
							return
				if(B.MakesStaff)
					var/obj/Items/Sword/sord=src.EquippedSword()
					var/obj/Items/Enchantment/Staff/staf=src.EquippedStaff()
					if(sord)
						if(!src.ArcaneBladework&&src.Race!="Demon")
							src << "You can't use [B] to make a staff while wielding a sword!"
							return
					if(staf)
						src << "You can't use [B] to make a staff while already using one!"
						return
					if(src.StanceActive)
						if(src.Race!="Demon"&&!src.ArcaneBladework && (!src.StyleBuff||src.StyleBuff.type!=/obj/Skills/Buffs/NuStyle/SwordStyle/Battle_Mage_Style&&!src.HasMovingCharge()))
							src << "You can't use [B] to make a staff while using a stance!"
							return
				if(B.NoSword)
					var/obj/Items/Sword/S=src.EquippedSword()
					if(S)
						if(src.NotUsingChamploo())
							if(src.HasNeedsSword())
								src << "You cannot use [B] while using something that requires you to have a sword!"
								return
							src << "You can't use [B] while using a sword."
							return
				if(B.NoStaff)
					var/obj/Items/Enchantment/Staff/St=src.EquippedStaff()
					if(St)
						if(src.NotUsingBattleMage())
							if(src.HasNeedsStaff())
								src << "You cannot use [B] while using something that requires you to have a staff!"
								return
							src << "You can't use [B] while using a staff."
							return
				if(B.NeedsAnger)
					if(!src.Anger)
						src << "You can't use [B] before you're angry!"
						return
				if(B.NeedsHealth)
					if(src.Health>B.NeedsHealth*(1-src.HealthCut))
						src << "You can't use [B] before you're below [B.NeedsHealth*(1-src.HealthCut)]% health!"
						return
				if(B.PULock)
					if(src.PowerControl>100)
						src << "You can't use this buff right now because it seals your power up."
						return
				if(B.PUSpike)
					if(src.PULock)
						src << "You can't use this buff right now because your power up is sealed."
						return
				if(B.Ripple)
					if(src.Race=="Android")
						src <<"You do not breathe."
						return
					if(src.IsEvil())
						if(!src.HasGodKi())
							src.Death(null, "suicidal stupidity!", SuperDead=1)
							return
				if(B.WarpZone)
					if(!B.WarpX||!B.WarpY||!B.WarpZ)
						src << "Your duel location hasn't been set!"
						return
					if(!locate(B.WarpX, B.WarpY, B.WarpZ))
						src << "Your assigned duel location doesn't exist!"
						return
						if(src.Target==null)
							src << "You don't have a target to warp with!"
							return
				if(B.AssociatedGear)
					if(!B.AssociatedGear.InfiniteUses)
						if(B.Integrated)
							B.AssociatedGear.IntegratedUses--
							if(B.AssociatedGear.IntegratedUses<=0)
								src << "Your [B] is out of power!"
								if(src.ManaAmount>=10)
									src << "Your [B] automatically draws on new power to reload!"
									src.LoseMana(10)
									B.AssociatedGear.IntegratedUses=B.AssociatedGear.IntegratedMaxUses
						else
							B.AssociatedGear.Uses--
							if(B.AssociatedGear.Uses<=0)
								src << "[B] is out of power!"
				if(B.Transform)
					if(src.Transforming||trans["transing"]||ssj["transing"])
						src <<"You are already transforming!"
						return
					if(!(B.Transform in list("Force","Strong","Weak")))
						if(trans["active"]||ssj["active"])
							src <<"You are already transformed!"
							return

			if(B.StyleSlot)
				var/obj/Items/Sword/S=src.EquippedSword()
				if(S)
					if(B.NoSword)
						src << "You can't use [B] while having a sword equipped!"
						return
				if(src.StyleBuff)
					if(src.BuffOn(B))
						src.RemoveStyleBuff()
						return
					else
						src.StyleBuff.Trigger(src, Override=1)
				if(B.Copyable)
					spawn() for(var/mob/m in view(10, src))
						if(m.CheckSpecial("Sharingan"))
							if(m.client&&m.client.address==src.client.address)
								continue
							if(m.SagaLevel/2<B.Copyable)
								continue
							if(!locate(B.type, m))
								m.AddSkill(new B.type)
								m << "Your Sharingan analyzes and stores the [B.StyleActive] style you've just viewed."
					spawn()
						for(var/obj/Items/Tech/Security_Camera/SC in view(10, src))
							if(IsList(B.PreRequisite))
								SC.ObservedTechniques["[B.type]"]=B.Copyable
					spawn()
						for(var/obj/Items/Tech/Recon_Drone/RD in view(10, src))
							if(IsList(B.PreRequisite))
								RD.ObservedTechniques["[B.type]"]=B.Copyable
				src.StyleBuff=B
				if(src.Secret=="Ripple")
					src << "You channel the graceful motions of the Ripple through your style!"
				if(src.Secret=="Senjutsu")
					src << "You surround your body with a nimbus of natural energy, becoming able to strike targets without physical contact!"
				if(src.Secret=="Werewolf")
					src << "You channel the shifting phases of the Moon through your style!"
				if(src.Secret=="Vampire")
					src << "You channel the haziness of Shadow through your style!"
				if(src.Secret=="Zombie")
					src << "You channel the stillness of the Underworld through your style!"
				src.AddStyleBuff()
			if(B.ActiveSlot)//If the buff you pressed the button for is active slots...
				if(src.Race=="Changeling"&&src.TransActive()&&!B.UnrestrictedBuff)
					src << "No buffs as a changeling in transformations."
					return
				if(src.ActiveBuff)//And you already have an active buff...
					if(!src.BuffOn(B))//Check if it is the buff that is active.
						src << "You're already using an active buff."
						return//If not, post this message.
					else//Buf if it's the same...
						src.RemoveActiveBuff()//Remove the buff.
				else//If there is no buff active...
					src.ActiveBuff=B//Set the buff.
					src.AddActiveBuff()//Then add boosts.
				return

			if(B.SpecialSlot)
				if(src.Race=="Changeling"&&src.TransActive()&&!B.UnrestrictedBuff)
					src << "No buffs as a changeling in transformations."
					return
				if(src.Race=="Saiyan"&&src.TransActive()&&!B.UnrestrictedBuff)
					src << "No buffs as a saiyan in transformations."
					return
				if(src.SpecialBuff)
					if(!src.BuffOn(B))
						src << "You're already using a special buff."
						return
					else
						src.RemoveSpecialBuff()
				else
					src.SpecialBuff=B
					src.AddSpecialBuff()
				return

			if(B.Slotless)//If a buff is designated as slotless...
				if(B.SlotlessOn)//And it's marked as on...
					src.RemoveSlotlessBuff(B)//Remove it.
				else//But if it's not on...
					src.AddSlotlessBuff(B)//Add it.
				return

			if(!B.ActiveSlot&&!B.SpecialSlot&&!B.Slotless&&!B.StanceSlot&&!B.StyleSlot)
				src << "[B] is an incomplete buff which doesn't know what slot it takes."
				return
			if(B.AssociatedGear)
				if(!B.AssociatedGear.InfiniteUses)
					if(B.Integrated)
						B.AssociatedGear.IntegratedUses--
						if(B.AssociatedGear.IntegratedUses<=0)
							src << "Your [B.AssociatedGear] is out of power!"
						if(src.ManaAmount>=10)
							src.LoseMana(10)
							src << "Your integrated [B.AssociatedGear] automatically replenishes power!"
							B.AssociatedGear.IntegratedUses=B.AssociatedGear.IntegratedMaxUses
					else
						B.AssociatedGear.Uses--
						if(B.AssociatedGear.Uses==0)
							src << "Your [B.AssociatedGear] is out of power!"
		AddStyleBuff()

			if(src.StyleBuff.StyleActive=="Dark Flame")
				if(src.HasJagan())
					src.StyleBuff.HitSpark='fevExplosion - Hellfire.dmi'
					src.StyleBuff.HitX=-32
					src.StyleBuff.HitY=-32
					src.StyleBuff.HitSize=0.5

			if(src.StyleBuff.StyleActive=="Hiten Mitsurugi")
				if(src.SagaLevel>=2)
					if(src.StyleBuff.Godspeed<1)
						src.StyleBuff.Godspeed+=1
				if(src.SagaLevel>=4)
					if(src.StyleBuff.Flicker<2)
						src.StyleBuff.Flicker+=1
				if(src.SagaLevel>=6)
					if(src.StyleBuff.Godspeed<2)
						src.StyleBuff.Godspeed+=1
				if(src.SagaLevel>=8)
					if(src.StyleBuff.Flicker<3)
						src.StyleBuff.Flicker+=1

				src.StyleBuff.Mastery=4

			if(src.StyleBuff.StyleActive=="Ansatsuken")
				if(src.SagaLevel>=5)
					src.StyleBuff.AngerThreshold=2
					switch(src.AnsatsukenAscension)
						if("Chikara")
							src.StyleBuff.StyleStr=1.1
							src.StyleBuff.StyleEnd=1.4
							src.StyleBuff.StyleFor=1.1
							src.StyleBuff.StyleSpd=1.4
							src.StyleBuff.CalmAnger=1
							if(src.SagaLevel>7)
								src.StyleBuff.Unstoppable=1
								src.StyleBuff.LifeGeneration=25
								src.StyleBuff.EnergyGeneration=100
								src.StyleBuff.ManaGeneration=100
						if("Satsui")
							src.StyleBuff.AutoAnger=1
							src.StyleBuff.StyleStr=1.4
							src.StyleBuff.StyleEnd=1.1
							src.StyleBuff.StyleFor=1.4
							src.StyleBuff.StyleSpd=1.1

					src.StyleBuff.Mastery=4

			src.Power_Multiplier+=(src.StyleBuff.PowerMult-1)
			src.StrMultTotal+=(src.StyleBuff.StrMult-1)
			src.EndMultTotal+=(src.StyleBuff.EndMult-1)
			src.SpdMultTotal+=(src.StyleBuff.SpdMult-1)
			src.ForMultTotal+=(src.StyleBuff.ForMult-1)
			src.OffMultTotal+=(src.StyleBuff.OffMult-1)
			src.DefMultTotal+=(src.StyleBuff.DefMult-1)
			src.RecovMultTotal+=(src.StyleBuff.RecovMult-1)

			src.AllSkillsAdd(src.StyleBuff)
			OMsg(src, "[src] takes up the [src.StyleBuff]!")
			src.StanceActive=src.StyleBuff.UnlockedStances[2]

		RemoveStyleBuff()

			src.Power_Multiplier-=(src.StyleBuff.PowerMult-1)
			src.StrMultTotal-=(src.StyleBuff.StrMult-1)
			src.EndMultTotal-=(src.StyleBuff.EndMult-1)
			src.SpdMultTotal-=(src.StyleBuff.SpdMult-1)
			src.ForMultTotal-=(src.StyleBuff.ForMult-1)
			src.OffMultTotal-=(src.StyleBuff.OffMult-1)
			src.DefMultTotal-=(src.StyleBuff.DefMult-1)
			src.RecovMultTotal-=(src.StyleBuff.RecovMult-1)
			src.AllSkillsRemove(src.StyleBuff)
			OMsg(src, "[src] relaxes their [src.StyleBuff]...")
			src.Tension=0
			src.StanceActive=0
			src.StyleBuff=null

		AddActiveBuff()

			if(src.ActiveBuff.BuffName=="Ki Control")
				if(src.Anaerobic)
					src.ActiveBuff.PUSpike=25

				if(src.TransActive())
					src.ActiveBuff.OverlayTransLock=1
					if(src.Race=="Saiyan"||src.Race=="Half Saiyan")
						if((!src.HasGodKi()&&masteries["[src.TransActive()]mastery"]==100)||src.HasGodKi()&&masteries["4mastery"]==100)
							if(src.TransActive()==1&&(!src.HasGodKi()&&!src.Anger))
								src.Anger=src.AngerMax
							else if(src.HasGodKi()&&masteries["4mastery"]==100)
								src.ActiveBuff.AuraLock='BLANK.dmi'
								src.ActiveBuff.FlashChange=1
				else
					src.ActiveBuff.OverlayTransLock=0

				if(src.Race=="Makyo")
					src.ActiveBuff.IconReplace=1
					src.ActiveBuff.icon=src.ExpandBase
					src.ActiveBuff.BleedHit=0
					src.ActiveBuff.EnergyLeak=0
					src.ActiveBuff.ManaLeak=0
					if(src.HellPower||src.StarPowered)
						src.ActiveBuff.AutoAnger=1
						src.ActiveBuff.AngerMult=2
						src.ActiveBuff.PUSpike=50
					else
						src.ActiveBuff.AutoAnger=0
						src.ActiveBuff.AngerMult=1
						src.ActiveBuff.PUSpike=0

				if(src.Saga=="Cosmo")
					src.ActiveBuff.ActiveMessage="burns their Cosmo with full strength!!!"
					src.ActiveBuff.OffMessage="calms their Cosmo..."
					src.ActiveBuff.OverlayTransLock=1
					src.ActiveBuff.AuraLock=1
					src.ActiveBuff.SenseUnlocked=1
					if(src.SagaLevel==6)
						switch(src.ClothGold)
							if("Aries")
								if(!locate(/obj/Skills/Projectile/Stardust_Revolution, src))
									src.AddSkill(new/obj/Skills/Projectile/Stardust_Revolution)
							if("Gemini")
								if(!locate(/obj/Skills/Projectile/Galaxian_Explosion, src))
									src.AddSkill(new/obj/Skills/Projectile/Galaxian_Explosion)
							if("Cancer")
								if(!locate(/obj/Skills/Projectile/Praesepe_Demonic_Blue_Flames, src))
									src.AddSkill(new/obj/Skills/Projectile/Praesepe_Demonic_Blue_Flames)
							if("Leo")
								if(!locate(/obj/Skills/Queue/Lightning_Plasma_Strike, src))
									src.AddSkill(new/obj/Skills/Queue/Lightning_Plasma_Strike)
							if("Virgo")
								if(!locate(/obj/Skills/AutoHit/Demon_Pacifier, src))
									src.AddSkill(new/obj/Skills/AutoHit/Demon_Pacifier)
							if("Libra")
								if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Libra_Armory, src))
									src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Libra_Armory)
							if("Scorpio")
								if(!locate(/obj/Skills/Projectile/Scarlet_Needle, src))
									src.AddSkill(new/obj/Skills/Projectile/Scarlet_Needle)
							if("Capricorn")
								if(!locate(/obj/Skills/AutoHit/Sacred_Sword_Excalibur, src))
									src.AddSkill(new/obj/Skills/AutoHit/Sacred_Sword_Excalibur)
							if("Aquarius")
								if(!locate(/obj/Skills/Projectile/Beams/Big/Saint_Seiya/Aurora_Execution, src))
									src.AddSkill(new/obj/Skills/Projectile/Beams/Big/Saint_Seiya/Aurora_Execution)
							if("Pisces")
								if(!locate(/obj/Skills/Projectile/Royal_Demon_Rose, src))
									src.AddSkill(new/obj/Skills/Projectile/Royal_Demon_Rose)
					if(FightingSeriously(src,0))
						if(src.SagaLevel>=5 && src.SagaLevel < 7)
							if(src.Health<=15 || src.InjuryAnnounce)
								src.ActiveBuff.SenseUnlocked=2
								src.ActiveBuff.ActiveMessage="burns their Cosmo with full strength and attains the Seventh Sense!!!"
						if(src.SagaLevel==7)
							src.ActiveBuff.SenseUnlocked=2
							src.ActiveBuff.ActiveMessage="burns their Cosmo with full strength and attains the Seventh Sense!!!"
						if(src.SagaLevel>=8)
							src.ActiveBuff.ActiveMessage="burns their Cosmo with full strength and attains the Seventh Sense!!!"
						if(src.SagaLevel==8&&src.Dead)
							src.ActiveBuff.SenseUnlocked=2
							src.ActiveBuff.ActiveMessage="burns their Cosmo with full strength and attains the Eighth Sense!!!"
						if(src.SagaLevel==8&&src.SenseUnlocked>=7)
							src.ActiveBuff.SenseUnlocked=2
							src.ActiveBuff.ActiveMessage="burns their Cosmo with full strength and reaches the Ninth Sense, realm of the Gods!!!"

			src.Power_Multiplier+=(src.ActiveBuff.PowerMult-1)
			src.StrMultTotal+=(src.ActiveBuff.StrMult-1)
			src.EndMultTotal+=(src.ActiveBuff.EndMult-1)
			src.SpdMultTotal+=(src.ActiveBuff.SpdMult-1)
			src.ForMultTotal+=(src.ActiveBuff.ForMult-1)
			src.OffMultTotal+=(src.ActiveBuff.OffMult-1)
			src.DefMultTotal+=(src.ActiveBuff.DefMult-1)
			src.RecovMultTotal+=(src.ActiveBuff.RecovMult-1)
			src.AllSkillsAdd(src.ActiveBuff)

		RemoveActiveBuff()

			src.Power_Multiplier-=(src.ActiveBuff.PowerMult-1)
			src.StrMultTotal-=(src.ActiveBuff.StrMult-1)
			src.EndMultTotal-=(src.ActiveBuff.EndMult-1)
			src.SpdMultTotal-=(src.ActiveBuff.SpdMult-1)
			src.ForMultTotal-=(src.ActiveBuff.ForMult-1)
			src.OffMultTotal-=(src.ActiveBuff.OffMult-1)
			src.DefMultTotal-=(src.ActiveBuff.DefMult-1)
			src.RecovMultTotal-=(src.ActiveBuff.RecovMult-1)
			if(src.SpecialBuff)
				if(src.SpecialBuff.ABuffNeeded)
					if(src.SpecialBuff.ABuffNeeded.len>0)
						if(src.ActiveBuff.BuffName in src.SpecialBuff.ABuffNeeded)
							src.SpecialBuff.Trigger(src, Override=1)
			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
				if(sb.ABuffNeeded)
					if(sb.ABuffNeeded.len>0)
						if(src.ActiveBuff.BuffName in sb.ABuffNeeded)
							sb.Trigger(src, Override=1)
			if(src.StanceBuff)
				if(src.StanceBuff.ABuffNeeded)
					if(src.StanceBuff.ABuffNeeded.len>0)
						if(src.ActiveBuff.BuffName in src.StanceBuff.ABuffNeeded)
							src.StanceBuff.Trigger(src, Override=1)
			if(src.StyleBuff)
				if(src.StyleBuff.ABuffNeeded)
					if(src.StyleBuff.ABuffNeeded.len>0)
						if(src.ActiveBuff.BuffName in src.StyleBuff.ABuffNeeded)
							src.StyleBuff.Trigger(src, Override=1)
			if(src.TransActive()||src.Saga=="Cosmo")
				if(src.ActiveBuff.BuffName=="Ki Control")
					src.ActiveBuff.OverlayTransLock=1
			else
				if(src.ActiveBuff.BuffName=="Ki Control")
					src.ActiveBuff.OverlayTransLock=0
			src.AllSkillsRemove(src.ActiveBuff)
			src.ActiveBuff=null
			if(src.Race=="Makyo")
				src.StarPowered=0

		AddSpecialBuff()

			if(src.SpecialBuff.BuffName=="Jagan Eye")
				src.SpecialBuff.FatigueLeak=2-(src.SpecialBuff.Mastery*0.5)
				src.SpecialBuff.SureDodgeTimerLimit=(25-(3.75*src.SpecialBuff.Mastery))
				src.SpecialBuff.SureHitTimerLimit=(25-(3.75*src.SpecialBuff.Mastery))
				src.PureDamage=(1.25*src.SpecialBuff.Mastery)
				if(!locate(/obj/Skills/Utility/Telepathy, src.Skills))
					src.AddSkill(new/obj/Skills/Utility/Telepathy)
					src << "Through acquiring the Jagan Eye, you've developed telepathy!"
				if(!locate(/obj/Skills/Utility/Observe, src.Skills))
					src.AddSkill(new/obj/Skills/Utility/Observe)
					src << "Through acquiring the Jagan Eye, you've developed remote viewing!"
				if(!locate(/obj/Skills/Telekinesis, src.Skills))
					src.AddSkill(new/obj/Skills/Telekinesis)
					src << "Through acquiring the Jagan Eye, you've developed telekinesis!"
				if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Jagan_Expert, src.Buffs))
					src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Jagan_Expert)
					src << "You can push the limits of the Jagan Eye for a time to regain lost power!"
				if(!src.EnhancedHearing)
					src.EnhancedHearing=1
				if(!src.EnhancedSmell)
					src.EnhancedSmell=1
					src << "The powers of the Jagan eye cause your senses to sharpen!"

				if(src.SpecialBuff.Mastery==1)
					src.JaganPowerNerf=0.5
				if(src.SpecialBuff.Mastery==2)
					src.JaganPowerNerf=0.75
					if(!locate(/obj/Skills/Projectile/Beams/Big/Jagan/Dragon_of_the_Darkness_Flame, src.Projectiles))
						src.AddSkill(new/obj/Skills/Projectile/Beams/Big/Jagan/Dragon_of_the_Darkness_Flame)
						src << "Through disciplining your Jagan Eye, you've developed the Dragon of the Darkness Flame!"
						src << "It is a reckless attack and will sacrifice the limb used to perform it."
				if(src.SpecialBuff.Mastery==3)
					usr.JaganPowerNerf=1
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/SwordOfDarknessFlame, src.Buffs))
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/SwordOfDarknessFlame)
					for(var/obj/Skills/Projectile/Beams/Big/Jagan/Dragon_of_the_Darkness_Flame/DF in src.Projectiles)
						if(DF.MaimCost)
							DF.MaimCost=0
							src << "Through refining the Jagan Eye, your control over darkness flame grows!"
				if(src.SpecialBuff.Mastery>=4)
					usr.JaganPowerNerf=0
					for(var/obj/Skills/Projectile/Beams/Big/Jagan/Dragon_of_the_Darkness_Flame/DF in src.Projectiles)
						if(DF.MaimCost||DF.WoundCost)
							DF.WoundCost=0
							src << "Through mastering your Jagan Eye, you can now call on the Dragon with absolute control!"
					if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Darkness_Dragon_Master, src))
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Darkness_Dragon_Master)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Jagan_Expert/je in usr)
						del je

			if(src.SpecialBuff.BuffName=="Jinchuuriki")
				src.SpecialBuff.BleedHit=4-src.SpecialBuff.Mastery
				src.SpecialBuff.PureReduction=(src.SpecialBuff.Mastery*1.25)
				if(src.SpecialBuff.Mastery==1)
					src.SpecialBuff.BleedHit=0
				if(src.SpecialBuff.Mastery>1)
					if(src.SpecialBuff.ActiveMessage=="overflows with berserk demon chakra!")
						src.SpecialBuff.ActiveMessage="cloaks their form with demon chakra!"
					if(src.SpecialBuff.OffMessage=="can no longer bear the strain of channelling demon chakra...")
						src.SpecialBuff.OffMessage="quells the inner rage of their demon..."
				src.SpecialBuff.PureReduction=(src.SpecialBuff.Mastery*1.25)
				src.SpecialBuff.LifeGeneration=(src.SpecialBuff.Mastery*25)
				if(src.SpecialBuff.Mastery==2)
					src.SpecialBuff.Intimidation=1.5
				if(src.SpecialBuff.Mastery==3)
					src.SpecialBuff.Intimidation=2
				if(src.SpecialBuff.Mastery==4)
					src.SpecialBuff.Intimidation=3
				if(!src.JinchuuType)
					src.JinchuuType=pick(list("Tyrant", "Catastrophe", "Dominator", "Juggernaut"))
				for(var/obj/Skills/Buffs/SpecialBuffs/Cursed/Jinchuuriki/j in src.Buffs)
					switch(src.JinchuuType)
						if("Tyrant")
							j.StrMult=2
						if("Catastrophe")
							j.ForMult=2
						if("Dominator")
							j.OffMult=2
						if("Juggernaut")
							j.EndMult=2

			if(src.SpecialBuff.BuffName=="Vaizard Mask")
				src.SpecialBuff.ManaLeak=4-src.SpecialBuff.Mastery
				src.SpecialBuff.PureReduction=(src.SpecialBuff.Mastery*0.5)
				src.SpecialBuff.PureDamage=(src.SpecialBuff.Mastery*0.5)
				if(src.SpecialBuff.Mastery==1)
					src.SpecialBuff.ManaLeak=0
				if(src.SpecialBuff.Mastery>1)
					if(src.SpecialBuff.ActiveMessage=="is taken over by a violent rage as a mask forms on their face!")
						src.SpecialBuff.ActiveMessage="dons a mask of dark energy!"
					if(src.SpecialBuff.OffMessage=="violently rips off their mask as it shatters into fragments...")
						src.SpecialBuff.OffMessage="tears off their mask as it shatters into fragments..."
				if(src.SpecialBuff.Mastery==2)
					src.SpecialBuff.Intimidation=1.25
					src.SpecialBuff.BuffTechniques=list("/obj/Skills/Projectile/Beams/Big/Vaizard/Cero")
				if(src.SpecialBuff.Mastery==3)
					src.SpecialBuff.Intimidation=1.5
					src.SpecialBuff.BuffTechniques=list("/obj/Skills/Projectile/Beams/Big/Vaizard/Cero", "/obj/Skills/Buffs/SlotlessBuffs/Regeneration")
				if(src.SpecialBuff.Mastery==4)
					src.SpecialBuff.Intimidation=2
					src.SpecialBuff.BuffTechniques=list("/obj/Skills/Projectile/Beams/Big/Vaizard/Cero", "/obj/Skills/Buffs/SlotlessBuffs/Regeneration")
					//TODO gran rey cero sometime
					//TODO full hollow mode sometime too
					if(src.Maimed>0)//regen happens automagically because regeneration wouldnt be in mob's contents yet
						src.Maimed--
						OMsg(src, "[src] regrows a maiming at the pleasure of their inner passenger!")
				if(!src.VaizardType)
					src.VaizardType=pick(list("Berserker", "Manipulator", "Hellion", "Phantasm"))
				if(!src.VaizardIcon)
					src.GetVaizardIcon()
				for(var/obj/Skills/Buffs/SpecialBuffs/Cursed/Vaizard_Mask/vm in src.Buffs)
					vm.IconLock=src.VaizardIcon
					vm.LockX=0
					vm.LockY=0
					switch(src.VaizardType)
						if("Berserker")
							vm.StrMult=1.5
							vm.OffMult=1.5
						if("Manipulator")
							vm.ForMult=1.5
							vm.OffMult=1.5
						if("Hellion")
							vm.StrMult=1.25
							vm.ForMult=1.25
							vm.DefMult=1.5
						if("Phantasm")
							vm.EndMult=1.5
							vm.DefMult=1.5

			if(src.SpecialBuff.BuffName=="One Hundred Percent Power")
				src.SpecialBuff.IconReplace=1
				src.SpecialBuff.icon=src.Form4Base
			if(src.SpecialBuff.BuffName=="Fifth Form")
				src.SpecialBuff.IconReplace=1
				src.SpecialBuff.icon=src.Form4Base

			src.Power_Multiplier+=(src.SpecialBuff.PowerMult-1)
			src.StrMultTotal+=(src.SpecialBuff.StrMult-1)
			src.EndMultTotal+=(src.SpecialBuff.EndMult-1)
			src.SpdMultTotal+=(src.SpecialBuff.SpdMult-1)
			src.ForMultTotal+=(src.SpecialBuff.ForMult-1)
			src.OffMultTotal+=(src.SpecialBuff.OffMult-1)
			src.DefMultTotal+=(src.SpecialBuff.DefMult-1)
			src.RecovMultTotal+=(src.SpecialBuff.RecovMult-1)
			src.AllSkillsAdd(src.SpecialBuff)

		RemoveSpecialBuff()

			src.Power_Multiplier-=(src.SpecialBuff.PowerMult-1)
			src.StrMultTotal-=(src.SpecialBuff.StrMult-1)
			src.EndMultTotal-=(src.SpecialBuff.EndMult-1)
			src.SpdMultTotal-=(src.SpecialBuff.SpdMult-1)
			src.ForMultTotal-=(src.SpecialBuff.ForMult-1)
			src.OffMultTotal-=(src.SpecialBuff.OffMult-1)
			src.DefMultTotal-=(src.SpecialBuff.DefMult-1)
			src.RecovMultTotal-=(src.SpecialBuff.RecovMult-1)
			if(src.ActiveBuff)
				if(src.ActiveBuff.SBuffNeeded)
					if(src.ActiveBuff.SBuffNeeded==src.SpecialBuff.BuffName)
						src.ActiveBuff.Trigger(src, Override=1)
			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
				if(sb.SBuffNeeded)
					if(sb.SBuffNeeded==src.SpecialBuff.BuffName)
						sb.Trigger(src, Override=1)
			if(src.StanceBuff)
				if(src.StanceBuff.SBuffNeeded)
					if(src.StanceBuff.SBuffNeeded==src.SpecialBuff.BuffName)
						src.StanceBuff.Trigger(src, Override=1)
			if(src.StyleBuff)
				if(src.StyleBuff.SBuffNeeded)
					if(src.StyleBuff.SBuffNeeded==src.SpecialBuff.BuffName)
						src.StyleBuff.Trigger(src, Override=1)
			src.AllSkillsRemove(src.SpecialBuff)

			if(src.SpecialBuff.BuffName=="Vaizard Mask")
				src.SpecialBuff.Cooldown = max(20, round(60 * (1/max(1,min(20,max(1,VaizardHealth)))), 1))
				ForceCancelBeam()

			var/list/Gold=list("Aries Cloth", "Taurus Cloth", "Gemini Cloth", "Cancer Cloth", "Leo Cloth", "Virgo Cloth", "Libra Cloth", "Scorpio Cloth", "Sagittarius Cloth", "Capricorn Cloth", "Aquarius Cloth", "Pisces Cloth")
			if(src.SpecialBuff.BuffName in Gold)
				if(src.SpecialBuff.BuffName!="[src.ClothGold] Cloth")
					for(var/obj/Items/Symbiotic/Saint_Cloth/Gold_Cloth/GC in src)
						if(GC.suffix)
							src.SpecialBuff=null
							GC.ObjectUse(src)
							GC.loc=locate(GC.ReturnX,GC.ReturnY,GC.ReturnZ)
							OMsg(src, "[src] isn't aligned with [GC] so it abandons them!")
							KenShockwave(src, icon='KenShockwaveGold.dmi', Size=1, Blend=2, Time=3)
							src.LoseEnergy(100)
							src.GainFatigue(30)
					if(src.HasKiControl())
						src.Auraz("Add")
				else if(src.SagaLevel<7||src.Saga!="Cosmo")
					for(var/obj/Items/Symbiotic/Saint_Cloth/Gold_Cloth/GC in src)
						if(GC.suffix)
							src.SpecialBuff=null
							GC.ObjectUse(src)
							GC.loc=locate(GC.ReturnX,GC.ReturnY,GC.ReturnZ)
							OMsg(src, "[src] isn't powerful enough to control the [GC] so it abandons them!")
							KenShockwave(src, icon='KenShockwaveGold.dmi', Size=1, Blend=2, Time=3)
					if(src.HasKiControl())
						src.Auraz("Add")

			src.SpecialBuff=null

		AddSlotlessBuff(var/obj/Skills/Buffs/B)

			if(B.BuffName=="Regeneration")
				if(src.HellPower)
					B.RegenerateLimbs=1
			if(B.BuffName=="Symbiote Infection")
				if(B.PowerReplacement)
					B.PowerReplacement=0//anti god tier

			src.Power_Multiplier+=(B.PowerMult-1)
			src.StrMultTotal+=(B.StrMult-1)
			src.EndMultTotal+=(B.EndMult-1)
			src.SpdMultTotal+=(B.SpdMult-1)
			src.ForMultTotal+=(B.ForMult-1)
			src.OffMultTotal+=(B.OffMult-1)
			src.DefMultTotal+=(B.DefMult-1)
			src.RecovMultTotal+=(B.RecovMult-1)
			B.SlotlessOn=1
			src.SlotlessBuffs.Add(B)
			src.AllSkillsAdd(B)

		RemoveSlotlessBuff(var/obj/Skills/Buffs/B)

			src.Power_Multiplier-=(B.PowerMult-1)
			src.StrMultTotal-=(B.StrMult-1)
			src.EndMultTotal-=(B.EndMult-1)
			src.SpdMultTotal-=(B.SpdMult-1)
			src.ForMultTotal-=(B.ForMult-1)
			src.OffMultTotal-=(B.OffMult-1)
			src.DefMultTotal-=(B.DefMult-1)
			src.RecovMultTotal-=(B.RecovMult-1)
			B.SlotlessOn=0
			src.SlotlessBuffs.Remove(B)
			src.AllSkillsRemove(B)


		AllSkillsAdd(var/obj/Skills/Buffs/B)

			if(B.Transform)
				src.Transforming=1
				if(B.Transform=="Force")
					src.ssj["unlocked"]=min(src.ssj["unlocked"]+1,4)
					src.trans["unlocked"]=min(src.trans["unlocked"]+1,4)
					src.Transform()
				else if(B.Transform=="Strong")
					src.Intimidation*=1.5
				else if(B.Transform=="Weak")
					src.PowerBoost*=0.25
				else
					src.Transform(B.Transform)
				src.Transforming=0

			if(B.ClientTint)
				src.appearance_flags+=16

			if(B.FlashChange)
				animate(src, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
			if(B.DarkChange)
				animate(src, color = list(0,0,0, 0,0,0, 0,0,0, 0,0,0))

			if(B.StrReplace)
				src.StrReplace=B.StrReplace
			if(B.EndReplace)
				src.EndReplace=B.EndReplace
			if(B.ForReplace)
				src.ForReplace=B.ForReplace
			if(B.SpdReplace)
				src.SpdReplace=B.SpdReplace
			if(B.RecovReplace)
				src.RecovReplace=B.RecovReplace


			if(B.StripEquip)
				if(B.AssociatedGear)
					src.overlays-=image(B.AssociatedGear.icon, pixel_x=B.AssociatedGear.pixel_x, pixel_y=B.AssociatedGear.pixel_y, layer=FLOAT_LAYER-3)
				if(B.AssociatedLegend)
					src.overlays-=image(B.AssociatedLegend.icon, pixel_x=B.AssociatedLegend.pixel_x, pixel_y=B.AssociatedLegend.pixel_y, layer=FLOAT_LAYER-3)
			if(B.Earthshaking)
				src.Quake(B.Earthshaking)
			if(B.StanceActive)
				src.StanceActive=B.StanceActive
			if(B.StyleActive)
				src.StyleActive=B.StyleActive

			if(B.TurfShift)
				if(!B.TurfShiftLayer)
					B.TurfShiftLayer=MOB_LAYER-0.5
				for(var/turf/t in Turf_Circle(src, 6))
					sleep(-1)
					TurfShift(B.TurfShift, t, 30+(B.CastingTime*30), src, B.TurfShiftLayer)

			if(B.TargetOverlay)
				var/image/im=image(icon=B.TargetOverlay, pixel_x=B.TargetOverlayX, pixel_y=B.TargetOverlayY)
				im.blend_mode=B.IconLockBlend
				im.transform*=B.OverlaySize
				if(B.OverlaySize>=2)
					im.appearance_flags+=512
				src.Target.overlays+=im

			if(B.CastingTime)
				src.Frozen=2
				src.OMessage(15,"<font color=red>[src] focuses their power!","Skill Cast: [B.BuffName].")
				sleep(10*B.CastingTime)
				src.Frozen=0
				if(B.Range)//This one doesn't apply to rushes.
					if(!src.Target)
						src << "You need a target to use this skill!"
						B.Trigger(usr, Override=1)
						return
					if(B.ForcedRange)
						if(get_dist(src,src.Target)!=B.Range)
							src << "They're not in range!"
							B.Trigger(usr, Override=1)
							return
					else
						if(get_dist(src,src.Target)>B.Range||src.z!=src.Target.z)
							src << "They've moved out of range!"
							B.Trigger(usr, Override=1)
							return

			if(B.IconTransform)
				var/image/T=image(B.IconTransform, pixel_x=B.TransformX, pixel_y=B.TransformY, loc = src)
				T.appearance_flags=68
				world << T
				spawn()
					animate(T, alpha=0)
					animate(T, alpha=255, time=3)
				spawn()
					animate(src, alpha=0, time=3)
				spawn(3)
					B.icon=src.icon
					B.pixel_x=src.pixel_x
					B.pixel_y=src.pixel_y
					src.Transformed=1
					src.AppearanceOff()
					src.icon=B.IconTransform
					src.pixel_x=B.TransformX
					src.pixel_y=B.TransformY
					src.alpha=255
					del T
				sleep(3)

			if(B.Fusion)
				if(B.Fusion=="Dance")
					var/mob/Players/Fuse=new/mob/Players
					var/Failed=0
					var/Mastery=B.Mastery
					var/MasterySpecial=max(Mastery-3,0)

					src.BuffingUp=0

					if(prob(B.FusionFailure))
						Failed=1

					for(var/x in src.SlotlessBuffs)
						if(istype(x, /obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance))
							x:Trigger(src, Override=1)//turn off here

					src.Fused=1
					src.Target.Fused=2
					src.Target.Fusee=src.ckey
					src.Fusee=src.Target.ckey
					Fuse.FusionCKey1="[src.ckey]"
					Fuse.FusionCKey2="[src.Target.ckey]"

					src.client.SaveChar()
					src.Target.client.SaveChar()

					Fuse.Race=src.Race
					Fuse.Class="Dance"
					if(!src.Name_Fusion||src.Name_Fusion!=src.Target.Name_Fusion)
						Fuse.name="???"
					else
						Fuse.name=src.Name_Fusion
					if(!src.Profile_Fusion||src.Profile_Fusion!=src.Target.Profile_Fusion)
						Fuse.Profile=null
					else
						Fuse.Profile=src.Profile_Fusion
					Fuse.Text_Color=src.Text_Color
					src.Target.name=Fuse.name
					src.Target.Text_Color=Fuse.Text_Color

					if(!Failed)
						if(!src.Icon_Fusion||src.Icon_Fusion!=src.Target.Icon_Fusion)
							Fuse.icon=src.icon
						else
							Fuse.icon=src.Icon_Fusion
					else
						if(!src.Icon_FusionFat||src.Icon_FusionFat!=src.Target.Icon_FusionFat)
							Fuse.icon=src.icon
							Fuse.transform=matrix(0.7, 0, 0, 0, 1, 0)
						else
							Fuse.icon=src.Icon_FusionFat

					SCLForm_1=src.SCLForm_1
					SCLForm_2=src.SCLForm_2
					SCLForm_3=src.SCLForm_3
					SCLForm_4=src.SCLForm_4
					SCLForm_5=src.SCLForm_5
					SCLForm_6=src.SCLForm_6

					if(!src.Hair_Fusion||src.Hair_Fusion!=src.Target.Hair_Fusion)
						Fuse.Hair_Base=src.Target.Hair_Base
						Fuse.Hair_Color=src.Hair_Color
						Fuse.Hair_Forms()
					else
						Fuse.Hair_Base=src.Hair_Fusion
						Fuse.Hair_SSJ1=src.Hair_Fusion_SSJ1
						Fuse.Hair_FPSSJ1=src.Hair_Fusion_FPSSJ1
						Fuse.Hair_SSJ2=src.Hair_Fusion_SSJ2
						Fuse.Hair_SSJ3=src.Hair_Fusion_SSJ3
						Fuse.Hair_SSJGod=src.Hair_Fusion_SSJGod
						Fuse.Hair_SSJBlue=src.Hair_Fusion_SSJBlue
						Fuse.Hair_SSJ4=src.Hair_Fusion_SSJ4
						Fuse.Hair_HT=src.Hair_Fusion_HT
						Fuse.SuperDemonHair=src.SuperDemonHair_Fusion
						Fuse.SuperDemonHair2=src.SuperDemonHair2_Fusion
						Fuse.KingofBravesHair=src.KingofBravesHair_Fusion

					Fuse.EyesSSJ='EyesSSJ.dmi'
					Fuse.EyesSSJ3='EyesSSJ3.dmi'
					Fuse.EyesSSJ4='EyesSSJ4.dmi'
					Fuse.FurSSJ4='Overlay SSJ4 Fusion.dmi'
					Fuse.ClothingSSJ4='Fusion Vest.dmi'
					Fuse.TailSSJ4='Tail SSJ4 Fusion.dmi'
					Fuse.EyesSSG='EyesSSG.dmi'
					Fuse.EyesSSB='EyesSSB.dmi'
					Fuse.EyesUI='EyesUI.dmi'
					animate(Fuse, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))

					spawn()
						FusionEffect(src, src.Target)

					sleep(15)

					Fuse.Base=WorldBaseAmount
					Fuse.potential_power_mult=((src.potential_power_mult*src.RPPower) + (src.Target.potential_power_mult*src.Target.RPPower))

					if(src.StrAscension>src.Target.StrAscension)
						Fuse.StrAscension=src.StrAscension
					else
						Fuse.StrAscension=src.Target.StrAscension

					if(src.EndAscension>src.Target.EndAscension)
						Fuse.EndAscension=src.EndAscension
					else
						Fuse.EndAscension=src.Target.EndAscension

					if(src.SpdAscension>src.Target.SpdAscension)
						Fuse.SpdAscension=src.SpdAscension
					else
						Fuse.SpdAscension=src.Target.SpdAscension

					if(src.ForAscension>src.Target.ForAscension)
						Fuse.ForAscension=src.ForAscension
					else
						Fuse.ForAscension=src.Target.ForAscension

					if(src.OffAscension>src.Target.OffAscension)
						Fuse.OffAscension=src.OffAscension
					else
						Fuse.OffAscension=src.Target.OffAscension

					if(src.DefAscension>src.Target.DefAscension)
						Fuse.DefAscension=src.DefAscension
					else
						Fuse.DefAscension=src.Target.DefAscension

					if(src.RecovAscension>src.Target.RecovAscension)
						Fuse.RecovAscension=src.RecovAscension
					else
						Fuse.RecovAscension=src.Target.RecovAscension

					if(src.StrMod>src.Target.StrMod)
						Fuse.StrMod=src.StrMod
					else
						Fuse.StrMod=src.Target.StrMod

					if(src.EndMod>src.Target.EndMod)
						Fuse.EndMod=src.EndMod
					else
						Fuse.EndMod=src.Target.EndMod

					if(src.SpdMod>src.Target.SpdMod)
						Fuse.SpdMod=src.SpdMod
					else
						Fuse.SpdMod=src.Target.SpdMod

					if(src.ForMod>src.Target.ForMod)
						Fuse.ForMod=src.ForMod
					else
						Fuse.ForMod=src.Target.ForMod

					if(src.OffMod>src.Target.OffMod)
						Fuse.OffMod=src.OffMod
					else
						Fuse.OffMod=src.Target.OffMod

					if(src.DefMod>src.Target.DefMod)
						Fuse.DefMod=src.DefMod
					else
						Fuse.DefMod=src.Target.DefMod

					if(src.RecovMod>src.Target.RecovMod)
						Fuse.RecovMod=src.RecovMod
					else
						Fuse.RecovMod=src.Target.RecovMod

					if(src.AngerMax>src.Target.AngerMax)
						Fuse.AngerMax=src.AngerMax
					else
						Fuse.AngerMax=src.Target.AngerMax

					if(src.PureDamage>src.Target.PureDamage)
						Fuse.PureDamage=src.PureDamage
					else
						Fuse.PureDamage=src.Target.PureDamage

					if(src.PureReduction>src.Target.PureReduction)
						Fuse.PureReduction=src.PureReduction
					else
						Fuse.PureReduction=src.Target.PureReduction

					if(src.Judgment||src.Target.Judgment)
						Fuse.Judgment=1

					if(src.Adaptation||src.Target.Adaptation)
						Fuse.Adaptation=1

					if(src.Defiance||src.Target.Defiance)
						Fuse.Defiance=1

					if(src.Attunement=="Fire"&&!src.Target.Attunement)
						Fuse.Attunement="Fire"
					if(src.Target.Attunement=="Fire"&&!src.Attunement)
						Fuse.Attunement="Fire"

					if(src.Attunement=="Water"&&!src.Target.Attunement)
						Fuse.Attunement="Water"
					if(src.Target.Attunement=="Water"&&!src.Attunement)
						Fuse.Attunement="Water"

					if(src.Attunement=="Earth"&&!src.Target.Attunement)
						Fuse.Attunement="Earth"
					if(src.Target.Attunement=="Earth"&&!src.Attunement)
						Fuse.Attunement="Earth"

					if(src.Attunement=="Wind"&&!src.Target.Attunement)
						Fuse.Attunement="Wind"
					if(src.Target.Attunement=="Wind"&&!src.Attunement)
						Fuse.Attunement="Wind"

					if(src.Hustle||src.Target.Hustle)
						Fuse.Hustle=1

					if(src.Infusion||src.Target.Infusion)
						Fuse.Infusion=1

					if(src.Flicker)
						Fuse.Flicker+=src.Flicker
					if(src.Target.Flicker)
						Fuse.Flicker+=src.Target.Flicker
					Fuse.Flicker+=round(B.Mastery/2)

					if(src.Adrenaline||src.Target.Adrenaline)
						Fuse.Adrenaline=1

					if(src.EnhancedHearing||src.Target.EnhancedHearing)
						Fuse.EnhancedHearing=1
					if(src.EnhancedSmell||src.Target.EnhancedSmell)
						Fuse.EnhancedSmell=1
					if(src.see_invisible>=71||src.Target.see_invisible>=71)
						Fuse.see_invisible=71

					if(src.Fishman||src.Target.Fishman)
						Fuse.Fishman=1

					if(src.VenomResistance)
						Fuse.VenomResistance+=src.VenomResistance
					if(src.Target.VenomResistance)
						Fuse.VenomResistance+=src.Target.VenomResistance

					if(src.VenomBlood||src.Target.VenomBlood)
						Fuse.VenomBlood=1

					if(src.VenomImmune||src.Target.VenomImmune)
						Fuse.VenomImmune=1

					if(src.Godspeed)
						Fuse.Godspeed+=src.Godspeed
					if(src.Target.Godspeed)
						Fuse.Godspeed+=src.Target.Godspeed
					Fuse.Godspeed+=round(B.Mastery/2)

					if(src.HiddenAnger||src.Target.HiddenAnger)
						Fuse.HiddenAnger=1

					if(src.HasVoid()||src.Target.HasVoid())
						Fuse.Void=1

					if(src.StaticWalk||src.Target.StaticWalk)
						Fuse.StaticWalk=1

					if(src.SpaceWalk||src.Target.SpaceWalk)
						Fuse.SpaceWalk=1

					if(src.KiControlMastery)
						Fuse.KiControlMastery+=src.KiControlMastery
					if(src.Target.KiControlMastery)
						Fuse.KiControlMastery+=src.Target.KiControlMastery
					Fuse.KiControlMastery+=round(B.Mastery/2)

					if(src.Restoration||src.Target.Restoration)
						Fuse.Restoration=1

					if(src.WalkThroughHell||src.Target.WalkThroughHell)
						Fuse.WalkThroughHell=1

					if(src.WaterWalk||src.Target.WaterWalk)
						Fuse.WaterWalk=1

					if(src.AbyssMod)
						Fuse.AbyssMod+=src.AbyssMod
					if(src.Target.AbyssMod)
						Fuse.AbyssMod+=src.Target.AbyssMod

					if(src.FluidForm)
						Fuse.FluidForm+=src.FluidForm
					if(src.Target.FluidForm)
						Fuse.FluidForm+=src.Target.FluidForm

					if(src.DebuffImmune>0||src.Target.DebuffImmune>0)
						Fuse.DebuffImmune=1
					if(src.DebuffImmune>=2||src.Target.DebuffImmune>=2)
						Fuse.DebuffImmune=2

					if(src.AngerPoint!=25||src.Target.AngerPoint!=25)
						if(Fuse.Race!="Changeling")//if not changeling
							if(src.AngerPoint>src.Target.AngerPoint)//Pick higher anger
								Fuse.AngerPoint=src.AngerPoint
							else
								Fuse.AngerPoint=src.Target.AngerPoint
						else//if they are changeling
							if(src.AngerPoint<src.Target.AngerPoint)//pick the lower
								Fuse.AngerPoint=src.AngerPoint
							else
								Fuse.AngerPoint=src.Target.AngerPoint

					if(src.CalmAnger||src.Target.CalmAnger)
						Fuse.CalmAnger=1

					if(src.Hardening)
						Fuse.Hardening+=src.Hardening
					if(src.Target.Hardening)
						Fuse.Hardening+=src.Target.Hardening

					if(src.InjuryImmune||src.Target.InjuryImmune)
						Fuse.InjuryImmune=1
					if(src.FatigueImmune||src.Target.FatigueImmune)
						Fuse.FatigueImmune=1

					if(src.LegendaryPower||src.Target.LegendaryPower)
						Fuse.LegendaryPower=1
					if(src.SpiritPower||src.Target.SpiritPower)
						Fuse.SpiritPower=1
					if(src.HellPower||src.Target.HellPower)
						Fuse.HellPower=1

					if(src.BioArmorMax>0||src.Target.BioArmorMax>0)
						if(src.BioArmorMax>src.Target.BioArmorMax)
							Fuse.BioArmorMax=src.BioArmorMax
						else
							Fuse.BioArmorMax=src.Target.BioArmorMax

					if(src.Intimidation>src.Target.Intimidation)
						Fuse.Intimidation=src.Intimidation
					else
						Fuse.Intimidation=src.Target.Intimidation

					if(src.Desperation>src.Target.Desperation)
						Fuse.Desperation=src.Desperation
					else
						Fuse.Desperation=src.Target.Desperation

					if(src.PowerBoost)
						Fuse.PowerBoost=1+(src.PowerBoost-1)
					if(src.Target.PowerBoost)
						Fuse.PowerBoost+=(src.Target.PowerBoost-1)

					if(src.AscensionsAcquired>src.Target.AscensionsAcquired)
						Fuse.AscensionsAcquired=src.AscensionsAcquired
					else
						Fuse.AscensionsAcquired=src.Target.AscensionsAcquired

					if(Fuse.Race!="Saiyan"&&Fuse.Race!="Half Saiyan")
						Fuse.trans["unlocked"]=min((src.trans["unlocked"]+src.Target.trans["unlocked"]),Mastery)
						if(MasterySpecial)
							Fuse.trans["unlocked"]=min(Fuse.trans["unlocked"]+1,4)
					else
						Fuse.ssj["unlocked"]=min((src.ssj["unlocked"]+src.Target.ssj["unlocked"]),Mastery)
						if(MasterySpecial)
							Fuse.ssj["unlocked"]=min(Fuse.ssj["unlocked"]+1,3)
						if(src.ssj["unlocked"]==4&&src.Target.ssj["unlocked"]==4)
							Fuse.SSJ4Unlocked=1
							Fuse.ssj["unlocked"]=4
					Fuse.masteries["1mastery"]=100
					Fuse.masteries["2mastery"]=100
					Fuse.masteries["3mastery"]=100
					Fuse.masteries["4mastery"]=100
					Fuse.SetVars()

					if(src.Tail||src.Target.Tail)
						Fuse.Tail=1

					if(!locate(/obj/Communication,Fuse.contents))
						Fuse.contents+=new/obj/Communication
					if(!locate(/obj/Skills/Meditate,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Meditate)
					if(!locate(/obj/Skills/Queue/Heavy_Strike,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Queue/Heavy_Strike)
						Fuse.AddSkill(new/obj/Skills/Reverse_Dash)
					if(!locate(/obj/Skills/Grapple/Toss,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Aerial_Recovery)
						Fuse.AddSkill(new/obj/Skills/Grapple/Toss)
					if(!locate(/obj/Skills/Dragon_Dash,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Dragon_Dash)
						Fuse.AddSkill(new/obj/Skills/Aerial_Payback)
						Fuse.AddSkill(new/obj/Skills/Target_Switch)
						Fuse.AddSkill(new/obj/Skills/Target_Clear)
					if(!locate(/obj/Skills/Buffs/Stances/Stance_Selector, Fuse))
						Fuse.AddSkill(new/obj/Skills/Buffs/Stances/Stance_Selector)
					if(!locate(/obj/Skills/Buffs/Styles/Style_Selector, Fuse))
						Fuse.AddSkill(new/obj/Skills/Buffs/Styles/Style_Selector)
					var/list/DenyVars=list("client", "key", "loc", "x", "y", "z", "type", "locs", "parent_type", "verbs", "vars", "contents", "Transform", "appearance")
					for(var/obj/Skills/s in src)
						if(s.AssociatedGear)
							continue
						if(s.AssociatedLegend)
							continue
						if(!locate(s, Fuse))
							var/obj/Skills/NewS=new s.type
							for(var/x in s.vars)
								if(x in DenyVars)
									continue
								NewS.vars[x]=s.vars[x]
							Fuse.AddSkill(NewS)
					for(var/obj/Skills/s in src.Target)
						if(s.AssociatedGear)
							continue
						if(s.AssociatedLegend)
							continue
						if(!locate(s, Fuse))
							var/obj/Skills/NewS=new s.type
							for(var/x in s.vars)
								if(x in DenyVars)
									continue
								NewS.vars[x]=s.vars[x]
							Fuse.AddSkill(NewS)

					//fusion special skills

					//Galic Kamehameha
					if(locate(/obj/Skills/Projectile/Beams/Kamehameha, Fuse)&&locate(/obj/Skills/Projectile/Beams/Galic_Gun, Fuse))
						Fuse << "You unlock the fusion of Kamehameha and Galic Gun: Galic Kamehameha!!"
						Fuse.AddSkill(new/obj/Skills/Projectile/Beams/Galic_Kamehameha)

					//Big Bang Kamehameha
					if(locate(/obj/Skills/Projectile/Beams/Big/Super_Kamehameha, Fuse)&&locate(/obj/Skills/Projectile/Big_Bang_Attack, Fuse))
						Fuse << "You unlock the fusion of Super Kamehameha and Big Bang Attack: Big Bang Kamehameha!!"
						Fuse.AddSkill(new/obj/Skills/Projectile/Beams/Big/Big_Bang_Kamehameha)

					//Final Kamehameha
					if(locate(/obj/Skills/Projectile/Beams/Big/Super_Kamehameha, Fuse)&&locate(/obj/Skills/Projectile/Beams/Big/Final_Flash, Fuse))
						Fuse << "You unlock the fusion of Super Kamehameha and Final Flash: Final Kamehameha!!"
						Fuse.AddSkill(new/obj/Skills/Projectile/Beams/Big/Final_Kamehameha)


					for(var/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance/fd in Fuse)
						del fd

					src.Savable=0//Remember the last location
					src.Target.Savable=0//But not the fusion void.

					Fuse.loc=locate((src.x-((src.x-src.Target.x)/2)),(src.y-((src.y-src.Target.y)/2)), src.z)
					src.client.eye=Fuse
					src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
					src.Target.client.eye=Fuse
					src.Target.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
					src.Target.Observing=2
					Fuse.BeingObserved.Add(src.Target)
					src.loc=locate(1,1,1)
					src.Stasis=RawMinutes(31)
					src.Target.loc=locate(1,1,1)
					src.Target.Stasis=RawMinutes(31)

					Fuse.overlays+=image(B.IconLock, pixel_x=B.LockX, pixel_y=B.LockY, layer=FLOAT_LAYER-B.IconLayer)
					if(Fuse.Tail)
						Fuse.contents+=new/obj/Oozaru
						Fuse.Tail(1)
					Fuse.Hairz("Add")
					Fuse.overlays+=image(B.TopOverlayLock, pixel_x=B.TopOverlayX, pixel_y=B.TopOverlayY, layer=FLOAT_LAYER-1)
					animate(Fuse, color = null, time=10)


					for(var/mob/Players/T in oview(31, Fuse))
						animate(T.client, color=list(1,0,0, 0,1,0, 0,0,1, 0.4,0.4,0.4), time = 5)
						spawn(5)
							animate(T.client, color=null, time = 5)
					var/ShockSize=5
					for(var/wav=5, wav>0, wav--)
						KenShockwave(Fuse, icon='KenShockwaveDivine.dmi', Size=ShockSize, Blend=2, Time=24)
						ShockSize/=2
					sleep(5)

					if(Failed)
						Fuse.RPPower*=0.2
						OMsg(Fuse, "[src] messed up their attempt of fusing with [src.Target]!")
					Fuse.FusionTimer=RawMinutes(30)
					src.client.mob=Fuse

				else if(B.Fusion=="Potara")
					var/mob/Players/Fuse=new/mob/Players

					src.BuffingUp=0

					for(var/x in src.SlotlessBuffs)
						if(istype(x, /obj/Skills/Buffs/SlotlessBuffs/Divine_Fusion))
							x:Trigger(src, Override=1)//turn off here

					src.Fused=1
					src.Target.Fused=2
					src.Fusee=src.Target.ckey
					src.Target.Fusee=src.ckey
					Fuse.FusionCKey1="[src.ckey]"
					Fuse.FusionCKey2="[src.Target.ckey]"

					src.client.SaveChar()
					src.Target.client.SaveChar()

					Fuse.Race=src.Race
					Fuse.Class="Potara"
					if(!src.Name_Fusion||src.Name_Fusion!=src.Target.Name_Fusion)
						Fuse.name="???"
					else
						Fuse.name=src.Name_Fusion
					if(!src.Profile_Fusion||src.Profile_Fusion!=src.Target.Profile_Fusion)
						Fuse.Profile=null
					else
						Fuse.Profile=src.Profile_Fusion
					Fuse.Text_Color=src.Text_Color
					src.Target.name=Fuse.name
					src.Target.Text_Color=Fuse.Text_Color

					if(!src.Icon_Fusion||src.Icon_Fusion!=src.Target.Icon_Fusion)
						Fuse.icon=src.icon
					else
						Fuse.icon=src.Icon_Fusion

					SCLForm_1=src.SCLForm_1
					SCLForm_2=src.SCLForm_2
					SCLForm_3=src.SCLForm_3
					SCLForm_4=src.SCLForm_4
					SCLForm_5=src.SCLForm_5
					SCLForm_6=src.SCLForm_6

					if(!src.Hair_Fusion||src.Hair_Fusion!=src.Target.Hair_Fusion)
						Fuse.Hair_Base=src.Hair_Base
						Fuse.Hair_Color=src.Target.Hair_Color
						Fuse.Hair_Forms()
					else
						Fuse.Hair_Base=src.Hair_Fusion
						Fuse.Hair_SSJ1=src.Hair_Fusion_SSJ1
						Fuse.Hair_FPSSJ1=src.Hair_Fusion_FPSSJ1
						Fuse.Hair_SSJ2=src.Hair_Fusion_SSJ2
						Fuse.Hair_SSJ3=src.Hair_Fusion_SSJ3
						Fuse.Hair_SSJGod=src.Hair_Fusion_SSJGod
						Fuse.Hair_SSJBlue=src.Hair_Fusion_SSJBlue
						Fuse.Hair_SSJ4=src.Hair_Fusion_SSJ4
						Fuse.Hair_HT=src.Hair_Fusion_HT
						Fuse.SuperDemonHair=src.SuperDemonHair_Fusion
						Fuse.SuperDemonHair2=src.SuperDemonHair2_Fusion
						Fuse.KingofBravesHair=src.KingofBravesHair_Fusion

					Fuse.EyesSSJ='EyesSSJ.dmi'
					Fuse.EyesSSJ3='EyesSSJ3.dmi'
					Fuse.EyesSSJ4='EyesSSJ4.dmi'
					Fuse.FurSSJ4='Overlay SSJ4 Fusion.dmi'
					Fuse.ClothingSSJ4='Fusion Vest.dmi'
					Fuse.TailSSJ4='Tail SSJ4 Fusion.dmi'
					Fuse.EyesSSG='EyesSSG.dmi'
					Fuse.EyesSSB='EyesSSB.dmi'
					Fuse.EyesUI='EyesUI.dmi'
					animate(Fuse, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))

					spawn()
						FusionEffect(src, src.Target)

					sleep(15)

					Fuse.Base=(src.Base+src.Target.Base)
					if(Fuse.Base<=(WorldBaseAmount*2))
						Fuse.Base=(WorldBaseAmount*2)
					Fuse.RPPower=(src.RPPower+src.Target.RPPower)/2
					Fuse.Potential=min(src.Potential, src.Target.Potential)+15
					Fuse.PotentialCap=Fuse.Potential

					if(src.StrAscension>src.Target.StrAscension)
						Fuse.StrAscension=src.StrAscension
					else
						Fuse.StrAscension=src.Target.StrAscension

					if(src.EndAscension>src.Target.EndAscension)
						Fuse.EndAscension=src.EndAscension
					else
						Fuse.EndAscension=src.Target.EndAscension

					if(src.SpdAscension>src.Target.SpdAscension)
						Fuse.SpdAscension=src.SpdAscension
					else
						Fuse.SpdAscension=src.Target.SpdAscension

					if(src.ForAscension>src.Target.ForAscension)
						Fuse.ForAscension=src.ForAscension
					else
						Fuse.ForAscension=src.Target.ForAscension

					if(src.OffAscension>src.Target.OffAscension)
						Fuse.OffAscension=src.OffAscension
					else
						Fuse.OffAscension=src.Target.OffAscension

					if(src.DefAscension>src.Target.DefAscension)
						Fuse.DefAscension=src.DefAscension
					else
						Fuse.DefAscension=src.Target.DefAscension

					if(src.RecovAscension>src.Target.RecovAscension)
						Fuse.RecovAscension=src.RecovAscension
					else
						Fuse.RecovAscension=src.Target.RecovAscension

					if(src.StrMod>src.Target.StrMod)
						Fuse.StrMod=src.StrMod
					else
						Fuse.StrMod=src.Target.StrMod

					if(src.EndMod>src.Target.EndMod)
						Fuse.EndMod=src.EndMod
					else
						Fuse.EndMod=src.Target.EndMod

					if(src.SpdMod>src.Target.SpdMod)
						Fuse.SpdMod=src.SpdMod
					else
						Fuse.SpdMod=src.Target.SpdMod

					if(src.ForMod>src.Target.ForMod)
						Fuse.ForMod=src.ForMod
					else
						Fuse.ForMod=src.Target.ForMod

					if(src.OffMod>src.Target.OffMod)
						Fuse.OffMod=src.OffMod
					else
						Fuse.OffMod=src.Target.OffMod

					if(src.DefMod>src.Target.DefMod)
						Fuse.DefMod=src.DefMod
					else
						Fuse.DefMod=src.Target.DefMod

					if(src.RecovMod>src.Target.RecovMod)
						Fuse.RecovMod=src.RecovMod
					else
						Fuse.RecovMod=src.Target.RecovMod

					if(src.AngerMax>src.Target.AngerMax)
						Fuse.AngerMax=src.AngerMax
					else
						Fuse.AngerMax=src.Target.AngerMax

					if(src.PureDamage>src.Target.PureDamage)
						Fuse.PureDamage=src.PureDamage
					else
						Fuse.PureDamage=src.Target.PureDamage

					if(src.PureReduction>src.Target.PureReduction)
						Fuse.PureReduction=src.PureReduction
					else
						Fuse.PureReduction=src.Target.PureReduction

					if(src.Judgment||src.Target.Judgment)
						Fuse.Judgment=1

					if(src.Adaptation||src.Target.Adaptation)
						Fuse.Adaptation=1

					if(src.Defiance||src.Target.Defiance)
						Fuse.Defiance=1

					if(src.Attunement=="Fire"&&!src.Target.Attunement)
						Fuse.Attunement="Fire"
					if(src.Target.Attunement=="Fire"&&!src.Attunement)
						Fuse.Attunement="Fire"

					if(src.Attunement=="Water"&&!src.Target.Attunement)
						Fuse.Attunement="Water"
					if(src.Target.Attunement=="Water"&&!src.Attunement)
						Fuse.Attunement="Water"

					if(src.Attunement=="Earth"&&!src.Target.Attunement)
						Fuse.Attunement="Earth"
					if(src.Target.Attunement=="Earth"&&!src.Attunement)
						Fuse.Attunement="Earth"

					if(src.Attunement=="Wind"&&!src.Target.Attunement)
						Fuse.Attunement="Wind"
					if(src.Target.Attunement=="Wind"&&!src.Attunement)
						Fuse.Attunement="Wind"

					if(src.Hustle||src.Target.Hustle)
						Fuse.Hustle=1

					if(src.Infusion||src.Target.Infusion)
						Fuse.Infusion=1

					if(src.Flicker)
						Fuse.Flicker+=src.Flicker
					if(src.Target.Flicker)
						Fuse.Flicker+=src.Target.Flicker
					Fuse.Flicker+=2

					if(src.Adrenaline||src.Target.Adrenaline)
						Fuse.Adrenaline=1

					if(src.EnhancedHearing||src.Target.EnhancedHearing)
						Fuse.EnhancedHearing=1
					if(src.EnhancedSmell||src.Target.EnhancedSmell)
						Fuse.EnhancedSmell=1
					if(src.see_invisible>=71||src.Target.see_invisible>=71)
						Fuse.see_invisible=71

					if(src.Fishman||src.Target.Fishman)
						Fuse.Fishman=1

					if(src.VenomResistance)
						Fuse.VenomResistance+=src.VenomResistance
					if(src.Target.VenomResistance)
						Fuse.VenomResistance+=src.Target.VenomResistance

					if(src.VenomBlood||src.Target.VenomBlood)
						Fuse.VenomBlood=1

					if(src.VenomImmune||src.Target.VenomImmune)
						Fuse.VenomImmune=1

					if(src.Godspeed)
						Fuse.Godspeed+=src.Godspeed
					if(src.Target.Godspeed)
						Fuse.Godspeed+=src.Target.Godspeed
					Fuse.Godspeed+=2

					if(src.HiddenAnger||src.Target.HiddenAnger)
						Fuse.HiddenAnger=1

					if(src.HasVoid()||src.Target.HasVoid())
						Fuse.Void=1

					if(src.StaticWalk||src.Target.StaticWalk)
						Fuse.StaticWalk=1

					if(src.SpaceWalk||src.Target.SpaceWalk)
						Fuse.SpaceWalk=1

					if(src.KiControlMastery)
						Fuse.KiControlMastery+=src.KiControlMastery
					if(src.Target.KiControlMastery)
						Fuse.KiControlMastery+=src.Target.KiControlMastery
					Fuse.KiControlMastery+=2

					if(src.Restoration||src.Target.Restoration)
						Fuse.Restoration=1

					if(src.WalkThroughHell||src.Target.WalkThroughHell)
						Fuse.WalkThroughHell=1

					if(src.WaterWalk||src.Target.WaterWalk)
						Fuse.WaterWalk=1

					if(src.AbyssMod)
						Fuse.AbyssMod+=src.AbyssMod
					if(src.Target.AbyssMod)
						Fuse.AbyssMod+=src.Target.AbyssMod

					if(src.FluidForm)
						Fuse.FluidForm+=src.FluidForm
					if(src.Target.FluidForm)
						Fuse.FluidForm+=src.Target.FluidForm

					if(src.DebuffImmune>0||src.Target.DebuffImmune>0)
						Fuse.DebuffImmune=1
					if(src.DebuffImmune>=2||src.Target.DebuffImmune>=2)
						Fuse.DebuffImmune=2

					if(src.AngerPoint!=25||src.Target.AngerPoint!=25)
						if(Fuse.Race!="Changeling")//if not changeling
							if(src.AngerPoint>src.Target.AngerPoint)//Pick higher anger
								Fuse.AngerPoint=src.AngerPoint
							else
								Fuse.AngerPoint=src.Target.AngerPoint
						else//if they are changeling
							if(src.AngerPoint<src.Target.AngerPoint)//pick the lower
								Fuse.AngerPoint=src.AngerPoint
							else
								Fuse.AngerPoint=src.Target.AngerPoint

					if(src.CalmAnger||src.Target.CalmAnger)
						Fuse.CalmAnger=1

					if(src.Hardening)
						Fuse.Hardening+=src.Hardening
					if(src.Target.Hardening)
						Fuse.Hardening+=src.Target.Hardening

					if(src.InjuryImmune||src.Target.InjuryImmune)
						Fuse.InjuryImmune=1
					if(src.FatigueImmune||src.Target.FatigueImmune)
						Fuse.FatigueImmune=1

					if(src.LegendaryPower||src.Target.LegendaryPower)
						Fuse.LegendaryPower=1
					if(src.SpiritPower||src.Target.SpiritPower)
						Fuse.SpiritPower=1
					if(src.HellPower||src.Target.HellPower)
						Fuse.HellPower=1

					if(src.BioArmorMax>0||src.Target.BioArmorMax>0)
						if(src.BioArmorMax>src.Target.BioArmorMax)
							Fuse.BioArmorMax=src.BioArmorMax
						else
							Fuse.BioArmorMax=src.Target.BioArmorMax

					if(src.Intimidation>src.Target.Intimidation)
						Fuse.Intimidation=src.Intimidation
					else
						Fuse.Intimidation=src.Target.Intimidation
					Fuse.Intimidation*=2

					if(src.Desperation>src.Target.Desperation)
						Fuse.Desperation=src.Desperation
					else
						Fuse.Desperation=src.Target.Desperation

					if(src.PowerBoost)
						Fuse.PowerBoost=1+(src.PowerBoost-1)
					if(src.Target.PowerBoost)
						Fuse.PowerBoost+=(src.Target.PowerBoost-1)

					if(src.AscensionsAcquired>src.Target.AscensionsAcquired)
						Fuse.AscensionsAcquired=src.AscensionsAcquired
					else
						Fuse.AscensionsAcquired=src.Target.AscensionsAcquired

					if(Fuse.Race!="Saiyan"&&Fuse.Race!="Half Saiyan")
						Fuse.trans["unlocked"]=min(src.trans["unlocked"],src.Target.trans["unlocked"])
					else
						Fuse.ssj["unlocked"]=min(src.ssj["unlocked"],src.Target.ssj["unlocked"])
						if(src.ssj["unlocked"]==4&&src.Target.ssj["unlocked"]==4)
							Fuse.SSJ4Unlocked=1
							Fuse.ssj["unlocked"]=4
					Fuse.masteries["1mastery"]=100
					Fuse.masteries["2mastery"]=100
					Fuse.masteries["3mastery"]=100
					Fuse.masteries["4mastery"]=100

					Fuse.SetVars()

					if(src.Tail||src.Target.Tail)
						Fuse.Tail=1

					if(!locate(/obj/Communication,Fuse.contents))
						Fuse.contents+=new/obj/Communication
					if(!locate(/obj/Skills/Meditate,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Meditate)
					if(!locate(/obj/Skills/Queue/Heavy_Strike,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Queue/Heavy_Strike)
						Fuse.AddSkill(new/obj/Skills/Reverse_Dash)
					if(!locate(/obj/Skills/Grapple/Toss,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Aerial_Recovery)
						Fuse.AddSkill(new/obj/Skills/Grapple/Toss)
					if(!locate(/obj/Skills/Dragon_Dash,Fuse.contents))
						Fuse.AddSkill(new/obj/Skills/Dragon_Dash)
						Fuse.AddSkill(new/obj/Skills/Aerial_Payback)
						Fuse.AddSkill(new/obj/Skills/Target_Switch)
						Fuse.AddSkill(new/obj/Skills/Target_Clear)
					if(!locate(/obj/Skills/Buffs/Stances/Stance_Selector, Fuse))
						Fuse.AddSkill(new/obj/Skills/Buffs/Stances/Stance_Selector)
					if(!locate(/obj/Skills/Buffs/Styles/Style_Selector, Fuse))
						Fuse.AddSkill(new/obj/Skills/Buffs/Styles/Style_Selector)
					var/list/DenyVars=list("client", "key", "loc", "x", "y", "z", "type", "locs", "parent_type", "verbs", "vars", "contents", "Transform", "appearance")
					for(var/obj/Skills/s in src)
						if(s.AssociatedGear)
							continue
						if(s.AssociatedLegend)
							continue
						if(!locate(s, Fuse))
							var/obj/Skills/NewS=new s.type
							for(var/x in s.vars)
								if(x in DenyVars)
									continue
								NewS.vars[x]=s.vars[x]
							Fuse.AddSkill(NewS)
					for(var/obj/Skills/s in src.Target)
						if(s.AssociatedGear)
							continue
						if(s.AssociatedLegend)
							continue
						if(!locate(s, Fuse))
							var/obj/Skills/NewS=new s.type
							for(var/x in s.vars)
								if(x in DenyVars)
									continue
								NewS.vars[x]=s.vars[x]
							Fuse.AddSkill(NewS)

					//fusion special skills

					//Final Kamehameha
					if(locate(/obj/Skills/Projectile/Beams/Big/Super_Kamehameha, Fuse)&&locate(/obj/Skills/Projectile/Beams/Big/Final_Flash, Fuse))
						Fuse << "You unlock the fusion of Kamehameha and Final Flash: Final Kamehameha!!"
						Fuse.AddSkill(new/obj/Skills/Projectile/Beams/Big/Final_Kamehameha)

					src.Savable=0//Remember the last location
					src.Target.Savable=0//But not the fusion void.

					Fuse.loc=locate((src.x-((src.x-src.Target.x)/2)),(src.y-((src.y-src.Target.y)/2)), src.z)
					src.client.eye=Fuse
					src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
					src.Target.client.eye=Fuse
					src.Target.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
					src.Target.Observing=2
					Fuse.BeingObserved.Add(src.Target)
					src.loc=locate(1,1,1)
					src.Stasis=RawMinutes(61)
					src.Target.loc=locate(1,1,1)
					src.Target.Stasis=RawMinutes(61)

					if(src.Icon_FusionClothes&&(src.Icon_FusionClothes==src.Target.Icon_FusionClothes))
						Fuse.overlays+=image(src.Icon_FusionClothes, pixel_x=src.Icon_FusionClothesX, pixel_y=src.Icon_FusionClothesY, layer=FLOAT_LAYER-B.IconLayer)
					else if(B.IconLock)
						Fuse.overlays+=image(B.IconLock, pixel_x=B.LockX, pixel_y=B.LockY, layer=FLOAT_LAYER-B.IconLayer)
					else
						for(var/obj/Items/Wearables/w in src)
							if(w.SpecialClothing)
								w.AlignEquip(Fuse)
						for(var/obj/Items/Wearables/w in src.Target)
							if(w.SpecialClothing)
								w.AlignEquip(Fuse)
					if(Fuse.Tail)
						Fuse.contents+=new/obj/Oozaru
						Fuse.Tail(1)
					Fuse.Hairz("Add")
					Fuse.overlays+=image(B.TopOverlayLock, pixel_x=B.TopOverlayX, pixel_y=B.TopOverlayY, layer=FLOAT_LAYER-1)
					animate(Fuse, color = null, time=10)

					for(var/mob/Players/T in oview(31, Fuse))
						animate(T.client, color=list(1,0,0, 0,1,0, 0,0,1, 0.4,0.4,0.4), time = 5)
						spawn(5)
							animate(T.client, color=null, time = 5)
					var/ShockSize=5
					for(var/wav=5, wav>0, wav--)
						KenShockwave(Fuse, icon='KenShockwaveDivine.dmi', Size=ShockSize, Blend=2, Time=24)
						ShockSize/=2
					sleep(5)

					Fuse.FusionTimer=RawMinutes(60)
					src.client.mob=Fuse

			if(B.DropOverlays)
				src.AppearanceOff()

			if(B.KenWave)
				var/Wave=B.KenWave
				for(var/wav=Wave, wav>0, wav--)
					KenShockwave(src, icon=B.KenWaveIcon, Size=Wave*B.KenWaveSize, PixelX=B.KenWaveX, PixelY=B.KenWaveY, Blend=B.KenWaveBlend, Time=B.KenWaveTime)
					Wave/=2

			if(B.KKTWave)
				var/Wave=B.KKTWave
				for(var/wav=Wave, wav>0, wav--)
					KKTShockwave(src, icon=B.KKTWaveIcon, Size=Wave*B.KKTWaveSize, PixelX=B.KKTWaveX, PixelY=B.KKTWaveY)
					Wave/=2

			if(B.DustWave)
				Dust(src.loc, B.DustWave)

			if(B.MakesArmor)
				var/obj/Items/Armor/s
				switch(B.ArmorClass)
					if("Light")
						s=new/obj/Items/Armor/Mobile_Armor
					if("Medium")
						s=new/obj/Items/Armor/Balanced_Armor
					if("Heavy")
						s=new/obj/Items/Armor/Plated_Armor
					else
						s=new/obj/Items/Armor/Balanced_Armor
				if(B.ArmorIcon)
					s.icon=B.ArmorIcon
					if(B.ArmorX)
						s.pixel_x=B.ArmorX
					if(B.ArmorY)
						s.pixel_y=B.ArmorY
				if(B.ArmorName)
					s.name=B.ArmorName
				if(B.ArmorAscension)
					s.InnatelyAscended=B.ArmorAscension
				if(B.ArmorElement)
					s.Element=B.ArmorElement
				src.contents+=s
				s.Conjured=1
				s.Cost=0
				s.Stealable=0
				if(B.FlashDraw)
					var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
					if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
						si.transform*=3
					animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
					world << si
					spawn()
						animate(si, alpha=0, time=3)
						sleep(3)
						del si
				s.AlignEquip(src)

			if(B.MakesStaff)
				var/obj/Items/Enchantment/Staff/s
				switch(B.StaffClass)
					if("Wand")
						s=new/obj/Items/Enchantment/Staff/NonElemental/Wand
					if("Rod")
						s=new/obj/Items/Enchantment/Staff/NonElemental/Rod
					if("Staff")
						s=new/obj/Items/Enchantment/Staff/NonElemental/Staff
					else
						s=new/obj/Items/Enchantment/Staff/NonElemental/Staff
				if(B.StaffIcon)
					s.icon=B.StaffIcon
					if(B.StaffX)
						s.pixel_x=B.StaffX
					if(B.StaffY)
						s.pixel_y=B.StaffY
				if(B.StaffName)
					s.name=B.StaffName
				if(B.StaffAscension)
					s.InnatelyAscended=B.StaffAscension
				if(B.StaffElement)
					s.Element=B.StaffElement
				s.Conjured=1
				src.contents+=s
				if(B.FlashDraw)
					var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
					if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
						si.transform*=3
					animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
					world << si
					spawn()
						animate(si, alpha=0, time=3)
						sleep(3)
						del si
				s.AlignEquip(src)

			if(B.MakesSword==1 || B.MakesSword==3)
				var/obj/Items/Sword/s
				switch(B.SwordClass)
					if("Wooden")
						s=new/obj/Items/Sword/Wooden
					if("Light")
						s=new/obj/Items/Sword/Light
					if("Medium")
						s=new/obj/Items/Sword/Medium
					if("Heavy")
						s=new/obj/Items/Sword/Heavy
					if("Double")
						s=new/obj/Items/Sword/Light
					else
						s=new/obj/Items/Sword/Medium
				if(B.SwordIcon)
					s.icon=B.SwordIcon
					if(B.SwordX)
						s.pixel_x=B.SwordX
					if(B.SwordY)
						s.pixel_y=B.SwordY
					s.UnderlayIcon=B.SwordIconUnder
					s.UnderlayX=B.SwordXUnder
					s.UnderlayY=B.SwordYUnder
				if(B.SwordName)
					s.name=B.SwordName
				if(B.SwordUnbreakable)
					s.Destructable=0
					s.ShatterTier=0
				src.contents+=s
				if(B.SwordClass=="Double")
					//light sword damage, heavy sword accuracy, and 1.5x faster swing
					s.DamageEffectiveness=1.3
					s.AccuracyEffectiveness=0.7
					s.SpeedEffectiveness=1.5
				if(B.SwordAscension)
					s.InnatelyAscended=B.SwordAscension
				if(B.MagicSword)
					s.MagicSword+=B.MagicSword
				if(B.SwordElement)
					s.Element = B.SwordElement
				if(B.SpiritSword)
					s.SpiritSword+=B.SpiritSword
				if(B.Extend)
					s.Extend+=B.Extend
				s.Conjured=1
				s.Cost=0
				s.Stealable=0
				if(B.FlashDraw)
					var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
					if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
						si.transform*=3
					animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
					world << si
					spawn()
						animate(si, alpha=0, time=3)
						sleep(3)
						del si
				s.AlignEquip(src)

			if(B.MakesSecondSword==1)
				var/obj/Items/Sword/s
				switch(B.SwordClassSecond)
					if("Wooden")
						s=new/obj/Items/Sword/Wooden
					if("Light")
						s=new/obj/Items/Sword/Light
					if("Medium")
						s=new/obj/Items/Sword/Medium
					if("Heavy")
						s=new/obj/Items/Sword/Heavy
					else
						s=new/obj/Items/Sword/Medium
				if(B.SwordIconSecond)
					s.icon=B.SwordIconSecond
					if(B.SwordXSecond)
						s.pixel_x=B.SwordXSecond
					if(B.SwordYSecond)
						s.pixel_y=B.SwordYSecond
				if(B.SwordNameSecond)
					s.name=B.SwordNameSecond
				src.contents+=s
				if(B.SwordAscension)
					s.InnatelyAscended=B.SwordAscensionSecond
				if(B.MagicSword)
					s.MagicSword+=B.MagicSwordSecond
				if(B.SwordElementSecond)
					s.Element=B.SwordElementSecond
				if(B.SpiritSword)
					s.SpiritSword+=B.SpiritSword
				if(B.Extend)
					s.Extend+=B.Extend
				s.Conjured=1
				s.Cost=0
				s.Stealable=0
				if(B.FlashDraw)
					var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
					if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
						si.transform*=3
					animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
					world << si
					spawn()
						animate(si, alpha=0, time=3)
						sleep(3)
						del si
				s.AlignEquip(src)
				s.suffix="*Equipped (Second)*"

			if(B.MakesThirdSword==1)
				var/obj/Items/Sword/s
				switch(B.SwordClassThird)
					if("Wooden")
						s=new/obj/Items/Sword/Wooden
					if("Light")
						s=new/obj/Items/Sword/Light
					if("Medium")
						s=new/obj/Items/Sword/Medium
					if("Heavy")
						s=new/obj/Items/Sword/Heavy
					else
						s=new/obj/Items/Sword/Medium
				if(B.SwordIconThird)
					s.icon=B.SwordIconThird
					if(B.SwordXThird)
						s.pixel_x=B.SwordXThird
					if(B.SwordYThird)
						s.pixel_y=B.SwordYThird
				if(B.SwordNameThird)
					s.name=B.SwordNameThird
				src.contents+=s
				if(B.SwordAscension)
					s.InnatelyAscended=B.SwordAscensionThird
				if(B.MagicSword)
					s.MagicSword+=B.MagicSwordThird
				if(B.SwordElementThird)
					s.Element=B.SwordElementThird
				if(B.SpiritSword)
					s.SpiritSword+=B.SpiritSword
				if(B.Extend)
					s.Extend+=B.Extend
				s.Conjured=1
				s.Cost=0
				s.Stealable=0
				if(B.FlashDraw)
					var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y, loc=src)
					if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
						si.transform*=3
					animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
					world << si
					spawn()
						animate(si, alpha=0, time=3)
						sleep(3)
						del si
				s.AlignEquip(src)
				s.suffix="*Equipped (Third)*"

			if(B.SwordIcon&&!B.MakesSword)
				var/obj/Items/Sword/s = src.EquippedSword()
				if(s)
					s.AlignEquip(src)
					B.SwordIconOld=s.icon
					s.icon=B.SwordIcon
					if(B.SwordX)
						B.SwordXOld=s.pixel_x
						s.pixel_x=B.SwordX
					if(B.SwordY)
						B.SwordYOld=s.pixel_y
						s.pixel_y=B.SwordY
					s.UnderlayIcon=B.SwordIconUnder
					s.UnderlayX=B.SwordXUnder
					s.UnderlayY=B.SwordYUnder
					s.AlignEquip(src)
			if(B.SwordClass&&!B.MakesSword)
				var/obj/Items/Sword/s = src.EquippedSword()
				if(s)
					B.SwordClassOld=s.Class
					s.Class=B.SwordClass
					switch(s.Class)
						if("Light")
							s.DamageEffectiveness=1.3
							s.AccuracyEffectiveness=0.9
							s.SpeedEffectiveness=1
						if("Medium")
							s.DamageEffectiveness=1.6
							s.AccuracyEffectiveness=0.8
							s.SpeedEffectiveness=0.95
						if("Heavy")
							s.DamageEffectiveness=1.9
							s.AccuracyEffectiveness=0.7
							s.SpeedEffectiveness=0.9
			if(B.SwordName&&!B.MakesSword)
				var/obj/Items/Sword/s = src.EquippedSword()
				if(s)
					s.Password=s.name
					s.name=B.SwordName

			if(B.LoseDurability)
				var/obj/Items/Sword/s = src.EquippedSword()
				s.ShatterCounter-=B.LoseDurability

			if(B.NeedsSecondSword && !B.NeedsThirdSword && B.MakesSword != 3)
				for(var/obj/Items/Sword/s in src)
					if(s.suffix=="*Equipped*"||s.suffix=="*Broken*")
						continue
					s.AlignEquip(src)
					s.suffix="*Equipped (Second)*"
					break

			if(B.NeedsThirdSword && B.MakesSword != 3)
				var/src2=0
				var/src3=0
				for(var/obj/Items/Sword/s in src)
					if(s.suffix=="*Equipped*"||s.suffix=="*Broken*")
						continue
					if(!src2)
						s.AlignEquip(src)
						s.suffix="*Equipped (Second)*"
						src2=s
						continue
					if(!src3)
						if(s==src2)
							continue
						else
							s.AlignEquip(src)
							s.suffix="*Equipped (Third)*"
							src3=s
							break

			if(B.HairLock&&B.HairLock!=1)
				if(B.BuffName=="Ki Control")
					if(B.OverlayTransLock)
						goto IgnoreHair
				src.HairLocked=1
				src.HairLock=B.HairLock
				src.HairBX=B.HairBX
				src.HairBY=B.HairBY
				src.Hairz("Add")
			IgnoreHair

			if(B.IconReplace&&B.icon)
				if(B.BuffName=="Ki Control")
					if(B.OverlayTransLock)
						goto IgnoreReplace
				B.OldIcon=src.icon
				B.OldX=src.pixel_x
				B.OldY=src.pixel_y
				src.icon=image(icon=B.icon, pixel_x=B.pixel_x, pixel_y=B.pixel_y)
			IgnoreReplace

			if(B.IconLock)
				if(B.BuffName=="Ki Control")
					if(B.OverlayTransLock)
						goto IgnoreIcon
				var/image/im=image(icon=B.IconLock, pixel_x=B.LockX, pixel_y=B.LockY, layer=FLOAT_LAYER-B.IconLayer)
				im.blend_mode=B.IconLockBlend
				im.transform*=B.OverlaySize
				if(B.OverlaySize>=2)
					im.appearance_flags+=512
				if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
					im.transform*=3
				if(B.IconApart)
					im.appearance_flags+=70
				if(B.IconUnder)
					src.underlays+=im
				else
					src.overlays+=im
			IgnoreIcon

			if(B.HairLock==1)
				src.Hairz("Add")

			if(B.TopOverlayLock)//subs out the aura
				if(B.BuffName=="Ki Control")
					if(B.OverlayTransLock)
						goto IgnoreHead
				if(istype(B.TopOverlayLock, /list))
					for(var/index in B.TopOverlayLock)
						if(istype(B.TopOverlayLock[index], /list))
							var/list/l = B.TopOverlayLock[index]
							var/image/im = image(icon=l["icon"], pixel_x=l["pixel_x"], pixel_y=l["pixel_y"], layer=FLOAT_LAYER-1)
							im.blend_mode=B.IconLockBlend
							im.transform*=B.OverlaySize
							if(B.OverlaySize>=2)
								im.appearance_flags+=512
							src.overlays+=im
						else
							var/image/im = image(icon=B.TopOverlayLock[index], pixel_x=B.TopOverlayX, pixel_y=B.TopOverlayY, layer=FLOAT_LAYER-1)
							im.blend_mode=B.IconLockBlend
							im.transform*=B.OverlaySize
							if(B.OverlaySize>=2)
								im.appearance_flags+=512
							src.overlays+=im
				else
					var/image/im=image(icon=B.TopOverlayLock, pixel_x=B.TopOverlayX, pixel_y=B.TopOverlayY, layer=FLOAT_LAYER-1)
					im.blend_mode=B.IconLockBlend
					im.transform*=B.OverlaySize
					if(B.OverlaySize>=2)
						im.appearance_flags+=512
					src.overlays+=im
			IgnoreHead

			if(B.IconLock&&B.IconRelayer)
				if(B.BuffName=="Ki Control")
					if(B.OverlayTransLock)
						goto IgnoreRelayer
				var/image/im=image(icon=B.IconLock, pixel_x=B.LockX, pixel_y=B.LockY, layer=FLOAT_LAYER-B.IconLayer)
				im.blend_mode=B.IconLockBlend
				im.transform*=B.OverlaySize
				if(B.OverlaySize>=2)
					im.appearance_flags+=512
				if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
					im.transform*=3
				if(B.IconApart)
					im.appearance_flags+=70
				if(B.IconUnder)
					src.underlays-=im
					src.underlays+=im
				else
					src.overlays-=im
					src.overlays+=im
			IgnoreRelayer

			if(B.MakesSword==2)
				var/obj/Items/Sword/s
				switch(B.SwordClass)
					if("Wooden")
						s=new/obj/Items/Sword/Wooden
					if("Light")
						s=new/obj/Items/Sword/Light
					if("Medium")
						s=new/obj/Items/Sword/Medium
					if("Heavy")
						s=new/obj/Items/Sword/Heavy
					else
						s=new/obj/Items/Sword/Medium
				if(B.SwordIcon)
					s.icon=B.SwordIcon
					if(B.SwordX)
						s.pixel_x=B.SwordX
					if(B.SwordY)
						s.pixel_y=B.SwordY
					s.UnderlayIcon=B.SwordIconUnder
					s.UnderlayX=B.SwordXUnder
					s.UnderlayY=B.SwordYUnder
				if(B.SwordName)
					s.name=B.SwordName
				src.contents+=s
				if(B.SwordAscension)
					s.InnatelyAscended=B.SwordAscension
				if(B.MagicSword)
					s.MagicSword+=B.MagicSword
				if(B.SpiritSword)
					s.SpiritSword+=B.SpiritSword
				if(B.Extend)
					s.Extend+=B.Extend
				if(B.FlashDraw)
					var/image/si=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y)
					if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
						si.transform*=3
					animate(si, alpha=255, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))
					world << si
					spawn()
						animate(si, alpha=0, time=3)
						sleep(3)
						del si
				s.Conjured=1
				s.Stealable=0
				s.AlignEquip(src)

			if(B.BuffName=="Ki Control"&&B.OverlayTransLock)
				src.Auraz("Remove")
				src.Auraz("Add")

			else if(B.AuraLock&&B.AuraLock!=1&&!src.AuraLocked)
				src.Auraz("Remove")
				src.AuraLocked+=1
				src.AuraLock=B.AuraLock
				src.AuraX=B.AuraX
				src.AuraY=B.AuraY
				if(B.AuraUnder)
					src.AuraLockedUnder+=1
				src.Auraz("Add")

			else if(B.AuraLock==1)
				src.Auraz("Remove")
				src.Auraz("Add")

			if(B.Enlarge)
				animate(src, transform = matrix()*B.Enlarge, time=10)
				spawn(10)
					if(src.appearance_flags<512)
						src.appearance_flags+=512

			if(B.ProportionShift)
				animate(src, transform = src.transform*B.ProportionShift, time=10)
				spawn(10)
					if(src.appearance_flags<512)
						src.appearance_flags+=512

			if(B.CustomActive)
				OMsg(src, "[B.CustomActive]")
			else
				if(B.ActiveMessage)
					if(B.TextColor)
						OMsg(src, "<font color='[B.TextColor]'>[src] [B.ActiveMessage]</font color>")
					else
						OMsg(src, "[src] [B.ActiveMessage]")

			if(B.Imitate)
				B.OldName=src.name
				B.OldOverlays+=src.overlays
				B.OldBase=src.icon
				B.OldProfile=src.Profile
				B.OldTextColor=src.Text_Color
				if(src.Target)
					src.icon=src.Target.icon
					src.overlays=src.Target.overlays
					src.name=src.Target.name
					src.Profile=src.Target.Profile
					src.Text_Color=src.Target.Text_Color
				else
					src.icon=B.ImitateBase
					src.overlays=B.ImitateOverlays
					src.name=B.ImitateName
					src.Profile=B.ImitateProfile
					src.Text_Color=B.ImitateTextColor
				if(B.ImitateBadly)
					spawn()
						animate(src, color = list(0.35,0.2,0.2, 0.25,0.45,0.35, 0.25,0.25,0.55, 0,0,0), time = 3)

			if(B.NameFake)
				B.NameTrue=src.name
				src.name=B.NameFake

			if(B.FlashChange||B.DarkChange)
				if(B.IconTint)
					src.MobColor=B.IconTint
					spawn()
						animate(src, color = src.MobColor, time = 10, flags=ANIMATION_PARALLEL)
				else if(B.PowerGlows)
					src.TransformingBeyond=1
					spawn()
						src.FlickeringGlow(src, B.PowerGlows)
				else
					spawn()
						animate(src, color = null, time=10, flags=ANIMATION_PARALLEL)
			else
				if(B.IconTint)
					src.MobColor=B.IconTint
					spawn()
						animate(src, color = src.MobColor, time = 2, flags=ANIMATION_PARALLEL)
				else if(B.PowerGlows)
					src.TransformingBeyond=1
					spawn()
						src.FlickeringGlow(src, B.PowerGlows)

			if(B.VanishImage)
				src.VanishPersonal=B.VanishImage

			if(B.ManaGlow)
				filters = null
				filters += filter(type="drop_shadow",x=0,y=0,size=B.ManaGlowSize, offset=B.ManaGlowSize/2, color=B.ManaGlow)
				GlowFilter = filters[filters.len]
				filters += filter(type="motion_blur", x=0,y=0)

			if(B.ArmamentGlow)
				src.ArmamentGlow = filter(type="drop_shadow",x=0,y=0,size=B.ArmamentGlowSize, offset=B.ArmamentGlowSize/2, color=B.ArmamentGlow)
				AppearanceOff()
				AppearanceOn()

			if(B.TimerLimit)
				B.Timer=0
			if(B.Warp)
				src.Warp+=B.Warp
			if(B.SenseUnlocked)
				src.SenseUnlocked+=B.SenseUnlocked
			if(B.Afterimages)
				src.Afterimages+=1
			if(B.AutoAnger)
				src.Anger=src.AngerMax
				src.EndlessAnger+=1
			if(B.CalmAnger)
				src.Anger=0
			if(B.AngerMult)
				src.AngerMult+=B.AngerMult
			if(B.AngerThreshold)
				src.AngerThreshold=B.AngerThreshold
			if(B.WaveringAngerLimit)
				B.WaveringAnger=0
				B.NoAnger=0
			if(B.AngerMessage)
				B.OldAngerMessage=src.AngerMessage
				src.AngerMessage=B.AngerMessage
			if(B.HotHundred)
				src.HotHundred+=B.HotHundred
			if(B.PoseEnhancement)
				src.PoseEnhancement+=B.PoseEnhancement
			if(B.BioArmor)
				src.BioArmor+=B.BioArmor
			if(B.VaizardHealth)
				src.VaizardHealth+=10*B.VaizardHealth
			if(B.KiControlMastery)
				src.KiControlMastery+=B.KiControlMastery
			if(B.SpiritPower)
				src.SpiritPower+=1
			if(B.SoulFire)
				src.SoulFire+=B.SoulFire
			if(B.NoWhiff)
				src.NoWhiff+=1
			if(B.GatesLevel)
				switch(B.GatesLevel)
					if(2)
						if(src.GatesNerfPerc<=20)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(0.05)
							usr.SubEndTax(0.05)
							usr.SubSpdTax(0.05)
					if(3)
						if(src.GatesNerfPerc<=25)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(0.1)
							usr.SubEndTax(0.1)
							usr.SubSpdTax(0.1)
					if(4)
						if(src.GatesNerfPerc<=30)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(0.15)
							usr.SubEndTax(0.15)
							usr.SubSpdTax(0.15)
					if(5)
						if(src.GatesNerfPerc<=35)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(0.2)
							usr.SubEndTax(0.2)
							usr.SubSpdTax(0.2)
					if(6)
						if(src.GatesNerfPerc<=40)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(0.25)
							usr.SubEndTax(0.25)
							usr.SubSpdTax(0.25)
					if(7)
						if(src.GatesNerfPerc<=45)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(0.3)
							usr.SubEndTax(0.3)
							usr.SubSpdTax(0.3)
					if(8)
						if(src.GatesNerfPerc)
							src.GatesNerfPerc=0
							src.GatesNerf=0
							usr.SubStrTax(1)
							usr.SubEndTax(1)
							usr.SubSpdTax(1)
				src.GatesMessage(B.GatesLevel)
				src.GatesActive=B.GatesLevel
				B.FatigueThreshold=20+(10*src.GatesActive)
			if(B.MagicSword&&!B.MakesSword)
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s)
					s.MagicSword+=B.MagicSword
			if(B.SpiritSword&&!B.MakesSword)
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s)
					s.SpiritSword+=B.SpiritSword
			if(B.Extend&&!B.MakesSword)
				var/obj/Items/Sword/s=src.EquippedSword()
				if(s)
					s.Extend+=B.Extend
			if(B.KBMult)
				src.KBMult+=B.KBMult
			if(B.KBAdd)
				src.KBAdd+=B.KBAdd
			if(B.SpaceWalk)
				src.SpaceWalk+=B.SpaceWalk
			if(B.StaticWalk)
				src.StaticWalk+=B.StaticWalk
			if(B.GiantForm)
				src.GiantForm+=B.GiantForm
			if(B.NoDodge)
				src.NoDodge+=B.NoDodge
			if(B.PowerInvisible)
				src.PowerInvisible*=B.PowerInvisible
			if(B.PURestrictionRemove)
				src.PURestrictionRemove+=B.PURestrictionRemove
			if(B.ConstantPU)
				src.PUConstant+=1
			if(B.UnlimitedPU)
				src.PUUnlimited+=1
			if(B.EffortlessPU)
				B.OldEffortlessPU=src.PUEffortless
				src.PUEffortless=B.EffortlessPU
			if(B.HighestPU)
				src.PUThresholdUp+=B.HighestPU
			if(B.StealsStats)
				src.StealsStats+=B.StealsStats
			if(B.CriticalChance)
				src.CriticalChance=B.CriticalChance
			if(B.CriticalDamage)
				src.CriticalDamage=B.CriticalDamage
			if(B.KBRes)
				src.KBRes=B.KBRes
			if(B.KBMult)
				src.KBMult=B.KBMult
			if(B.SureHitTimerLimit)
				src.SureHitTimerLimit=B.SureHitTimerLimit
			if(B.CriticalBlock)
				src.CriticalBlock=B.CriticalBlock
			if(B.BlockChance)
				src.BlockChance=B.BlockChance
			if(B.SureHitTimerLimit)
				src.SureHitTimerLimit=B.SureHitTimerLimit
			if(B.SureDodgeTimerLimit)
				src.SureDodgeTimerLimit=B.SureDodgeTimerLimit
			if(B.ManaSeal)
				src.ManaSeal=B.ManaSeal
			if(B.Incorporeal)
				src.density=0
				src.invisibility=98
				src.AdminInviso=1
				src.Incorporeal=1
			if(B.FluidForm)
				src.FluidForm+=1
			if(B.ElementalOffense)
				src.ElementalOffense=B.ElementalOffense
			if(B.ElementalDefense)
				src.ElementalDefense=B.ElementalDefense
			if(B.ElementalEnchantment)
				var/obj/Items/Sword/s=src.EquippedSword()
				var/obj/Items/Sword/s2=src.EquippedStaff()
				if(s&&!s.Element)
					s.Element=B.ElementalEnchantment
					s.ElementallyInfused=1
				if(s2&&!s2.Element)
					s2.Element=B.ElementalEnchantment
					s2.ElementallyInfused=1
			if(B.PUDrainReduction)
				src.PUDrainReduction+=(B.PUDrainReduction-1)
			if(B.PUSpeedModifier)
				src.PUSpeedModifier*=B.PUSpeedModifier
			if(B.ArcaneBladework)
				src.ArcaneBladework=1
			if(B.WarpZone)
				B.WarpTarget=src.Target
				if(src.KO||src.Health<15)
					src.RemoveSlotlessBuff(B)
					return
				else
					B.OldLocX=src.x
					B.OldLocY=src.y
					B.OldLocZ=src.z
					if(B.Duel)
						src.loc=locate(B.WarpX, B.WarpY, B.WarpZ)
					B.WarpTarget.loc=locate(B.WarpX, B.WarpY-5, B.WarpZ)
			if(B.EnergyExpenditure)
				src.EnergyExpenditure+=B.EnergyExpenditure
			if(B.Desperation)
				src.Desperation+=B.Desperation
			if(B.Warping)
				src.Warping=B.Warping
			if(B.Juggernaut)
				src.Juggernaut+=1
			if(B.Siphon)
				src.EnergySiphon+=(0.1*B.Siphon)
			if(B.Intimidation)
				src.Intimidation*=B.Intimidation
			if(B.PridefulRage)
				src.PridefulRage+=1
			if(B.DefianceRetaliate)
				src.DefianceRetaliate+=B.DefianceRetaliate
			if(B.FusionPowered)
				src.FusionPowered+=1
			if(B.Overdrive)
				if(src.MeditateModule)
					if(src.Race=="Android")
						src.HealHealth(10)
					else
						src.HealWounds(15)
						src.HealHealth(15)
			if(B.Skimming||B.Flight)
				if(B.Flight)
					src.Flying=1
				Flight(src, Start=1)
			if(B.HealthCost)
				src.DoDamage(src, TrueDamage(B.HealthCost))
			if(B.EnergyCost)
				src.LoseEnergy(B.EnergyCost)
			if(B.ManaCost)
				if(!src.TomeSpell(B))
					src.LoseMana(B.ManaCost)
				else
					src.LoseMana(B.ManaCost*(1-(0.45*src.TomeSpell(B))))
			if(B.CapacityCost)
				src.LoseCapacity(B.CapacityCost)
			if(B.WoundCost)
				src.WoundSelf(B.WoundCost)
			if(B.FatigueCost)
				src.GainFatigue(B.FatigueCost)
			if(B.Kaioken)
				src.Kaioken=1
			if(B.BurningShot)
				src.BurningShot=1
			if(B.HitSpark)
				src.SetHitSpark(B.HitSpark, B.HitX, B.HitY, B.HitTurn, B.HitSize)
			if(B.KiBlade)
				src.KiBlade+=1
			if(B.SeeInvisible)
				src.see_invisible+=B.SeeInvisible+1
			if(B.Invisible)
				spawn()
					animate(src,alpha=50,time=10)
				sleep(10)
				src.invisibility+=B.Invisible
				src.see_invisible+=B.Invisible+1
			if(B.ManaAdd)
				src.HealMana(B.ManaAdd)
			if(B.PhysicalHitsLimit)
				B.PhysicalHits=0
			if(B.UnarmedHitsLimit)
				B.UnarmedHits=0
			if(B.SwordHitsLimit)
				B.SwordHits=0
			if(B.SpiritHitsLimit)
				B.SpiritHits=0
			if(B.InstantAffect)
				B.InstantAffected=0
			if(B.SpiritForm)
				src.SpiritShift()
			if(B.TransMimic)
				src.fake_unlock=B.TransMimic
			if(B.BuffTechniques.len>0)
				for(var/x=1, x<=B.BuffTechniques.len, x++)
					var/path=text2path("[B.BuffTechniques[x]]")
					var/obj/o = new path
					if(!locate(o, src))
						src.AddSkill(o)
			if(B.IconOutline)
				src.filters += B.IconOutline
			if(B.BuffName=="Kyoukaken")
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					src.Kyoukaken("On")
			if(B.EndYourself)
				src.RemoveSlotlessBuff(B)
			src.BuffingUp=0

		AllSkillsRemove(var/obj/Skills/Buffs/B)

			if(B.ClientTint)
				if(src.SenseRobbed>=5)
					animate(src.client, color = list(-1,0,0, 0,-1,0, 0,0,-1, 1,1,1), time=3)
				else
					animate(src.client, color = null, time = 3)
				src.appearance_flags-=16
			if(B.StanceActive)
				src.StanceActive=null
			if(B.StyleActive)
				src.StyleActive=null
			if(B.IconTransform)
				var/image/T=image(B.IconTransform, pixel_x=B.TransformX, pixel_y=B.TransformY, loc = src)
				T.appearance_flags=68
				world << T
				spawn()
					animate(T, alpha=255)
					animate(T, alpha=0, time=3)
				spawn()
					src.icon=B.icon
					src.pixel_x=B.pixel_x
					src.pixel_y=B.pixel_y
					src.Transformed=0
					src.AppearanceOn()
					B.icon=null
					B.pixel_x=null
					B.pixel_y=null
					animate(src, alpha=0)
					animate(src, alpha=255, time=3)
				spawn(3)
					del T
				sleep(3)

			if(B.FlashChange)
				animate(src, color = list(1,0,0, 0,1,0, 0,0,1, 1,1,1))

			if(B.StrReplace)
				src.StrReplace=0
			if(B.EndReplace)
				src.EndReplace=0
			if(B.ForReplace)
				src.ForReplace=0
			if(B.SpdReplace)
				src.SpdReplace=0
			if(B.RecovReplace)
				src.RecovReplace=0

			if(B.TopOverlayLock)//subs out the aura
				if(istype(B.TopOverlayLock, /list))
					for(var/index in B.TopOverlayLock)
						if(istype(B.TopOverlayLock[index], /list))
							var/list/l = B.TopOverlayLock[index]
							src.overlays -= image(icon=l["icon"], pixel_x=l["pixel_x"], pixel_y=l["pixel_y"], layer=FLOAT_LAYER-1)
						else
							src.overlays -= image(icon=B.TopOverlayLock[index], pixel_x=B.TopOverlayX, pixel_y=B.TopOverlayY, layer=FLOAT_LAYER-1)
				else
					var/image/im=image(icon=B.TopOverlayLock, pixel_x=B.TopOverlayX, pixel_y=B.TopOverlayY, layer=FLOAT_LAYER-1)
					im.blend_mode=B.IconLockBlend
					im.transform*=B.OverlaySize
					if(B.OverlaySize>=2)
						im.appearance_flags+=512
					src.overlays-=im


			if(B.StripEquip==1)
				if(B.AssociatedGear)
					src.overlays+=image(B.AssociatedGear.icon, pixel_x=B.AssociatedGear.pixel_x, pixel_y=B.AssociatedGear.pixel_y, layer=FLOAT_LAYER-3)
				if(B.AssociatedLegend)
					src.overlays+=image(B.AssociatedLegend.icon, pixel_x=B.AssociatedLegend.pixel_x, pixel_y=B.AssociatedLegend.pixel_y, layer=FLOAT_LAYER-3)
			if(B.HairLock)
				if(B.HairLock==1)
					src.Hairz("Add")
				else
					src.HairLocked=0
					src.Hairz("Add")
			if(B.IconReplace&&B.OldIcon)
				src.icon=B.OldIcon
				src.pixel_x=B.OldX
				src.pixel_y=B.OldY
			if(B.IconLock)
				var/image/im=image(icon=B.IconLock, pixel_x=B.LockX, pixel_y=B.LockY, layer=FLOAT_LAYER-B.IconLayer)
				im.blend_mode=B.IconLockBlend
				im.transform*=B.OverlaySize
				if(B.OverlaySize>=2)
					im.appearance_flags+=512
				if(src.CheckActive("Mobile Suit")&&B.BuffName!="Mobile Suit")
					im.transform*=3
				if(B.IconApart)
					im.appearance_flags+=70
				if(B.IconUnder)
					src.underlays-=im
				else
					src.overlays-=im
			if(B.StripEquip==2)
				if(B.AssociatedGear)
					src.overlays+=image(B.AssociatedGear.icon, pixel_x=B.AssociatedGear.pixel_x, pixel_y=B.AssociatedGear.pixel_y, layer=FLOAT_LAYER-3)
				if(B.AssociatedLegend)
					src.overlays+=image(B.AssociatedLegend.icon, pixel_x=B.AssociatedLegend.pixel_x, pixel_y=B.AssociatedLegend.pixel_y, layer=FLOAT_LAYER-3)

			if(B.AuraLock||B.OverlayTransLock)
				if(B.AuraLock)
					if(src.AuraLocked)
						src.AuraLocked-=1
						if(B.AuraUnder)
							src.AuraLockedUnder-=1
				src.Auraz("Remove")

			if(B.TargetOverlay)
				var/image/im=image(icon=B.TargetOverlay, pixel_x=B.TargetOverlayX, pixel_y=B.TargetOverlayY)
				im.blend_mode=B.IconLockBlend
				im.transform*=B.OverlaySize
				if(B.OverlaySize>=2)
					im.appearance_flags+=512
				src.overlays-=im
				if(src.Target)
					src.Target.overlays-=im

			if(B.MakesStaff)
				var/obj/Items/Enchantment/Staff/s=src.EquippedStaff()
				s.AlignEquip(src)
				del s
			if(B.MakesSecondSword)
				var/obj/Items/Sword/s=src.EquippedSecondSword()
				s.AlignEquip(src)
				del s
			if(B.MakesArmor)
				var/obj/Items/Sword/s=src.EquippedArmor()
				s.AlignEquip(src)
				del s
				var/image/im=image(icon='goldsaint_cape.dmi', layer=FLOAT_LAYER-3)
				src.overlays-=im
			if(B.MakesSword)
				var/obj/Items/Sword/s=src.EquippedSword()
				s.AlignEquip(src)
				del s
				if(B.MakesSword==3)
					for(s in src)
						if(s.Conjured)
							if(s.suffix) s.AlignEquip(src)
							del s
			if(B.SwordIconOld)
				var/obj/Items/Sword/s = src.EquippedSword()
				if(s)
					s.AlignEquip(src)
					s.icon=B.SwordIconOld
					if(B.SwordXOld)
						s.pixel_x=B.SwordXOld
					if(B.SwordYOld)
						s.pixel_y=B.SwordYOld
					s.AlignEquip(src)
			if(B.SwordClassOld)
				var/obj/Items/Sword/s = src.EquippedSword()
				if(s)
					s.Class=B.SwordClassOld
					switch(s.Class)
						if("Light")
							s.DamageEffectiveness=1.3
							s.AccuracyEffectiveness=0.9
							s.SpeedEffectiveness=1
						if("Medium")
							s.DamageEffectiveness=2
							s.AccuracyEffectiveness=0.8
							s.SpeedEffectiveness=0.95
						if("Heavy")
							s.DamageEffectiveness=3.6
							s.AccuracyEffectiveness=0.7
							s.SpeedEffectiveness=0.9
			if(B.SwordName)
				var/obj/Items/Sword/s = src.EquippedSword()
				if(s&&s.Password)
					s.name=s.Password
			if(B.NeedsSecondSword)
				for(var/obj/Items/Sword/s in src)
					if(s.suffix=="*Equipped*"||s.suffix=="*Broken*")
						continue
					src.overlays-=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y)
					s.AlignEquip(src)
					break
			if(B.NeedsThirdSword)
				var/src2=0
				var/src3=0
				for(var/obj/Items/Sword/s in src)
					if(s.suffix=="*Equipped*"||s.suffix=="*Broken*")
						continue
					if(!src2)
						src.overlays-=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y)
						s.AlignEquip(src)
						src2=s
						continue
					if(!src3)
						if(s==src2)
							continue
						else
							src.overlays-=image(icon=s.icon, pixel_x=s.pixel_x, pixel_y=s.pixel_y)
							s.AlignEquip(src)
							src3=s
							break

			if(B.Enlarge)
				if(src.appearance_flags>=512)
					src.appearance_flags-=512
				animate(src, transform = matrix(), time = 10)

			if(B.ProportionShift)
				if(src.appearance_flags>=512)
					src.appearance_flags-=512
				animate(src, transform = src.transform/B.ProportionShift, time=10)

			if(B.PowerGlows)
				src.TransformingBeyond=0

			if(B.IconTint&&!B.FlashChange)
				src.MobColor=list(1,0,0, 0,1,0, 0,0,1, 0,0,0)
				spawn()
					animate(src, color = src.MobColor, time = 2, flags=ANIMATION_PARALLEL)

			if(B.DropOverlays)
				spawn(1)src.AppearanceOn()

			if(B.FlashChange)
				src.MobColor=list(1,0,0, 0,1,0, 0,0,1, 0,0,0)
				animate(src, color = src.MobColor, time=10)

			if(B.VanishImage)
				src.VanishPersonal=null

			if(B.TimerLimit)
				B.Timer=0
			if(B.Warp)
				src.Warp-=B.Warp
			if(B.SpiritSword)
				if(src.HasSword())
					var/obj/Items/Sword/s=src.EquippedSword()
					s.SpiritSword-=B.SpiritSword
			if(B.Extend)
				if(src.HasSword())
					var/obj/Items/Sword/s=src.EquippedSword()
					s.Extend-=B.Extend
			if(B.MagicSword)
				if(src.HasSword())
					var/obj/Items/Sword/s=src.EquippedSword()
					s.MagicSword-=B.MagicSword
			if(B.SenseUnlocked)
				src.SenseUnlocked-=B.SenseUnlocked
			if(B.Afterimages)
				src.Afterimages-=B.Afterimages
			if(B.AutoAnger)
				if(src.EndlessAnger)
					src.EndlessAnger-=1
				src.Calm()
			if(B.AngerThreshold)
				src.AngerThreshold-=B.AngerThreshold
			if(B.AngerMult)
				src.AngerMult-=B.AngerMult
			if(B.AngerMessage)
				src.AngerMessage=B.OldAngerMessage
			if(B.HotHundred)
				src.HotHundred-=B.HotHundred
			if(B.PoseEnhancement)
				src.PoseEnhancement-=B.PoseEnhancement
			if(B.BioArmor)
				src.BioArmor-=B.BioArmor
				if(src.BioArmor<0)
					src.BioArmor=0
			if(B.VaizardHealth)
				src.VaizardHealth-=15*B.VaizardHealth
				if(src.VaizardHealth<0)
					src.VaizardHealth=0
			if(B.KiControlMastery)
				src.KiControlMastery-=B.KiControlMastery
			if(B.SpiritPower)
				src.SpiritPower-=1
			if(B.SoulFire)
				src.SoulFire-=B.SoulFire
			if(B.NoWhiff)
				src.NoWhiff-=1

			if(B.ManaGlow)
				filters -= GlowFilter
				GlowFilter = null
			if(B.ArmamentGlow)
				src.ArmamentGlow = null
				AppearanceOff()
				AppearanceOn()
			if(B.GatesLevel)
				if(B.ShuttingGates)
					src.GatesActive=0
					switch(B.GatesLevel)//It only cares about what the highest gate you used was
						if(1)
							if(src.GatesNerfPerc<=20)
								src.GatesNerfPerc=20
								src.GatesNerf=RawMinutes(1)
							usr.AddStrTax(0.05)
							usr.AddEndTax(0.05)
							usr.AddSpdTax(0.05)
						if(2)
							if(src.GatesNerfPerc<=25)
								src.GatesNerfPerc=25
								src.GatesNerf=RawMinutes(4)
							usr.AddStrTax(0.1)
							usr.AddEndTax(0.1)
							usr.AddSpdTax(0.1)
						if(3)
							if(src.GatesNerfPerc<=30)
								src.GatesNerfPerc=30
								src.GatesNerf=RawHours(1)
							usr.AddStrTax(0.15)
							usr.AddEndTax(0.15)
							usr.AddSpdTax(0.15)
						if(4)
							if(src.GatesNerfPerc<=35)
								src.GatesNerfPerc=35
								src.GatesNerf=RawHours(4)
							usr.AddStrTax(0.2)
							usr.AddEndTax(0.2)
							usr.AddSpdTax(0.2)
						if(5)
							if(src.GatesNerfPerc<=40)
								src.GatesNerfPerc=40
								src.GatesNerf=RawHours(6)
							usr.AddStrTax(0.25)
							usr.AddEndTax(0.25)
							usr.AddSpdTax(0.25)
						if(6)
							if(src.GatesNerfPerc<=45)
								src.GatesNerfPerc=45
								src.GatesNerf=RawHours(1)
							usr.AddStrTax(0.3)
							usr.AddEndTax(0.3)
							usr.AddSpdTax(0.3)
						if(7)
							if(src.GatesNerfPerc<=50)
								src.GatesNerfPerc=50
								src.GatesNerf=RawHours(4)
							usr.AddStrTax(0.5)
							usr.AddEndTax(0.5)
							usr.AddSpdTax(0.5)
						if(8)
							src.GatesNerfPerc=90
							src.GatesNerf=-1
							src.TotalInjury+=90
							src.Unconscious()
							src.Burn=100
							src.HealthCut=0.5
							src.EnergyCut=0.5
							src.StrCut=0.5
							src.EndCut=0.5
							src.SpdCut=0.5
							src.RecovCut=0.5
					B.GatesLevel=0
			if(B.WoundNerf)
				switch(B.WoundNerf)
					if(1)
						var/Time=RawHours(12)
						Time/=src.GetRecov()
						src.BPPoisonTimer=Time
						src.BPPoison=0.9
					if(2)
						var/Time=RawHours(12)
						Time/=src.GetRecov()
						src.BPPoisonTimer=Time
						src.BPPoison=0.7
					if(3)
						var/Time=RawHours(6)
						Time/=src.GetRecov()
						src.BPPoisonTimer=Time
						src.BPPoison=0.5
			if(B.OverClock)
				src.OverClockNerf+=B.OverClock
				if(src.OverClockNerf>=1)
					src.OverClockNerf=0.99
				src.OverClockTime+=RawHours(24*B.OverClock)
			if(B.PotionCD)
				src.PotionCD+=B.PotionCD

			if(B.KBMult)
				if(src.KBMult!=B.KBMult)
					src.KBMult/=B.KBMult
				else
					src.KBMult=0
			if(B.KBAdd)
				src.KBAdd-=B.KBAdd
			if(B.SpaceWalk)
				src.SpaceWalk-=1
			if(B.StaticWalk)
				src.StaticWalk-=1
			if(B.GiantForm)
				src.GiantForm-=B.GiantForm
			if(B.NoDodge)
				src.NoDodge-=B.NoDodge
			if(B.AngerStorage)
				src.AngerMax=B.AngerStorage
			if(B.PowerInvisible)
				src.PowerInvisible/=B.PowerInvisible
			if(B.PURestrictionRemove)
				src.PURestrictionRemove-=B.PURestrictionRemove
			if(B.ConstantPU)
				src.PUConstant-=1
			if(B.UnlimitedPU)
				src.PUUnlimited-=1
			if(B.EffortlessPU)
				src.PUEffortless=B.OldEffortlessPU
			if(B.HighestPU)
				src.PUThresholdUp-=B.HighestPU
			if(B.StealsStats)
				src.StealsStats-=B.StealsStats
				src.StrStolen=0
				src.EndStolen=0
				src.SpdStolen=0
				src.ForStolen=0
				src.OffStolen=0
				src.DefStolen=0
			if(B.CriticalChance)
				src.CriticalChance=0
			if(B.CriticalDamage)
				src.CriticalDamage=0
			if(B.CriticalBlock)
				src.CriticalBlock=0
			if(B.BlockChance)
				src.BlockChance=0
			if(B.KBRes)
				src.KBRes=0
			if(B.KBMult)
				src.KBMult=0
			if(B.SureHitTimerLimit)
				src.SureHitTimerLimit=0
				src.SureHitTimer=0
				src.SureHit=0
			if(B.SureDodgeTimerLimit)
				src.SureDodgeTimerLimit=0
				src.SureDodgeTimer=0
				src.SureDodge=0
			if(B.ManaSeal)
				src.ManaSeal=0
			if(B.Incorporeal)
				src.density=1
				src.invisibility=0
				src.AdminInviso=0
				src.Incorporeal=0
			if(B.FluidForm)
				src.FluidForm-=1
			if(B.ElementalOffense)
				src.ElementalOffense=null
			if(B.ElementalDefense)
				src.ElementalDefense=null
			if(B.ElementalEnchantment)
				var/obj/Items/Sword/s=src.EquippedSword()
				var/obj/Items/Sword/s2=src.EquippedStaff()
				if(s&&s.ElementallyInfused)
					s.Element=null
					s.ElementallyInfused=null
				if(s2&&s2.ElementallyInfused)
					s2.Element=null
					s2.ElementallyInfused=null
			if(B.PUDrainReduction)
				src.PUDrainReduction-=(B.PUDrainReduction-1)
			if(B.PUSpeedModifier)
				src.PUSpeedModifier/=B.PUSpeedModifier
			if(B.ArcaneBladework)
				src.ArcaneBladework=0
			if(B.WarpZone)
				if(B.Duel)
					src.loc=locate(B.OldLocX, B.OldLocY, B.OldLocZ)
					B.WarpTarget.loc=locate(B.OldLocX+pick(-1,1), B.OldLocY+pick(-1,1), B.OldLocZ)
				B.OldLocX=0
				B.OldLocY=0
				B.OldLocZ=0
				B.WarpTarget=0
			if(B.EnergyExpenditure)
				src.EnergyExpenditure-=B.EnergyExpenditure
			if(B.Desperation)
				src.Desperation-=B.Desperation
			if(B.Warping)
				src.Warping=0
			if(B.Juggernaut)
				src.Juggernaut-=1
			if(B.Siphon)
				src.EnergySiphon-=(0.1*B.Siphon)
			if(B.Intimidation)
				src.Intimidation/=B.Intimidation
			if(B.PridefulRage)
				src.PridefulRage-=1
			if(B.DefianceRetaliate)
				src.DefianceRetaliate-=B.DefianceRetaliate
				src.DefianceCounter=0
			if(B.FusionPowered)
				src.FusionPowered-=1
			if(B.Overdrive)
				if(src.MeditateModule)
					if(src.Race=="Android")
						src.DoDamage(src, TrueDamage(15))
					else
						src.WoundSelf(20)
						src.DoDamage(src, TrueDamage(20))
				if(src.FusionPowered)
					src.PowerControl=100

			if(B.Skimming||B.Flight)
				Flight(src, Land=1)
			if(B.Kaioken)
				src.Kaioken=0
			if(B.BurningShot)
				src.BurningShot=0
			if(B.HitSpark)
				src.ClearHitSpark()
			if(B.KiBlade)
				src.KiBlade-=1
			if(B.ExplosiveFinish)
				src.Activate(new/obj/Skills/AutoHit/Explosive_Finish)
			if(B.FINISHINGMOVE)
				src.Unconscious()
			if(B.HealthCut)
				src.AddHealthCut(B.HealthCut)
			if(B.EnergyCut)
				src.AddEnergyCut(B.EnergyCut)
			if(B.ManaCut)
				src.AddManaCut(B.ManaCut)
			if(B.StrCut)
				src.AddStrCut(B.StrCut)
			if(B.EndCut)
				src.AddEndCut(B.EndCut)
			if(B.SpdCut)
				src.AddSpdCut(B.SpdCut)
			if(B.ForCut)
				src.AddForCut(B.ForCut)
			if(B.OffCut)
				src.AddOffCut(B.OffCut)
			if(B.DefCut)
				src.AddDefCut(B.DefCut)

			if(B.RecovCut)
				src.AddRecovCut(B.RecovCut)
			if(B.StrTax)
				src.AddStrTax(B.StrTax)
			if(B.EndTax)
				src.AddEndTax(B.EndTax)
			if(B.SpdTax)
				src.AddSpdTax(B.SpdTax)
			if(B.ForTax)
				src.AddForTax(B.ForTax)
			if(B.OffTax)
				src.AddOffTax(B.OffTax)
			if(B.DefTax)
				src.AddDefTax(B.DefTax)
			if(B.RecovTax)
				src.AddRecovTax(B.RecovTax)
			if(B.WaveringAngerLimit)
				B.WaveringAnger=0
			if(B.SeeInvisible)
				src.see_invisible-=(B.SeeInvisible+1)
			if(B.Invisible)
				spawn()
					animate(src,alpha=255,time=10)
				src.invisibility-=B.Invisible
				src.see_invisible-=(B.Invisible+1)
			if(B.ManaAdd)
				src.LoseMana(B.ManaAdd)
			if(B.PhysicalHitsLimit)
				B.PhysicalHits=0
			if(B.UnarmedHitsLimit)
				B.UnarmedHits=0
			if(B.SwordHitsLimit)
				B.SwordHits=0
			if(B.SpiritHitsLimit)
				B.SpiritHits=0
			if(B.SpiritForm)
				src.SpiritShiftBack()
			if(B.IconOutline)
				src.filters -= B.IconOutline
			if(B.InstantAffect)
				B.InstantAffected=0
			if(B.BuffName=="Kyoukaken")
				src.Kyoukaken("Off")

			if(B.KillSword&&src.EquippedSword())
				var/obj/Items/Sword/s=src.EquippedSword()
				src.SwordShatter(s)
			else if(B.KillSword&&src.EquippedStaff())
				var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
				src.StaffShatter(st)

			if(B.CustomOff)
				OMsg(src, "[B.CustomOff]")
			else
				if(B.OffMessage)
					if(B.TextColor)
						OMsg(src, "<font color='[B.TextColor]'>[src] [B.OffMessage]</font color>")
					else
						OMsg(src, "[src] [B.OffMessage]")

			if(B.DebuffCrash)
				var/list/debuffs=list()
				debuffs.Add(B.DebuffCrash)
				for(var/d in debuffs)
					if(d=="Poison")
						src.LoseHealth(src.Poison/20)//5% at 100% poison
						src.WoundSelf(src.Poison/20)
						src.Poison=0
					if(d=="Fire")
						src.LoseHealth(src.Burn/20)//5% at 100% burn
						src.Burn=0

			if(B.MaimCost)
				src.Maimed+=B.MaimCost
				src << "You have been maimed by using the overwhelming power of [B]!"

			if(B.Imitate)
				src.name=B.OldName
				src.overlays=null
				src.icon=B.OldBase
				src.overlays+=B.OldOverlays
				src.Profile=B.OldProfile
				src.Text_Color=B.OldTextColor
				B.OldName=null
				B.OldBase=null
				B.OldOverlays=list()
				B.OldProfile=null
				B.OldTextColor=null
				if(src.color)
					spawn()
						animate(src, color = null, time = 3)

			if(B.NameFake)
				src.name=B.NameTrue

			if(B.Transform)
				if(B.Transform=="Strong")
					src.Intimidation/=1.5
				else if(B.Transform=="Weak")
					src.PowerBoost/=0.25
				else if(B.Transform=="Force")
					src.ssj["unlocked"]=max(src.ssj["unlocked"]-1,0)
					src.trans["unlocked"]=max(src.trans["unlocked"]-1,0)
					src.Revert()
				else
					src.Revert(B.Transform)

			if(B.AllOutPU)
				if(src.CheckActive("Ki Control"))
					for(var/obj/Skills/Buffs/ActiveBuffs/Ki_Control/KC in src)
						src.UseBuff(KC, Override=1)

			if(B.type==/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/What_Must_Be_Done)
				B.StrMult=1
				B.EndMult=1
				B.SpdMult=1
				B.ForMult=1

			if(B.Cooldown)
				if(src.TomeSpell(B))
					B.Cooldown(1-(0.25*src.TomeSpell(B)))
				else
					B.Cooldown()

			if(B.BuffTechniques.len>0)
				for(var/x=1, x<=B.BuffTechniques.len, x++)
					var/path=text2path("[B.BuffTechniques[x]]")
					for(var/obj/Skills/o in usr)
						if(o.type == path)
							if(istype(o, /obj/Skills/Buffs) && BuffOn(o))
								var/obj/Skills/Buffs/b = o
								if(b.Trigger(src, Override=1))
									del b
							else
								del o

			src.BuffingUp=0
			if(B.AlwaysOn)
				if(B.NeedsPassword)
					if(B.Password)
						del B
				else
					del B


mob
	proc
		BuffOn(var/obj/Skills/Buffs/B)
			if(src.StanceBuff)
				if(src.StanceBuff.type==B.type)
					return 1
			if(src.StyleBuff)
				if(src.StyleBuff.type==B.type)
					return 1
			if(src.ActiveBuff)
				if(src.ActiveBuff.type==B.type)
					return 1
			if(src.SpecialBuff)
				if(src.SpecialBuff.type==B.type)
					return 1
			if(src.SlotlessBuffs.len>0)
				for(var/obj/Skills/Buffs/b2 in src.SlotlessBuffs)
					if(b2.type==B.type)
						return 1
			return 0