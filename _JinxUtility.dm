mob
	proc
		AscAvailable(var/race)
			if(src.trans["active"]>0||src.ssj["active"]>0)
				return
			if(src.SteadyRace()) src.potential_ascend(Silent=1)


			if(race=="Human")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.HumanAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.HumanAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.HumanAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.HumanAscension4()
						return
				if(src.AscensionsAcquired<5)
					if(src.AscensionsUnlocked>=5)
						src.HumanAscension5()
						return

				return

			if(src.Race=="Makyo")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.MakyoAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.MakyoAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.MakyoAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.MakyoAscension4()
						return
				if(src.AscensionsAcquired<5)
					if(src.AscensionsUnlocked>=5)
						src.MakyoAscension5()
						return
				return

			if(race=="Half Saiyan")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.HalfSaiyanAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.HalfSaiyanAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.HalfSaiyanAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.HalfSaiyanAscension4()
						return
				return

			if(race=="Namekian")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >=1)
						src.NamekianAscension1()
						return
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >=2)
						src.NamekianAscension2()
						return
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >=3)
						src.NamekianAscension3()
						return
				if(src.AscensionsAcquired < 4)
					if(src.AscensionsUnlocked >=4)
						src.NamekianAscension4()
						return
				if(src.AscensionsAcquired < 5)
					if(src.AscensionsUnlocked >=5)
						src.NamekianAscension5()
						return
				return

			if(race=="Saiyan")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.SaiyanAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.SaiyanAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.SaiyanAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.SaiyanAscension4()
						return
				return

			if(race=="Tuffle")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						src.TuffleAscension1()
						return
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						src.TuffleAscension2()
						return
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						src.TuffleAscension3()
						return
				if(src.AscensionsAcquired < 4)
					if(src.AscensionsUnlocked >= 4)
						src.TuffleAscension4()
						return
				if(src.AscensionsAcquired < 5)
					if(src.AscensionsUnlocked >= 5)
						src.TuffleAscension5()
						return
				return

			if(race=="Alien")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.AlienAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.AlienAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.AlienAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.AlienAscension4()
						return
				return

			if(race=="Monster")
				if(src.AscensionsAcquired<src.AscensionsUnlocked)
					src.MonsterAscensionX(src.AscensionsAcquired+1)
				return

			if(race=="Shinjin")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.ShinjinAscension1()
						return
				return

			if(race=="Demon")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.DemonAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.DemonAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.DemonAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.DemonAscension4()
						return
				if(src.AscensionsAcquired<5)
					if(src.AscensionsUnlocked>=5)
						src.DemonAscension5()
						return
				return

			if(src.Race=="Djinn")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.DjinnAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.DjinnAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.DjinnAscension3()
						return

			if(src.Race=="Dragon")
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.DragonAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.DragonAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.DragonAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.DragonAscension4()
						return
				if(src.AscensionsAcquired<5)
					if(src.AscensionsUnlocked>=5)
						src.DragonAscension5()
						return
				if(src.AscensionsAcquired<6)
					if(src.AscensionsUnlocked>=6)
						src.DragonAscension6()
						return
				return

			if(race=="Android")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						src.AndroidAscension1()
						return
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						src.AndroidAscension2()
						return
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						src.AndroidAscension3()
						return
				if(src.AscensionsAcquired < 4)
					if(src.AscensionsUnlocked >= 4)
						src.AndroidAscension4()
						return
				if(src.AscensionsAcquired < 5)
					if(src.AscensionsUnlocked >= 5)
						src.AndroidAscension5()
						return
				return

			if(src.Race=="Changeling")
				if(src.AngerMax<1)
					src.AngerMax=1
				if(src.AscensionsAcquired<1)
					if(src.AscensionsUnlocked>=1)
						src.ChangelingAscension1()
						return
				if(src.AscensionsAcquired<2)
					if(src.AscensionsUnlocked>=2)
						src.ChangelingAscension2()
						return
				if(src.AscensionsAcquired<3)
					if(src.AscensionsUnlocked>=3)
						src.ChangelingAscension3()
						return
				if(src.AscensionsAcquired<4)
					if(src.AscensionsUnlocked>=4)
						src.ChangelingAscension4()
						return

		HumanAscension1()//Shiro
			src.AscensionsAcquired=1
			src.PotentialRate=1
			src.HumanAscension=alert(src, "You stand at a crossroads; capable of pursuing many paths yet limited to one, which do you choose?  Fighting, Technology, or Enchantment?", "Breakthrough Ascension", "Fighting", "Technology", "Enchantment")
			switch(src.HumanAscension)
				if("Technology")
					src << "You focus your flexible mind towards pursuit of scientific knowledge!"
					src.RPPMult=1.5
					src.EconomyMult=1.5
					src.Intelligence=2
					src.CyberizeMod=1
					src.Imagination=0.25
					src.PilotingProwess+=0.5
				if("Enchantment")
					src << "Your mystic knowledge allows you to research magic easier!"
					src.Imagination=2
			if(src.HumanAscension=="Fighting")
				src.StrAscension+=0.25
				src.EndAscension+=0.25
				src.SpdAscension+=0.25
				src.ForAscension+=0.25
				src.OffAscension+=0.25
				src.DefAscension+=0.25
				src.NewAnger(1.25)
				src.Desperation=4
				src.AngerPoint=50
				src.AngerMessage="grows desperate!"
				src << "You learn the meaning of desperation..."
		HumanAscension2()//Aka
			src.AscensionsAcquired=2
			src.PotentialRate=2
			src.Desperation=3
			src.NewAnger(1.5)
			src.AngerPoint=50
			if(src.HumanAscension=="Technology")
				src.PilotingProwess+=0.5
			src.StrAscension+=0.25
			src.EndAscension+=0.25
			src.SpdAscension+=0.25
			src.ForAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.AngerMessage="grows determined!"
			src << "You learn the meaning of responsibility..."
		HumanAscension3()//Aoi
			src.AscensionsAcquired=3
			src.PotentialRate=3
			src.Desperation=2
			src.NewAnger(2)
			if(src.HumanAscension=="Technology")
				src.PilotingProwess+=0.5
			src.StrAscension+=0.5
			src.EndAscension+=0.5
			src.SpdAscension+=0.5
			src.ForAscension+=0.5
			src.OffAscension+=0.5
			src.DefAscension+=0.5
			src.AngerMessage="grows confident!"
			src << "You learn the meaning of confidence..."
		HumanAscension4()//Koku
			src.AscensionsAcquired=4
			src.PotentialRate=4
			src.Desperation=1
			src.NewAnger(2.5)
			if(src.HumanAscension=="Technology")
				src.PilotingProwess+=0.5
			src.StrAscension+=0.5
			src.EndAscension+=0.5
			src.SpdAscension+=0.5
			src.ForAscension+=0.5
			src.OffAscension+=0.5
			src.DefAscension+=0.5
			src.AngerMessage="gains absolute clarity!"
			src << "You learn the meaning of competence..."
		HumanAscension5()
			src.AscensionsAcquired=5
			if(src.CyberCancel)
				return
			if(src.HellPower)
				return
			if(src.LegendaryPower)
				return
			if(src.SpiritPower)
				return
			src.PotentialRate=5
			src.Desperation=0
			src.NewAnger(3)
			if(src.HumanAscension=="Technology")
				src.PilotingProwess+=1
			src.StrAscension+=1
			src.EndAscension+=1
			src.SpdAscension+=1
			src.ForAscension+=1
			src.OffAscension+=1
			src.DefAscension+=1
			src.AngerMessage="becomes angry!"
			src << "You learn the meaning of humanity..."


		HalfDemonAscension()
			src.HellPower=2
			src << "By dying at a level of power suitable to wield the force of a true devil, you have awakened an ancient bloodline..."
			src.SetVars()


		//Makyo gimmick is that they get even more power from buffs.
		MakyoAscension1()//PTE
			src.StrAscension+=0.5
			src.ForAscension+=0.5
			src.AscensionsAcquired=1
			src << "You're feeling spicy today."

		MakyoAscension2()//SSj1
			src.StrAscension+=0.5
			src.ForAscension+=0.5
			src.AscensionsAcquired=2
			src << "Your muscles are toned."

		MakyoAscension3()//SSj2
			src.StrAscension+=1
			src.ForAscension+=1
			src.AscensionsAcquired=3
			src << "Your bulk is wholesome."

		MakyoAscension4()//SSj3
			src.StrAscension+=1
			src.ForAscension+=1
			src.AscensionsAcquired=4
			src << "Your heft is considerable."

		MakyoAscension5()//SSj4
			src.StrAscension+=2
			src.ForAscension+=2
			src.AscensionsAcquired=5
			src << "Your girth is worldshattering."

		HalfSaiyanAscension1()
			src.AscensionsAcquired=1
			src.Desperation=3
			src.NewAnger(2.25)
			src.StrAscension+=0.25
			src.EndAscension+=0.25
			src.SpdAscension+=0.25
			src.ForAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.Intimidation*=1.25
		HalfSaiyanAscension2()
			src.AscensionsAcquired=2
			src.Desperation=2
			src.NewAnger(2.5)
			src.StrAscension+=0.25
			src.EndAscension+=0.25
			src.SpdAscension+=0.25
			src.ForAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.Intimidation/=1.25
			src.Intimidation*=1.5
		HalfSaiyanAscension3()
			src.AscensionsAcquired=3
			src.Desperation=1
			src.NewAnger(2.75)
			src.StrAscension+=0.25
			src.EndAscension+=0.25
			src.SpdAscension+=0.25
			src.ForAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.Intimidation/=1.5
			src.Intimidation*=1.75
		HalfSaiyanAscension4()
			src.AscensionsAcquired=4
			src.Desperation=0
			src.NewAnger(3)
			src.StrAscension+=0.25
			src.EndAscension+=0.25
			src.SpdAscension+=0.25
			src.ForAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.Intimidation/=1.75
			src.Intimidation*=2


		NamekianAscension1()//OF
			if(src.Class=="Warrior")
				src.SpdAscension+=0.5
				src.OffAscension+=0.5
				src.RecovAscension+=0.5
				src.NewAnger(1.5)
				src.Intimidation*=2
			if(src.Class=="Dragon")
				src.ForAscension+=0.5
				src.DefAscension+=0.5
				src.RecovAscension+=0.5
				if(locate(/obj/Skills/Utility/Heal, src))
					if(!locate(/obj/Skills/Utility/Send_Energy, src))
						src.AddSkill(new/obj/Skills/Utility/Send_Energy)
						src.AddSkill(new/obj/Skills/Give_Power)
						src << "You become more fluent in sharing your energy with others."
						for(var/obj/Skills/Utility/Send_Energy/se in src.contents)
							se.SagaSignature=1
							se.SignatureTechnique=0
						for(var/obj/Skills/Give_Power/gp in src.contents)
							gp.SagaSignature=1
							gp.SignatureTechnique=0
				if(src.ManaCapMult>1)
					src.ManaCapMult+=0.5
				if(src.AngerMax>=1.5)
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/Giant_Form, src))
						src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/Giant_Form)
						src << "You learn how to channel your excess lifeforce into monstrous growth."
					src.HellPower+=0.2
			src.AscensionsAcquired=1
		NamekianAscension2()//SSj
			if(src.Class=="Warrior")
				src.SpdAscension+=0.5
				src.OffAscension+=0.5
				src.RecovAscension+=0.5
			if(src.Class=="Dragon")
				src.ForAscension+=0.5
				src.DefAscension+=0.5
				src.RecovAscension+=0.5
				if(src.HellPower)
					src.HellPower+=0.2
			src.Intimidation*=10
			src.AscensionsAcquired=2
		NamekianAscension3()//SSj2
			if(src.Class=="Warrior")
				src.SpdAscension+=1
				src.OffAscension+=1
				src.RecovAscension+=1
			if(src.Class=="Dragon")
				src.ForAscension+=1
				src.DefAscension+=1
				src.RecovAscension+=1
				if(src.HellPower)
					src.HellPower+=0.2
			src.AscensionsAcquired=3
		NamekianAscension4()//SSj3
			if(src.Class=="Warrior")
				src.SpdAscension+=1
				src.OffAscension+=1
				src.RecovAscension+=1
			if(src.Class=="Dragon")
				src.ForAscension+=1
				src.DefAscension+=1
				src.RecovAscension+=1
				if(src.HellPower)
					src.HellPower+=0.2
			src.AscensionsAcquired=4
		NamekianAscension5()
			if(src.Class=="Warrior")
				src.SpdAscension+=2
				src.OffAscension+=2
			if(src.Class=="Dragon")
				src.ForAscension+=2
				src.DefAscension+=2
				if(src.HellPower)
					src.HellPower+=0.2
			src.AscensionsAcquired=5


		SaiyanAscension1()
			src.AscensionsAcquired=1
			if(!src.SaiyanAscension)
				var/Choice
				var/Confirm
				while(Confirm!="Yes")
					Choice=alert(src, "As your body recovers from grievious wounds, you feel yourself growing closer to your primal nature. What pillar of strength do you stand on?", "Zenkai Ascension", "Pride", "Honor", "Zeal")
					switch(Choice)
						if("Pride")
							Confirm=alert(src, "Prideful warriors crush those who oppose them with raw power.  Is this your priority?", "Zenkai Ascension", "Yes", "No")
						if("Honor")
							Confirm=alert(src, "Honorable warriors will never fail to endure and defy the odds. Is this your priority?", "Zenkai Ascension", "Yes", "No")
						if("Zeal")
							Confirm=alert(src, "Warriors of Zeal adapt faster and push themselves further than any other.  Is this your priority?", "Zenkai Ascension", "Yes", "No")
				src.SaiyanAscension=Choice
				switch(src.SaiyanAscension)
					if("Pride")
						src << "You gain the ability to keenly read the weaknesses of your opponents."
						src.Judgment=1
						src << "You realize you exist to tread on every opponent, no matter how defiant."
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Saiyan_Dominance)
					if("Honor")
						src << "You gain the ability to draw ire and drive to keep going by enduring powerful strikes."
						src.Defiance=1
						src << "You realize you exist to always hold the line, no matter how grim the situation becomes."
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Saiyan_Grit)
					if("Zeal")
						src << "You gain the ability to adjust and adapt to martial arts used by your enemies."
						src.Adaptation=1
						src << "You learn to explode with power to catch up to stronger opponents."
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Saiyan_Soul)
				src.Intimidation*=1.25
				src << "Some of the primal might of the Oozaru now infuses your normal form."
				src << "You stake your life on [src.SaiyanAscension]!"
		SaiyanAscension2()
			if(src.SaiyanAscension)
				src.AscensionsAcquired=2
				src.NewAnger(1.75)
				src.Intimidation/=1.25
				src.Intimidation*=1.5
				src << "More of the primal might of the Oozaru now infuses your normal form."
		SaiyanAscension3()
			if(src.SaiyanAscension)
				src.AscensionsAcquired=3
				src.Intimidation/=1.5
				src.Intimidation*=1.75
				src << "More of the primal might of the Oozaru now infuses your normal form."
		SaiyanAscension4()
			if(src.SaiyanAscension)
				src.AscensionsAcquired=4
				src.NewAnger(2)
				src.Intimidation=2
				src << "You now access the primal power of the Oozaru at your base form!"


		TuffleAscension1()//OF
			src.AscensionsAcquired=1
			src.RecovAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.NewAnger(1.5)
			src.RPPMult+=0.25
			src.Intelligence+=0.25
			src.PilotingProwess+=0.25
			src.EnhanceChipsMax+=1
		TuffleAscension2()//SSj
			src.AscensionsAcquired=2
			src.RecovAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.RPPMult+=0.25
			src.Intelligence+=0.25
			src.PilotingProwess+=0.25
			src.EnhanceChipsMax+=1
			src << "Your scientific mind sharpens further."
		TuffleAscension3()//SSj2
			src.AscensionsAcquired=3
			src.RecovAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.RPPMult+=0.25
			src.Intelligence+=0.25
			src.PilotingProwess+=0.25
			src.EnhanceChipsMax+=1
			src << "Your scientific mind sharpens further."
		TuffleAscension4()//SSj3
			src.AscensionsAcquired=4
			src.RecovAscension+=0.25
			src.OffAscension+=0.25
			src.DefAscension+=0.25
			src.RPPMult+=0.25
			src.Intelligence+=0.25
			src.PilotingProwess+=0.25
			src.EnhanceChipsMax+=1
			src << "You develop a mind capable of rivaling super-computers!"
		TuffleAscension5()
			src.AscensionsAcquired=5
			src.RecovAscension+=1
			src.OffAscension+=1
			src.DefAscension+=1
			src.NewAnger(2)
			src.Imagination+=1.25
			src.PilotingProwess+=1
			src.EnhanceChipsMax+=2
			src << "Your imagination develops to match your unrivalled intellect!"


		AlienAscension1()
			src.AscensionsAcquired=1
			src.Intimidation*=2
			src.SetVars()
			if(!src.Symbiote&&!src.Metamorean)
				src << "Your body mutates in completely novel ways!"
				src.AlienRacials()
				if(src.AlienEvolutionStats<2)
					src.AlienStatAscensions(2)
			else if(src.Metamorean)
				src << "Your body recovers some of its individual power!"
				src.RPPower+=0.25
				for(var/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance/FD in src)
					FD.Mastery+=1
			else
				src << "Your symbiote evolved!"
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/S in src)
					S.PowerMult=1
					S.VaizardHealth=2.5
		AlienAscension2()
			src.AscensionsAcquired=2
			src.Intimidation*=2.5
			src.SetVars()
			if(!src.Symbiote&&!src.Metamorean)
				src << "Your body mutates in completely novel ways!"
				src.AlienRacials()
				if(src.AlienEvolutionStats<5)
					src.AlienStatAscensions(3)
			else if(src.Metamorean)
				src << "Your body recovers its full individual power!"
				src.RPPower+=0.25
				for(var/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance/FD in src)
					FD.Mastery+=2
			else
				src << "Your symbiote evolved!"
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/S in src)
					S.PowerMult=1
					S.VaizardHealth=3

		AlienAscension3()
			src.AscensionsAcquired=3
			src.Intimidation*=2
			src.SetVars()
			if(!src.Symbiote&&!src.Metamorean)
				src << "Your body mutates in completely novel ways!"
				src.AlienRacials()
				if(src.AlienEvolutionStats<7)
					src.AlienStatAscensions(2)
			else if(src.Metamorean)
				src << "Your body recovers some of its individual power!"
				src.RPPower+=0.25
				for(var/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance/FD in src)
					FD.Mastery+=1
			else
				src << "Your symbiote evolved!"
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/S in src)
					S.PowerMult=1
					S.VaizardHealth=3.5
					S.Curse=1
		AlienAscension4()
			src.AscensionsAcquired=4
			src.Intimidation*=2
			src.SetVars()
			if(!src.Symbiote&&!src.Metamorean)
				src << "Your body mutates in completely novel ways!"
				src.AlienRacials()
				if(src.AlienEvolutionStats<10)
					src.AlienStatAscensions(3)
			else if(src.Metamorean)
				src << "Your body recovers its full individual power!"
				src.RPPower+=0.25
				for(var/obj/Skills/Buffs/SlotlessBuffs/Fusion_Dance/FD in src)
					FD.Mastery+=2
			else
				src << "Your symbiote evolved, but became harder to control!"
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/S in src)
					S.PowerMult=1
					S.VaizardHealth=4


		MonsterAscensionX(var/Value)
			if(src.AscensionsUnlocked==0)
				src << "You do not have any ascensions unlocked, but the code sure is trying to give you one."
				return
			if(!Value)
				src << "Your monster ascension was triggered without noting what ascension level it is."
				return
			src.AscensionsAcquired++
			if(Value==1)
				src.Intimidation*=2//2
			else if(Value==2)
				src.Intimidation*=5//10
			else if(Value==3)
				src.Intimidation*=2//20
			else if(Value==4)
				src.Intimidation*=2//40


			switch(src.Class)
				if("Yokai")
					src.NewAnger(max(1, src.AngerMax-0.1), Override=1)
					if(src.AngerMax<1)
						src.AngerMax=1
					//at asc5+, if they have an activebuff and arent mechanized, they gain manastats and manaleak
					src.ManaCapMult+=0.25
					src.TechniqueMastery+=2
					if(Value==5)
						src.ManaCapMult+=0.25
				if("Beastmen")
					src.AngerPoint+=5
					for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Berserk/b in src.Buffs)
						b.NeedsHealth=max(5, 5+(src.AscensionsAcquired*5))
					if(Value==5)
						src.EndlessAnger++
				if("Eldritch")
					src.DebuffImmune+=1
					src.VenomResistance+=0.5
					src.Void=1
					src.SoulFire+=0.2
					src.DeathField+=1
					src.VoidField+=1
					if(Value==3)
						src.StaticWalk=1
						src.NoDeath=1
						src.AddSkill(new/obj/Skills/Teleport/Warp)
					if(Value==5)
						src.PureReduction+=5
			switch(src.MonsterClass)
				if("Warrior")
					src.StrAscension+=0.2
					src.EndAscension+=0.2
					src.DefAscension+=0.2
				if("Hunter")
					src.StrAscension+=0.2
					src.SpdAscension+=0.2
					src.ForAscension+=0.2
				if("Shaman")
					src.EndAscension+=0.2
					src.ForAscension+=0.2
					src.OffAscension+=0.2
			switch(src.MonsterSource)
				if("Domination")
					src.Intimidation/=1+(2*(src.AscensionsAcquired-1)/10)
					src.Intimidation*=1+(2*(src.AscensionsAcquired)/10)
					src.PowerBoost/=(1+((src.AscensionsAcquired-1)/10))
					src.PowerBoost*=(1+((src.AscensionsAcquired)/10))
				if("Determination")
					src.Desperation+=0.7
					src.OffAscension+=0.2
					src.DefAscension+=0.2
				if("Ingenuity")
					src.RPPMult+=0.2
					src.Intelligence+=0.2
					src.Imagination+=0.2
					src.EconomyMult+=0.2
					src.PilotingProwess+=0.2
					src.PotentialRate+=1
					if(src.AscensionsAcquired==5)
						src.PotentialRate=10
			switch(src.MonsterAscension)
				if("Celestial")
					src.HolyMod+=1
					src.MovementMastery+=2
					src.RecovAscension+=((3-src.RecovMod)/5)
					src.SpiritPower+=0.2
					if(Value==3)
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Celestial_Ascension)
				if("Natural")
					src.BuffMastery+=0.6
					src.SpdAscension+=((3-src.SpdMod)/5)
					src.LegendaryPower+=0.2
					if(Value==3)
						src.EnhancedSmell=1
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Boss_Form)
				if("Infernal")
					src.AbyssMod+=1
					src.NewAnger(src.AngerMax+0.1)
					if(Value==1)
						src.HellPower+=0.5
					else
						src.HellPower+=0.25
					if(Value==3)
						src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Regeneration)
						for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in src)
							r.RegenerateLimbs=1


		ShinjinAscension1()
			src.AscensionsAcquired=1

			src.AddSkill(new/obj/Skills/Utility/Unlock_Potential)
			src<<"You learn to draw forth the full potential of those you choose."

			src.AddSkill(new/obj/Skills/Utility/Bind_To_Plane)
			src.AddSkill(new/obj/Skills/Teleport/Kai_Kai)//kaio tp


			if(src.ShinjinAscension=="Kai")
				//src.contents+=new/obj/Items/Symbiotic/Potara_Earrings/Right_Earring
				//src.contents+=new/obj/Items/Symbiotic/Potara_Earrings/Left_Earring
				if(!locate(/obj/Skills/Utility/Heal, src))
					src.AddSkill(new/obj/Skills/Utility/Heal)
				if(!locate(/obj/Skills/Utility/Send_Energy, src))
					src.AddSkill(new/obj/Skills/Utility/Send_Energy)
				//give life will go here
				src << "You learn how to give your life force to empower others!"
			if(src.ShinjinAscension=="Makai")
				if(!locate(/obj/Skills/Utility/Contractor, src))
					src.AddSkill(new/obj/Skills/Utility/Contractor)
				src.ContractPowered=1
				src.Intimidation*=5
				src.PotentialCap*=2
				src.GodKi+=0.5
				src<<"You learn how to claim dominion over souls."


		DemonAscension1()
			src.AscensionsAcquired=1
			src.Class="C"
		DemonAscension2()
			src.AscensionsAcquired=2
			src.Class="B"
		DemonAscension3()
			src.AscensionsAcquired=3
			src.Class="A"
			src.EnhancedSmell=1
		DemonAscension4()
			src.AscensionsAcquired=4
			src.Class="S"
			src.EnhancedHearing=1
		DemonAscension5()
			src.AscensionsAcquired=5
			src.PotentialRate=10
			src.PotentialCap*=2
			src.EndlessAnger+=1
			src.Anger=2
			src.Class="Maou"


		DjinnAscension1()//SSj2 - Fat Buu
			src.AscensionsAcquired=1
			src.PotentialRate=7.5
			src.FatigueImmune=0
			src<<"Through absorbing a sentient creature you have gained a new level of restraint in your actions."
		DjinnAscension2()//SSj3 - Super Buu
			src.AscensionsAcquired=2
			src.PotentialRate=5
			src.InjuryImmune=0
			src<<"Through absorbing more sentient creatures you've gained the ability to include their traits in your physiology."
		DjinnAscension3()//SSj3+ - Kid Buu
			src.AscensionsAcquired=3
			src.NewAnger(3)
			src.PotentialRate=10
			src.PotentialCap*=10
			src.FatigueImmune=1
			src.InjuryImmune=1
			src.StrAscension=0
			src.EndAscension=0
			src.SpdAscension=0
			src.ForAscension=0
			src.OffAscension=0
			src.DefAscension=0
			src.RecovAscension=0
			src.RPPower=1
			src.RPPMult=2
			src.Intelligence=0.25
			src.Imagination=4
			src.EconomyMult=1
			src.BioArmorMax=0
			src.Desperation=0
			src.PilotingProwess=0
			src.KiControlMastery=0
			src.Adaptation=0
			src.Judgment=0
			src.Defiance=0
			src.HellPower=0
			src.SpiritPower=0
			src.Juggernaut=0
			src.Burning=0
			src.Chilling=0
			src.Crushing=0
			src.Shocking=0
			src.Hustle=0
			src.Anaerobic=0
			src.Infusion=0
			src.Flicker=0
			src.Adrenaline=0
			src.EnhancedSmell=0
			src.EnhancedHearing=0
			src.see_invisible=0
			src.Fishman=0
			src.VenomBlood=0
			src.VenomResistance=0
			src.VenomImmune=0
			src.ManaCapMult=0
			src.WalkThroughHell=0
			src.DebuffImmune=0
			src.NoDeath=0
			src.PureReduction=0
			src.DeathField=0
			for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in src)
				r.CooldownScaling=0
				r.CooldownScalingCounter=0
			src.EndlessAnger+=1
			src<<"You've cast away all that you've learned to return to your primal, furious and inexhaustible nature!"

		DragonAscension1()
			src.AscensionsAcquired=1
			if(src.StrAscension)
				src.StrAscension=0.5
			if(src.EndAscension)
				src.EndAscension=0.5
			if(src.ForAscension)
				src.ForAscension=0.5
			if(src.OffAscension)
				src.OffAscension=0.5
			if(src.DefAscension)
				src.DefAscension=0.5
			if(src.RecovAscension)
				src.RecovAscension=0.5
			src.Intimidation*=2//5
		DragonAscension2()
			src.AscensionsAcquired=2
			if(src.StrAscension)
				src.StrAscension=0.75
			if(src.EndAscension)
				src.EndAscension=0.75
			if(src.ForAscension)
				src.ForAscension=0.75
			if(src.OffAscension)
				src.OffAscension=0.75
			if(src.DefAscension)
				src.DefAscension=0.75
			if(src.RecovAscension)
				src.RecovAscension=0.75
			src.Intimidation*=2//10
			src.GodKi+=0.05
		DragonAscension3()
			src.AscensionsAcquired=3
			if(src.StrAscension)
				src.StrAscension=1
			if(src.EndAscension)
				src.EndAscension=1
			if(src.ForAscension)
				src.ForAscension=1
			if(src.OffAscension)
				src.OffAscension=1
			if(src.DefAscension)
				src.DefAscension=1
			if(src.RecovAscension)
				src.RecovAscension=1
			src.Intimidation*=2//20
			src.GodKi+=0.05
		DragonAscension4()
			src.AscensionsAcquired=4
			if(src.StrAscension)
				src.StrAscension=1.25
			if(src.EndAscension)
				src.EndAscension=1.25
			if(src.ForAscension)
				src.ForAscension=1.25
			if(src.OffAscension)
				src.OffAscension=1.25
			if(src.DefAscension)
				src.DefAscension=1.25
			if(src.RecovAscension)
				src.RecovAscension=1.25
			if(src.AngerPoint>=75)
				if(!src.DarknessFlame)
					src.DarknessFlame+=1
			if(src.Fishman)
				if(!src.AbsoluteZero)
					src.AbsoluteZero+=1
			if(src.Godspeed)
				if(!src.StunningStrike)
					src.StunningStrike+=1
			if(src.Hardening)
				if(!src.PureReduction)
					src.PureReduction+=2
			if(src.VenomResistance)
				if(!src.PureDamage)
					src.PureDamage+=2
			src.Intimidation+=10//30
			src.GodKi+=0.05
		DragonAscension5()
			src.AscensionsAcquired=5
			if(src.StrAscension)
				src.StrAscension=1.5
			if(src.EndAscension)
				src.EndAscension=1.5
			if(src.ForAscension)
				src.ForAscension=1.5
			if(src.OffAscension)
				src.OffAscension=1.5
			if(src.DefAscension)
				src.DefAscension=1.5
			if(src.RecovAscension)
				src.RecovAscension=1.5
			if(src.AngerPoint>=75)
				if(!src.DarknessFlame)
					src.DarknessFlame+=1
			if(src.Fishman)
				if(!src.AbsoluteZero)
					src.AbsoluteZero+=1
			if(src.Godspeed)
				if(!src.StunningStrike)
					src.StunningStrike+=1
			if(src.Hardening)
				if(!src.PureReduction)
					src.PureReduction+=2
			if(src.VenomResistance)
				if(!src.PureDamage)
					src.PureDamage+=2
			src.Intimidation+=10//40
			src.GodKi+=0.05
		DragonAscension6()
			src.AscensionsAcquired=6
			if(src.StrAscension)
				src.StrAscension=2
			if(src.EndAscension)
				src.EndAscension=2
			if(src.ForAscension)
				src.ForAscension=2
			if(src.OffAscension)
				src.OffAscension=2
			if(src.DefAscension)
				src.DefAscension=2
			if(src.RecovAscension)
				src.RecovAscension=2
			if(src.AngerPoint>=75)
				if(!src.DarknessFlame)
					src.DarknessFlame+=1
			if(src.Fishman)
				if(!src.AbsoluteZero)
					src.AbsoluteZero+=1
			if(src.Godspeed)
				if(!src.StunningStrike)
					src.StunningStrike+=1
			if(src.Hardening)
				if(!src.PureReduction)
					src.PureReduction+=2
			if(src.VenomResistance)
				if(!src.PureDamage)
					src.PureDamage+=2
			src.Intimidation+=10//50
			src.GodKi+=0.05

		AndroidAscension1()//pre-SSj
			src.AscensionsAcquired=1
			src.EnhancedStrength+=0.05
			src.EnhancedEndurance+=0.05
			src.EnhancedForce+=0.05
			src.EnhancedSpeed+=0.05
			src.EnhancedAggression+=0.05
			src.EnhancedReflexes+=0.05
		AndroidAscension2()//SSJ
			src.AscensionsAcquired=2
			src.EnhancedStrength+=0.05
			src.EnhancedEndurance+=0.05
			src.EnhancedForce+=0.05
			src.EnhancedSpeed+=0.05
			src.EnhancedAggression+=0.05
			src.EnhancedReflexes+=0.05
		AndroidAscension3()//SSj2
			src.AscensionsAcquired=3
			src.EnhancedStrength+=0.5
			src.EnhancedEndurance+=0.5
			src.EnhancedForce+=0.5
			src.EnhancedSpeed+=0.5
			src.EnhancedAggression+=0.5
			src.EnhancedReflexes+=0.5
		AndroidAscension4()//SSj3
			src.AscensionsAcquired=4
			src.EnhancedStrength+=0.5
			src.EnhancedEndurance+=0.5
			src.EnhancedForce+=0.5
			src.EnhancedSpeed+=0.5
			src.EnhancedAggression+=0.5
			src.EnhancedReflexes+=0.5
		AndroidAscension5()
			src.AscensionsAcquired=5
			src.EnhancedStrength+=2
			src.EnhancedEndurance+=2
			src.EnhancedForce+=2
			src.EnhancedSpeed+=2
			src.EnhancedAggression+=2
			src.EnhancedReflexes+=2

		ChangelingAscension1()
			src.AscensionsAcquired=1
			src.masteries["1mastery"]=100
			src.Class=alert(src, "After a period of growing aquainted with your incredible power, you finally started to ponder on its true source. Is it just raw, unhinged talent or did you arrive at the summit through careful experimentation and pushing your limits?", "Changeling Ascension", "Prodigy", "Experience")
			if(src.Class=="Prodigy")
				src.Intimidation*=2
				src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/OneHundredPercentPower)
			if(src.Class=="Experience")
				src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/FifthForm)
			src.RecovAscension+=0.25
		ChangelingAscension2()
			src.AscensionsAcquired=2
			src.masteries["2mastery"]=100
			src.RecovAscension+=0.25
		ChangelingAscension3()
			src.AscensionsAcquired=3
			src.masteries["3mastery"]=100
			src.RecovAscension+=0.25
		ChangelingAscension4()
			src.AscensionsAcquired=4
			src.trans["unlocked"]=4
			src.RecovAscension+=0.25



		DamageSelf(var/val)
			val=BalanceDamage(val)
			if(src.Health-val<=src.AngerPoint*(1-src.HealthCut))
				if(!src.Anger&&!src.HasCalmAnger()&&!src.HasNoAnger()&&!src.AngerCD)
					src.Anger()
					val/=src.AngerMax
			if(src.VaizardHealth)
				src.VaizardHealth-=val
				if(src.VaizardHealth<=0)
					if(src.ActiveBuff)
						if(src.ActiveBuff.VaizardShatter)
							src.ActiveBuff.Trigger(src)
					if(src.SpecialBuff)
						if(src.SpecialBuff.VaizardShatter)
							src.SpecialBuff.Trigger(src)
					for(var/obj/Skills/Buffs/SlotlessBuffs/b in src.SlotlessBuffs)
						if(b.VaizardShatter)
							b.Trigger(src)
					if(src.VaizardHealth<0)
						val=((-1)*src.VaizardHealth)
						src.VaizardHealth=0
					else
						val=0
				else
					val=0
			if(src.BioArmor)
				src.BioArmor-=val
				if(src.BioArmor<=0)
					val=(-1)*src.BioArmor
					src.BioArmor=0
				else
					val=0
			if(src.Desperation&&!src.HasInjuryImmune()&&(!src.CyberCancel||src.Saga=="King of Braves"))
				src.WoundSelf(val/src.Desperation)//Take all damage as wounds
				val=0//but no health damage.
			src.Health-=val
			if(src.CursedWounds())
				src.WoundSelf(val)
			if(src.Health<=0&&!src.KO)
				if(src.Burn&&src.Poison)
					src.Unconscious(null, "succumbing to terrible pain!")
				if(src.Burn&&!src.Poison)
					src.Unconscious(null, "getting burned out!")
				if(src.Poison&&!src.Burn)
					src.Unconscious(null, "succumbing to poison!")
				if(!src.Burn&&!src.Poison)
					src.Unconscious()

		DoDamage(var/mob/m, var/val, var/UnarmedAttack=0, var/SwordAttack=0, var/SecondStrike, var/ThirdStrike, var/TrueMult=0, var/SpiritAttack=0, var/Destructive=0)
			if(src.Stasis||m.Stasis)
				return
			if(m==src)
				src.DamageSelf(val)
				return

			if(istype(m, /mob/Player/AI) && m !=src)
				var/mob/Player/AI/a = m
				if(a.ai_adapting_power && !a.ai_power_adapted) //First time adaption occurs instantly so that AI can't be destroyed before actually adapting.
					a.ai_power_adapted=1
					a.Target=src
					a.AIAvailablePower()
				if(!a.ai_team_fire && a.AllianceCheck(src))
					return

			if(src.HasPhysicalHitsLimit())
				if(UnarmedAttack||SwordAttack)
					if(src.ActiveBuff)
						if(src.ActiveBuff.PhysicalHitsLimit)
							src.ActiveBuff.PhysicalHits++
							if(src.ActiveBuff.PhysicalHits>=src.ActiveBuff.PhysicalHitsLimit)
								src.ActiveBuff.PhysicalHits=0
								src.ActiveBuff.Trigger(src)
					if(src.SpecialBuff)
						if(src.SpecialBuff.PhysicalHitsLimit)
							src.SpecialBuff.PhysicalHits++
							if(src.SpecialBuff.PhysicalHits>=src.SpecialBuff.PhysicalHitsLimit)
								src.SpecialBuff.PhysicalHits=0
								src.SpecialBuff.Trigger(src)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.PhysicalHitsLimit)
								sb.PhysicalHits++
								if(sb.PhysicalHits>=sb.PhysicalHitsLimit)
									sb.PhysicalHits=0
									sb.Trigger(src)
					if(src.StanceBuff)
						if(src.StanceBuff.PhysicalHitsLimit)
							src.StanceBuff.PhysicalHits++
							if(src.StanceBuff.PhysicalHits>=src.StanceBuff.PhysicalHitsLimit)
								src.StanceBuff.PhysicalHits=0
								src.StanceBuff.Trigger(src)
					if(src.StyleBuff)
						if(src.StyleBuff.PhysicalHitsLimit)
							src.StyleBuff.PhysicalHits++
							if(src.StyleBuff.PhysicalHits>=src.StyleBuff.PhysicalHitsLimit)
								src.StyleBuff.PhysicalHits=0
								src.StyleBuff.Trigger(src)

			if(src.HasSwordHitsLimit())
				if(SwordAttack)
					if(src.ActiveBuff)
						if(src.ActiveBuff.SwordHitsLimit)
							src.ActiveBuff.SwordHits++
							if(src.ActiveBuff.SwordHits>=src.ActiveBuff.SwordHitsLimit)
								src.ActiveBuff.SwordHits=0
								src.ActiveBuff.Trigger(src)
					if(src.SpecialBuff)
						if(src.SpecialBuff.SwordHitsLimit)
							src.SpecialBuff.SwordHits++
							if(src.SpecialBuff.SwordHits>=src.SpecialBuff.SwordHitsLimit)
								src.SpecialBuff.SwordHits=0
								src.SpecialBuff.Trigger(src)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.SwordHitsLimit)
								sb.SwordHits++
								if(sb.SwordHits>=sb.SwordHitsLimit)
									sb.SwordHits=0
									sb.Trigger(src)
					if(src.StanceBuff)
						if(src.StanceBuff.SwordHitsLimit)
							src.StanceBuff.SwordHits++
							if(src.StanceBuff.SwordHits>=src.StanceBuff.SwordHitsLimit)
								src.StanceBuff.SwordHits=0
								src.StanceBuff.Trigger(src)
					if(src.StyleBuff)
						if(src.StyleBuff.SwordHitsLimit)
							src.StyleBuff.SwordHits++
							if(src.StyleBuff.SwordHits>=src.StyleBuff.SwordHitsLimit)
								src.StyleBuff.SwordHits=0
								src.StyleBuff.Trigger(src)

			if(src.HasUnarmedHitsLimit())
				if(UnarmedAttack)
					if(src.ActiveBuff)
						if(src.ActiveBuff.UnarmedHitsLimit)
							src.ActiveBuff.UnarmedHits++
							if(src.ActiveBuff.UnarmedHits>=src.ActiveBuff.UnarmedHitsLimit)
								src.ActiveBuff.UnarmedHits=0
								src.ActiveBuff.Trigger(src)
					if(src.SpecialBuff)
						if(src.SpecialBuff.UnarmedHitsLimit)
							src.SpecialBuff.UnarmedHits++
							if(src.SpecialBuff.UnarmedHits>=src.SpecialBuff.UnarmedHitsLimit)
								src.SpecialBuff.UnarmedHits=0
								src.SpecialBuff.Trigger(src)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.UnarmedHitsLimit)
								sb.UnarmedHits++
								if(sb.UnarmedHits>=sb.UnarmedHitsLimit)
									sb.UnarmedHits=0
									sb.Trigger(src)
					if(src.StanceBuff)
						if(src.StanceBuff.UnarmedHitsLimit)
							src.StanceBuff.UnarmedHits++
							if(src.StanceBuff.UnarmedHits>=src.StanceBuff.UnarmedHitsLimit)
								src.StanceBuff.UnarmedHits=0
								src.StanceBuff.Trigger(src)
					if(src.StyleBuff)
						if(src.StyleBuff.UnarmedHitsLimit)
							src.StyleBuff.UnarmedHits++
							if(src.StyleBuff.UnarmedHits>=src.StyleBuff.UnarmedHitsLimit)
								src.StyleBuff.UnarmedHits=0
								src.StyleBuff.Trigger(src)

			if(src.HasSpiritHitsLimit())
				if(SpiritAttack)
					if(src.ActiveBuff)
						if(src.ActiveBuff.SpiritHitsLimit)
							src.ActiveBuff.SpiritHits++
							if(src.ActiveBuff.SpiritHits>=src.ActiveBuff.SpiritHitsLimit)
								src.ActiveBuff.SpiritHits=0
								src.ActiveBuff.Trigger(src)
					if(src.SpecialBuff)
						if(src.SpecialBuff.SpiritHitsLimit)
							src.SpecialBuff.SpiritHits++
							if(src.SpecialBuff.SpiritHits>=src.SpecialBuff.SpiritHitsLimit)
								src.SpecialBuff.SpiritHits=0
								src.SpecialBuff.Trigger(src)
					if(src.SlotlessBuffs.len>0)
						for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
							if(sb.SpiritHitsLimit)
								sb.SpiritHits++
								if(sb.SpiritHits>=sb.SpiritHitsLimit)
									sb.SpiritHits=0
									sb.Trigger(src)
					if(src.StanceBuff)
						if(src.StanceBuff.SpiritHitsLimit)
							src.StanceBuff.SpiritHits++
							if(src.StanceBuff.SpiritHits>=src.StanceBuff.SpiritHitsLimit)
								src.StanceBuff.SpiritHits=0
								src.StanceBuff.Trigger(src)
					if(src.StyleBuff)
						if(src.StyleBuff.SpiritHitsLimit)
							src.StyleBuff.SpiritHits++
							if(src.StyleBuff.SpiritHits>=src.StyleBuff.SpiritHitsLimit)
								src.StyleBuff.SpiritHits=0
								src.StyleBuff.Trigger(src)

			if(src.Quaking)
				spawn()
					src.Quake(src.Quaking)

			val=BalanceDamage(val)
			if(istype(m, /mob/Player/AI))
				if(m.RPPower>1)
					val*=0.25
			else
				val*=global.WorldDamageMult

			if(m.HasIntimidation())
				var/Effective=m.GetIntimidation()
				if(m.CheckSlotless("Saiyan Soul"))
					if(!m.Target.CheckSlotless("Saiyan Soul"))
						if(Effective<m.Target.GetIntimidation())
							Effective=m.Target.GetIntimidation()
				if(Effective>0)
					if(Effective>1)
						var/Ratio=src.GetIntimidationIgnore(m)
						var/Ignored=Effective*Ratio
						Effective-=Ignored
					if(Effective<=0)
						Effective=1
					TrueMult -= (min(100,Effective)/100) + (Effective > 100 ? max(0,(Effective-100)/300) : 0)

			if(src.TimeStop)
				val/=10
			for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/A in src)
				if(A.Infatuated&&A.Password==m.name)
					val/=1+A.Infatuated

			if(src.CriticalChance&&src.CriticalDamage)
				if(prob(src.CriticalChance)&&src.StandardBiology())
					val*=src.CriticalDamage
			if(m.BlockChance&&m.CriticalBlock)
				if(prob(m.BlockChance))
					val/=m.CriticalBlock

			if(src.Desperation&&!src.HasInjuryImmune()&&(!src.CyberCancel||src.Saga=="King of Braves"))
				TrueMult+=round(((0.05*src.Desperation)*(src.TotalInjury/100)), 0.01)*10
			if(m.Desperation&&!m.HasInjuryImmune()&&(!m.CyberCancel||m.Saga=="King of Braves"))
				TrueMult-=round(((0.05*m.Desperation)*(m.TotalInjury/100)), 0.01)*10

			var/puredam=src.HasPureDamage()
			if(puredam)
				TrueMult+=puredam
			var/purered=m.HasPureReduction()
			if(purered)
				TrueMult-=purered

			if(src.HasUnarmedDamage()&&UnarmedAttack)
				TrueMult+=src.GetUnarmedDamage()
			if(src.HasSpiritualDamage()&&SpiritAttack)
				TrueMult+=src.GetSpiritualDamage()
			if(src.HasDuelist() && src.Target)
				if(src.Target==m)
					TrueMult+=src.GetDuelist()
				else
					TrueMult-=src.GetDuelist()
			if(m.HasDuelist() && m.Target)
				if(m.Target==src)
					TrueMult-=m.GetDuelist()
				else
					TrueMult+=m.GetDuelist()

			if(!SpiritAttack)
				if(src.Race=="Alien"&&(src.AscensionsAcquired>=5||src.TransActive()||src.GetPassive("TransMimic", BuffsOnly=1, NoMobVar=1)))
					switch(src.Class)
						if("Brutality")
							TrueMult+=src.AscensionsAcquired/2
						if("Ferocity")
							TrueMult+=src.AscensionsAcquired/4
				if(m.Race=="Alien"&&(src.AscensionsAcquired>=5||m.TransActive()||m.GetPassive("TransMimic", BuffsOnly=1, NoMobVar=1)))
					switch(m.Class)
						if("Tenacity")
							TrueMult-=m.AscensionsAcquired/2
						if("Sagacity")
							TrueMult-=m.AscensionsAcquired/4
			else
				if(src.Race=="Alien"&&(src.AscensionsAcquired>=5||src.TransActive()||src.GetPassive("TransMimic", BuffsOnly=1, NoMobVar=1)))
					switch(src.Class)
						if("Harmony")
							TrueMult+=src.AscensionsAcquired/2
						if("Ferocity")
							TrueMult+=src.AscensionsAcquired/4
				if(m.Race=="Alien"&&(src.AscensionsAcquired>=5||m.TransActive()||m.GetPassive("TransMimic", BuffsOnly=1, NoMobVar=1)))
					switch(m.Class)
						if("Equanimity")
							TrueMult-=m.AscensionsAcquired/2
						if("Sagacity")
							TrueMult-=m.AscensionsAcquired/4

			if(src.UsingDireFist()||src.UsingDarkElementSword()||src.ElementalOffense=="Dark"||src.Race=="Demon")
				var/Effective=1
				if(src.UsingDarkElementSword())
					Effective*=0.5
				if(src.UsingAtomicFist())
					Effective*=2
				if(src.Race=="Demon")
					Effective+=src.AscensionsAcquired
				if(Effective>0&&src.Anger)
					TrueMult+=Effective
				if(src.Race=="Demon"&&!src.Anger)
					TrueMult+=(Effective/2)
			if((src.UsingTranquilFist()||src.UsingLightElementSword()||src.ElementalOffense=="Light")&&m.Race!="Demon")
				var/Effective=1
				if(src.UsingLightElementSword())
					Effective*=0.5
				if(src.UsingAtomicFist())
					Effective*=2
				if(Effective>0&&(m.Anger||m.AngerCD))
					TrueMult+=Effective
			if(m.UsingDireFist()||m.HasElementalDefense("Dark")||m.Race=="Demon")
				var/Effective=1
				if(m.UsingAtomicFist())
					Effective*=2
				if(m.Race=="Demon")
					Effective+=m.AscensionsAcquired
				if(Effective>0&&m.Anger)
					TrueMult-=Effective
				if(m.Race=="Demon"&&!m.Anger)
					TrueMult+=(Effective/2)
			if((m.UsingTranquilFist()||m.HasElementalDefense("Light"))&&src.Race!="Demon")
				var/Effective=1
				if(m.UsingAtomicFist())
					Effective*=2
				if(Effective>0&&(src.Anger||src.AngerCD))
					TrueMult-=Effective
			if(m.CheckSlotless("Heartless"))
				if(src.CheckActive("Keyblade"))
					TrueMult+=src.SagaLevel
			if(src.CheckSlotless("Heartless"))
				if(m.CheckActive("Keyblade"))
					TrueMult-=src.SagaLevel

			var/OldEDefense
			var/obj/Items/Armor/armr=m.EquippedArmor()
			if(armr)
				if(armr.Element)
					OldEDefense=m.ElementalDefense
					m.ElementalDefense=armr.Element

			TrueMult+=(ElementalCheck(src, m))

			var/PreviousElement
			if(src.HasSword()&&SwordAttack)
				var/obj/Items/Sword/s=src.EquippedSword()
				var/obj/Items/Sword/s2=src.EquippedSecondSword()
				var/obj/Items/Sword/s3=src.EquippedThirdSword()
				if(!SecondStrike&&!ThirdStrike)
					if(s.Element)
						PreviousElement=src.ElementalOffense
						src.ElementalOffense=s.Element
						TrueMult+=(ElementalCheck(src, m))
						src.ElementalOffense=PreviousElement
				if(SecondStrike&&!ThirdStrike)
					if(s2)
						if(s2.Element)
							PreviousElement=src.ElementalOffense
							src.ElementalOffense=s2.Element
							TrueMult+=(ElementalCheck(src, m))
							src.ElementalOffense=PreviousElement
					else
						PreviousElement=src.ElementalOffense
						src.ElementalOffense=s.Element
						TrueMult+=(ElementalCheck(src, m))
						src.ElementalOffense=PreviousElement
				if(SecondStrike&&ThirdStrike)
					if(s3)
						if(s3.Element)
							PreviousElement=src.ElementalOffense
							src.ElementalOffense=s3.Element
							TrueMult+=(ElementalCheck(src, m))
							src.ElementalOffense=PreviousElement
					else
						PreviousElement=src.ElementalOffense
						src.ElementalOffense=s.Element
						TrueMult+=(ElementalCheck(src, m))
						src.ElementalOffense=PreviousElement

			if(src.HasStaff())
				if(SpiritAttack||src.UsingBattleMage())
					if(src.NotUsingMagicSword())
						var/obj/Items/Enchantment/Staff/s=src.EquippedStaff()
						if(!src.ArcaneBladework)
							if(s.Element)
								PreviousElement=src.ElementalOffense
								src.ElementalOffense=s.Element
								TrueMult+=(ElementalCheck(src, m))
								src.ElementalOffense=PreviousElement
						else
							if(SecondStrike)
								if(s.Element)
									PreviousElement=src.ElementalOffense
									src.ElementalOffense=s.Element
									TrueMult+=(ElementalCheck(src, m))
									src.ElementalOffense=PreviousElement

			if(src.HasBurning())
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Fire"
				TrueMult+=(ElementalCheck(src, m, DebuffIntensity=max(GetBurning(),1)))
				src.ElementalOffense=PreviousElement
			if(src.HasScorching())
				if(!m.Burn&&!m.HasDebuffImmune())
					OMsg(src, "<font color='[rgb(204, 153, 51)]'>[m] erupts in flames!!</font color>")
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Fire"
				TrueMult+=(ElementalCheck(src, m, 1, GetScorching()))
				src.ElementalOffense=PreviousElement
			if(src.HasChilling())
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Water"
				TrueMult+=(ElementalCheck(src, m, DebuffIntensity=max(GetChilling(),1)))
				src.ElementalOffense=PreviousElement
			if(src.HasFreezing())
				if(!m.Slow&&!m.HasDebuffImmune())
					OMsg(src, "<font color='[rgb(51, 153, 204)]'>[m] freezes to the bone!!</font color>")
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Water"
				TrueMult+=(ElementalCheck(src, m, 1, GetFreezing()))
				src.ElementalOffense=PreviousElement
			if(src.HasCrushing())
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Earth"
				TrueMult+=(ElementalCheck(src, m, DebuffIntensity=max(GetCrushing(),1)))
				src.ElementalOffense=PreviousElement
			if(src.HasShattering())
				if(!m.Shatter&&!m.HasDebuffImmune())
					OMsg(src, "<font color='[rgb(51, 204 , 153)]'>[m] falters; their guard is crushed!!</font color>")
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Earth"
				TrueMult+=(ElementalCheck(src, m, 1, GetShattering()))
				src.ElementalOffense=PreviousElement
			if(src.HasShocking())
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Wind"
				TrueMult+=(ElementalCheck(src, m, DebuffIntensity=max(GetShocking(),1)))
				src.ElementalOffense=PreviousElement
			if(src.HasParalyzing())
				if(!m.Shock&&!m.HasDebuffImmune())
					OMsg(src, "<font color='[rgb(153, 255, 255)]'>[m] twitches erratically; they're shocked!!</font color>")
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Wind"
				TrueMult+=(ElementalCheck(src, m, 1, GetParalyzing()))
				src.ElementalOffense=PreviousElement
			if(src.HasPoisoning())
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Poison"
				TrueMult+=(ElementalCheck(src, m, DebuffIntensity=GetPoisoning()))
				src.ElementalOffense=PreviousElement
			if(src.HasToxic())
				if(!m.Poison&&!m.HasDebuffImmune())
					OMsg(src, "<font color='[rgb(204, 51, 204)]'>[m] looks unwell; they've been poisoned!!</font color>")
				PreviousElement=src.ElementalOffense
				src.ElementalOffense="Poison"
				TrueMult+=(ElementalCheck(src, m, 1, GetToxic()))
				src.ElementalOffense=PreviousElement
			if(src.HasDisorienting())
				if(prob(10*src.GetDisorienting()))
					m.AddConfuse(2.5*max(val,1))
			if(src.HasConfusing())
				m.AddConfuse(src.GetConfusing()*max(val,1))
			if(src.HasStunningStrike())
				if(!m.Stunned)
					if(prob(src.GetStunningStrike()*5*max(val,1)))
						Stun(m, 3)
			if(src.HasHardening())
				if(prob(30))
					src.Harden+=3*src.GetHardening()
			if(m.HasHardening())
				if(prob(30))
					m.Harden+=3*m.GetHardening()
			if(src.HasShear())
				m.AddSheared(src.GetShear()*max(val,1))
			if(src.HasAttracting())
				m.AddAttracted(src.GetAttracting()*max(val,1), src)
			if(src.HasTerrifying())
				m.AddTerrified(src.GetTerrifying()*max(val,1), src)
			if(src.HasCripple())
				m.AddCrippled(src.GetCripple()*max(val,1))
			if(src.HasPacifying())
				m.AddPacifying(src.GetPacifying()*max(val, 1))
			if(src.HasEnraging())
				m.AddEnraging(src.GetEnraging()*max(val, 1))

			if(OldEDefense)
				m.ElementalDefense=OldEDefense

			if(src.HasSoftStyle())
				TrueMult+=(m.TotalFatigue/33)*src.GetSoftStyle()
			if(m.HasHardStyle())
				TrueMult-=(src.TotalInjury/33)*m.GetHardStyle()
			if(src.HasCyberStigma())
				if(m.CyberCancel||m.Mechanized)//ranges from +10 truemult at 0 mana to +0 truemult at 100 mana
					TrueMult+=((abs((m.ManaAmount/m.ManaCapMult)-100)/33)*max(m.Mechanized,m.CyberCancel)*src.GetCyberStigma())


			if(!(m.HasGodKi() && (m.GetGodKi()>=1)))
				if(src.HasHolyMod())
					TrueMult+=(src.HolyDamage(m))
				if(src.HasAbyssMod())
					TrueMult+=(src.AbyssDamage(m))
				if(src.HasSlayerMod())
					TrueMult+=(src.SlayerDamage(m))


			if(m.DefianceRetaliate&&!m.Oozaru)
				if(src.Health>m.Health)
					TrueMult-=m.DefianceRetaliate

			if(src.HasGodKi())
				TrueMult+=(src.GetGodKi()*10)
			if(m.HasGodKi() && Destructive < 2)
				TrueMult-=(m.GetGodKi()*10)

			if(src.party)
				if(src.party.members.len>1)
					TrueMult-=src.party.members.len*1.5
			if(m.GetWeaponSoulType()=="Soul Calibur")
				TrueMult-=2

			if(TrueMult!=0)//If True mult has been tapped by anything...
				if(TrueMult>0)//Check if its a net gain...
					val*=1+(0.1*TrueMult)
				else if(TrueMult<0)//Or, if its a net loss...
					val/=1+((-0.1)*TrueMult)//flip them negatives, biotch

			if(src.HasPurity())//If damager is pure
				var/found=0//Assume you haven't found a proper target
				if(src.HasBeyondPurity())//if you can say fuck off to purity...
					if(src.HasHolyMod())
						if(m.IsGood())//good things still heal good people
							found=1
					if(found)
						return
				else
					if(src.HasHolyMod())//Holy things
						if(m.IsEvil())//Kill evil things
							found=1
					if(!found)//If you don't find what you're supposed to hunt
						return//Do not do damage

			if(m.UsingVoidDefense())
				if(m.TotalFatigue>0)
					m.HealFatigue(val/2)
				else
					m.HealWounds(val/2)
				m.HealEnergy(val)
				m.HealMana(val)

			if(m.HasDeathField()&&(UnarmedAttack||SwordAttack))
				src.WoundSelf(m.GetDeathField()*0.01*min((1/val),1))
			if(m.HasVoidField()&&SpiritAttack)
				src.GainFatigue(m.GetVoidField()*0.01*min((1/val),1))

			if(src.HasSoftStyle())
				m.GainFatigue(val*0.2*src.GetSoftStyle())
			if(src.HasHardStyle())
				if(!src.CursedWounds())
					src.DealWounds(m, val*0.2*src.GetHardStyle())
			if(src.HasCyberStigma())
				if(m.CyberCancel||m.Mechanized)
					m.LoseMana(val*max(m.Mechanized,m.CyberCancel)*src.GetCyberStigma())

			if(locate(/obj/Skills/Zanzoken, m))
				if(m.MovementCharges<m.GetMaxMovementCharges())
					m.MovementChargeBuildUp(val)

			if(m.VaizardHealth)
				m.VaizardHealth-=val
				if(m.VaizardHealth<=0)
					if(m.ActiveBuff)
						if(m.ActiveBuff.VaizardShatter)
							m.ActiveBuff.Trigger(m)
					if(m.SpecialBuff)
						if(m.SpecialBuff.VaizardShatter)
							m.SpecialBuff.Trigger(m)
					for(var/obj/Skills/Buffs/SlotlessBuffs/b in m.SlotlessBuffs)
						if(b.VaizardShatter)
							b.Trigger(m)
					if(m.VaizardHealth<0)
						val=((-1)*m.VaizardHealth)
						m.VaizardHealth=0
				else
					val=0

			if(m.BioArmor)
				m.BioArmor-=val
				if(m.BioArmor<0)
					val=(-1)*m.BioArmor
					m.BioArmor=0
				else
					val=0

			if(m.Health-val<=m.AngerPoint*(1-m.HealthCut))
				if(!m.Anger&&!m.HasCalmAnger()&&!m.HasNoAnger()&&!m.AngerCD)
					m.Anger()
					val/=m.AngerMax

			if(m.Desperation&&!m.HasInjuryImmune()&&(!m.CyberCancel||m.Saga=="King of Braves"))
				if(FightingSeriously(src,m))
					if(prob(5*m.Desperation))
						m.WoundSelf(val/sqrt(1+m.Desperation))//Take all damage as wounds
						val=0//reduce damag ehard

			if(m.KO&&!src.Lethal)
				val=0

			if(m.CheckSpecial("Kamui Unite") && m.GodKi < 1)
				val+=(1-m.GodKi)
				if(m.Health<=50)
					m.TotalInjury=0
					m.TotalFatigue=0
					m.Health=100
					m.Energy=100
					m.BPPoison=1
					m.GodKi+=0.2
					OMsg(m, "<font color='red'><font size=+2>[m] stitches themselves back together with life fibers!</font size></font color>")


			if(istype(m, /mob/Player/AI))
				var/mob/Player/AI/aa = m
				if(aa.ai_hostility >= 1)
					aa.Target=src
					aa.ai_state = "combat"

			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in m.SlotlessBuffs)
				if(sb.BuffName=="Crystal Wall")
					src.LoseHealth(val)
					return

			m.LoseHealth(max(0,val))

			if(m.Flying)
				var/obj/Items/check = m.EquippedFlyingDevice()
				if(istype(check))
					check.ObjectUse(m)
					m << "You are knocked off your flying device!"

			if(UnarmedAttack || SwordAttack || SpiritAttack)

				if(src.StyleBuff&&src.StyleBuff.Mastery>=4)
					if(src.Tension<100 && !src.HasTensionLock())
						src.Tension+=(val)

				if(m.StyleBuff&&m.StyleBuff.Mastery>=4)
					if(m.Tension<100 && !m.HasTensionLock())
						m.Tension+=(val*0.75)

			if(src.HasEnergyLeak())
				src.LoseEnergy(src.GetEnergyLeak()*0.25*val)
			if(m.HasEnergyLeak())
				m.LoseEnergy(m.GetEnergyLeak()*0.25*val)

			if(src.HasFatigueLeak())
				src.GainFatigue(src.GetFatigueLeak()*0.25*val)
			if(m.HasFatigueLeak())
				m.GainFatigue(src.GetFatigueLeak()*0.25*val)

			if(src.HasManaLeak())
				src.LoseMana(src.GetManaLeak()*0.25*val, 1)
			if(m.HasManaLeak())
				m.LoseMana(m.GetManaLeak()*0.25*val, 1)

			if(src.HasBleedHit())
				src.WoundSelf(src.GetBleedHit()*0.25*val)

			if(src.HasMaimStrike()&&FightingSeriously(src, 0))
				if(val>(25*global.WorldDamageMult/src.GetMaimStrike())&&m.Maimed<4 && world.realtime > MaimCooldown+Day(0.75))
					m.Maimed+=1
					OMsg(m, "<font color='red'><font size=+2><b>[src] maimed [m] with a brutal attack!</b></font size></font color>")
				else if(val>(15*global.WorldDamageMult/src.GetMaimStrike())&&m.Tail)
					m.Tail=0
					OMsg(m, "<font color='red'><font size=+2><b>[src] took off [m]'s tail!</b></font size></font color>")

			if(src.SoulFire&&FightingSeriously(src, 0))
				m.LoseMana(val*src.SoulFire,1)
				m.TotalFatigue+=val*0.5*src.SoulFire
				m.LoseCapacity(val*0.5*src.SoulFire)

			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in m.SlotlessBuffs)
				if(sb.BuffName=="Protega")
					src.LoseHealth(val/10)
			if(m.MeltyBlood)
				if(m.Health<50*(1-src.HealthCut))
					if(FightingSeriously(src,0))
						if(!m.MeltyMessage)
							m.MeltyMessage=1
							OMsg(m, "<font color='red'>[m]'s blood burns through all it comes in contact with!</font>")
						src.AddBurn(val, m)
			if(m.VenomBlood)
				if(m.Health<50*(1-src.HealthCut))
					if(FightingSeriously(src,0))
						if(!m.VenomMessage)
							m.VenomMessage+=1
							OMsg(m, "<font color='red'>[m]'s toxic blood sprays out!</font>")
						src.AddPoison(val*0.5, m)


			if(m.Health<=m.AngerPoint*(1-src.HealthCut)&&m.Defiance&&!m.Oozaru)
				if(m.DefianceCounter<10)
					if(m.Anger)
						if(val>=(1/m.AscensionsAcquired)&&val<(2/m.AscensionsAcquired))
							m.DefianceCounter+=1
							m.OMessage(10,"<font color=red>[m]'s defiance sparks!","Defiance (1) passive.")
						else if(val>=(2/m.AscensionsAcquired)&&val<(4/m.AscensionsAcquired))
							m.DefianceCounter+=2
							m.OMessage(10,"<font color=red>[m] grows more defiant!","Defiance (2) passive.")
						else if(val>=(4/m.AscensionsAcquired))
							m.DefianceCounter+=5
							m.OMessage(10,"<font color=red>[m] roars in complete defiance of odds!","Defiance (3) passive.")
						if(m.DefianceCounter>10)
							m.DefianceCounter=10

			if(m.HasAdaptation()&&src==m.Target||src.HasAdaptation()&&m==src.Target)
				if(m.HasAdaptation()&&!m.Oozaru)
					m.AdaptationTarget=src
					m.AdaptationCounter+=(val*(m.AscensionsAcquired/80))
					if(m.AdaptationCounter>=1)
						m.AdaptationCounter=1
						if(!m.AdaptationAnnounce)
							m << "<b>You've adapted to your target's style!</b>"
							m.AdaptationAnnounce=1
				if(src.HasAdaptation()&&!src.Oozaru)
					src.AdaptationTarget=m
					src.AdaptationCounter+=(val*(src.AscensionsAcquired/80))
					if(src.AdaptationCounter>=1)
						src.AdaptationCounter=1
						if(!src.AdaptationAnnounce)
							src << "<b>You've adapted to your target's style!</b>"
							src.AdaptationAnnounce=1

			if(src.HasWeaponBreaker())
				if((m.HasSword()||m.HasStaff()||m.HasArmor())&&(UnarmedAttack||SwordAttack))
					var/obj/Items/Sword/s=m.EquippedSword()
					var/obj/Items/Enchantment/Staff/st=m.EquippedStaff()
					var/obj/Items/Armor/ar=m.EquippedArmor()

					var/SwordQuality
					var/StaffQuality
					var/ArmorQuality

					if(s)
						SwordQuality=min(s.Ascended+m.GetSwordAscension(),4)
					if(st)
						StaffQuality=min(st.Ascended+m.GetStaffAscension(),4)
					if(ar)
						ArmorQuality=min(ar.Ascended+m.GetArmorAscension(),4)

					if(m.UsingKendo()&&m.HasSword())
						if(s.Class=="Wooden")
							SwordQuality+=1
						if(src.StyleActive=="Shinzan")
							SwordQuality+=3

					if(s)
						if(s.Destructable)
							var/BreakMult=(src.GetWeaponBreaker()+m.GetShatterTier(s))/(2*SwordQuality+1)
							if(BreakMult>0)
								s.ShatterCounter-=val*BreakMult*src.GetOff(0.5)
								if(s.ShatterCounter<0)
									s.ShatterCounter=0
								if(s.ShatterCounter==0)
									m.SwordShatter(s)
					if(st)
						if(st.Destructable)
							var/BreakMult=(src.GetWeaponBreaker()+m.GetShatterTier(st))/(2*StaffQuality+1)
							if(BreakMult>0)
								st.ShatterCounter-=val*BreakMult*src.GetOff(0.5)
								if(st.ShatterCounter<0)
									st.ShatterCounter=0
								if(st.ShatterCounter==0)
									m.StaffShatter()
					if(ar)
						if(ar.Destructable)
							var/BreakMult=(src.GetWeaponBreaker()+m.GetShatterTier(ar))/(2*ArmorQuality+1)
							if(BreakMult>0)
								ar.ShatterCounter-=val*BreakMult*src.GetOff(0.5)
								if(ar.ShatterCounter<0)
									ar.ShatterCounter=0
								if(ar.ShatterCounter==0)
									m.ArmorShatter()

					if(m.EquippedSecondSword())
						var/obj/Items/Sword/s2=m.EquippedSecondSword()
						var/Sword2Quality=min(s2.Ascended+m.GetSwordAscension(),4)
						if(s2&&s2.Destructable)
							var/BreakMult=(src.GetWeaponBreaker()+m.GetShatterTier(s2))/(2*Sword2Quality+1)
							if(BreakMult>0)
								s2.ShatterCounter-=val*BreakMult*m.GetOff(0.5)
								if(s2.ShatterCounter<0)
									s2.ShatterCounter=0
								if(s2.ShatterCounter==0)
									m.SwordShatter(s2)
					if(m.EquippedThirdSword())
						var/obj/Items/Sword/s3=m.EquippedThirdSword()
						var/Sword3Quality=min(s3.Ascended+m.GetSwordAscension(),4)
						if(s3&&s3.Destructable)
							var/BreakMult=(src.GetWeaponBreaker()+m.GetShatterTier(s3))/(2*Sword3Quality+1)
							if(BreakMult>0)
								s3.ShatterCounter-=val*BreakMult*m.GetOff(0.5)
								if(s3.ShatterCounter<0)
									s3.ShatterCounter=0
								if(s3.ShatterCounter==0)
									m.SwordShatter(s3)

			if(m.HasWeaponBreaker())
				if((src.HasSword()||src.HasStaff()||src.HasArmor())&&(UnarmedAttack||SwordAttack))
					var/obj/Items/Sword/s=src.EquippedSword()
					var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
					var/obj/Items/Armor/ar=src.EquippedArmor()

					var/SwordQuality
					var/StaffQuality
					var/ArmorQuality

					if(s)
						SwordQuality=min(s.Ascended+src.GetSwordAscension(),4)
					if(st)
						StaffQuality=min(st.Ascended+src.GetStaffAscension(),4)
					if(ar)
						ArmorQuality=min(ar.Ascended+src.GetArmorAscension(),4)

					if(src.UsingKendo()&&src.HasSword())
						if(s.Class=="Wooden")
							SwordQuality+=1

					if(s)
						if(s.Destructable)
							var/BreakMult=(m.GetWeaponBreaker()+src.GetShatterTier(s))/(2*SwordQuality+1)
							if(BreakMult>0)
								s.ShatterCounter-=(val*BreakMult*m.GetDef(0.25))
								if(s.ShatterCounter<0)
									s.ShatterCounter=0
								if(s.ShatterCounter<=0)
									src.SwordShatter(s)
					if(st)
						if(st.Destructable)
							var/BreakMult=(m.GetWeaponBreaker()+src.GetShatterTier(st))/(2*StaffQuality+1)
							if(BreakMult>0)
								st.ShatterCounter-=val*BreakMult*m.GetDef(0.25)
								if(st.ShatterCounter<0)
									st.ShatterCounter=0
								if(st.ShatterCounter==0)
									src.StaffShatter()
					if(ar)
						if(ar.Destructable)
							var/BreakMult=(m.GetWeaponBreaker()+src.GetShatterTier(ar))/(2*ArmorQuality+1)
							if(BreakMult>0)
								ar.ShatterCounter-=val*BreakMult*m.GetDef(0.25)
								if(ar.ShatterCounter<0)
									ar.ShatterCounter=0
								if(ar.ShatterCounter==0)
									src.ArmorShatter()

					if(src.EquippedSecondSword())
						var/obj/Items/Sword/s2=src.EquippedSecondSword()
						var/Sword2Quality=min(s2.Ascended+src.GetSwordAscension(),4)
						if(s2&&s2.Destructable)
							var/BreakMult=(m.GetWeaponBreaker()+src.GetShatterTier(s2))/(2*Sword2Quality+1)
							if(BreakMult>0)
								s2.ShatterCounter-=(val*BreakMult*m.GetDef(0.25))
								if(s2.ShatterCounter<0)
									s2.ShatterCounter=0
								if(s2.ShatterCounter==0)
									src.SwordShatter(s2)
					if(src.EquippedThirdSword())
						var/obj/Items/Sword/s3=src.EquippedThirdSword()
						var/Sword3Quality=min(s3.Ascended+src.GetSwordAscension(),4)
						if(s3&&s3.Destructable)
							var/BreakMult=(m.GetWeaponBreaker()+src.GetShatterTier(s3))/(2*Sword3Quality+1)
							if(BreakMult>0)
								s3.ShatterCounter-=(val*BreakMult*m.GetDef(0.25))
								if(s3.ShatterCounter<0)
									s3.ShatterCounter=0
								if(s3.ShatterCounter==0)
									src.SwordShatter(s3)

			if(m.HasLifeGeneration())
				m.HealHealth(m.GetLifeGeneration()/100)
				if(m.Health>=100-100*m.HealthCut-m.TotalInjury)
					m.HealWounds(0.2*m.GetLifeGeneration()/100)
			if(src.HasEnergyGeneration())
				src.HealFatigue(0.2*src.GetEnergyGeneration()/100)
				src.HealEnergy(src.GetEnergyGeneration()/100)
			if(m.HasEnergyGeneration())
				m.HealFatigue(0.2*m.GetEnergyGeneration()/100)
				m.HealEnergy(m.GetEnergyGeneration()/100)
			if(src.HasManaGeneration())
				src.HealMana(src.GetManaGeneration()/100)
			if(m.HasManaGeneration())
				m.HealMana(m.GetManaGeneration()/100)

			if(src.ActiveBuff&&src.CheckActive("Keyblade")&&!src.SpecialBuff)
				src.ManaAmount+=(0.25*src.SagaLevel)
			if(m.ActiveBuff&&m.CheckActive("Keyblade")&&!m.SpecialBuff)
				m.ManaAmount+=(0.25*m.SagaLevel)

			if(src.HellPower&&!src.TransActive())
				src.HealMana(1)
			if(m.HellPower&&!src.TransActive())
				m.HealMana(1)

			if(src.SlotlessBuffs)
				if(src.CheckSlotless("Frost End"))
					if(SwordAttack&&m.Stunned)
						m.overlays+='IceCoffin.dmi'
						m.StasisStun=1
				if(src.CheckSlotless("AntiForm"))
					src.ManaAmount-=1
					if(src.ManaAmount<0)
						ManaAmount=0
				if(m.CheckSlotless("OverSoul")&&m.BoundLegend=="Caledfwlch")
					if(!m.Shielding)
						m.Shielding=1
						spawn()
							m.AvalonField()

			if(src.HasSoulSteal())
				var/Amt=val*src.GetSoulSteal()
				var/Cap=15*src.GetSoulSteal()
				src.VaizardHealth+=Amt
				if(src.VaizardHealth>Cap)
					src.VaizardHealth=Cap

			if(src.HasLifeSteal())
				var/CursedBlood=0
				var/NoBlood=0
				NoBlood=m.CyberCancel
				if(m.Race=="Android"||m.Class=="Eldritch"||m.Secret=="Zombie"||m.Dead)
					NoBlood=1
				var/Effectiveness=1
				if(NoBlood>0)
					Effectiveness-=(Effectiveness*NoBlood)
				if(m.MeltyBlood)
					CursedBlood=1
					src.AddBurn(val*Effectiveness)
				if(m.VenomBlood)
					CursedBlood=1
					src.AddPoison(val*Effectiveness,m)
					src.AddBurn(val,m)
				if(!CursedBlood)
					src.HealHealth(val*src.GetLifeSteal()*Effectiveness/100)
					if(src.Health>=(100-100*src.HealthCut-src.TotalInjury))
						src.HealWounds(0.2*val*src.GetLifeSteal()*Effectiveness/100)
			if(src.HasLifeStealTrue())
				m.AddHealthCut(val/300)
				src.HealthCut-=(val/300)
				if(src.HealthCut<=0)
					src.HealthCut=0
			if(src.HasEnergySteal())
				var/Effectiveness=1
				if(m.CyberCancel>0)
					Effectiveness-=(Effectiveness*m.CyberCancel)
				src.HealEnergy(val*(src.GetEnergySteal()*Effectiveness/100))
				m.LoseEnergy(val*(src.GetEnergySteal()*Effectiveness/100))

			if(src.HasErosion())
				var/MPow=m.Power_Multiplier/4
				var/BPCap=MPow*src.GetErosion()
				var/MStr=m.GetStrMult()
				var/StrCap=MStr*src.GetErosion()
				var/MEnd=m.GetEndMult()
				var/EndCap=MEnd*src.GetErosion()
				var/MSpd=m.GetSpdMult()
				var/SpdCap=MSpd*src.GetErosion()
				var/MFor=m.GetForMult()
				var/ForCap=MFor*src.GetErosion()
				var/MOff=m.GetOffMult()
				var/OffCap=MOff*src.GetErosion()
				var/MDef=m.GetDefMult()
				var/DefCap=MDef*src.GetErosion()
				var/MRecov=m.GetRecovMult()
				var/RecovCap=MRecov*src.GetErosion()
				if(MPow>0)
					m.PowerEroded+=(BPCap/45)*val
					if(m.PowerEroded>BPCap)
						m.PowerEroded=BPCap
				if(MStr>1)
					m.StrEroded+=(StrCap/45)*val
					if(m.StrEroded>StrCap)
						m.StrEroded=StrCap
				if(MEnd>1)
					m.EndEroded+=(EndCap/45)*val
					if(m.EndEroded>EndCap)
						m.EndEroded=EndCap
				if(MSpd>1)
					m.SpdEroded+=(SpdCap/45)*val
					if(m.SpdEroded>SpdCap)
						m.SpdEroded=SpdCap
				if(MFor>1)
					m.ForEroded+=(ForCap/45)*val
					if(m.ForEroded>ForCap)
						m.ForEroded=ForCap
				if(MOff>1)
					m.OffEroded+=(OffCap/45)*val
					if(m.OffEroded>OffCap)
						m.OffEroded=OffCap
				if(MDef>1)
					m.DefEroded+=(DefCap/45)*val
					if(m.DefEroded>DefCap)
						m.DefEroded=DefCap
				if(MRecov>1)
					m.RecovEroded+=(RecovCap/45)*val
					if(m.RecovEroded>RecovCap)
						m.RecovEroded=RecovCap


			if(src.StealsStats||src.ElementalOffense=="Void")
				var/Effective=1
				if(src.StealsStats)
					Effective*=src.StealsStats
				var/MStr=m.GetStrMult()
				var/MEnd=m.GetEndMult()
				var/MSpd=m.GetSpdMult()
				var/MFor=m.GetForMult()
				var/MOff=m.GetOffMult()
				var/MDef=m.GetDefMult()
				if(MStr>1)
					if(src.StrStolen<(MStr-1))
						src.StrStolen+=(((MStr-1)*0.025*Effective)*val)
						if(src.StrStolen>(MStr-1))
							src.StrStolen=(MStr-1)
				if(MEnd>1)
					if(src.EndStolen<(MEnd-1))
						src.EndStolen+=(((MEnd-1)*0.025*Effective)*val)
						if(src.EndStolen>(MEnd-1))
							src.EndStolen=(MEnd-1)
				if(MSpd>1)
					if(src.SpdStolen<(MSpd-1))
						src.SpdStolen+=(((MSpd-1)*0.025*Effective)*val)
						if(src.SpdStolen>(MSpd-1))
							src.SpdStolen=(MSpd-1)
				if(MFor>1)
					if(src.ForStolen<(MFor-1))
						src.ForStolen+=(((MFor-1)*0.025*Effective)*val)
						if(src.ForStolen>(MFor-1))
							src.ForStolen=(MFor-1)
				if(MOff>1)
					if(src.OffStolen<(MOff-1))
						src.OffStolen+=(((MOff-1)*0.025*Effective)*val)
						if(src.OffStolen>(MOff-1))
							src.OffStolen=(MOff-1)
				if(MDef>1)
					if(src.DefStolen<(MDef-1))
						src.DefStolen+=(((MDef-1)*0.025*Effective)*val)
						if(src.DefStolen>(MDef-1))
							src.DefStolen=(MDef-1)

			if(FightingSeriously(src,0))
				var/WoundsInflicted
				var/obj/Items/Sword/s=src.EquippedSword()
				var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
				if(src.CursedWounds())
					if(m.UsingMuken())
						WoundsInflicted=val/max(m.GetRecov(2), 1.5)
					else
						WoundsInflicted=val
				else if(src.HasPurity()&&m.IsEvil())
					WoundsInflicted=val
				else if(s||st)
					if(((s&&s.Element=="Silver")||(st&&st.Element=="Silver"))&&m.IsEvil())
						WoundsInflicted=val
					else if(src.SwordWounds())
						WoundsInflicted=val/max(m.GetRecov(2)/(GetSwordDamage(s)**(1/3)), 1.5)
					else
						WoundsInflicted=val/max(m.GetRecov(2), 1.5)
				else
					WoundsInflicted=val/max(m.GetRecov(2), 1.5)
				src.DealWounds(m, WoundsInflicted)

			if(m.Health<=0&&Destructive>0)
				m.Death(src, "being completely obliterated!", SuperDead=1, NoRemains=2)
				return


			if(m.KO && istype(m, /mob/Player/AI))
				var/mob/Player/AI/a = m
				if(!a.ai_owner)
					a.Death(src, null)
					if(src.Frozen)
						src.Frozen=0
					return
			if(m.Health<=0&&!m.KO)
				m.Unconscious(src)
			else if(m.Health<=0&&m.KO&&src.Lethal)
				m.Death(src, null)


		DealWounds(var/mob/m, var/val, var/FromSelf=0)
			if(m.CyberCancel)
				val*=(1-m.CyberCancel)
			if(m.BioArmor)
				return
			if(src.Race=="Djinn")
				val*=0.25
			if(m.HasCeramicPlating()||m.HasPlatedWeights())
				if(m.HasPlatedWeights())
					if(!m.HasInjuryImmune())
						m.TotalInjury+=val/2
				else
					var/obj/Items/Plating/P=m.EquippedPlating()
					if(P.PlatedHealth>0)
						P.PlatedHealth-=val
						if(P.PlatedHealth<0)
							if(!m.HasInjuryImmune())
								m.TotalInjury+=(P.PlatedHealth*(-1))
							P.PlatedHealth=0
						if(P.PlatedHealth<=0)
							m << "<font size=+1>Your ceramic plating has been shattered!</font size>"
						P.suffix="*Broken*"
						del P
			else
				if(!m.HasInjuryImmune())
					m.TotalInjury+=val
			if(m.TotalInjury>=99)
				m.TotalInjury=99
			m.MaxHealth()
		WoundSelf(var/val)
			if(src.BioArmor)
				src.DamageSelf(val)
				return
			if(src.Race=="Djinn")
				val*=0.25
			if(!src.HasInjuryImmune())
				src.TotalInjury+=val
			if(src.TotalInjury>=99)
				src.TotalInjury=99
			src.MaxHealth()
		LoseHealth(var/val)
			src.Health-=val
			src.MaxHealth()
		LoseEnergy(var/val)
			if(src.FusionPowered)
				return
			val/=1+src.GetKiControlMastery()
			val*=src.Power_Multiplier
			if(src.GetPowerUpRatio()>1)
				var/PowerUpPercent=GetPowerUpRatio()-1
				if(src.HasMovementMastery())
					PowerUpPercent/=1+(src.GetMovementMastery()/10)
				val*=(1+(PowerUpPercent/src.PUDrainReduction))
			if(src.Kaioken)
				if(src.Anger)
					val*=src.Anger
			if(src.PotionCD)
				val*=1.25
			src.Energy-=val
			if(src.Energy<0)
				src.Energy=0
			if(src.Energy<=10 && src.HasHealthPU() && src.PowerControl>100)
				src.PowerControl=100
				src << "You lose your gathered power..."
				src.Auraz("Remove")
				src<<"You are too tired to power up."
				src.PoweringUp=0
			src.GainFatigue(val/30)
		GainFatigue(var/val)
			if(src.FusionPowered)
				return
			val/=1+src.GetKiControlMastery()
			val*=src.EnergyExpenditure*src.Power_Multiplier
			if(src.GetPowerUpRatio()>1 && !src.GatesActive)
				var/PowerUpPercent=GetPowerUpRatio()-1
				if(src.HasMovementMastery())
					PowerUpPercent/=1+(src.GetMovementMastery()/10)
				val*=(1+(PowerUpPercent/src.PUDrainReduction))
			if(src.Kaioken)
				if(src.Anger)
					val*=src.Anger
			if(src.PotionCD)
				val*=1.25
			if(src.Race=="Djinn")
				val*=0.25
			if(!src.HasFatigueImmune())
				src.TotalFatigue+=val
			if(src.TotalFatigue>99)
				src.TotalFatigue=99
			src.MaxEnergy()
		LoseMana(var/val, var/Override=0)
			val*=src.EnergyExpenditure*src.Power_Multiplier
			if(src.HasDrainlessMana()&&!Override)
				return//Nope.
			if(src.PotionCD)
				val*=1.25
			src.ManaAmount-=val
			if(src.ManaAmount<=0)
				src.ManaAmount=0
		LoseCapacity(var/val)
			val/=src.GetManaCapMult()
			if(src.PotionCD)
				val*=1.25
			src.TotalCapacity+=val
			if(src.TotalCapacity>=100)
				src.TotalCapacity=100
		HealHealth(var/val)
			if(src.Sheared)
				if(src.HasHellPower())
					src.Sheared-=val/(2/src.HasHellPower())
					if(src.Sheared<0)
						val+=(-1)*src.Sheared
						src.Sheared=0
					else
						val=val/(2/src.HasHellPower())
				else
					src.Sheared-=val
					if(src.Sheared<0)
						val=(-1)*src.Sheared
						src.Sheared=0
					else
						val=val/3
			if(src.PotionCD)
				val/=1.25
			if(icon_state == "Meditate")
				src.Tension=max(0, Tension-(val*1.5))
			else if(Tension != 100)
				src.Tension=max(0, Tension-(val*0.75))
			src.Health+=val
			src.MaxHealth()
		HealEnergy(var/val, var/StableHeal=0)
			if(!src.FusionPowered&&!StableHeal)
				val/=src.GetPowerUpRatio()
				val/=src.EnergyExpenditure*src.Power_Multiplier
			if(src.PotionCD)
				val/=1.25
			src.Energy+=val
			src.MaxEnergy()
		HealMana(var/val, var/StableHeal=0)
			if(!src.FusionPowered&&!StableHeal)
				val/=src.GetPowerUpRatio()
				val/=src.EnergyExpenditure*src.Power_Multiplier
			if(src.PotionCD)
				val/=1.25
			if(is_arcane_beast)
				val *= max(1,ManaCapMult)
			src.ManaAmount+=val
			src.MaxMana()
		HealWounds(var/val, var/StableHeal=0)
			if(src.Sheared)
				src.Sheared-=val
				if(src.Sheared<0)
					val=(-1)*src.Sheared
					src.Sheared=0
				else
					val=0
			if(src.PotionCD)
				val/=1.25
			src.TotalInjury-=val
			if(src.TotalInjury < 0)
				src.TotalInjury=0
			src.MaxHealth()
		HealFatigue(var/val, var/StableHeal=0)
			if(!src.FusionPowered&&!StableHeal)
				val*=1/src.GetPowerUpRatio()
			if(src.PotionCD)
				val/=1.25
			src.TotalFatigue-=val
			if(src.TotalFatigue < 0)
				src.TotalFatigue=0
			src.MaxEnergy()
		HealCapacity(var/val, var/StableHeal=0)
			if(src.PotionCD)
				val/=1.25
			src.TotalCapacity-=val
			if(src.TotalCapacity<=0)
				src.TotalCapacity=0
			src.MaxMana()
		MaxHealth()
			var/HasWounds=1
			if(src.HasUnstoppable()||src.Secret=="Zombie")
				HasWounds=0
			var/KeyHealth=100-(src.TotalInjury*HasWounds)
			var/Sub
			var/Cut
			if(src.HealthCut)
				Sub=KeyHealth*src.HealthCut
				Cut=KeyHealth-Sub
				if(src.Health > Cut)
					src.Health=Cut
			if(src.Health > KeyHealth)
				src.Health=KeyHealth
		MaxEnergy()
			var/HasFatigue=1
			if(src.HasUnstoppable()||src.Secret=="Zombie")
				HasFatigue=0
			if(src.Anaerobic)
				HasFatigue=0.7/(src.Anaerobic)
			var/KeyEnergy=100-(src.TotalFatigue*HasFatigue)
			var/Sub
			var/Cut
			if(src.EnergyCut)
				Sub=KeyEnergy*src.EnergyCut
				Cut=KeyEnergy-Sub
				if(src.Energy > Cut)
					src.Energy=Cut
			if(src.Energy > KeyEnergy)
				src.Energy=KeyEnergy
		MaxMana()
			if(src.Secret=="Senjutsu"&&src.CheckSlotless("Senjutsu Focus"))
				if((src.ManaAmount>2.5*((src.ManaMax-src.TotalCapacity)*src.GetManaCapMult()))&&!src.ManaDeath)
					src.ManaDeath=1
					src << "You draw in too much natural energy -- use it up before you die by turning to stone!"
				return//if you're a senjutsu then we don't give a FUCK.
			var/KeyMana=src.ManaMax
			if(src.TotalCapacity&&!src.HasMechanized())
				KeyMana-=src.TotalCapacity
			if(src.HasManaCapMult())
				KeyMana*=src.GetManaCapMult()
			var/Sub
			var/Cut
			if(src.ManaCut)
				Sub=KeyMana*src.ManaCut
				Cut=KeyMana-Sub
				if(src.ManaAmount > Cut)
					src.ManaAmount=Cut
			if(src.ManaAmount > KeyMana)
				src.ManaAmount=KeyMana
		MaxOxygen()
			var/KeyOxygen=src.OxygenMax
			if(SenseRobbed>=2)
				KeyOxygen/=src.SenseRobbed
			if(src.Oxygen>KeyOxygen)
				src.Oxygen-=1
		Calm(var/Pacified=0)
			if(src.EndlessAnger)
				return
			if(!Pacified)src.OMessage(10,"<font color=white><i>[src] becomes calm.","<font color=silver>[src]([src.key]) becomes calm.")
			src.DefianceCounter=0
			src.Anger=0
			src.AngerCD=30
		AddHealthCut(var/Val)
			src.HealthCut+=Val
			if(src.HealthCut>=1)
				src.Death(null, "exhausting their life force!", SuperDead=1, NoRemains=1)
		AddEnergyCut(var/Val)
			src.EnergyCut+=Val
			if(src.EnergyCut>=1)
				src.Death(null, "exhausting their life force!", SuperDead=1, NoRemains=1)
		AddManaCut(var/Val)
			src.ManaCut+=Val
			if(src.ManaCut>=1)
				src.ManaCut=1
		AddStrTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.StrTax>=src.GetTaxThreshold())
					src.StrTax=src.GetTaxThreshold()
					src.AddStrCut(0.1*Val)
					return
			src.StrTax+=Val
			if(src.StrTax>=1)
				src.StrTax=1
		SubStrTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.StrTax-=Val
			if(src.StrTax<=0)
				src.StrTax=0
		AddStrCut(var/Val)
			src.StrCut+=Val
			if(src.StrCut>=1)
				src.StrCut=1
		AddEndTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.EndTax>=src.GetTaxThreshold())
					src.EndTax=src.GetTaxThreshold()
					src.AddEndCut(0.1*Val)
					return
			src.EndTax+=Val
			if(src.EndTax>=1)
				src.EndTax=1
		SubEndTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.EndTax-=Val
			if(src.EndTax<=0)
				src.EndTax=0
		AddEndCut(var/Val)
			src.EndCut+=Val
			if(src.EndCut>=1)
				src.EndCut=1
		AddSpdTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.SpdTax>=src.GetTaxThreshold())
					src.SpdTax=src.GetTaxThreshold()
					src.AddSpdCut(0.1*Val)
					return
			src.SpdTax+=Val
			if(src.SpdTax>=1)
				src.SpdTax=1
		SubSpdTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.SpdTax-=Val
			if(src.SpdTax<=0)
				src.SpdTax=0
		AddSpdCut(var/Val)
			src.SpdCut+=Val
			if(src.SpdCut>=1)
				src.SpdCut=1
		AddForTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.ForTax>=src.GetTaxThreshold())
					src.ForTax=src.GetTaxThreshold()
					src.AddForCut(0.1*Val)
					return
			src.ForTax+=Val
			if(src.ForTax>=1)
				src.ForTax=1
		SubForTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.ForTax-=Val
			if(src.ForTax<=0)
				src.ForTax=0
		AddForCut(var/Val)
			src.ForCut+=Val
			if(src.ForCut>=1)
				src.ForCut=1
		AddOffTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.OffTax>=src.GetTaxThreshold())
					src.OffTax=src.GetTaxThreshold()
					src.AddOffCut(0.1*Val)
					return
			src.OffTax+=Val
			if(src.OffTax>=1)
				src.OffTax=1
		SubOffTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.OffTax-=Val
			if(src.OffTax<=0)
				src.OffTax=0
		AddOffCut(var/Val)
			src.OffCut+=Val
			if(src.OffCut>=1)
				src.OffCut=1
		AddDefTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.DefTax>=src.GetTaxThreshold())
					src.DefTax=src.GetTaxThreshold()
					src.AddDefCut(0.1*Val)
					return
			src.DefTax+=Val
			if(src.DefTax>=1)
				src.DefTax=1
		SubDefTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.DefTax-=Val
			if(src.DefTax<=0)
				src.DefTax=0
		AddDefCut(var/Val)
			src.DefCut+=Val
			if(src.DefCut>=1)
				src.DefCut=1
		AddRecovTax(var/Val)
			if(src.HasTaxThreshold())
				if(src.RecovTax>=src.GetTaxThreshold())
					src.RecovTax=src.GetTaxThreshold()
					src.AddRecovCut(0.1*Val)
					return
			src.RecovTax+=Val
			if(src.RecovTax>=1)
				src.RecovTax=1
		SubRecovTax(var/Val, var/Forced=0)
			if(src.Satiated||Forced)
				Val*=4
			src.RecovTax-=Val
			if(src.RecovTax<=0)
				src.RecovTax=0
		AddRecovCut(var/Val)
			src.RecovCut+=Val
			if(src.RecovCut>=1)
				src.RecovCut=1
		BaseStr()
			return (src.StrMod+src.StrAscension+(src.EnhancedStrength*0.5))*StrChaos
		BaseFor()
			return (src.ForMod+src.ForAscension+(src.EnhancedForce*0.5))*ForChaos
		BaseEnd()
			return (src.EndMod+src.EndAscension+(src.EnhancedEndurance*0.5))*EndChaos
		BaseSpd()
			return (src.SpdMod+src.SpdAscension+(src.EnhancedSpeed*0.5))*SpdChaos
		BaseOff()
			return (src.OffMod+src.OffAscension+(src.EnhancedAggression*0.5))*OffChaos
		BaseDef()
			return (src.DefMod+src.DefAscension+(src.EnhancedReflexes*0.5))*DefChaos
		BaseRecov()
			return (src.RecovMod+src.RecovAscension)*RecovChaos

		GetStrMult()
			return src.StrMultTotal
		GetForMult()
			return src.ForMultTotal
		GetEndMult()
			return src.EndMultTotal
		GetSpdMult()
			return src.SpdMultTotal
		GetOffMult()
			return src.OffMultTotal
		GetDefMult()
			return src.DefMultTotal
		GetRecovMult()
			return src.RecovMultTotal

		GetMAStr()
			var/MA=0
			if(src.StyleBuff)
				MA=(src.StyleBuff.StyleStr-1)
				if(src.Secret=="Senjutsu"&&src.CheckSlotless("Senjutsu Focus"))
					MA+=0.3
				if(src.Secret=="Haki"&&src.HakiSpecialization=="Armament")
					MA+=0.2
				if(src.Secret=="Werewolf"&&!(src.CheckSlotless("Half Moon Form")))
					MA+=0.2
				if(src.Secret=="Zombie"||src.Secret=="Vampire")
					MA+=0.1
				MA*=(src.StyleBuff.Mastery) / 3
				if(src.StanceActive=="Striking")
					if(src.UsingSpiritStyle())
						MA+=(0.75*src.UsingSpiritStyle())
					else
						MA+=0.5
				if(src.StanceActive=="Advancing")
					if(src.UsingSpiritStyle())
						MA+=(0.5*src.UsingSpiritStyle())
					else
						MA+=0.25
				if(src.StanceActive=="Evasive")
					if(src.UsingSpiritStyle())
						MA-=(0.25/src.UsingSpiritStyle())
					else
						MA-=0.5
				if(src.StanceActive=="Defensive")
					if(src.UsingSpiritStyle())
						MA-=(0.5/src.UsingSpiritStyle())
					else
						MA-=0.75
			return MA
		GetMAEnd()
			var/MA=0
			if(src.StyleBuff)
				MA=(src.StyleBuff.StyleEnd-1)
				if(src.Secret=="Haki")
					MA+=0.1
				MA*=(src.StyleBuff.Mastery) / 3
				if(src.StanceActive=="Defensive")
					if(src.UsingSpiritStyle())
						MA+=(0.75*src.UsingSpiritStyle())
					else
						MA+=0.5
				if(src.StanceActive=="Evasive")
					if(src.UsingSpiritStyle())
						MA+=(0.5*src.UsingSpiritStyle())
					else
						MA+=0.25
				if(src.StanceActive=="Advancing")
					if(src.UsingSpiritStyle())
						MA-=(0.25/src.UsingSpiritStyle())
					else
						MA-=0.5
				if(src.StanceActive=="Striking")
					if(src.UsingSpiritStyle())
						MA-=(0.5/src.UsingSpiritStyle())
					else
						MA-=0.75
			return MA
		GetMAFor()
			var/MA=0
			if(src.StyleBuff)
				MA=(src.StyleBuff.StyleFor-1)
				if(src.Secret=="Vampire"||src.Secret=="Zombie")
					MA+=0.1
				if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation")
					MA+=0.2
				MA*=(src.StyleBuff.Mastery) / 3
				if(src.StanceActive=="Striking")
					if(src.UsingSpiritStyle())
						MA+=(0.75*src.UsingSpiritStyle())
					else
						MA+=0.5
				if(src.StanceActive=="Advancing")
					if(src.UsingSpiritStyle())
						MA+=(0.5*src.UsingSpiritStyle())
					else
						MA+=0.25
				if(src.StanceActive=="Evasive")
					if(src.UsingSpiritStyle())
						MA-=(0.25/src.UsingSpiritStyle())
					else
						MA-=0.5
				if(src.StanceActive=="Defensive")
					if(src.UsingSpiritStyle())
						MA-=(0.5/src.UsingSpiritStyle())
					else
						MA-=0.75
			return MA
		GetMASpd()
			var/MA=0
			if(src.StyleBuff)
				MA=(src.StyleBuff.StyleSpd-1)
				MA*=(src.StyleBuff.Mastery) / 3
				if(src.Secret=="Senjutsu"&&src.CheckSlotless("Senjutsu Focus"))
					MA+=0.2
			return MA
		GetMAOff()
			var/MA=0
			if(src.StyleBuff)
				MA=(src.StyleBuff.StyleOff-1)
				if(src.Secret=="Werewolf"&&(!src.CheckSlotless("Half Moon Form")))
					MA+=0.2
				if(src.Secret=="Zombie"||src.Secret=="Vampire")
					MA+=0.1
				if(src.Secret=="Haki"&&src.HakiSpecialization=="Armament")
					MA+=0.2
				if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation")
					MA+=0.1
				if(src.Secret=="Ripple")
					MA+=0.1
				MA*=(src.StyleBuff.Mastery) / 3
				if(src.StanceActive=="Advancing")
					if(src.UsingSpiritStyle())
						MA+=(0.75*src.UsingSpiritStyle())
					else
						MA+=0.5
				if(src.StanceActive=="Striking")
					if(src.UsingSpiritStyle())
						MA+=(0.5*src.UsingSpiritStyle())
					else
						MA+=0.25
				if(src.StanceActive=="Defensive")
					if(src.UsingSpiritStyle())
						MA-=(0.25/src.UsingSpiritStyle())
					else
						MA-=0.5
				if(src.StanceActive=="Evasive")
					if(src.UsingSpiritStyle())
						MA-=(0.5/src.UsingSpiritStyle())
					else
						MA-=0.75
			return MA
		GetMADef()
			var/MA=0
			if(src.StyleBuff)
				MA=(src.StyleBuff.StyleDef-1)
				if(src.Secret=="Haki"&&src.HakiSpecialization=="Observation")
					MA+=0.2
				if(src.Secret=="Haki"&&src.HakiSpecialization=="Armament")
					MA+=0.1
				if(src.Secret=="Ripple")
					MA+=0.2
				if(src.Secret=="Zombie"||src.Secret=="Vampire")
					MA+=0.1
				MA*=(src.StyleBuff.Mastery) / 3
				if(src.StanceActive=="Evasive")
					if(src.UsingSpiritStyle())
						MA+=(0.75*src.UsingSpiritStyle())
					else
						MA+=0.5
				if(src.StanceActive=="Defensive")
					if(src.UsingSpiritStyle())
						MA+=(0.5*src.UsingSpiritStyle())
					else
						MA+=0.25
				if(src.StanceActive=="Striking")
					if(src.UsingSpiritStyle())
						MA-=(0.25/src.UsingSpiritStyle())
					else
						MA-=0.5
				if(src.StanceActive=="Advancing")
					if(src.UsingSpiritStyle())
						MA-=(0.5/src.UsingSpiritStyle())
					else
						MA-=0.75
			return MA


		GetStr(var/Mult=1)
			var/Str=src.StrMod
			if(src.HasPiloting())
				for(var/obj/Items/Gear/Mobile_Suit/MS in src)
					Str=min(MS.Level,3)
			//mecha suits replace base stats with their level up to max value of 3, which is a cutoff line for many races
			Str+=src.StrAscension
			//stat ascensions gained through racial or saga improvements
			Str+=src.EnhancedStrength ? src.EnhancedStrength*0.5 : 0
			//cyber stats boosters.
			//gain double value when Overdive is active, unless the user is Android (then only +50%)
			Str*=src.StrChaos
			//tarot shit
			if(src.StrReplace)
				Str=StrReplace
			if(src.HasHellPower())
				if(Str<3*src.HasHellPower())
					Str=3*src.HasHellPower()
			//when you want to ignore all of the above for some reason

			var/Mod=1
			Mod+=(src.StrMultTotal-1)
			if(src.KamuiBuffLock)
				Mod+=1
			if(src.Saga=="Eight Gates")
				Mod+=0.05*src.SagaLevel
			if(src.Race=="Human")
				if(src.AscensionsAcquired)
					Mod+=(src.AscensionsAcquired/20)
			if(src.Race=="Android" && src.EnhancedStrength)
				Mod+=(src.AscensionsAcquired/10)*src.EnhancedStrength
			if(src.CheckSlotless("What Must Be Done"))
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/What_Must_Be_Done/wmbd in src.Buffs)
					if(wmbd.Password)
						Mod+=min(0.5, wmbd.Mastery/5)
			if(src.HasManaStats())
				Mod+=0.5*src.GetManaStats()*(src.ManaAmount/100)
			if(src.InfinityModule)
				Mod+=0.2
			if(src.ssj["active"]&&!src.SpecialBuff)
				if(src.masteries["[src.ssj["active"]]mastery"]==100||src.ssj["active"]>1)
					Mod+=0.2
			if(src.CheckSlotless("Devil Arm")&&!src.SpecialBuff)
				Mod+=0.3
			if(src.StrStolen)
				Mod+=src.StrStolen*0.5
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=25)
						Mod+=0.75*src.BurningShot
					else if(src.Burn>25&&src.Burn<=75)
						Mod+=0.5*src.BurningShot
					else
						Mod+=0.25*src.BurningShot
			if(src.SpecialBuff&&(src.SpecialBuff.BuffName=="Genesic Brave"||src.SpecialBuff.BuffName=="Broken Brave"))
				if(src.Health<=25*(1-src.HealthCut))
					Mod+=min(10/src.Health,1)
			if(src.StrEroded)
				Mod-=src.StrEroded

			Str*=Mod
			Str*=Mult
			if(src.HasMirrorStats())
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					Str=src.Target.GetStr()
			var/TotalTax
			if(src.StrTax)
				TotalTax+=src.StrTax
			if(src.StrCut)
				TotalTax+=src.StrCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=Str*TotalTax
			Str-=Sub
			Str+=src.GetMAStr()
			if(src.UsingYinYang()&&src.Target&&src.Target!=src&&!src.Target.UsingYinYang()&&istype(src.Target, /mob/Players))
				Str+=src.Target.GetMAEnd()*0.5
			if(src.HasAdaptation())
				if(src.AdaptationCounter!=0&&!src.Oozaru)
					if(src.Target&&src.AdaptationTarget==src.Target)
						Str+=(src.Target.GetMAEnd()*0.5*src.AdaptationCounter)
			if(Str<0.1)
				Str=0.1
			return Str

		GetFor(var/Mult=1)
			var/For=src.ForMod
			if(src.HasPiloting())
				for(var/obj/Items/Gear/Mobile_Suit/MS in src)
					For=min(MS.Level,3)
			For+=src.ForAscension
			For+=(EnhancedForce ? src.EnhancedForce*0.5 : 0)
			For*=src.ForChaos
			if(src.ForReplace)
				For=ForReplace
			if(src.HasHellPower())
				if(For<3*src.HasHellPower())
					For=3*src.HasHellPower()

			var/Mod=1
			Mod+=(src.ForMultTotal-1)
			if(src.Race=="Human")
				if(src.AscensionsAcquired)
					Mod+=(src.AscensionsAcquired/20)
			if(src.Race=="Android" && src.EnhancedForce)
				Mod+=(src.AscensionsAcquired/10)*src.EnhancedForce
			if(src.CheckSlotless("What Must Be Done"))
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/What_Must_Be_Done/wmbd in src.Buffs)
					if(wmbd.Password)
						Mod+=min(0.5, wmbd.Mastery/5)
			if(src.HasManaStats())
				Mod+=0.5*src.GetManaStats()*(src.ManaAmount/100)
			if(src.InfinityModule)
				Mod+=0.2
			if(src.ssj["active"]&&!src.SpecialBuff)
				if(src.masteries["[src.ssj["active"]]mastery"]==100||src.ssj["active"]>1)
					Mod+=0.2
			if(src.CheckSlotless("Devil Arm")&&!src.SpecialBuff)
				Mod+=0.3
			if(src.ForStolen)
				Mod+=src.ForStolen*0.5
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=25)
						Mod+=0.75*src.BurningShot
					else if(src.Burn>25&&src.Burn<=75)
						Mod+=0.5*src.BurningShot
					else
						Mod+=0.25*src.BurningShot
			if(src.SpecialBuff&&(src.SpecialBuff.BuffName=="Genesic Brave"||src.SpecialBuff.BuffName=="Broken Brave"))
				if(src.Health<=25*(1-src.HealthCut))
					Mod+=min(10/src.Health,1)
			if(src.ForEroded)
				Mod-=src.ForEroded

			For*=Mod
			For*=Mult
			if(src.HasMirrorStats())
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					For=src.Target.GetFor()
			var/TotalTax
			if(src.ForTax)
				TotalTax+=src.ForTax
			if(src.ForCut)
				TotalTax+=src.ForCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=For*TotalTax
			For-=Sub
			For+=src.GetMAFor()
			if(src.UsingYinYang()&&src.Target&&src.Target!=src&&!src.Target.UsingYinYang()&&istype(src.Target, /mob/Players))
				For+=src.Target.GetMAEnd()*0.5
				if(src.HasAdaptation())
					if(src.AdaptationCounter!=0&&!src.Oozaru)
						if(src.Target&&src.AdaptationTarget==src.Target)
							For+=(src.Target.GetMAEnd()*0.5*src.AdaptationCounter)
			if(For<0.1)
				For=0.1
			return For

		GetEnd(var/Mult=1)
			var/End=src.EndMod
			if(src.HasPiloting())
				for(var/obj/Items/Gear/Mobile_Suit/MS in src)
					End=min(MS.Level,3)
			End+=src.EndAscension
			End+=EnhancedEndurance ? src.EnhancedEndurance*0.5 : 0
			End*=src.EndChaos
			if(src.EndReplace)
				End=EndReplace

			var/Mod=1
			Mod+=(src.EndMultTotal-1)
			if(src.KamuiBuffLock)
				Mod+=1
			if(src.Race=="Human")
				if(src.AscensionsAcquired)
					Mod+=(src.AscensionsAcquired/20)
			if(src.Race=="Android" && src.EnhancedEndurance)
				Mod+=(src.AscensionsAcquired/10)*src.EnhancedEndurance
			if(src.CheckSlotless("What Must Be Done"))
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/What_Must_Be_Done/wmbd in src.Buffs)
					if(wmbd.Password)
						Mod+=min(0.5, wmbd.Mastery/5)
			if(src.HasManaStats())
				Mod+=0.5*src.GetManaStats()*(src.ManaAmount/100)
			if(src.InfinityModule)
				Mod+=0.3
			if(src.ssj["active"]&&!src.SpecialBuff)
				if(src.masteries["[src.ssj["active"]]mastery"]==100||src.ssj["active"]>1)
					Mod+=0.3
			if(src.CheckSlotless("Devil Arm")&&!src.SpecialBuff)
				Mod+=0.2
			if(src.EndStolen)
				Mod+=src.EndStolen*0.5
			if(src.Harden)
				Mod*=1.35
			if(src.Shatter)
				if(!src.HasDebuffImmune())
					if(src.HasDebuffReversal())
						Mod*=1.35
					else
						Mod*=0.65
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=50)
						Mod-=0.5*src.BurningShot
					else if(src.Burn>50&&src.Burn<=75)
						Mod-=0.75*src.BurningShot
					else
						Mod-=1*src.BurningShot
			if(src.SpecialBuff&&(src.SpecialBuff.BuffName=="Genesic Brave"||src.SpecialBuff.BuffName=="Protect Brave"))
				if(src.Health<=25*(1-src.HealthCut))
					Mod+=min(10/src.Health,1)
			if(src.EndEroded)
				Mod-=src.EndEroded

			End*=Mod
			End*=Mult
			if(src.HasMirrorStats())
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					End=src.Target.GetEnd()
			var/TotalTax
			if(src.EndTax)
				TotalTax+=src.EndTax
			if(src.EndCut)
				TotalTax+=src.EndCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=End*TotalTax
			End-=Sub
			End+=src.GetMAEnd()
			if(src.UsingYinYang()&&src.Target&&src.Target!=src&&!src.Target.UsingYinYang()&&istype(src.Target, /mob/Players))
				End+=(src.Target.GetMAStr()+src.Target.GetMAFor())*0.5
			if(src.HasAdaptation())
				if(src.AdaptationCounter!=0&&!src.Oozaru)
					if(src.Target&&src.AdaptationTarget==src.Target)
						End+=((src.Target.GetMAStr()+src.Target.GetMAFor())*0.5*src.AdaptationCounter)
			if(End<0.1)
				End=0.1
			return End

		GetSpd(var/Mult=1)
			var/Spd=src.SpdMod
			if(src.HasPiloting())
				for(var/obj/Items/Gear/Mobile_Suit/MS in src)
					Spd=min(MS.Level,2)*(1+src.PilotingProwess)
			Spd+=src.SpdAscension
			Spd+=EnhancedSpeed ? src.EnhancedSpeed*0.5 : 0
			Spd*=src.SpdChaos

			if(src.SpdReplace)
				Spd=SpdReplace

			var/Mod=1
			Mod+=(src.SpdMultTotal-1)
			if(src.KamuiBuffLock)
				Mod+=1
			if(src.Saga=="Eight Gates")
				Mod+=0.05*src.SagaLevel
			if(src.Race=="Human")
				if(src.AscensionsAcquired)
					Mod+=(src.AscensionsAcquired/20)
			if(src.Race=="Android" && src.EnhancedSpeed)
				Mod+=(src.AscensionsAcquired/10)*src.EnhancedSpeed
			if(src.CheckSlotless("What Must Be Done"))
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/What_Must_Be_Done/wmbd in src.Buffs)
					if(wmbd.Password)
						Mod+=min(0.5, wmbd.Mastery/5)
			if(src.HasManaStats())
				Mod+=0.5*src.GetManaStats()*(src.ManaAmount/100)
			if(src.InfinityModule)
				Mod+=0.3
			if(src.ssj["active"]&&!src.SpecialBuff)
				if(src.masteries["[src.ssj["active"]]mastery"]==100||src.ssj["active"]>1)
					Mod+=0.3
			if(src.CheckSlotless("Devil Arm")&&!src.SpecialBuff)
				Mod+=0.2
			if(src.SpdStolen)
				Mod+=src.SpdStolen*0.5
			if(src.Slow)
				if(!src.HasDebuffImmune())
					if(src.HasDebuffReversal())
						Mod*=1.35
					else
						Mod*=0.65
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=25)
						Mod+=0.75*src.BurningShot
					else if(src.Burn>25&&src.Burn<=75)
						Mod+=0.5*src.BurningShot
					else
						Mod+=0.25*src.BurningShot
			if(src.SpdEroded)
				Mod-=src.SpdEroded

			Spd*=Mod
			Spd*=Mult
			if(src.HasMirrorStats())
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					Spd=src.Target.GetSpd()
			var/TotalTax
			if(src.SpdTax)
				TotalTax+=src.SpdTax
			if(src.SpdCut)
				TotalTax+=src.SpdCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=Spd*TotalTax
			Spd-=Sub
			Spd+=src.GetMASpd()
			if(src.UsingYinYang()&&src.Target&&src.Target!=src&&!src.Target.UsingYinYang()&&istype(src.Target, /mob/Players))
				Spd+=src.Target.GetMASpd()*0.5
			if(src.HasAdaptation())
				if(src.AdaptationCounter!=0&&!src.Oozaru)
					if(src.Target&&src.AdaptationTarget==src.Target)
						Spd+=(src.Target.GetMASpd()*0.5*src.AdaptationCounter)
			if(Spd<0.1)
				Spd=0.1
			return Spd

		GetOff(var/Mult=1)
			var/Off=src.OffMod
			if(src.HasPiloting())
				if(src.Intelligence*(1+src.PilotingProwess)>src.OffMod)
					Off=src.Intelligence*(1+src.PilotingProwess)
			Off+=src.OffAscension
			Off+=EnhancedAggression ? src.EnhancedAggression*0.5 : 0
			Off*=src.OffChaos

			var/Mod=1
			Mod+=(src.OffMultTotal-1)
			if(src.Race=="Human")
				if(src.AscensionsAcquired)
					Mod+=(src.AscensionsAcquired/20)
			if(src.Race=="Android" && src.EnhancedAggression)
				Mod+=(src.AscensionsAcquired/10)*src.EnhancedAggression
			if(src.OffStolen)
				Mod+=src.OffStolen*0.5
			if(src.Shock)
				if(!src.HasDebuffImmune())
					if(src.HasDebuffReversal())
						Mod*=1.35
					else
						Mod*=0.65
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=25)
						Mod+=0.75*src.BurningShot
					else if(src.Burn>25&&src.Burn<=75)
						Mod+=0.5*src.BurningShot
					else
						Mod+=0.25*src.BurningShot
			if(src.OffEroded)
				Mod-=src.OffEroded

			Off*=Mod
			Off*=Mult
			if(src.HasMirrorStats())
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					Off=src.Target.GetOff()
			var/TotalTax
			if(src.OffTax)
				TotalTax+=src.OffTax
			if(src.OffCut)
				TotalTax+=src.OffCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=Off*TotalTax
			Off-=Sub
			Off+=src.GetMAOff()
			if(src.UsingYinYang()&&src.Target&&src.Target!=src&&!src.Target.UsingYinYang()&&istype(src.Target, /mob/Players))
				Off+=src.Target.GetMADef()*0.5
			if(src.HasAdaptation())
				if(src.AdaptationCounter!=0&&!src.Oozaru)
					if(src.Target&&src.AdaptationTarget==src.Target)
						Off+=(src.Target.GetMADef()*0.5*src.AdaptationCounter)
			if(Off<0.1)
				Off=0.1
			return Off

		GetDef(var/Mult=1)
			var/Def=src.DefMod
			if(src.HasPiloting())
				if(src.Intelligence*(1+src.PilotingProwess)>src.DefMod)
					Def=src.Intelligence*(1+src.PilotingProwess)
			Def+=src.DefAscension
			Def+=EnhancedReflexes ? src.EnhancedReflexes*0.5 : 0
			Def*=src.DefChaos

			var/Mod=1
			Mod+=(src.DefMultTotal-1)
			if(src.Race=="Human")
				if(src.AscensionsAcquired)
					Mod+=(src.AscensionsAcquired/20)
			if(src.Race=="Android" && src.EnhancedReflexes)
				Mod+=(src.AscensionsAcquired/10)*src.EnhancedReflexes
			if(src.DefStolen)
				Mod+=src.DefStolen*0.5
			if(src.Shock)
				if(!src.HasDebuffImmune())
					if(src.HasDebuffReversal())
						Mod*=1.35
					else
						Mod*=0.65
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=25)
						Mod+=0.75*src.BurningShot
					else if(src.Burn>25&&src.Burn<=75)
						Mod+=0.5*src.BurningShot
					else
						Mod+=0.25*src.BurningShot
			if(src.DefEroded)
				Mod-=src.DefEroded

			Def*=Mod
			Def*=Mult
			if(src.HasMirrorStats())
				if(src.Target&&src.Target!=src&&!src.Target.HasMirrorStats()&&istype(src.Target, /mob/Players))
					Def=src.Target.GetDef()
			var/TotalTax
			if(src.DefTax)
				TotalTax+=src.DefTax
			if(src.DefCut)
				TotalTax+=src.DefCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=Def*TotalTax
			Def-=Sub
			Def+=src.GetMADef()
			if(src.UsingYinYang()&&src.Target&&src.Target!=src&&!src.Target.UsingYinYang()&&istype(src.Target, /mob/Players))
				Def+=src.Target.GetMAOff()*0.5
			if(src.HasAdaptation())
				if(src.AdaptationCounter!=0&&!src.Oozaru)
					if(src.Target&&src.AdaptationTarget==src.Target)
						Def+=(src.Target.GetMAOff()*0.5*src.AdaptationCounter)
			if(Def<0.1)
				Def=0.1
			return Def

		GetRecov(var/Mult=1)
			var/Recov=src.RecovMod
			Recov+=src.RecovAscension
			if(src.RecovReplace)
				Recov=src.RecovReplace
			if(src.HasHellPower()||(src.Secret=="Werewolf"&&(!src.CheckSlotless("Half Moon Form"))))
				var/Effective=src.HasHellPower()
				if(src.Secret=="Werewolf"&&!src.CheckSlotless("Half Moon Form"))
					Effective=1
				if(src.Race=="Namekian"&&src.TransActive())
					Effective=1
				if(Recov<3*Effective)
					Recov=3*Effective
			if(src.Race=="Djinn")
				Recov=5

			var/Mod=1
			if(src.HasManaStats())
				Mod+=(0.5*src.GetManaStats()*(src.ManaAmount/100))

			Mod+=(src.RecovMultTotal-1)
			var/BM=src.HasBuffMastery()
			if(BM)
				if(Mod<0.95)
					Mod*=(1+(BM*0.2))
				else if(Mod>1.05)
					Mod*=(1+(BM*0.1))
			if(src.BurningShot)
				if(src.Burn)
					if(src.Burn>0&&src.Burn<=50)
						Mod-=0.5*src.BurningShot
					else if(src.Burn>50&&src.Burn<=75)
						Mod-=0.75*src.BurningShot
					else
						Mod-=1*src.BurningShot
			if(src.SpecialBuff&&(src.SpecialBuff.BuffName=="Genesic Brave"||src.SpecialBuff.BuffName=="Protect Brave"))
				if(src.Health<=25*(1-src.HealthCut))
					Mod+=min(10/src.Health,1)
			if(src.RecovEroded)
				Mod-=src.RecovEroded

			Recov*=Mod
			Recov*=Mult
			Recov*=src.RecovChaos
			if(src.Race=="Namekian"&&src.TransActive())
				if(Recov<3)
					Recov=3
			if(src.HasRipple())
				Recov*=max(min(src.Oxygen/src.OxygenMax,1.5),0.5)
			var/TotalTax
			if(src.RecovTax)
				TotalTax+=src.RecovTax
			if(src.RecovCut)
				TotalTax+=src.RecovCut
			if(TotalTax>=1)
				TotalTax=0.9
			var/Sub=Recov*TotalTax
			Recov-=Sub
			if(Recov<0.1)
				Recov=0.1
			return Recov


		NewAnger(var/num, var/Override=0)
			if(!Override)
				if(src.AngerMax < num)
					src.AngerMax = num
			else
				src.AngerMax=num
		AngerMult(var/num)
			src.AngerMax=1+((src.AngerMax-1)*num)
		AngerDiv(var/num)
			src.AngerMax=1+((src.AngerMax-1)/num)
		AllMult(var/num)
			src.StrMult(num)
			src.EndMult(num)
			src.SpdMult(num)
			src.ForMult(num)
			src.OffMult(num)
			src.DefMult(num)
		StrAdd(var/num)
			src.StrMod+=num
			src.StrOriginal+=num
		StrMult(var/num)
			src.StrMod*=num
			src.StrOriginal*=num
		StrDiv(var/num)
			src.StrMod/=num
			src.StrOriginal/=num
		EndMult(var/num)
			src.EndMod*=num
			src.EndOriginal*=num
		EndDiv(var/num)
			src.EndMod/=num
			src.EndOriginal/=num
		SpdMult(var/num)
			src.SpdMod*=num
			src.SpdOriginal*=num
		SpdDiv(var/num)
			src.SpdMod/=num
			src.SpdOriginal/=num
		ForAdd(var/num)
			src.ForMod+=num
			src.ForOriginal+=num
		ForMult(var/num)
			src.ForMod*=num
			src.ForOriginal*=num
		ForDiv(var/num)
			src.ForMod/=num
			src.ForOriginal/=num
		OffMult(var/num)
			src.OffMod*=num
			src.OffOriginal*=num
		OffDiv(var/num)
			src.OffMod/=num
			src.OffOriginal/=num
		DefMult(var/num)
			src.DefMod*=num
			src.DefOriginal*=num
		DefDiv(var/num)
			src.DefMod/=num
			src.DefOriginal/=num
		RecovMult(var/num)
			src.RecovMod*=num
			src.RecovOriginal*=num
		RecovDiv(var/num)
			src.RecovMod/=num
			src.RecovOriginal/=num
		GetBPM()
			return (src.potential_power_mult)
		BPMult(var/num)
			src.Base*=num
		BPDiv(var/num)
			src.Base/=num
		TransMastery(var/num)
			if(src.HasSSjVars())
				return src.ssj["[num]mastery"]
			else
				return src.trans["[num]mastery"]
		TransUnlocked()
			if(src.HasSSjVars())
				return src.ssj["unlocked"]
			else
				return src.trans["unlocked"]
		TransActive()
			if(src.HasSSjVars())
				return src.ssj["active"]
			else
				if(src.trans["tension"])
					return 1
				else
					return src.trans["active"]
		TransAuraFound()
			if(src.TransActive())
				if(src.TransActive()==1)
					if(src.Form1Aura)
						return 1
				if(src.TransActive()==2)
					if(src.Form2Aura)
						return 1
				if(src.TransActive()==3)
					if(src.Form3Aura)
						return 1
				if(src.TransActive()==4)
					if(src.Form4Aura)
						return 1
			return 0
		TransActiveDown()
			if(src.HasSSjVars())
				src.ssj["active"]--
			else
				src.trans["active"]--
		MakeSword(var/obj/Items/Sword/s, var/damage, var/acc, var/icon/i=null, var/px=0, var/py=0)
			s.DamageEffectiveness=damage
			s.AccuracyEffectiveness=acc
			s.AlignEquip(src)
			if(i)
				s.icon=i
				s.pixel_x=px
				s.pixel_y=py
			s.AlignEquip(src)
		ArmorShatter()
			var/obj/Items/Armor/ar=src.EquippedArmor()
			OMsg(src, "[src]'s armor has shattered!!")
			if(src.StyleBuff)
				if(src.StyleBuff.NeedsArmor||src.StyleBuff.MakesArmor)
					src.StyleBuff.Trigger(src, Override=1)
					if(src.StyleBuff.MakesArmor)
						del(ar)
			if(src.ActiveBuff)
				if(src.ActiveBuff.NeedsArmor||src.ActiveBuff.MakesArmor)
					src.ActiveBuff.Trigger(src, Override=1)
					if(src.ActiveBuff.MakesArmor)
						del(ar)
			if(src.SpecialBuff)
				if(src.SpecialBuff.NeedsArmor||src.SpecialBuff.MakesArmor)
					src.SpecialBuff.Trigger(src, Override=1)
					if(src.SpecialBuff.MakesArmor)
						del(ar)
			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
				if(sb.NeedsArmor||sb.MakesArmor)
					sb.Trigger(src, Override=1)
					if(sb.MakesArmor)
						del(ar)
			if(ar)
				ar.ObjectUse(User=src)
				spawn(10)
					ar.suffix="*Broken*"
					ar.Broken=1
		StaffShatter()
			var/obj/Items/Enchantment/Staff/st=src.EquippedStaff()
			OMsg(src, "[src]'s staff has shattered!!")
			if(src.StyleBuff)
				if(src.StyleBuff.NeedsStaff||src.StyleBuff.MakesStaff)
					src.StyleBuff.Trigger(src, Override=1)
					if(src.StyleBuff.MakesStaff)
						del(st)
			if(src.ActiveBuff)
				if(src.ActiveBuff.NeedsStaff||src.ActiveBuff.MakesStaff)
					src.ActiveBuff.Trigger(src, Override=1)
					if(src.ActiveBuff.MakesStaff)
						del(st)
			if(src.SpecialBuff)
				if(src.SpecialBuff.NeedsStaff||src.SpecialBuff.MakesStaff)
					src.SpecialBuff.Trigger(src, Override=1)
					if(src.SpecialBuff.MakesStaff)
						del(st)
			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
				if(sb.NeedsStaff||sb.MakesStaff)
					sb.Trigger(src, Override=1)
					if(sb.MakesStaff)
						del(st)
			if(st)
				st.ObjectUse(User=src)
				spawn(10)
					st.suffix="*Broken*"
					st.Broken=1
		SwordShatter(var/obj/Items/Sword/PassedSword=null)
			var/obj/Items/Sword/s
			if(PassedSword)
				s=PassedSword
			else
				s=src.EquippedSword()
			src.OMessage(10, "[src]'s sword has shattered!!", "[src]([src.key]) got their sword broken.")
			if(src.StyleBuff)
				if(src.StyleBuff.NeedsSword||src.StyleBuff.MakesSword)
					src.StyleBuff.Trigger(src, Override=1)
					if(src.StyleBuff.MakesSword)
						del(s)
			if(src.ActiveBuff)
				if(src.ActiveBuff.NeedsSword||src.ActiveBuff.MakesSword)
					src.ActiveBuff.Trigger(src, Override=1)
					if(src.ActiveBuff.MakesSword)
						del(s)
			if(src.SpecialBuff)
				if(src.SpecialBuff.NeedsSword||src.SpecialBuff.MakesSword)
					src.SpecialBuff.Trigger(src, Override=1)
					if(src.SpecialBuff.MakesSword)
						del(s)
			for(var/obj/Skills/Buffs/SlotlessBuffs/sb in src.SlotlessBuffs)
				if(sb.NeedsSword||sb.MakesSword)
					sb.Trigger(src, Override=1)
					if(sb.MakesSword)
						del(s)
			if(s)
				if(s.suffix=="*Equipped*")
					s.ObjectUse(User=src)
				else//this is in case the sword was dual / triple wielded
					var/obj/Items/Sword/ActualSword=src.EquippedSword()
					ActualSword.ObjectUse(User=src)
				spawn(10)
					s.suffix="*Broken*"//unequip that bitch
					s.Broken=1//can't be worn (for nyow)
					if(s.Glass)
						OMsg(src, "[src]'s glass weaponry shatters into a million pieces!")
						del s
					if(s.Conjured)
						OMsg(src, "[src]'s conjured weapontry shatters into arcane mist!")
						del s

		IsGrabbed()
			for(var/mob/Players/M in world)
				if(M.Grab==src)
					return M
			return 0

		StandardBiology()
			var/list/Standard=list("Human", "Half Saiyan", "Saiyan", "Tuffle", "Makyo", "Alien", "Monster")
			if(src.XenoBiology())
				return 0
			if(src.Race in Standard)
				return 1
			return 0
		XenoBiology()//might be useful for some anti-monster/anti-inhuman style later
			var/list/Xeno=list("Namekian", "Dragon", "Changeling")
			if(src.Race in Xeno)
				return 1
			if(src.Class=="Eldritch")
				return 1
			if(src.Race=="Android")
				return 1
			if(src.Secret=="Zombie")
				return 1
			if(src.HasPassive("Xenobiology", BuffsOnly=1))
				return 1
			return 0

		IsGood()
			var/list/EvilRaces=list("Djinn", "Demon")
			var/list/EvilSecrets=list("Vampire", "Werewolf", "Zombie")
			//these are all bad.
			if(src.HasMaki())
				return 0
			if(src.Race=="Android")
				return 0
			if(src.Race in EvilRaces)
				return 0
			if(src.Secret in EvilSecrets)
				return 0
			if(src.ShinjinAscension=="Makai")
				return 0
			if(src.HasHellPower())
				return 0
			if(src.HasAbyssMod() && !src.HasHolyMod())
				return 0
			if(istype(src, /mob/Player/AI) && !src.SpiritPower)
				return 0
			//these are all good.
			if(src.ShinjinAscension=="Kai")
				return 1
			if(src.HasHolyMod() && !src.HasAbyssMod())
				return 1
			if(src.Secret=="Ripple")
				return 1
			if(src.HasSpiritPower())
				return 1
			return 0
		IsEvil()
			var/list/EvilRaces=list("Djinn", "Demon")
			var/list/EvilSecrets=list("Vampire", "Werewolf", "Zombie")
			//these are all good.
			if(src.Race=="Android")
				return 0
			if(src.ShinjinAscension=="Kai")
				return 0
			if(src.HasHolyMod())
				return 0
			if(src.HasSpiritPower())
				return 0
			//these are all bad.
			if(src.HasMaki())
				return 1
			if(src.Race in EvilRaces)
				return 1
			if(src.Secret in EvilSecrets)
				return 1
			if(src.ShinjinAscension=="Makai")
				return 1
			if(src.HasHellPower())
				return 1
			if(src.HasAbyssMod())
				return 1
			if(istype(src, /mob/Player/AI) && !src.SpiritPower)
				return 1
			if(src.NoDeath && src.Class!="Eldritch")
				return 1
			return 0

		HolyDamage(var/mob/P, var/Forced=0)//Stick this in the DoDamage proc.
			//To get to this proc, you have to already have holy damage
			if(P.UsingMuken())
				if(!Forced)
					return (-1)*src.GetHolyMod()
				else
					return (-1)*Forced
			else if(P.IsEvil())
				if(!Forced)
					return src.GetHolyMod()
				else
					return Forced
			else if(src.HasSpiritPower())
				if(!Forced)
					return src.GetHolyMod()*src.HasSpiritPower()
				else
					return Forced
			else
				return 1
		AbyssDamage(var/mob/P, var/Forced=0)//Stick this in the DoDamage proc.
			//yadda yadda gotta have abyss
			if(P.UsingMuken())
				if(!Forced)
					return (-1)*src.GetAbyssMod()
				else
					return (-1)*Forced
			else if(!P.IsGood())
				if(!Forced)
					return src.GetAbyssMod()
				else
					return Forced
			else if(P.IsGood())
				if(!Forced)
					return (-1)*src.GetAbyssMod()
				else
					return (-1)*Forced
			else
				return 1
		SlayerDamage(var/mob/P, var/Forced=0)
			if(P.UsingMuken())
				return (-1)*src.GetSlayerMod()

			if(src.Saga in list("Hiten Mitsurugi-Ryuu", "Ansatsuken"))
				if(src.SagaLevel>=7)
					if(!Forced)
						return src.GetSlayerMod()
					else
						return Forced

			if(P.StandardBiology())
				if(!Forced)
					return src.GetSlayerMod()
				else
					return Forced
			else
				return 1

		SpiritShift()
			var/SFStr=src.BaseFor()+(0.2*src.AscensionsAcquired*(src.BaseStr()-src.BaseFor()))
			var/SFFor=src.BaseStr()
			src.StrReplace=SFStr
			src.ForReplace=SFFor
		SpiritShiftBack()
			src.StrReplace=0
			src.ForReplace=0

		Flux()
			var/list/Chaos=list(0.6, 0.7, 0.7, 0.8, 0.8, 0.8, 0.9, 0.9, 0.9, 0.9, 1, 1, 1, 1, 1, 1.1, 1.1, 1.1, 1.1, 1.2, 1.2, 1.2, 1.3, 1.3, 1.4)
			src.StrChaos*=pick(Chaos)
			src.EndChaos*=pick(Chaos)
			src.SpdChaos*=pick(Chaos)
			src.ForChaos*=pick(Chaos)
			src.OffChaos*=pick(Chaos)
			src.DefChaos*=pick(Chaos)
			src.RecovChaos*=pick(Chaos)
			src.RecovChaos*=pick(Chaos)
		UnFlux()
			src.StrChaos=1
			src.EndChaos=1
			src.SpdChaos=1
			src.ForChaos=1
			src.OffChaos=1
			src.DefChaos=1
			src.RecovChaos=1
			src.RecovChaos=1

		SetHitSpark(var/icon, var/x1=0, var/y1=0, var/turn=0, var/size=1)
			src.BuffHitSparkIcon=icon
			src.BuffHitSparkX=x1
			src.BuffHitSparkY=y1
			src.BuffHitSparkTurns=turn
			src.BuffHitSparkSize=size
		ClearHitSpark()
			src.BuffHitSparkIcon=null
			src.BuffHitSparkX=0
			src.BuffHitSparkY=0
			src.BuffHitSparkTurns=0
			src.BuffHitSparkSize=1

		TakeMoney(var/Value)
			for(var/obj/Money/m in src)
				m.Level-=Value
				m.name="[Commas(round(m.Level))] [global.MoneyName]"
		GiveMoney(var/Value)
			for(var/obj/Money/m in src)
				m.Level+=Value
				m.name="[Commas(round(m.Level))] [global.MoneyName]"
			src << "You've gained [Commas(round(Value))] [global.MoneyName]."
		TakeManaCapacity(var/Value)
			var/Remaining=Value
			for(var/obj/Magic_Circle/MC in range(3, src))
				if(!MC.Locked)
					Remaining*=0.9
				else
					if(MC.Creator==src.ckey)
						Remaining*=0.75
				break
			for(var/obj/Items/Enchantment/PhilosopherStone/PS in src)
				if(!PS.ToggleUse) continue
				if(Remaining==PS.CurrentCapacity)
					Remaining=0
					PS.CurrentCapacity=0
				else if(Remaining>PS.CurrentCapacity)
					Remaining-=PS.CurrentCapacity
					PS.CurrentCapacity=0
				else if(PS.CurrentCapacity>Remaining)
					PS.CurrentCapacity-=Remaining
					Remaining=0
				if(0>=PS.CurrentCapacity) if(istype(PS, /obj/Items/Enchantment/PhilosopherStone/Magicite))
					src << "You burn out the mana in one of your magicite stones, causing it to crumble."
					contents-=PS
					PS.loc = null //garbage collection
					for(var/atom/a in PS.contents) PS.contents-=a //incase they sealed it i guess
				PS.desc="A philosopher's stone is the result of a sapient being transmuted into pure mana.  They regenerate capacity.<br>Your [PS] has [PS.CurrentCapacity] / [PS.MaxCapacity] capacity generated."
				if(Remaining==0)
					break
			if(Remaining>0)
				src.LoseCapacity(Remaining)
				//This proc only gets called if it has already been checked that someone has enough to pay...So nothing else should be necessary.
		DropMoney(var/Value)
			var/obj/Money/m=new
			m.Level=Value
			m.name="[Commas(round(m.Level))] [global.MoneyName]"
			m.loc=get_step(src, src.dir)
			m.MoneyCreator=src.key
			for(var/obj/Money/m2 in src)
				m.icon=m2.icon
			src.TakeMoney(m.Level)
		GetRadarRange()
			var/Highest=0
			for(var/obj/Items/Tech/Radar/r in src)
				if(r.Range>Highest)
					Highest=r.Range
			return Highest

		TriggerBinding()
			if(src.z!=src.Binding)
				OMsg(src, "[src]'s binding pulls their body back to their sealed dimension!")
				src.loc=locate(150, 150, src.Binding)
				OMsg(src, "[src] suddenly appears as a result of their binding!")
			src.BindingTimer=RawMinutes(1, 60)//refresh timer regardless

		SetStasis(var/StasisTime)
			if(src.HasDebuffImmune())
				StasisTime/=2
			src.Stasis=StasisTime
			if(!src.StasisFrozen)
				src.StasisEffect("Form")
		RemoveStasis()
			src.Stasis=0
			if(src.StasisFrozen)
				src.StasisEffect("Thaw")
			if(src.StasisSpace)
				src.density=1
				src.Grabbable=1
				src.Incorporeal=0
				src.invisibility=0
				src.StasisSpace=0
				animate(src.client, color = null, time = 5)

		GatesMessage(var/NewGate)
			if(NewGate==1)
				if(src.GatesActive<1)
					OMsg(src, "[src] opens the First Gate: Gate of Opening!")
					return
			if(NewGate==2)
				if(src.GatesActive<2)
					OMsg(src, "[src] opens the Second Gate: Gate of Healing!")
					return
			if(NewGate==3)
				if(src.GatesActive<3)
					OMsg(src, "[src] opens the Third Gate: Gate of Life!")
					src.Quake(5)
					return
			if(NewGate==4)
				if(src.GatesActive<4)
					OMsg(src, "[src] opens the Fourth Gate: Gate of Pain!")
					src.Quake(5)
					return
			if(NewGate==5)
				if(src.GatesActive<5)
					OMsg(src, "[src] opens the Fifth Gate: Gate of Limit!")
					src.Quake(5)
					return
			if(NewGate==6)
				if(src.GatesActive<6)
					OMsg(src, "[src] opens the Sixth Gate: Gate of View!")
					src.Quake(10)
					return
			if(NewGate==7)
				if(src.GatesActive<7)
					OMsg(src, "[src] opens the Seventh Gate: Gate of Wonder!")
					src.Quake(10)
					return
			if(NewGate==8)
				if(src.GatesActive<8)
					OMsg(src, "[src] opens the Eighth Gate: Gate of Death!")
					src.Quake(20)
					return

		AlienRacials()
			var/list/Racials=list()
			var/Choice
			var/Confirm
			while(Confirm!="Yes")
				//Racials.Add("Prodigy")
				Racials.Add("Juggernaut")
				if(!src.Attunement || src.Attunement=="Fire")
					Racials.Add("Pyrokinetic")
				if(!src.Attunement || src.Attunement=="Water")
					Racials.Add("Cryogenic")
				if(!src.Attunement || src.Attunement=="Earth")
					Racials.Add("Breaker")
				if(!src.Attunement || src.Attunement=="Wind")
					Racials.Add("Shocker")
				Racials.Add("Hustle")
				Racials.Add("Infusion")
				Racials.Add("Flicker")
				Racials.Add("Adrenaline")
				if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Camouflage, src) && !locate(/obj/Skills/Clairvoyance, src))
					Racials.Add("Hunter")
				if(!locate(/obj/Skills/Telekinesis, src) && !locate(/obj/Skills/Utility/Observe, src))
					Racials.Add("ESP")
				Racials.Add("Fishman")
				Racials.Add("Venomblood")
				Racials.Add("Xenobiology")
				if(!usr.AscensionsAcquired)
					//Racials.Add("Longevity") trap pick for this wipe
					Racials.Add("Genius")//doesnt allow stacking of spiritual and genius
					//Racials.Add("Symbiotic") foolish samurai warrior
					Racials.Add("Spiritual")
				Choice=input("Pick an alien racial.") in Racials
				switch(Choice)
					if("Juggernaut")
						Confirm=alert(usr, "Juggernauts cannot knocked back and recover faster when stunned.  Is this your trait?", "Racial Trait", "Yes", "No")
					if("Pyrokinetic")
						Confirm=alert(usr, "You utilize Fire element innately and you can burn people more intensely, but you really hate the cold. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Cryogenic")
						Confirm=alert(usr, "You utilize Water element innately and you can slow people easier, but shatter effects really hurt you. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Breaker")
						Confirm=alert(usr, "You utilize Earth element innately and can shatter people harder, but you are more vulnerable to electricity. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Shocker")
						Confirm=alert(usr, "You utilize Wind element innately and can shock people twice as easily, but you dislike fire. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Hustle")
						Confirm=alert(usr, "Hustle users move more recklessly and in constant rush. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Anaerobic")
						Confirm=alert(usr, "Anaerobic aliens grow more efficient with the buildup of fatigue in their muscles. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Infusion")
						Confirm=alert(usr, "Infusion users can bend the elements used against them to their advantage. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Flicker")
						Confirm=alert(usr, "Flicker fighters are masters of moving faster than the eye can see. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Adrenaline")
						Confirm=alert(usr, "Adrenaline fighters go faster as their health goes lower. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Hunter")
						Confirm=alert(usr, "Hunters possess both the cunning to meld with their environment and improved sensory prowess. Is this your trait?", "Racial Trait", "Yes", "No")
					if("ESP")
						Confirm=alert(usr, "Espers possess telekinetic and telepathic abilities. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Genius")
						Confirm=alert(usr, "Geniuses possess naturally higher intellect making developing new branches of knowledge easier. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Fishman")
						Confirm=alert(usr, "Fishmen have adjusted to the aquatic life - they do not tire from swimming, heal faster in water and constantly secrete mucus, making them tricky to grapple. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Venomblood")
						Confirm=alert(usr, "Venombloods are aliens evolved in highly noxious environments. They are highly resistant to various forms of poison and their blood is mildly toxic as well. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Xenobiology")
						Confirm=alert(usr, "Your anatomy is different enough to make you immune to typical ways of landing critical damage. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Longevity")
						Confirm=alert(usr, "Compared to other races, your lifespan is notably extensive. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Symbiotic")
						Confirm=alert(usr, "Compared to other races, your lifeforce is shared with another being - a mysterious symbiotic organism, ready to protect its host at all cost. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Spiritual")
						Confirm=alert(usr, "You have innate ties to the spirit realm and are more adept at magic. Is this your trait?", "Racial Trait", "Yes", "No")
					if("Prodigy")
						Confirm=alert(usr, "Compared to others, you quickly advance your potential as a fighter. Is this your trait?", "Racial Trait", "Yes", "No")
			switch(Choice)
				if("Juggernaut")
					if(src.Juggernaut<1)
						usr.Juggernaut+=1
					else
						usr.Juggernaut+=0.5
						src.EndAscension+=0.5
				if("Pyrokinetic")
					if(usr.Attunement=="Fire")
						src.DarknessFlame=1
						src.StrAscension+=0.25
						src.ForAscension+=0.25
					else
						usr.Attunement="Fire"
						usr.AddSkill(new/obj/Skills/Queue/Blaze_Burst)
						usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Elemental_Infusion)
				if("Cryogenic")
					if(src.Attunement=="Water")
						src.AbsoluteZero=1
						src.SpdAscension+=0.25
						src.DefAscension+=0.25
					else
						usr.Attunement="Water"
						usr.AddSkill(new/obj/Skills/Queue/Winter_Shock)
						usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Elemental_Infusion)
				if("Breaker")
					if(src.Attunement=="Earth")
						src.Hardening=3
						src.EndAscension+=0.25
						src.OffAscension+=0.25
					else
						usr.Attunement="Earth"
						usr.AddSkill(new/obj/Skills/Queue/Terra_Crack)
						usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Elemental_Infusion)
				if("Shocker")
					if(src.Attunement=="Wind")
						src.StunningStrike=1
						src.SpdAscension+=0.25
						src.EndAscension+=0.25
					else
						usr.Attunement="Wind"
						usr.AddSkill(new/obj/Skills/Queue/Aero_Slash)
						usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Elemental_Infusion)
				if("Hustle")
					if(usr.Hustle<1)
						usr.Hustle+=1
					else
						usr.Hustle+=0.25
						usr.SuperDash+=1
				if("Anaerobic")
					if(!usr.Anaerobic)
						usr.Anaerobic+=1
					else
						usr.Anaerobic+=0.5
						usr.MovementMastery+=2.5
				if("Infusion")
					if(!usr.Infusion)
						usr.Infusion+=1
					else
						src.DebuffImmune+=1
				if("Flicker")
					if(usr.Flicker<1)
						usr.Flicker+=1
						if(!locate(/obj/Skills/Zanzoken, src))
							usr.AddSkill(new/obj/Skills/Zanzoken)
					else
						usr.Pursuer+=1
				if("Adrenaline")
					if(!usr.Adrenaline)
						usr.Adrenaline+=1
					else
						usr.Desperation+=1
				if("Hunter")
					if(!usr.EnhancedSmell)
						usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Camouflage)
						usr.EnhancedSmell=1
						usr.EnhancedHearing=1
						usr.see_invisible=71
					else
						usr.AddSkill(new/obj/Skills/Clairvoyance)
				if("ESP")
					if(!locate(/obj/Skills/Telekinesis, src))
						usr.AddSkill(new/obj/Skills/Telekinesis)
						usr.AddSkill(new/obj/Skills/Utility/Telepathy)
					else
						usr.AddSkill(new/obj/Skills/Utility/Observe)
				if("Genius")
					usr.Intelligence+=0.5
				if("Fishman")
					if(!usr.Fishman)
						usr.Fishman+=1
					else
						usr.SpdAscension+=1
				if("Venomblood")
					if(!usr.VenomBlood)
						usr.VenomResistance+=1
						usr.VenomBlood+=1
					else
						usr.AngerMax+=0.125
				if("Xenobiology")
					if(!usr.Xenobiology)
						usr.Xenobiology+=1
					else
						usr.RecovAscension+=0.5
				if("Longevity")
					usr.Longlived=1
					usr.ModifyEarly+=1
					usr.ModifyPrime+=2
					usr.ModifyLate+=1
				/*if("Symbiotic")
					usr.RPPower*=0.8
					usr.Symbiote=1
					usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection)
					for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Symbiote_Infection/S in usr)
						S.NameFake=input(usr, "What will be the name of your symbiote?", "Symbiote") as text|null
						if(S.NameFake==""||S.NameFake==null)
							S.NameFake="Symbiote"*/
				if("Spiritual")
					usr.Spiritual=1
					usr.Imagination+=1
				if("Prodigy")
					usr.PotentialRate+=2
					usr.PotentialCap+=20
					if(usr.PotentialRate>5)
						usr.PotentialRate=5
					if(usr.PotentialCap>200)
						usr.PotentialCap=200
			usr.SetVars()
		AlienStatAscensions(var/x)
			src.AlienEvolutionStats+=x
			var/list/Choices=list("Strength", "Endurance", "Force", "Speed")
			while(x>0)
				x--
				var/Choice=input(src, "What aspect of your biology evolves?", "Alien Ascension") in Choices
				switch(Choice)
					if("Strength")
						src.StrAscension+=0.25
					if("Endurance")
						src.EndAscension+=0.25
					if("Force")
						src.ForAscension+=0.25
					if("Speed")
						src.SpdAscension+=0.25

		AddCyberCancel(var/val)
			src.CyberCancel+=val
			if(src.Race!="Android")
				if(src.CyberCancel>0.75)
					src.CyberCancel=0.75
		RemoveCyberCancel(var/val)
			src.CyberCancel-=val
			if(src.CyberCancel<0)
				src.CyberCancel=0
			if(src.Race=="Android")
				src.AddCyberCancel(1)
		SetCyberCancel()
			src.CyberCancel=0
			src.SetEnhanceChipCancel()
			src.SetMilitaryFrameCancel()
			src.SetConversionModuleCancel()
			if(src.CyberizeMod)
				if(src.CyberizeMod>=1)
					src.CyberCancel=0
				else if(src.CyberizeMod<1&&src.CyberizeMod>0)
					src.CyberCancel=src.CyberCancel-(src.CyberCancel*src.CyberizeMod)//remove portion of nerfs
			if(src.CyberCancel>0)
				src.Mechanized=1
			if(src.Race=="Tuffle")
				src.CyberCancel=0
				src.Mechanized=0
			if(src.Race=="Android")
				src.CyberCancel=1
				src.Mechanized=1
		SetEnhanceChipCancel()
			if(src.EnhanceChips)
				var/ChipCancel=0
				var/Percent=src.EnhanceChips/4
				ChipCancel=(0.25*Percent)
				if(ChipCancel>0.25)//idk how this would happen...
					ChipCancel=0.25
				src.AddCyberCancel(ChipCancel)
		SetMilitaryFrameCancel()
			if(src.HasMilitaryFrame())
				src.AddCyberCancel(0.25)
		SetConversionModuleCancel()
			var/Conversions=src.HasConversionModules()
			if(Conversions)
				var/Percent=Conversions/10
				var/ConversionCancel=(0.25*Percent)
				if(ConversionCancel>0.25)
					ConversionCancel=0.25
				src.AddCyberCancel(ConversionCancel)
		GetAndroidIntegrated()
			var/Count=0
			for(var/obj/Skills/S in usr)
				if(istype(S, /obj/Skills/Buffs/SlotlessBuffs/Gear/Integrated))
					Count++
					continue
				if(istype(S, /obj/Skills/Queue/Gear/Integrated))
					Count++
					continue
				if(istype(S, /obj/Skills/Projectile/Gear/Integrated))
					Count++
					continue
				if(istype(S, /obj/Skills/AutoHit/Gear/Integrated))
					Count++
					continue
			if(Count>=2+usr.AscensionsAcquired)
				src << "You already have the full number of integrated gears possible!"
				return 2+usr.AscensionsAcquired
			return Count

		ForceCancelBeam()
			if(Beaming)
				for(var/obj/Skills/Projectile/p in src)
					if(p.Charging)
						BeamStop(p)
						if(p.ChargeIcon)
							src.Chargez("Remove", image(icon=p.ChargeIcon, pixel_x=p.ChargeIconX, pixel_y=p.ChargeIconY))
						else
							src.Chargez("Remove")
					p.Charging=0
					src.Beaming=0
					src.BeamCharging=0
		ForceCancelBuster()
			if(BusterTech)
				if(BusterTech.Charging)
					BusterTech.Charging=0
					if(BusterTech.ChargeIcon)
						src.Chargez("Remove", image(icon=BusterTech.ChargeIcon, pixel_x=BusterTech.ChargeIconX, pixel_y=BusterTech.ChargeIconY))
					else
						src.Chargez("Remove")
					src.BusterCharging=0
					src.BusterTech=0
		ReturnProfile(var/FormNum)
			var/Return
			var/ProfileValue=src.vars["Form[FormNum]Profile"]
			if(ProfileValue)//if they have a profile set to the form
				Return=ProfileValue
			else
				Return=src.Profile
			return Return
		AddSkill(var/obj/Skills/S, var/AlreadyHere=0)
			if(S.type in typesof(/obj/Skills/Queue))
				src.Queues.Add(S)
			else if(S.type in typesof(/obj/Skills/AutoHit))
				src.AutoHits.Add(S)
			else if(S.type in typesof(/obj/Skills/Projectile))
				src.Projectiles.Add(S)
			else if(S.type in typesof(/obj/Skills/Buffs))
				src.Buffs.Add(S)
			src.Skills.Add(S)
			if(!AlreadyHere)
				src.contents.Add(S)
		DeleteSkill(var/obj/Skills/s)
			if(s in src.Queues)
				src.Queues.Remove(s)
			if(s in src.AutoHits)
				src.AutoHits.Remove(s)
			if(s in src.Projectiles)
				src.Projectiles.Remove(s)
			if(s in src.Buffs)
				src.Buffs.Remove(s)
			if(s in src.Skills)
				src.Skills.Remove(s)
			if(s in src.contents)
				src.contents.Remove(s)
			del s
		AddItem(var/obj/Items/I, var/AlreadyHere=0)
			src.Items.Add(I)
			if(!AlreadyHere)
				src.contents+=I
		AddUnlockedTechnology(var/x)
			if(x in list("Weapons", "Armor", "Weighted Clothing", "Smelting", "Locksmithing"))
				src.ForgingUnlocked++
			if(x in list("Molecular Technology", "Light Alloys", "Shock Absorbers", "Advanced Plating", "Modular Weaponry"))
				src.RepairAndConversionUnlocked++
			if(x in list("Medkits", "Fast Acting Medicine", "Enhancers", "Anesthetics", "Automated Dispensers"))
				src.MedicineUnlocked++
			if(x in list("Regenerator Tanks", "Prosthetic Limbs", "Genetic Manipulation", "Regenerative Medicine", "Revival Protocol"))
				src.ImprovedMedicalTechnologyUnlocked++
			if(x in list("Wide Area Transmissions", "Espionage Equipment", "Surveilance", "Drones", "Local Range Devices"))
				src.TelecommunicationsUnlocked++
			if(x in list("Scouters", "Obfuscation Equipment", "Satellite Surveilance", "Combat Scanning", "EM Wave Projectors"))
				src.AdvancedTransmissionTechnologyUnlocked++
			if(x in list("Hazard Suits", "Force Shielding", "Jet Propulsion", "Power Generators"))
				src.EngineeringUnlocked++
			if(x in list("Android Creation", "Conversion Modules", "Enhancement Chips", "Involuntary Implantation"))
				src.CyberEngineeringUnlocked++
			if(x in list("Assault Weaponry", "Missile Weaponry", "Melee Weaponry", "Thermal Weaponry", "Blast Shielding"))
				src.MilitaryTechnologyUnlocked++
			if(x in list("Powered Armor Specialization", "Armorpiercing Weaponry", "Impact Weaponry", "Hydraulic Weaponry"))
				src.MilitaryEngineeringUnlocked++

			if(x in list("Healing Herbs", "Refreshment Herbs", "Magic Herbs", "Toxic Herbs", "Philter Herbs"))
				src.AlchemyUnlocked++
			if(x in list("Stimulant Herbs", "Relaxant Herbs", "Numbing Herbs", "Distillation Process", "Mutagenic Herbs"))
				src.ImprovedAlchemyUnlocked++
			if(x in list("Spell Focii", "Artifact Manufacturing", "Arcane Espionage", "Flying Devices", "Warding Glyphs"))
				src.ToolEnchantmentUnlocked++
			if(x in list("Tome Cleansing", "Tome Security", "Tome Translation", "Tome Binding", "Tome Excerpts"))
				src.TomeCreationUnlocked++
			if(x in list("Turf Sealing", "Object Sealing", "Power Sealing", "Mobility Sealing", "Command Sealing"))
				src.SealingMagicUnlocked++
			if(x in list("Teleportation", "Retrieval", "Bilocation", "Dimensional Manipulation", "Dimensional Restriction"))
				src.SpaceMagicUnlocked++
			if(x in list("Transmigration", "Lifespan Extension", "Temporal Displacement", "Temporal Acceleration", "Temporal Rewinding"))
				src.TimeMagicUnlocked++

			src.UnlockedTechnology.Add(x)
		LoseLifespan(var/val)
			var/Remaining=val
			if(Remaining>0)
				if(src.ModifyFinal>(-1))
					if(src.ModifyFinal-Remaining<(-1))//if there's not enough life left in this stage
						Remaining=abs(-1)-abs(src.ModifyFinal)
						src.ModifyFinal=-1
					else//if there is enough life left
						src.ModifyFinal-=Remaining
						Remaining=0
			if(Remaining>0)
				if(src.ModifyLate>(-1))
					if(src.ModifyLate-Remaining<(-1))//if there's not enough life left in this stage
						Remaining=abs(-1)-abs(src.ModifyLate)
						src.ModifyLate=-1
					else//if there is enough life left
						src.ModifyLate-=Remaining
						Remaining=0
			if(Remaining>0)
				if(src.ModifyPrime>(-2))
					if(src.ModifyPrime-Remaining<(-2))//if there's not enough life left in this stage
						Remaining=abs(-2)-abs(src.ModifyPrime)
						src.ModifyPrime=-2
					else//if there is enough life left
						src.ModifyPrime-=Remaining
						Remaining=0
			if(Remaining>0)
				if(src.ModifyEarly>(-1))
					if(src.ModifyEarly-Remaining<(-1))//if there's not enough life left in this stage
						Remaining=abs(-1)-abs(src.ModifyEarly)
						src.ModifyEarly=-1
					else//if there is enough life left
						src.ModifyEarly-=Remaining
						Remaining=0
			if(Remaining>0)
				src.EraDeathTrigger=1
				src.Death(null, "exhausting their remaining lifespan!", SuperDead=10)
		MakeWarper(var/_x, var/_y, var/_z)
			var/obj/Special/Teleporter2/q=new(src.loc)
			var/obj/Special/Teleporter2/q2=new(locate(_x, _y, _z))
			q.Savable=1
			q.Destructable=0
			q.gotoX=_x
			q.gotoY=_y
			q.gotoZ=_z
			q.AssociatedWarper=q2
			q2.Savable=1
			q2.Destructable=0
			q2.gotoX=q.x
			q2.gotoY=q.y
			q2.gotoZ=q.z
			q2.AssociatedWarper=q
			global.Turfs+=q
			global.Turfs+=q2
			Log("Admin","[ExtractInfo(usr)] made a warper at [usr.x],[usr.y],[usr.z] to warp to [_x],[_y],[_z]!")
		DashTo(var/mob/Trg, var/MaxDistance=20, var/Delay=0.75, var/Clashable=0)
			var/DelayRelease=0
			src.Frozen=1
			src.icon_state="Flight"
			while(MaxDistance>0)
				var/travel_angle = GetAngle(src, Trg)
				animate(src.filters[filters.len], x=sin(travel_angle)*(6/Delay), y=cos(travel_angle)*(6/Delay), time=Delay)
				step_to(src,Trg)
				if(Trg in oview(1, src))
					MaxDistance=0
					Delay=0
					src.dir=get_dir(src,Trg)
					if(Trg.Knockbacked)
						src.NextAttack=0
						Trg.StopKB()
						if(Clashable)
							for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Clash_Defensive/DC in Trg)
								if(!Trg.BuffOn(DC))
									DC.Trigger(Trg)
							for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dragon_Clash/DC in src)
								if(!src.BuffOn(DC))
									DC.Trigger(src)
					break
				else
					MaxDistance-=1
					DelayRelease+=Delay
					if(DelayRelease>=1)
						DelayRelease--
						sleep(1*world.tick_lag)
			src.Frozen=0
			if(src.is_dashing>0)
				src.is_dashing--
			src.icon_state=""
			animate(src.filters[filters.len], x=0, y=0)
			src.dir=get_dir(src,Trg)
		Reincarnate()
			src.Savable=0
			if(istype(src, /mob/Players))
				fdel("Saves/Players/[src.ckey]")
			src.RPPCurrent=src.RPPSpent+src.RPPSpendable
			src.RPPTotal+=src.RPPCurrent
			global.RPPTotal["[src.ckey]"]=(src.RPPTotal/src.GetRPPMult())
			OMsg(src, "[src] fades away slowly, ready to begin a new life...", "[src] reincarnated.")
			animate(src,alpha=0,time=600)
			spawn(600)
				del(src)

		CountStyles(var/Tier=0)
			var/Count=0
			if(!Tier)
				Log("Admin", "[ExtractInfo(src)] tried to count signatures without specifying a tier.")
				return
			for(var/obj/Skills/Buffs/NuStyle/s in src.Skills)
				if(s.SignatureTechnique==Tier)
					Count++
					continue
			return Count
		CountSigs(var/Tier=0)
			var/Count=0
			var/list/combo_check=list()
			if(!Tier)
				Log("Admin", "[ExtractInfo(src)] tried to count signatures without specifying a tier.")
				return
			for(var/obj/Skills/s in src.Skills)
				if(istype(s, /obj/Skills/Buffs/NuStyle))
					continue
				if(s.SignatureTechnique==Tier)
					if("[s.type]" in combo_check)
						continue
					for(var/list/l in SigCombos)
						if("[s.type]" in l)
							combo_check += l
							break

					Count++
					continue
			return Count
		SagaEXPReq()
			var/Needed
			switch(src.SagaLevel)
				if(1)
					Needed=100
				if(2)
					Needed=150
				if(3)
					Needed=200
				if(4)
					Needed=250
				if(5)
					Needed=300
			return Needed
		SagaLevelUp()
			var/Needed=src.SagaEXPReq()
			if(src.SagaEXP >= Needed)
				return 1
			return 0
		SagaProgression()
			if(src.SagaLevelUp())
				if(src.Potential<25 && src.SagaLevel>=2)
					return
				if(src.Potential<50&&src.SagaLevel>=4)
					return
				if(src.Potential<75&&src.SagaLevel>=6)
					return
				if(src.SagaLevel>=6&&!src.SagaAdminPermission)
					return
				src.saga_up_self()
		SagaAscend(var/mod, var/val)
			src.SagaAscension["[mod]"]+=val
			src.vars["[mod]Ascension"]+=val
		SagaStat(var/mod)
			return src.SagaAscension["[mod]"]
		SagaThreshold(var/mod, var/threshold)
			var/current=src.SagaStat(mod)
			if(current < threshold)
				src.SagaAscend(mod, threshold-current)
		req_pot(var/val)
			if(src.Potential>=val)
				return 1
			return 0
		req_rpp(var/val)
			if(src.RPPSpendable+src.RPPSpent>=val)
				return 1
			return 0
		req_styles(var/val, var/tier)
			if(src.CountStyles(tier)<=val)
				return 1
			return 0
		req_sigs(var/val, var/tier)
			if(src.CountSigs(tier)<=val)
				return 1
			return 0
		styles_available(var/tier)
			var/list/styles_available=list()
			styles_available.Add(src.SignatureStyles)
			styles_available.Remove(src.SignatureSelected)
			if(styles_available.len>0)
				for(var/x in styles_available)
					var/path=styles_available[x]
					var/obj/Skills/s=new path
					if(s.SignatureTechnique==tier)
						return 1
					else
						del s
						continue
			else
				return 0
		PotentialSkillCheck()
			if(!locate(/obj/Skills/Zanzoken, src))
				if(src.req_pot(5))
					src << "You develop the ability to move faster than the eye can see due to your experience fighting!"
					src.AddSkill(new/obj/Skills/Zanzoken)
			if(!locate(/obj/Skills/Power_Control, src))
				if(src.req_pot(10))
					src << "You develop the ability to fluctuate your power due to your experience fighting!"
					src.AddSkill(new/obj/Skills/Power_Control)
					if(!locate(/obj/Skills/Buffs/ActiveBuffs/Ki_Control, src))
						src.PoweredFormSetup()
			if(!locate(/obj/Skills/Utility/Sense, src))
				if(src.req_pot(10/max(0.05, src.Imagination)))
					src << "You develop the ability to sense power due to your experience fighting!"
					src.AddSkill(new/obj/Skills/Utility/Sense)
			if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Ki_Blade, src) && !locate(/obj/Skills/Buffs/SlotlessBuffs/Ki_Shield, src))
				if(src.req_pot(10/max(0.05,src.Imagination)))
					var/Confirm
					var/Choice
					while(Confirm!="Yes")
						Choice=alert(src, "You have developed enough of your fighting spirit to be able to mold it to a particular form. Which would you like to use?", "Ki Forge", "Ki Blade", "Ki Shield")
						switch(Choice)
							if("Ki Blade")
								Confirm=alert(src, "Ki Blade allows you to use armed and unarmed techniques in sync, at the cost of energy expenditure. Damage is calculated based on both force and strength. Do you want to forge this?", "Ki Blade", "No", "Yes")
							if("Ki Shield")
								Confirm=alert(src, "Ki Shield allows you to deflect some energy attacks at the cost of energy expenditure. It also allows you to breathe in hostile environments. Do you want to forge this?", "Ki Shield", "No", "Yes")
					switch(Choice)
						if("Ki Blade")
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Ki_Blade)
						if("Ki Shield")
							src.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Ki_Shield)

			if(!src.SignatureCheck)
				return
			if(src.Saga)
				src.SagaProgression()
				return

			if(styles_available(1) && src.Potential>=25)
				DevelopSignature(src, 1, "Style")
			if(styles_available(2) && src.Potential>=50)
				DevelopSignature(src, 2, "Style")

			if(src.req_pot(10) && src.req_sigs(0, 1))
				DevelopSignature(src, 1, "Signature")

			if(src.req_pot(20) && src.req_sigs(1, 1))
				DevelopSignature(src, 1, "Signature")

			if(src.req_pot(30) && src.req_sigs(0, 2))
				DevelopSignature(src, 2, "Signature")

			if(src.req_pot(40) && src.req_sigs(1, 2))
				DevelopSignature(src, 2, "Signature")

			if(src.req_pot(50) && src.req_sigs(0, 3))
				if(src.Race!="Saiyan" && !src.InfinityModule && src.ShinjinAscension!="Kai" && src.Race!="Changeling")
					DevelopSignature(src, 3, "Signature")

			if(src.req_pot(60))
				if(src.req_sigs(2, 2))
					DevelopSignature(src, 2, "Signature")
				if(src.Race=="Saiyan")
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade2, src))
						src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade2)
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade3, src))
						src.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade3)


		YeetSignatures()
			for(var/obj/Skills/s in src.Skills)
				if(s.SignatureTechnique)
					if(!s.SagaSignature)
						src << "[s] has been removed as it is not one of your saga signatures."
						del s
		GetMaxMovementCharges()
			if(src.HasFlicker())
				return 3+src.HasFlicker()
			return 3
		MovementChargeBuildUp(var/Mult=1)
			//this ticks per second
			//partial charges are not able to be used
			//30 seconds will result in full charges
			if(src.Hustle||src.HasLegendaryPower() > 0.25)//hustle regains charges faster
				Mult+=(1/4)
			var/flick=src.HasFlicker()
			if(src.HasMovementMastery())
				Mult*=min(1.5,1+(src.GetMovementMastery()/20))
			if(flick)
				Mult*=min(1.5,1+(flick/2))
			if(src.AfterImageStrike)
				return
			var/MaxMovementCharges=GetMaxMovementCharges()
			src.MovementCharges+=(0.2-(max(0.01,MovementCharges)/MaxMovementCharges)/10)*Mult
			if(src.MovementCharges>MaxMovementCharges)
				src.MovementCharges=MaxMovementCharges
		GetRPPMult()
			var/Return=src.RPPMult
			Return*=src.ConditionRPPMult()
			if(src.TarotFate=="The Hermit")
				Return*=1.5
			return Return
		ConditionRPPMult()
			var/Return=1
			if(src.ParasiteCrest())
				Return*=2
			return Return
		Base()
			var/base=20*src.Base
			return base

		get_potential()
			var/Return=src.Potential

			if(src.HasPowerReplacement())
				var/Replace=src.GetPowerReplacement()
				if(Replace>Return)
					Return=Replace

			if(src.potential_trans)
				if(src.potential_trans > Return)
					Return=src.potential_trans

			if(src.Race=="Shinjin")//one determines the other
				if(src.ShinjinAscension=="Kai")
					var/NoFite=2
					if(src.AscensionsAcquired>0)
						NoFite=1
					if(src.GodKi < src.Potential/(100*NoFite))
						src.GodKi=src.Potential/(100*NoFite)
				if(src.ShinjinAscension=="Makai")
					src.GodKi=src.Potential/100
					if(src.AscensionsAcquired>0)
						src.GodKi+=0.5

			return Return


		transcend(var/val)
			if(!locate(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Transcendant, src))
				var/obj/Skills/Buffs/b=new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Transcendant
				b.GodKi=val
				src.AddSkill(b)
		SecretToss(var/obj/Skills/Grapple/Toss/Z)
			if(src.HasRipple())
				src.UseBuff(new/obj/Skills/Buffs/SlotlessBuffs/Ripple/Life_Magnetism_Overdrive)
				src.Oxygen+=(src.OxygenMax/max(src.SenseRobbed,1))*0.5
				if(src.Oxygen>=(src.OxygenMax/max(src.SenseRobbed,1))*2)
					src.Oxygen=(src.OxygenMax/max(src.SenseRobbed,1))*2
				Z.Cooldown(3)
				return
			if(src.Secret=="Vampire"&&src.BloodPower>=2)
				if(!src.PoseEnhancement)
					src.Activate(new/obj/Skills/AutoHit/Shadow_Tendril_Strike)
				else
					src.Activate(new/obj/Skills/AutoHit/Shadow_Tendril_Wave)
				Z.Cooldown()
				return
			if(src.Secret=="Werewolf")
				src.Activate(new/obj/Skills/AutoHit/Howl)
				Z.Cooldown(3)
				return
			if(src.Secret=="Haki")
				src.AddHaki("Armament")
				if(!src.CheckSlotless("Haki Armament"))
					for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Armament/H in src)
						H.Trigger(src)
				if(src.CheckSlotless("Haki Observation"))
					for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Observation/H in src)
						H.Trigger(src)
				Z.Cooldown(3)
				if(!src.CheckSlotless("Haki Shield")&&!src.CheckSlotless("Haki Shield Lite"))
					if(src.HakiSpecialization=="Armament")
						for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Shield/H in src)
							H.Trigger(src)
					else
						for(var/obj/Skills/Buffs/SlotlessBuffs/Haki/Haki_Shield_Lite/H in src)
							H.Trigger(src)


