// no special effects here.
// We're just telling the ball that when you hit anyone
// related to parent_floor_ceiling (which includes
// object left wall and object right wall), go ahead and bounce.

move_bounce_solid(false);
audio_play_sound(sound_beep,1,false);