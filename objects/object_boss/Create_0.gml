// We have 6 bosses in the room before we start the game.
// As each of those bosses is brought on-line, they
// run through this start-up code... and in doing so,
// they each create 7 paddle blocks.

// make it adjustable!
paddle_length = 7;
// this is a global variable, and once I set it, I can
// get data from it from inside any instance at any time.
// In this case, I'm using global.gameSpeed to change
// the speed of the game (although it isn't really
// implemented yet).

global.gameSpeed = 9;

// var means "temporary variable."  These get thrown
// away as soon as we leave this section of code, saving
// memory.  It isn't a mandatory thing, but it CAN
// keep your code neater and eliminate unepected problems.
// Here, I pick a random integer between 0 and 10.
// I multiply that integer by 18 (thus, 0 to 180).
// and I assign that angle to "startingAngle."

// I do this before I start the for loop (below) because
// I don't want to re-randomize the starting angle every
// time I add a new paddle block.  I want them to hang out
// together, so I need all of the paddle blocks in a single
// paddle to share the same startingAngle.
var startingAngle = irandom_range(0,10)*18;

// FOR/NEXT LOOPS are strangely built but awesome.
// Even if it doesn't make sense, it is very formulaic,
// so just remember how it goes together and it will
// never fail you.

// Here's what this one says:
// "Set i to be 0;
// "Is i less than paddle_length (7)" ?
// Yes? Then do all the code inside the curly braces and come back when you're done.
// -- do the code --
// Done?  Then add 1 to i.
// Is i less than paddle_length (7)?
// Yes? Then do all the code inside the...
//
// Keep repeating until we get to:
// Done?  Add 1 to i (so that i now equals 7).
// Is i less than paddle_length (7)?  
// NO?  Then skip down to the end of this curly braced section of code
// and move forward.
// 
// In other words, FOR loops allow us to do something
// repeatedly.  And because we have access to a counter that
// is incremented every step of the way (in this case "i"),
// we can make every repetition a LITTLE different.
// Take a look inside this loop at "orbit_number" for an example.

// 
for(var i = 0; i < paddle_length; i=i+1) {
	// create a new paddle block on the Instances Paddles layer.
	// We use "fresh_paddle" as a temp variable to hold onto that
	// paddle so that it is easier to access for a moment...
	var fresh_paddle = instance_create_layer(x, y, "Instances_Paddles", object_paddle);
	// the id variable is actually this instance of object_boss's id number.
	// by saying fresh_paddle.myBoss = id, I take the newly-created paddle
	// and insert my own variable into it, "myBoss."  I also assign it the
	// value of this boss's id, so that all 7 of its "children" can easily
	// find their boss later.
	
	fresh_paddle.myBoss = id;
	
	// Here I use the "i" variable from our FOR loop.  That means that the
	// paddle blocks will each have a different orbit number, from 0 to 6.
	// I have them store that value in my orbit_number variable.
	fresh_paddle.orbit_number = i;
	
	// I use this value to bounce the paddle in the opposite direction when
	// it gets struck.  For now, they are all at "1", which means they are
	// all going the same direction.
    fresh_paddle.direction_modifier = 1;
	
 // this code just takes the starting angle that we randomized outside of
 // the foor loop and assigns it to all 7 of the blocks.
 // I use the degtorad() function because "startingAngle" is in
 // degrees (0-359) and my sine/cosine approach will need radians.
 // One radian is about 57.3 degrees.
	fresh_paddle.paddleOrbitAngle = degtorad(startingAngle);//(i+1)*2;
}