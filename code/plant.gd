extends Node2D

var dir: bool

func _ready():
	randomize() # Only needed in Godot 3
	dir = randf() < 0.5
	
	$Sprite2D.flip_h = dir
	
	print("Dir:", dir)
