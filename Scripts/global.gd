extends Node

#User globals
var userUnlockedItems = []

#player globals
var playerCurrentCombo = 0
var playerCurrentHealth = 100
var playerAttackDmg = 25
var playerStartPosition
var playerPressedButton = false
var playerRestart = false
var playerBlocking = false
var playerScore = 0
var currentButtonPrompt = null

#player equipment
var HEAD
var WEAPON
var SHIELD

var selectedHelm
var selectedWeapon
var selectedShield

#enemy globals
var enemyToFight 
var currentRunEnemy
var enemyHealth = 100
var enemyAttack = false
var enemyArmor

#world variables
var coin_gold_points = 5.0
var timer = true
var coinsToMultiply = 1
var stopButtonPrompts = false

#Scenes
var levelText
var dungeonScene = ("res://Scenes/Dungeon.tscn")
var dungeonFight = ("res://Scenes/Dungeon_Fight.tscn")

#Potential Equipment
var red_helm = preload("res://Assets/eq_red_helm.png")
var bronze_helm = preload("res://Assets/eq_blue_helm.png")
var gold_helm = preload("res://Assets/eq_gold_helm.png")

var brown_shield = preload("res://Assets/eq_brown_shield.png")
var silver_shield = preload("res://Assets/eq_silver_shield.png")
var gold_shield = preload("res://Assets/eq_gold_shield.png")

var bronze_sword = preload("res://Assets/eq_bronze_sword.png")
var silver_sword = preload("res://Assets/eq_silver_sword.png")
var gold_sword = preload("res://Assets/eq_gold_sword.png")

#Set equipment dictionaries
#Head items
var HELMS = {
    0: red_helm,
    1: bronze_helm,
    2: gold_helm
}
#Weapon items
var WEAPONS = {
    0: bronze_sword,
    1: silver_sword,
    2: gold_sword
}
#Shield items
var SHIELDS = {
    0: brown_shield,
    1: silver_shield,
    2: gold_shield
}

#Equipment levels
	#helms
var red_helm_level = 1
var bronze_helm_level = 2
var gold_helm_level = 3
	#shields
var brown_shield_level = 1
var silver_shield_level = 2
var gold_shield_level = 3
	#Weapons
var bronze_sword_level = 1
var silver_sword_level = 2
var gold_sword_level = 3


#Potential Drops
var equipmentArray = []

func _ready():
	pass
