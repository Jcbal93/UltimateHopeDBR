mob
	proc
		potential_gain(var/val, var/npc=0)
			var/reduce=0

			src.potential_max()

			if(src.Potential<src.PotentialCap && src.PotentialStatus!="Distracted")

				if(npc)
					switch(src.PotentialStatus)
						if("Average")
							val*=2.5
						if("Focused")
							val*=5
					if(src.SteadyRace())
						var/eff=min(100, src.Potential)
						eff=round(eff, 10)
						eff/=10
						reduce=eff
						reduce+=1
					if(src.TransRace())
						var/trans=src.TransUnlocked()
						if(src.Race=="Changeling")
							trans-=3
						reduce=2**(trans)
					if(src.Potential>100)
						var/eff=src.Potential-100
						reduce+=round(eff/20)//every 20 potential over 100 increases reduction by 1
					if(src.CyberCancel)
						if(reduce)
							reduce*=(1+src.CyberCancel)
					if(reduce)
						val/=reduce
					if(src.party)
						if(src.party.highest_potential>src.Potential)
							val*=(src.party.members.len)//stop reducing pot gain
							val*=(src.party.highest_potential/src.Potential)


				val*=src.PotentialRate
				if(val>DaysOfWipe() / 3)
					val=DaysOfWipe()/3
				src.Potential+=val
				if(val>0)
					if(src.Race=="Android")
						src.HealthCut+=(val/100)

				if(src.Potential>src.PotentialCap && src.PotentialRate>0)
					src.Potential=src.PotentialCap

			src.potential_max()

			if(src.Potential>=50)
				if(src.KiControlMastery<1)
					src.KiControlMastery=1
			if(src.Potential>=100)
				if(src.KiControlMastery<2)
					src.KiControlMastery=2


			if(src.SteadyRace() || src.Race=="Changeling" || src.Race=="Half Saiyan") src.potential_ascend()

		potential_max()

			var/Max=DaysOfWipe()*global.PotentialDaily
			Max+=src.PotentialRate
			Max=round(Max)
			if(src.Potential>=Max && src.PotentialRate>0)//ecs will have potentialrate 0 and so they can be any level
				src.Potential=Max
				src.PotentialStatus="Distracted"
			else if(src.Potential>Max*0.8 && src.Potential<Max)
				src.PotentialStatus="Average"
			else
				src.PotentialStatus="Focused"

			if(src.Race=="Shinjin")
				var/Cap=Max/100

				if(src.AscensionsAcquired>0&&src.ShinjinAscension=="Makai")
					Cap+=0.5

				if(src.ShinjinAscension=="Kai"&&!src.AscensionsAcquired)
					Cap/=2

				if(src.GodKi>Cap && src.PotentialRate>0)
					src.GodKi=Cap

		SpendRPP(var/val, var/Purchase=0, var/Training=0)//Purchase is a variable that holds whatever you're trying to buy.  Optional.
			var/TotalSpend=src.GetRPPSpendable()
			if(TotalSpend>=val)
				var/Remaining=val
				if(Remaining<=src.RPPSpendableEvent)
					src.RPPSpendableEvent-=Remaining
					src.RPPSpentEvent+=Remaining
					if(src.RPPSpendableEvent<=0)
						src.RPPSpendableEvent=0
					Remaining=0
				else if(Remaining>src.RPPSpendableEvent)
					Remaining-=src.RPPSpendableEvent
					src.RPPSpentEvent+=src.RPPSpendableEvent
					src.RPPSpendableEvent=0
				if(Remaining>0)
					src.RPPSpent+=Remaining
					src.RPPSpendable-=Remaining
					Remaining=0
				if(Purchase)
					if(Training)
						src.potential_gain(val/global.RPPDaily)
					src << "You purchase [Purchase] for [Commas(val)] RPP!"
				return 1
			else
				if(Purchase)
					src << "You don't have enough RPP to buy [Purchase]! ([TotalSpend] / [val])"
				else
					src << "You don't have enough RPP! ([TotalSpend] / [val])"
				return 0
		GetRPPSpendable()
			var/Total=0
			Total+=src.RPPSpendable
			Total+=src.RPPSpendableEvent
			return Total
		GetRPP()
			var/Total=0
			Total+=src.RPPSpendable
			Total+=src.RPPSpent
			return Total
		GetRPPEvent()
			var/Total=0
			Total+=src.RPPSpendableEvent
			Total+=src.RPPSpentEvent
			return Total

		potential_ascend(var/Silent=0)
			if(src.SteadyRace())
				if(src.Potential>=10)
					if(src.AscensionsUnlocked<1)
						src.AscensionsUnlocked=1
						if(!Silent) src << "Meditate to acquire ascension boons."
				if(src.Potential>=30)
					if(src.AscensionsUnlocked<2)
						src.AscensionsUnlocked=2
						if(!Silent) src << "Meditate to acquire ascension boons."
				if(src.Potential>=50)
					if(src.AscensionsUnlocked<3)
						src.AscensionsUnlocked=3
						if(!Silent) src << "Meditate to acquire ascension boons."
				if(src.Potential>=70)
					if(src.AscensionsUnlocked<4)
						src.AscensionsUnlocked=4
						if(!Silent) src << "Meditate to acquire ascension boons."
			else if(src.Race=="Changeling")
				if(src.Potential>=20)
					if(src.AscensionsUnlocked<1)
						src.AscensionsUnlocked=1
						if(!Silent) src << "Meditate to acquire ascension boons."
				if(src.Potential>=40)
					if(src.AscensionsUnlocked<2)
						src.AscensionsUnlocked=2
						if(!Silent) src << "Meditate to acquire ascension boons."
				if(src.Potential>=60)
					if(src.AscensionsUnlocked<3)
						src.AscensionsUnlocked=3
						if(!Silent) src << "Meditate to acquire ascension boons."


proc
	potential_power(var/mob/m)
		if(m.get_potential()==m.potential_last_checked)
			return//don't keep getting potential power if the potential hasn't changed
		if(m.Class in list("Dance", "Potara"))
			return // dont mess with my fusion power

		var/tier_rem=min(10, (m.get_potential()/10))
		var/max_tier = min(10,round((DaysOfWipe()*global.PotentialDaily*1.25)/10))
		var/prev_tier= min(max_tier, round(m.get_potential()/10))
		var/list/power_vals=list(5,10,25,50,100,150,200,300,400,500)
		//100 potential = 500 bpm
		//90 potential = 400 bpm
		//80 potential = 300 bpm
		//70 potential = 200 bpm
		//60 potential = 150 bpm
		//50 potential = 100 bpm
		//40 potential = 50 bpm
		//30 potential = 25 bpm
		//20 potential = 10 bpm
		//10 potential = 5 bpm
		if(prev_tier==0)
			m.potential_power_mult=1
		else
			m.potential_power_mult=power_vals[prev_tier]

		if(prev_tier!=10)
			m.potential_power_mult+=potential_fraction(tier_rem-prev_tier, prev_tier)

		if(m.get_potential()>100)
			m.potential_power_mult+=((m.get_potential()-100)*25)//potential > 100 gives you an extra 25 bp every % of potential

		m.potential_last_checked=m.get_potential()

	potential_fraction(var/val, var/last_tier)
		switch(last_tier)
			if(0)
				return val*4//5
			if(1)
				return val*5//10
			if(2)
				return val*15//25
			if(3)
				return val*25//50
			if(4)
				return val*50//100
			if(5)
				return val*50//150
			if(6)
				return val*50//200
			if(7)
				return val*100//300
			if(8)
				return val*100//400
			if(9)
				return val*100//500
			//10 doesnt get fractions