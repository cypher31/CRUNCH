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
var red_helm = preload("res://Assets/eq_red_helm.tex")
var brown_shield = preload("res://Assets/eq_brown_shield.tex")
var silver_sword = preload("res://Assets/eq_silver_sword.tex")

#Equipment levels
	#helms
var red_helm_level = 1
	#shields
var brown_shield_level = 1
	#Weapons
var silver_sword_level = 1

#Potential Drops
var equipmentArray = []

func _ready():
	pass
