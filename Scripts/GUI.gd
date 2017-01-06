extends CanvasLayer

func _fixed_process(delta):
	get_node("Label").set_text(get_node("/root/global").levelText)
	pass

func _ready():
	set_fixed_process(true)
	pass
