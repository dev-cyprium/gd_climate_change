extends KinematicBody2D

export var movement_speed = 85.0

func _ready():
	$Animation.current_animation = "Idle"

func _physics_process(delta):
	movement(delta)
	
## User Defined
func movement(delta):
	var vec = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		vec += Vector2(-1, 0)
	
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		vec += Vector2(1, 0)
	
	if Input.is_action_pressed("ui_down"):
		vec += Vector2(0, 1)
	
	if Input.is_action_pressed("ui_up"):
		vec += Vector2(0, -1)
	
	vec *= movement_speed
	
	if vec.length_squared() > 0:
		$Animation.current_animation = "Running"
	else:
		$Animation.current_animation = "Idle"
	
	move_and_slide(vec)
