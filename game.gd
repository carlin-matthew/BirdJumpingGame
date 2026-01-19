extends Node2D

const PIPE_SPEED: int = -125
var score: int = 0

func _ready():
	randomize()
	play_music()
	Highscore.load()
	get_tree().paused = true

func score_up():
	score += 1
	%Score.text = "Score: " + str(score)

func _on_pipe_timer_timeout():
	%PipeTimer.wait_time = randf_range(1.2, 2)
	var new_pipe: AnimatableBody2D = preload("res://pipes/pipes_large.tscn").instantiate()
	new_pipe.position.y = randi_range(-65, 60)
	new_pipe.position.x = 400
	add_child(new_pipe)

func game_over():
	%Score.visible = false
	if score > Highscore.highscore:
		Highscore.save(score)
	add_child(load("res://game_over_screen.tscn").instantiate())

func play_music():
	var num: int = randi_range(0, 2)
	match num:
		0:
			$MusicPlayer.stream = load("res://sound/music/415804__sunsai__mushroom-background-music.wav")
		1:
			$MusicPlayer.stream = load("res://sound/music/610068__bloodpixelhero__game-music-loop-7.wav")
		2:
			$MusicPlayer.stream = load("res://sound/music/616049__bloodpixelhero__game-music-loop-9.wav")
	$MusicPlayer.play()
