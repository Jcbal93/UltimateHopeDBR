proc
	Flight(mob/m, var/Start=0, var/Land=0)
		sleep(1)

		if(m)
			if(Start)
				if(m.Flying)
					m.density=0
					m.layer=MOB_LAYER+3

			if(Land)
				if(m.Flying)
					m.Flying=0
					m.density=1
					m.layer=MOB_LAYER

			if(m.Flying)
				animate(m,pixel_z=48,time=5)
				spawn(5)
					animate(m,pixel_z=43,time=5)
					spawn(5)
						Flight(m)
			else if(m.HasPassive("Skimming", BuffsOnly=1))
				animate(m,pixel_z=8,time=5)
				spawn(5)
					animate(m,pixel_z=3,time=5)
					spawn(5)
						Flight(m)
			else
				animate(m,pixel_z=0,time=5)
				spawn(5)
					m.icon_state=""