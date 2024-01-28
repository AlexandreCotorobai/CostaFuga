extends CharacterBody2D

const GRAVITY : int = 0
const MAX_VEL : int = 600
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var running = true
# center of the sprite

func _ready():
	reset()

func reset():
	set_rotation(0)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if running == true:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

