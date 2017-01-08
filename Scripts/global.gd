extends Node

#player globals
var playerStartPosition
var playerRestart = false
var playerScore = 0

#enemy globals
var enemyToFight 
var currentRunEnemy

#world variables
var coin_gold_points = 5.0
var timer = true

#Scenes
var levelText
var dungeonScene = ("res://Scenes/Dungeon.tscn")
var dungeonFight = ("res://Scenes/Dungeon_Fight.tscn")

func _ready():
	pass
