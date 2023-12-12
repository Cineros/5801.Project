# Made by Petros Atsas
extends GridContainer

signal money_change(price)

func _on_money_counter_cash_amount(cash):
	if cash < $pointer_button.price:
		$pointer_button.disabled = true
	else:
		$pointer_button.disabled = false
		
	if cash < $Arrow_button.price:
		$Arrow_button.disabled = true
	else:
		$Arrow_button.disabled = false
		
	if cash < $cursor_button.price:
		$cursor_button.disabled = true
	else:
		$cursor_button.disabled = false


func _on_cursor_button_tower_bought(price):
	emit_signal("money_change", price)


func _on_arrow_button_tower_bought(price):
	emit_signal("money_change", price)


func _on_pointer_button_tower_bought(price):
	emit_signal("money_change", price)


func _on_money_counter_2_cash_amount(cash):
	if cash < $pointer_button.price:
		$pointer_button.disabled = true
	else:
		$pointer_button.disabled = false
		
	if cash < $Arrow_button.price:
		$Arrow_button.disabled = true
	else:
		$Arrow_button.disabled = false
		
	if cash < $cursor_button.price:
		$cursor_button.disabled = true
	else:
		$cursor_button.disabled = false
