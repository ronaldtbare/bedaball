extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 6
const ROTSPEED = 8

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTSPEED))
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROTSPEED))
	else:
		velocity.z = lerp(velocity.z, 0, 0.2)
		
	move_and_slide(velocity)


func _on_trollenemy_body_entered(body):
	if body.name =="Player":
		get_tree().change_scene("res://GameOver.tscn")
	
