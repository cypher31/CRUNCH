extends Node

#player globals
var playerCurrentCombo = 0
var playerCurrentHealth = 100
var playerStartPosition
var playerRestart = false
var playerScore = 0
var currentButtonPrompt = null

#enemy globals
var enemyToFight 
var currentRunEnemy

#world variables
var coin_gold_points = 5.0
var timer = true
var coinsToMultiply = 1
var stopButtonPrompts = false

#Scenes
var levelText
var dungeonScene = ("res://Scenes/Dungeon.tscn")
var dungeonFight = ("res://Scenes/Dungeon_Fight.tscn")

func _ready():
	pass
