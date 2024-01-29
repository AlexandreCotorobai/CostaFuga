extends CharacterBody2D

@onready var consts = get_node("/root/Consts")
const game_over = preload("res://scenes/game_over.tscn")


func _ready():
	reset()

func reset():
	set_rotation(0)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if consts.game_running == true:
		$AnimatedSprite2D.play()
		#print(self.position.x)
		if self.position.x < 50:
			self.velocity = Vector2(consts.SPEED, 0)
			consts.police_speed = 0
		else:
			self.velocity = Vector2(consts.police_speed, 0)
			if consts.police_speed <= 20:
				consts.police_speed *= 1.01
		if self.position.x >= 900:

			get_tree().change_scene_to_packed(game_over)
		move_and_slide()
	else:
		$AnimatedSprite2D.stop()

