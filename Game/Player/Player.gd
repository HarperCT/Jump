extends CharacterBody2D

const SPEED = 300.0
const JUMP_SPEED = -1000
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = -direction * SPEED
		
	var collision = move_and_collide(velocity * delta)
	if collision:
		_on_collision(collision)


func _on_collision(body):
	# if enemy projectile: die
	# Do jump if nothing else happened
	# TODO add variables for jumping. Maybe make a new class per jumpy thing
	if velocity.y > 0:
		velocity.y = JUMP_SPEED

