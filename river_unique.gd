extends StaticBody2D

func _ready(): # ready function called when mob is created when run
	%River_animation.play()

#func _physics_process(delta):
	#var overlapping_trees = %Water_area.get_overlapping_bodies()
	#if overlapping_trees.size() > 0:
		#queue_free()




func _on_no_tree_area_body_entered(body):
	if body.has_method("delete"):
		body.delete()
	pass # Replace with function body.
