extends CharacterBody2D


const SPEED = 10.0
@export var renaudChant : AudioStreamPlayer
var randomValue : float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0

#Variable accélération
var accel = 0


func _ready():
	randomValue = randf_range(0,4)
	scale = Vector2(randomValue,randomValue)

func _physics_process(delta):
	accel+=10
	print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
	if Input.is_action_pressed("ReDroite") :
		velocity.x = accel
		move_and_slide()
	if get_viewport().get_visible_rect().size.x<position.x :
		renaudChant.play()
		position.x = 0
	if Input.is_action_pressed("ReGauche") :
		velocity = Vector2(-500,0)
		move_and_slide()
	if position.x < 0 :
		position.x = 1920
		randomValue = randf_range(0,4)
		scale = Vector2(randomValue,randomValue)
		
	if Input.is_action_pressed("RenHaut") :
		velocity = Vector2(0,-500)
		move_and_slide()
		
	if Input.is_action_pressed("ReBas") :
		velocity = Vector2(0,500)
		move_and_slide()
