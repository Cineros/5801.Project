#Made on 11/06/2023 By Petros Atsas
extends Control



# create enemy spawn signal to send to counter
signal enemy_spawned(count)

# create enemy death signal to send to counter
signal enemy_death(count)

# create health signal to send to health bar
signal health_changed(health)
