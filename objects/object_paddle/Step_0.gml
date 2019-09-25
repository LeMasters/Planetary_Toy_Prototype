// how far out will our paddle's orbit take it?
// Note that I add 1 to the variable orbit_number because
// the orbit_numbers technicaly start at 0, meaning my first
// paddle would actually sit on top of the boss, instead of 
// moving to the next orbit out.

// sprite_width * 1.2 creates a tiny gap between the blocks.
// if you just use sprite_width * 1, you'll see a big difference.
orbitalRadiusPixels = (orbit_number+1) * (sprite_width*1.2);

// again:  var just means "this is a throw-away variable."
// the calculations here don't really matter... you could come up
// with these values in any number of ways...
// calculate change based on current difficulty; change to radians
var delta_degrees = (global.gameSpeed * 0.1) * direction_modifier;
paddleOrbitDelta = degtorad(delta_degrees);

// now add that to our current angle
paddleOrbitAngle = paddleOrbitAngle + paddleOrbitDelta;

// calculate and set this object instance's new X and new Y accordingly,
// Remember that myBoss contains the id code that refers to the 
// specific object that is its "parent."  So when I say 
// myBoss.x, I'm referring to the x-value of that specific object_boss instance.
//
// I add myBoss's x and y to my paddle's x and y in order to put the paddle
// in relation to the object_boss that gave birth to it...
x = (sin(paddleOrbitAngle) * orbitalRadiusPixels) + myBoss.x;
y = (cos(paddleOrbitAngle) * orbitalRadiusPixels)+ myBoss.y;

// turn to face the boss.
image_angle = point_direction(x,y,myBoss.x,myBoss.y);