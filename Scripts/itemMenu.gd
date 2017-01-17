extends CanvasLayer

var helms = []
var weapons = []
var shields = []

func _ready():
	helms = [get_node("/root/global").red_helm, get_node("/root/global").bronze_helm, get_node("/root/global").gold_helm]
	weapons = [get_node("/root/global").bronze_sword, get_node("/root/global").silver_sword, get_node("/root/global").gold_sword]
	shields = [get_node("/root/global").brown_shield, get_node("/root/global").silver_shield, get_node("/root/global").gold_shield]
	
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	for i in range(helms.size()):
		get_node("helmScroll/helm").set_button_icon(i, helms[i])
		pass
		
	for i in range(weapons.size()):
		get_node("weaponScroll/weapon").set_button_icon(i, weapons[i])
		pass
		
	for i in range(shields.size()):
		get_node("shieldScroll/shield").set_button_icon(i, shields[i])
		pass
		
	get_node("/root/global").selectedHelm = get_node("helmScroll/helm").get_selected()
	
	get_node("/root/global").HEAD = helms[get_node("/root/global").selectedHelm]
	
	get_node("/root/global").selectedWeapon = get_node("weaponScroll/weapon").get_selected()
	
	get_node("/root/global").WEAPON = weapons[get_node("/root/global").selectedWeapon]
	
	get_node("/root/global").selectedShield = get_node("shieldScroll/shield").get_selected()
	
	get_node("/root/global").SHIELD = shields[get_node("/root/global").selectedShield]
	
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().change_scene("res://Scenes/mainMenu.tscn")

	pass