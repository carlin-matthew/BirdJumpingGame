extends CanvasLayer

func _ready():
	$Label3.text = "Score: " + str(get_parent().score)
	$Label4.text = "Highscore: " + str(Highscore.highscore)

func _process(_delta):
	await get_tree().create_timer(1.0).timeout
	if Input.is_action_just_released("jump"):
		get_tree().reload_current_scene()
