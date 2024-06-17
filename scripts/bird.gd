extends CharacterBody2D

@onready var animation_player:AnimationPlayer = $AnimationPlayer

var game_started:bool = false
var gravity = ProjectSettings.get_setting('physics/2d/default_gravity')
var flap_speed = -1000

func _process(_delta):
	if Input.is_action_just_pressed('flap'):
		animation_player.play('flap')
		animation_player.queue('idle')

func _physics_process(delta):
	if game_started:
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed('flap'):
		velocity.y = flap_speed
	
	move_and_slide()

func _on_start_game():
	game_started = true
