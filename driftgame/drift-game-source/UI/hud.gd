extends CanvasLayer

var high_score = 0
var high_score_label = Label.new()

func _ready():
	high_score_label.add_theme_font_size_override("font_size", 40)
	high_score_label.add_theme_font_override("font", load("res://kenvector_future_thin.ttf"))
	
func update_drift_score(score):
	$Control/DriftScore.text = str(score)

func update_score(username, score):
	high_score_label.text =  username + ": " + str(score)

	$VBoxContainer.add_child(high_score_label)
