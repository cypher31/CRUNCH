extends Control

func _fixed_process(delta):
	get_node("stageName").set_text(get_node("/root/global").levelText)
	get_node("playerScore").set_text(str(get_node("/root/global").playerScore))
	pass

func _ready():
	set_fixed_process(true)
	pass
