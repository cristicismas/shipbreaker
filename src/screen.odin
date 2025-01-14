package main

import rl "vendor:raylib"

get_screen_center :: proc() -> Vector2 {
	x := cast(f32)DEFAULT_RESOLUTION.x / 2
	y := cast(f32)DEFAULT_RESOLUTION.y / 2

	return Vector2{x, y}
}
