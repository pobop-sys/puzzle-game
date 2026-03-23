extends CharacterBody2D

const SPEED = 60

var dir = 1

@onready var ray_left = $raycast/raycast_left
@onready var ray_right = $raycast/raycaset_right


func _physics_process(delta: float) -> void:
	if ray_right.is_colliding():
		dir = 1
	elif ray_left.is_colliding():
		dir = -1
	
	position.x += dir * SPEED * delta
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
