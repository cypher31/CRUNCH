extends Label

var new_label
var t 
var block
var isTweening = false
var distance = 100
var duration = .5

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if(event.is_action_pressed("left_punch") && event.is_action_pressed("right_punch")):
		block = true
	
	#create text pop up for player inputs
	if(event.is_action_pressed("left_punch") && isTweening == false && get_node("/root/global").currentButtonPrompt == "left"):
		new_label = Label.new()
		add_child(new_label)
		new_label.set_text("LEFT PUNCH")
		
		t = Tween.new()
		add_child(t)

		t.interpolate_property(new_label, "rect/pos", Vector2(0,0), Vector2(distance,-distance), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_property(new_label, "rect/scale", Vector2(1,1), Vector2(5,5), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "end_label")
		t.start()
		isTweening = true
	
	if(event.is_action_pressed("right_punch") && isTweening == false && get_node("/root/global").currentButtonPrompt == "right"):
		new_label = Label.new()
		add_child(new_label)
		new_label.set_text("RIGHT PUNCH")
		
		t = Tween.new()
		add_child(t)

		t.interpolate_property(new_label, "rect/pos", Vector2(0,0), Vector2(distance,distance), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_property(new_label, "rect/scale", Vector2(1,1), Vector2(5,5), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "end_label")
		t.start()
		isTweening = true
		
	if(block == true && isTweening == false && get_node("/root/global").currentButtonPrompt == "block"):
		new_label = Label.new()
		add_child(new_label)
		new_label.set_text("BLOCK")
		
		t = Tween.new()
		add_child(t)

		t.interpolate_property(new_label, "rect/pos", Vector2(0,0), Vector2(distance,distance), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_property(new_label, "rect/scale", Vector2(1,1), Vector2(5,5), duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		t.interpolate_callback(self, duration, "end_label")
		t.start()
		isTweening = true
	
#destroy the labels
func end_label():
	new_label.queue_free()
	t.queue_free()
	isTweening = false


