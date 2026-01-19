extends CanvasLayer

var credits: bool = false

func _ready():
	$Label4.text = "Highscore: " + str(Highscore.highscore)

func _process(_delta):
	if Input.is_action_just_released("jump"):
		%player.visible = true
		%Score.visible = true
		visible = false
		get_tree().paused = false
	if Input.is_action_just_pressed("credits"):
		if credits:
			$Credits.visible = false
			$Label2.visible = true
			$Label3.text = "Press c to open credits."
			$Label4.visible = true
			credits = false
		else:
			$Credits.visible = true
			$Label2.visible = false
			$Label3.text = "Press c to close credits."
			$Label4.visible = false
			credits = true
