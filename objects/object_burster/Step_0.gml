if (life_span < 0.1) {
	instance_destroy();
}

life_span = life_span -1;
if (life_span < 100) {
	image_alpha = life_span * 0.01;
	speed = speed * 0.995;
}
