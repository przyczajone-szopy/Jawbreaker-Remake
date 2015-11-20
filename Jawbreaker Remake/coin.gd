
extends Area2D

var taken=false


func _on_body_enter( body ):
	if (not taken and body extends preload("res://player.gd")):
		get_node("anim").play("taken")
		taken=true
		get_node("/root/game_state").points+=10
		print("Liczba punktów: ", get_node("/root/game_state").points)

func _ready():
	pass

