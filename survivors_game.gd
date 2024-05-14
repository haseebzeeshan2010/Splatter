extends Node2D



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_super_mob():
	var new_mob = preload("res://mob_super.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	#
func spawn_health():
	var new_health = preload("res://mob_heal.tscn").instantiate()
	%TreePath.progress_ratio = randf()
	new_health.global_position = %TreePath.global_position
	add_child(new_health)
	
func spawn_tree():
	var new_tree = preload("res://PineTree_landscape.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)
	
func spawn_river():
	var new_river = preload("res://River.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_river.global_position = %PathFollow2D.global_position
	add_child(new_river)

func _on_timer_timeout():
	spawn_mob()
	
	
	pass # Replace with function body.


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	pass # Replace with function body.


func _on_timer_2_timeout():
	spawn_health()
	spawn_super_mob()
	pass # Replace with function body.


func _on_timer_3_timeout():
	spawn_tree()
	pass # Replace with function body.


func _on_river_timer_timeout():
	spawn_river()
	pass # Replace with function body.
