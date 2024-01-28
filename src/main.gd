extends Node2D

@export var money_scene : PackedScene

var game_over : bool
var scroll 
var bg_scroll
var score
const SCROLL_SPEED : int = 4
const BG_SCROLL_SPEED : int = 1
var screen_size : Vector2i
var ground_height : int
var moneyArray : Array
const MONEY_DELAY : int = 100
const MONEY_RANGE : int = 200

@onready var consts = get_node("/root/Consts")
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()
	
func new_game():
	game_over = false
	score = 0
	scroll = 0
	bg_scroll = 0
	moneyArray.clear()
	generate_money()
	$Costa.reset()
	
func start_game():
	consts.game_running = true
	$Timer.start()
	
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
			
		bg_scroll += BG_SCROLL_SPEED
		if bg_scroll >= screen_size.x:
			bg_scroll = 0
	#move ground
	$Ground.position.x = -scroll
	
	$Background.position.x = -bg_scroll
	#move money
	for money in moneyArray:
		#print("MONEYYYYY")
		if money.is_inside_tree():
			#print("MONEYYYYY")
			money.position.x -= SCROLL_SPEED

func _on_timer_timeout():
	print("TIMER")
	generate_money()

func generate_money():
	var money = money_scene.instantiate()
	money.position.x = screen_size.x + MONEY_DELAY
	print("GAGAG")
	money.position.y = 0
	money.hit.connect(money_hit)
	add_child(money)
	moneyArray.append(money)

func money_hit(money):
	consts.score += 500
	print(consts.score)
	moneyArray.remove_at(moneyArray.find(money))
	money.queue_free()  # To delete it from the scene
	
