extends CharacterBody2D

signal health_depleted # create custom signal

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600.0
	move_and_slide()
	
	%Robot.play()
	
	const DAMAGE_RATE = 50.0
	const HEAL_RATE = 400.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
			
			
	var overlapping_health = %HealBox.get_overlapping_bodies()
	
	if overlapping_health.size() > 0:
		health += HEAL_RATE * delta
		%ProgressBar.value = health
		
		#
		if health > 100.0:
			health = 100

func _on_area_2d_body_entered(body):
	if body.has_method("remove_heal"):
			body.remove_heal()
			#health += 10.0 * new_delta

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
