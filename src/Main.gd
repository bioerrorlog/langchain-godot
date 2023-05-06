extends Node2D

var dialogues = [
	"This is the first line of dialogue.",
	"This is the second line of dialogue.",
	"This is the third line of dialogue."
]
var dialogue_index = 0

onready var dialogue_label = $CanvasLayer/Dialogue

func _ready():
	display_dialogue()

func display_dialogue():
	if dialogue_index < dialogues.size():
		dialogue_label.text = dialogues[dialogue_index]
	else:
		print("End of dialogues")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		dialogue_index += 1
		display_dialogue()
