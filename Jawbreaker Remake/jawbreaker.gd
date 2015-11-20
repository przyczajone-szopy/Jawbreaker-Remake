
extends Node2D

func _ready():
	self.set_process(true)
	pass

func _process(delta):
	self.get_node("HeadUpDisplay/ScorePoints").set_text(str(get_node("/root/game_state").points))
