slide_x = lerp(slide_x,slide_xGOTO,0.1)
slide_x2 = lerp(slide_x2,slide_xGOTO,0.1)

intro_alpha = approach(intro_alpha,intro_alphaGOTO,0.1)

if intro_alpha == 0
{
	persistent = false;
	instance_destroy(self);
}