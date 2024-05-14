extends Area2D

var fire = false

#func _input(event):
	#look_at(get_global_mouse_position()) #MANUAL FIRE CODE

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position) #AUTOFIRE CODE
		fire = true
	else:
		fire = false

func shoot():
	
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout():
	if fire == true:
		%animated_pistol.play()
		%animated_pistol.set_frame(0)
		shoot()
	else:
		%animated_pistol.pause()
		%animated_pistol.set_frame(0)
