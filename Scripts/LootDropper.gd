extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var chooseItemClass = randi() % get_node("/root/global").noItemClasses
	var randNumber = null
	
	#Drop chance percentage
	var dropChancePercent = 50
	var dropChancePercentCheck = rand_range(0,100)
	
	#Randomly choose an item class & then choose an item randomly from that dictionary
		#Check if chance of item dropping is true
	if(dropChancePercentCheck >= dropChancePercent):
		if(chooseItemClass == 0):
			randNumber = randi() % get_node("/root/global").HELMS.size()
			#grab sprite from the potential helms
			get_node("Sprite").set_texture(get_node("/root/global").HELMS[randNumber][0])
			#Add found item to dictionary
			get_node("/root/global").unlockedHELMS[randNumber] = get_node("/root/global").HELMS[randNumber]
		elif(chooseItemClass == 1):
			randNumber = randi() % get_node("/root/global").WEAPONS.size()
			#grab sprite from potential weapons
			get_node("Sprite").set_texture(get_node("/root/global").WEAPONS[randNumber][0])
			#Add found item to dictionary
			get_node("/root/global").unlockedWEAPONS[randNumber] = get_node("/root/global").WEAPONS[randNumber]
		elif(chooseItemClass == 2):
			randNumber = randi() % get_node("/root/global").SHIELDS.size()
			#grab sprite from potential shields
			get_node("Sprite").set_texture(get_node("/root/global").SHIELDS[randNumber][0])
			#Add found item to dictionary
			get_node("/root/global").unlockedSHIELDS[randNumber] = get_node("/root/global").SHIELDS[randNumber]

	set_fixed_process(true)
	pass
	
func _fixed_process(delta):
	pass
