# Made by Petros Atsas
extends NinePatchRect

var wallet = 10
signal cash_amount(cash)

func _on_start_button_money(counter):
	wallet += counter * 10
	$Label.text = str(wallet)
	emit_signal("cash_amount",wallet)


func _on_buy_grid_money_change(price):
	wallet -= price
	if wallet < 0:
		$Label.text = "0"
		wallet = 0
	else:
		$Label.text = str(wallet)
	emit_signal("cash_amount",wallet)


func _on_interface_add_score(score):
	wallet += score
