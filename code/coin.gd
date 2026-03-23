extends Area2D

@onready var game_manger = %"game manger"



func _on_body_entered(body: Node2D) -> void:
	game_manger.add_score()
	
	queue_free()
