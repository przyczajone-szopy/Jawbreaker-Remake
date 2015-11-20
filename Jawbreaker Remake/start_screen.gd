extends Control

func _ready():
	pass



func _on_StartGame_pressed():
	self.get_node("/root/game_state").points=0
	self.get_tree().change_scene("jawbreaker.scn")	
	pass
