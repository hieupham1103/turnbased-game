extends Marker2D

@export var has_battler: bool = false

func _process(delta):
	if has_battler == true:
		$Label.text = ''
