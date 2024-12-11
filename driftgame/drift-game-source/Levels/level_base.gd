extends Control

var high_score = 0

func score_change(score):
	
	$HUD.update_drift_score(score)
	if score > high_score:
		$HUD.update_high_score(score)
		high_score = score

func _process(delta):
	check_high_score()

func check_high_score():
	pass
	"""if $Player.drift_score > high_score:
		high_score = $Player.drift_score
		$HUD.update_score("player", high_score)"""

func _on_player_spawner_player_added(player):
	player.drift_score_change.connect(score_change)
