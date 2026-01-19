extends AnimatableBody2D

# Objects must be children of Game node with integet PIPE_SPEED variable
func _physics_process(delta):
	position.x += get_parent().PIPE_SPEED * delta
	if position.x < -100:
		queue_free()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if get_parent().has_method("score_up"):
		get_parent().score_up()
