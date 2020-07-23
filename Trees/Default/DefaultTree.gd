extends KinematicBody2D


func _on_Area2D_body_entered(body):
	if body.is_in_group("fader"):
		$Animator.play("Fade")


func _on_Area2D_body_exited(body):
	if body.is_in_group("fader"):
		$Animator.play_backwards("Fade")
