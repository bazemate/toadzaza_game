var vsp_choice = random_range(1,3)
var hsp_choice = random_range(1,3)

with instance_create_depth(x - 4,y - 4,depth,obj_particle)
{
	sprite_index = spr_block_particles
	vsp = -vsp_choice
	hsp = -hsp_choice
}
with instance_create_depth(x + 4,y - 4,depth,obj_particle)
{
	sprite_index = spr_block_particles
	vsp = -vsp_choice
	hsp = hsp_choice
}
with instance_create_depth(x - 4,y + 4,depth,obj_particle)
{
	sprite_index = spr_block_particles
	vsp = -vsp_choice
	hsp = -hsp_choice
}
with instance_create_depth(x + 4,y + 4,depth,obj_particle)
{
	sprite_index = spr_block_particles
	vsp = -vsp_choice
	hsp = hsp_choice
}