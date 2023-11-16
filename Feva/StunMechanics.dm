proc
	Stun(mob/m,amount=5)
		if(!m.client || istype(m, /mob/Player/AI))
			return
		if(m.InUBW&&m.MadeOfSwords)
			return
		if(m.StunImmune)
			return
		if(m.VaizardHealth)
			amount/=2
		if(m.Oozaru)
			amount/=2
		if(m.HasLegendaryPower() > 0.25 || m.Juggernaut)
			amount/=1.5
		if(m.HasDebuffImmune())
			amount/=1+m.GetDebuffImmune()
		if(m.ContinuousAttacking)
			for(var/obj/Skills/Projectile/p in m.contents)
				if(p.ContinuousOn && !p.StormFall)
					m.UseProjectile(p)
				continue
		var/Stun_Amount=world.time+(amount*10)
		if(m.Stunned)
			if(m.Stunned<Stun_Amount)
				m.Stunned=Stun_Amount
		else
			var/obj/Effects/Stun/S=new
			S.appearance_flags=66
			m.Stunned=world.time+(amount*10)
			m.overlays+=S
			m.ForceCancelBeam()
			m.ForceCancelBuster()
	StunCheck(mob/mob)
		if(mob.Stunned)
			if(mob.Stunned<world.time)
				var/obj/Effects/Stun/S=new
				S.appearance_flags=66
				mob.overlays-=S
				mob.Stunned=0
				mob.StasisStun=0
				mob.overlays-='IceCoffin.dmi'
				mob.StunImmune=world.time+(300*(1+(mob.Juggernaut+mob.HasLegendaryPower())))
			else
				return 1
	StunClear(mob/mob)
		if(mob.Stunned)
			var/obj/Effects/Stun/S=new
			S.appearance_flags=66
			mob.overlays-=S
			mob.Stunned=0
			mob.StasisStun=0
			mob.overlays-='IceCoffin.dmi'
			mob.StunImmune=world.time+300
	StunImmuneCheck(mob/mob)
		if(mob.StunImmune)
			if(mob.StunImmune<world.time)
				mob.StunImmune=0
			else
				return 1