extends RichTextLabel

func _ready():
	visible = false
	var file = FileAccess.open("res://CREDITS.txt",FileAccess.READ)
	text = file.get_as_text()
	file.close()
