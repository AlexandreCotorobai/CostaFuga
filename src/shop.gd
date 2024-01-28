class_name Shop
extends Control

@onready var roubo = $MarginContainer/HBoxContainer/VBoxContainer/roubo
@onready var galamba = $MarginContainer/HBoxContainer/VBoxContainer/galamba
@onready var advogado = $MarginContainer2/HBoxContainer/VBoxContainer/advogado
@onready var ubereats = $MarginContainer2/HBoxContainer/VBoxContainer/ubereats
@onready var fisco = $MarginContainer3/HBoxContainer/VBoxContainer/fisco
@onready var consts = get_node("/root/Consts")

func _ready():
	roubo.button_down.connect(on_roubo_pressed)
	galamba.button_down.connect(on_galamba_pressed)
	advogado.button_down.connect(on_advogado_pressed)
	ubereats.button_down.connect(on_ubereats_pressed)
	fisco.button_down.connect(on_fisco_pressed)

func on_roubo_pressed() -> void:
	pass
	
func on_galamba_pressed() -> void:
	pass
	
func on_advogado_pressed() -> void:
	pass

func on_ubereats_pressed() -> void:
	pass

func on_fisco_pressed() -> void:
	pass
