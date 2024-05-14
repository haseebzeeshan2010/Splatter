extends StaticBody2D

func _ready(): # ready function called when mob is created when run
	%River_animation.play()
	
	
	#_unique_river_generation()
	#var new_unique_river = preload("res://mob_heal.tscn").instantiate()
	#%unique_river_path.progress_ratio = randf()
	#new_unique_river.global_position = %unique_river_path.global_position
	#add_child(new_unique_river)

#func _physics_process(delta):
	#var overlapping_trees = %Water_area.get_overlapping_bodies()
	#if overlapping_trees.size() > 0:
		#queue_free()


#func _unique_river_generation():
	

func _on_no_tree_area_body_entered(body):
	
	if body.has_method("delete"):
		body.delete()
	pass # Replace with function body.
