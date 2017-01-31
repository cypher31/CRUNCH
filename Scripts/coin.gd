extends StaticBody2D

var coin_gold_points

func _ready():
	coin_gold_points = 5.0
	pass

func _on_coinArea_body_enter( body ):
	if(body.is_in_group("playerRun")):
		self.queue_free()
	if(get_node("/root/global").playerCurrentCombo > 0):
		get_node("/root/global").playerScore += get_node("/root/global").coin_gold_points * get_node("/root/global").playerCurrentCombo
	else:
		get_node("/root/global").playerScore += get_node("/root/global").coin_gold_points
	pass # replace with function body
