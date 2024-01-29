class_name Shop
extends Control

@onready var roubo = $MarginContainer/HBoxContainer/VBoxContainer/roubo
@onready var galamba = $MarginContainer/HBoxContainer/VBoxContainer/galamba
@onready var advogado = $MarginContainer2/HBoxContainer/VBoxContainer/advogado
@onready var ubereats = $MarginContainer2/HBoxContainer/VBoxContainer/ubereats
@onready var fisco = $"MarginContainer3/HBoxContainer/VBoxContainer/Fuga ao Fisco"

@onready var consts = get_node("/root/Consts")

func _ready():
	roubo.button_down.connect(on_roubo_pressed)
	galamba.button_down.connect(on_galamba_pressed)
	advogado.button_down.connect(on_advogado_pressed)
	ubereats.button_down.connect(on_ubereats_pressed)
	fisco.button_down.connect(on_fisco_pressed)

func on_roubo_pressed() -> void:
	consts.police_speed += 5
	consts.score += 5000
	
func on_galamba_pressed() -> void:
	consts.passive_income += 50
	consts.police_speed += 0.2
	consts.galamba = true
	
func on_advogado_pressed() -> void:
	var cost = 50
	if consts.score < cost:
		return
	consts.police_speed -= 5
	consts.passive_income -= cost
	
func on_ubereats_pressed() -> void:
	consts.police_speed += 0.05
	consts.passive_income += 20

func on_fisco_pressed() -> void:
	consts.passive_income += 10
	consts.police_speed += 0.1
