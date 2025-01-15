package main

import rl "vendor:raylib"

get_rec_center :: proc(rect: rl.Rectangle) -> Vector2 {
	return Vector2{cast(f32)rect.width / 2, cast(f32)rect.height / 2}
}
