
extends Area2D

var taken=false


func _on_body_enter( body ):
	if (not self.taken and body extends preload("res://player.gd")):
		self.get_node("anim").play("taken")
		self.taken = true
		self.get_node("/root/game_state").points+=10
		
		print("Liczba punktów: ", get_node("/root/game_state").points)

func _ready():
	pass

