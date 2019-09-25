// This code gets called when the ball collides
// with any of the paddle blocks.  

// The first thing
// to do whenever we collide is call
// "move_bounce_solid(false)."

move_bounce_solid(false);

// this tells GM to bounce off of a solid thing.  The "false"
// argument tells it NOT to use extra-precise calculations --
// they just slow us down.  Regular precision is good enough here.

// NOW FOR THE FIREWORKS
// repeat(11) { code }
// means DO THE CODE IN THE CURLY BRACES 11 TIMES
// In this case, I create an instance of an explosion spark
// on the "Instances_Effects" layer.  I don't have to put it on
// a different layer, but I can.

repeat(11) {
	instance_create_layer(x, y, "Instances_Effects",object_burster);
}

// Last business:  change the spin direction of the paddle that
// we ran into.  In this case "OTHER" automatically refers to
// the thing we collided with.  But "other" only means that while
// we're inside the code called by a COLLISION EVENT.  In other
// situations, it will mean something different.  

// Here, I alter a variable I called "direction_modifier".  It starts out 
// as 1, but every time I multiply it by -1, it changes sign (1,-1,1,-1, etc.)
// I constantly multiply the orbit delta by a paddle's direction
// modifier, making it head either clockwise or counterclockwise; as soon
// as I multiply direction_modifier by -1, the paddle begins heading in the
// opposite direction.

other.direction_modifier = other.direction_modifier * -1;

audio_play_sound(sound_cardoor_explosion,1,false);