proc
	DaysOfWipe()
		var/dow=Today() - global.WipeStart
		dow/=Day(1)
		dow=round(dow)
		if(dow>global.DaysOfWipe)
			global.DaysOfWipe=dow
		global.RPPStarting=global.RPPDaily*global.DaysOfWipe
		return global.DaysOfWipe
	Today()
		return world.realtime-world.timeofday
	Yesterday()
		return Today() - Day(1)

proc
	IsList(var/val)
		if(istype(val, /list))
			return 1
		return 0
proc
	StaticDamage(var/Val, var/Stat1, var/Stat2)
		return ((Val/Stat1)/(Val/Stat2))
proc
	BalanceDamage(Damage)
		return Damage**(1/3)
	TrueDamage(Damage)
		return Damage**3
proc
	MSay(var/mob/m, var/msg, var/type="says:")
		for(var/mob/E in hearers(12,m))
			E<<"<font color=[m.Text_Color]>[m] [type] [msg]"
	OMsg(var/mob/m, var/msg)
		m.OMessage(10, "[msg]", "[m]([m.key]) used ([msg]).")

var/list/general_magic_database = list()
var/list/general_weaponry_database = list()
proc
	BuildGeneralMagicDatabase() // This is a list of generally obtainable magics. For now, it's just used for Crimson grimoire.
		general_magic_database = SkillTree["MagicT1"] + SkillTree["MagicT2"] + SkillTree["MagicT3"] + SkillTree["MagicT4"]
		general_magic_database = general_magic_database.Copy() //Makes it so we don't reference vars in the SkillTree variable.

		for(var/index in general_magic_database) //remove all spell cost references for now.
			general_magic_database[index] = null

		//Now a layer of confirmation for the abilities in here.
		var/obj/Skills/s
		for(var/index in general_magic_database)
			s = text2path(index)
			s = new s
			if(s && istype(s))
				if(!s.MagicNeeded)
					general_magic_database -= index

	BuildGeneralWeaponryDatabase()
		var/list/weaponry_queues=list(
		"/obj/Skills/Queue/Gear/Integrated/Integrated_Pile_Bunker",
		"/obj/Skills/Queue/Gear/Integrated/Integrated_Power_Fist",
		"/obj/Skills/Queue/Gear/Integrated/Integrated_Power_Claw",
		"/obj/Skills/Queue/Gear/Integrated/Integrated_Hook_Grip_Claw",
		"/obj/Skills/Queue/Cyberize/Taser_Strike"
		)
		var/list/weaponry_autohits=list(
		"/obj/Skills/AutoHit/Gear/Integrated/Integrated_Incinerator",
		"/obj/Skills/AutoHit/Cyberize/Machine_Gun_Flurry"
		)
		var/list/weaponry_projectiles=list(
		"/obj/Skills/Projectile/Machine_Gun_Burst",
		"/obj/Skills/Projectile/Homing_Ray_Missiles",
		"/obj/Skills/Projectile/Plasma_Cannon",
		"/obj/Skills/Projectile/Gear/Integrated/Integrated_Missile_Launcher",
		"/obj/Skills/Projectile/Gear/Integrated/Integrated_Chemical_Mortar",
		"/obj/Skills/Projectile/Cyberize/Rocket_Punch"
		)

		general_weaponry_database = weaponry_queues + weaponry_autohits + weaponry_projectiles
		general_weaponry_database = general_weaponry_database.Copy()
