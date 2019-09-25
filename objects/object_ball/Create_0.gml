// Create the object_ball instance.
// give it a speed of 2 and a random direction.
// GameMaker handles all of the movement --
// we don't have to keep adding 1 to x and 1 to y,
// etc.  We just set speed and direction and
// away they go!

speed = 2;
direction=random_range(0,359);
move_bounce_solid(false);