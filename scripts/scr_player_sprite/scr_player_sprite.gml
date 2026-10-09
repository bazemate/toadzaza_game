function scr_player_sprite()
{

}

function scr_player_sprite_create()
{
	s_idle = p_idle
	s_walk = p_walk
	s_jump = p_jump
	s_jump_angle = p_jump_angle
	s_slide = p_slide
	s_bounce = p_bounce
	s_bounce_loop = p_bounce_loop
	s_turn = p_turn
	s_mask = p_mask
	s_jump_mask = p_jump_mask
}


function scr_player_sprite_manager()
{
	if (hp == 2)
	{
		s_idle = p_idle_big
		s_walk = p_walk_big
		s_jump = p_jump_big
		s_jump_angle = p_jump_angle_big
		s_slide = p_slide_big
		s_bounce = p_bounce_big
		s_bounce_loop = p_bounce_loop_big
		s_turn = p_turn_big
		s_mask = p_mask_big
		s_jump_mask = p_jump_mask_big
	} 
	else 
	{
		s_idle = p_idle
		s_walk = p_walk
		s_jump = p_jump
		s_jump_angle = p_jump_angle
		s_slide = p_slide
		s_bounce = p_bounce
		s_bounce_loop = p_bounce_loop
		s_turn = p_turn	
		s_mask = p_mask
		s_jump_mask = p_jump_mask
	}
}