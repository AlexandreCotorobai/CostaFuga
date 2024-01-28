extends Node2D

var game_over : bool
var scroll 
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int
var money : Array
const MONEY_DELAY : int = 100
const MONEY_RANGE : int = 200

@onready var consts = get_node("/root/Consts")
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	new_game()
	
func new_game():
	game_over = false
	score = 0
	scroll = 0
	$Costa.reset()
	
func start_game():
	consts.game_running = true
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if consts.game_running == false:
					start_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if consts.game_running:
		scroll += SCROLL_SPEED
		if scroll >= screen_size.x:
			scroll = 0
	$Ground.position.x = -scroll
