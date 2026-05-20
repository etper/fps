extends Node

#missing feedback
	#movement feedback
		#footsteps
		#head bob
		#landing impact
		#jump sound
	#difficulty progression feedback
		#wave text
		#danger music increase
		#stronger/faster enemy visuals
		#combo counter
		#score popups
	#audiofeedback
		#footsteps
		#ambient loop

#missing ui
	#health / damage feedback
		#hp bar
		#red screen when hit
		#low hp warning
	#game over screen
	#enemy difficulty feedback
	#ammo/reload ui
	#pause/settings ui
	#start/tutorial ui

#decision making
	#3. Space Control
	#
	#Reward controlling parts of the arena.
	#
	#Examples:
	#
	#enemies spawn more near edges
	#center gives visibility but danger
	#corners are safer but trap-prone
	#
	#Decision:
	#
	#rotate through space or hold position?
	#
	#4. Risk-Reward Scoring
	#
	#Let aggressive play increase score faster.
	#
	#Examples:
	#
	#combo multiplier
	#close-range bonus
	#headshots
	#kill streak timer
	#
	#Then players choose:
	#
	#play safe or maximize score?
	#
	#Your notes already hint at combo counters.
	#
	#5. Limited Resources
	#
	#Right now shooting is free. Add scarcity.
	#
	#Examples:
	#
	#reloads
	#stamina sprint
	#heat system
	#limited dash charges
	#
	#Good decisions emerge when resources matter.
	#
	#6. Temporary Power Choices
	#
	#Offer short-term strategic choices.
	#
	#Examples:
	#
	#double damage
	#freeze enemies
	#speed boost
	#piercing bullets
	#
	#Important:
	#Don’t make them permanent upgrades only.
	#Temporary powerups create moment-to-moment decisions.
	#
	#7. Escalation Timing
	#
	#Your spawn timer already speeds up with score.
	#
	#Improve it with “decision spikes.”
	#
	#Examples:
	#
	#every 10 kills:
	#tougher wave
	#miniboss
	#arena modifier
	#player chooses:
	#harder wave = higher rewards
	#safer wave = lower rewards
	#8. Information Decisions
	#
	#Hide some information intentionally.
	#
	#Examples:
	#
	#audio cue before enemy spawn
	#fog/darkness
	#enemies behind player
	#radar with cooldown
	#
	#Decision:
	#
	#trust awareness or check information tools?
	#
	#9. Weapon Identity
	#
	#Different weapons should change behavior.
	#
	#Examples:
	#
	#shotgun → close aggressive movement
	#sniper → distance positioning
	#SMG → tracking + mobility
	#revolver → precision timing
	#
	#Good weapons create different thinking patterns.
	#
	#10. Survival Tradeoffs
	#
	#Force “bad but necessary” choices.
	#
	#Examples:
	#
	#healing item in dangerous area
	#powerup surrounded by enemies
	#reload during pressure
	#save ult now vs later
	#
	#Interesting gameplay often comes from:
	#
	#“I know this is risky, but I need it.”
