extends RigidBody2D


const SPEED = 300.0
const JUMP_SPEED = 600

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	_fixed_process(true)

func _fixed_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		set_linear_velocity(Vector2(-SPEED, get_linear_velocity().y))
		get_node("AnimatedSprite2D").flip_h = false
	else:
		set_linear_velocity(Vector2(SPEED, get_linear_velocity().y))
		get_node("AnimatedSprite2D").flip_h = true


func collision(body):
	print("hit")
	if body.is_in_group("platform") && get_linear_velocity().y > 0:
		print("hit")
		set_linear_velocity(Vector2(SPEED, get_linear_velocity().y)) 
