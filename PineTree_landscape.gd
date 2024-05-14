extends StaticBody2D

var COLOR = randf_range(1, 2.9)

#func onready_():
	#
	
	
func _physics_process(delta):
	var overlapping_trees = %In_area.get_overlapping_bodies()
	if overlapping_trees.size() > 1:
		queue_free()
	%PineTree.set_modulate(Color(COLOR, 1, 1))
	
func delete():
	queue_free()
