extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

var coins_collected = 0

var sound_play = true


func coin_bar_state_manger():
	if coins_collected == 0:
		$Camera2D/AnimatedSprite2D.play("0 out of 4")
	
	if coins_collected == 1:
		$Camera2D/AnimatedSprite2D.play("1 out of 4")
	
	if coins_collected == 2:
		$Camera2D/AnimatedSprite2D.play("2 out of 4")
	
	if coins_collected == 3:
		$Camera2D/AnimatedSprite2D.play("3 out of 4")
	
	if coins_collected == 4:
		$Camera2D/AnimatedSprite2D.play("4 out of 4")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1 :
			$Sprite2D.flip_h = false
		elif direction == -1:
			$Sprite2D.flip_h = true
		
		# walking sound effects
# walking sound effects
		if is_on_floor()and not velocity.x == 0 and sound_play:
			var pick_sound = [0,1,2,3].pick_random()
			
			if pick_sound == 0:
				$"sounds/walking 1".play()
			elif pick_sound == 1:
				$"sounds/walking 2".play()
			elif pick_sound == 2:
				$"sounds/walking 3".play() # reuse or add more sounds
			elif pick_sound == 3:
				$"sounds/walking 4".play()
			
			$"waling soun effect timer".start()
			sound_play = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




func _on_coin_detect_area_entered(area: Area2D) -> void:
	coins_collected += 1
	print("coin collected")
	coin_bar_state_manger()


func _on_waling_soun_effect_timer_timeout() -> void:
	sound_play = true
