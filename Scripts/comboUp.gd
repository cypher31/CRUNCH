extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D_body_enter( body ):
	if(body.is_in_group("playerRun")):
		get_node("/root/global").playerCurrentCombo += 5
		self.queue_free()
	pass # replace with function body
