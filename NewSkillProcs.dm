mob/proc/SkillStunX(var/Wut,var/obj/Skills/Z,var/bypass=0)
	if(Z)
		if(!locate(Z) in src)
			return
	if(bypass||Z)
		switch(Wut)
			if("After Image Strike")
				if(src.KO)return
				if(Z.Using) return
				if(src.TimeFrozen)return
				if(!src.AfterImageStrike)
					spawn() KenShockwave(src, icon='KenShockwaveLegend.dmi', Size=0.5, Blend=2, Time=4)
					src.AfterImageStrike=1
					if(Stunned)	Stunned -= (Stunned - world.time)/2
					src << "You focus intently on your opponents movements..."
					Z.Cooldown()
					src.MovementCharges--