extends Node

#User globals

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
var noItemClasses = 3 #Number of item classes in game

var red_helm = preload("res://Assets/eq_red_helm.png")
var blue_helm = preload("res://Assets/eq_blue_helm.png")
var gold_helm = preload("res://Assets/eq_gold_helm.png")

var brown_shield = preload("res://Assets/eq_brown_shield.png")
var silver_shield = preload("res://Assets/eq_silver_shield.png")
var gold_shield = preload("res://Assets/eq_gold_shield.png")

var bronze_sword = preload("res://Assets/eq_bronze_sword.png")
var silver_sword = preload("res://Assets/eq_silver_sword.png")
var gold_sword = preload("res://Assets/eq_gold_sword.png")

#Set equipment dictionaries setup as:: [item, level]
#Head items
var HELMS = {
    0: [red_helm, 1],
    1: [blue_helm, 2],
    2: [gold_helm, 3]
}
#Weapon items
var WEAPONS = {
    0: [bronze_sword, 1],
    1: [silver_sword, 2],
    2: [gold_sword, 3]
}
#Shield items
var SHIELDS = {
    0: [brown_shield, 1],
    1: [silver_shield, 2],
    2: [gold_shield, 3]
}

#Unlocked items
var unlockedHELMS = {
    0: [red_helm, 1]
}

var unlockedWEAPONS = {
    0: [bronze_sword, 1]
}

var unlockedSHIELDS = {
    0: [brown_shield, 1]
}

func _ready():
	pass
