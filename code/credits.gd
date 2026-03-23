extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"end timer".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_end_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://sceens/main_menu.tscn")
