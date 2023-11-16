mob
	proc
		reward_auto()
			if(src.RewardsLastGained)
				if(src.RewardsLastGained+Day(1) < world.realtime)//if its been a day since the last reward
					var/Dif=((world.realtime-src.RewardsLastGained) / Day(1))//find how many days it has been

					Dif=round(Dif)//round off
					var/Statement=1
					while(Dif>0)
						src << "Gaining routine RPP for [Statement] day\s."
						src.reward_self()
						if(src.RPPEventCharges>0)
							src.reward_self_event()
							src.RPPEventCharges--
							src << "You have been given event RPP!"
							if(src.RPPEventCharges<0)
								src.RPPEventCharges=0
								src << "Your backlog of event RPP has reached its end."

						Statement++
						Dif--

					if(src.EconomyEventCharges>0)
						src.reward_self_econ()
					src.RewardsLastGained=(world.realtime-world.timeofday)//set the time they obtained the refresh to midnight
		reward_self()
			var/AddRPP=global.RPPDaily
			var/YourRPP=AddRPP
			DaysOfWipe()//mak sure globalrpp set.

			if(src.RPPStartingDaysTriggered >= 0)
				if((src.RPPSpent+src.RPPSpendable)/src.GetRPPMult()<global.RPPStarting)
					YourRPP=(global.RPPStarting / global.RPPStartingDays)
					src.RPPStartingDaysTriggered++
					if(src.RPPStartingDaysTriggered==global.RPPStartingDays)
						src.RPPStartingDaysTriggered=(-1)
						YourRPP=global.RPPStarting-((src.RPPSpent+src.RPPSpendable)/src.GetRPPMult())
				else
					src.RPPStartingDaysTriggered=(-1)

			if(YourRPP>0)
				if(locate(/obj/Skills/Utility/Teachz, src) || src.TarotFate=="The Hermit")
					var/ElderMult=1
					if(src.EraBody=="Senile")
						ElderMult=2
					if(src.TarotFate=="The Hermit")
						if(src.RPPSpendable>src.RPPDonate)
							src.RPPDonate=src.RPPSpendable
						if(!locate(/obj/Skills/Utility/Teachz, src))
							src.AddSkill(new/obj/Skills/Utility/Teachz)
					else
						src.RPPDonate+=(YourRPP*ElderMult*src.RPPMult*global.RPPBaseMult)
					src << "You have gained knowledge on how to help further other's development!"

				var/EMult=global.RPPBaseMult
				EMult*=src.GetRPPMult()
				YourRPP*=EMult

				src.RPPSpendable+=round(YourRPP)
				if(src.RPPStartingDaysTriggered==(-1))
					if(src.RPPSpendable+src.RPPSpent<global.RPPDaily)
						src.RPPSpendable+=(global.RPPDaily-(src.RPPSpendable+src.RPPSpent))
			if((src.EraBody!="Child"||!src.EraBody)&&!src.Dead)
				src << "You gain money from routine tasks."
				var/AgeMult=1
				if(src.EraBody=="Youth"||src.EraBody=="Elder")
					AgeMult=0.5
				if(src.EraBody=="Senile")
					AgeMult=0.25
				src.GiveMoney(max(0,round(global.EconomyIncome*src.EconomyMult*src.Intelligence*AgeMult)))
		reward_self_event()
			var/val=global.RPPDaily
			var/EMult=global.RPPBaseMult
			EMult*=src.GetRPPMult()
			val*=EMult

			if(src.GetRPPEvent()<src.GetRPP()*0.5)//trigger rpp gains!
				src.RPPSpendableEvent+=val
				var/Dif=((src.GetRPP()*0.5)-src.RPPSpentEvent)
				if(Dif<0)
					Dif*=(-1)
					Dif/=global.RPPDaily
					src.EconomyEventCharges+=Dif
					src.RPPSpendableEvent=((src.GetRPP()*0.5)-src.RPPSpentEvent)
			else//economy only
				src.EconomyEventCharges+=(val/global.RPPDaily)

			if(locate(/obj/Skills/Utility/Teachz, src))
				src.RPPDonate+=val
			global.RPPEventCharges["[src.ckey]"]=round((src.GetRPPEvent()/src.GetRPPMult())/global.RPPDaily)

		reward_self_econ()
			src.GiveMoney(max(0,global.EconomyIncome * 5 * src.EconomyEventCharges))
			src << "You've triggered [src.EconomyEventCharges] economy charges."
			src.EconomyEventCharges=0