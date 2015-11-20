
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	get_node("HeadUpDisplay/ScorePoints").set_text(str(get_node("/root/game_state").points))
