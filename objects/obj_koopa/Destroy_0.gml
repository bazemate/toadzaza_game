with instance_create_depth(x,y,-1,obj_particle)
{
	vsp = -4
	rotating = true
	sprite_index = spr_koopa_dead
}

repeat irandom_range(8,16)
{
	with instance_create_depth(x + random_range(4,-4),y + random_range(4,-4),-1,obj_particle)
	{
		vsp = -random_range(2,6)
		hsp = random_range(-4,4)
		sprite_index = choose(spr_blood,spr_blood_small)
	}
}

instance_create_depth(x,y,depth,obj_shell)