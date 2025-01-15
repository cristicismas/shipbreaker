package main

import "core:fmt"
import "core:os"
import rl "vendor:raylib"

Vector2 :: rl.Vector2

Vector2i :: [2]i32

DEFAULT_RESOLUTION :: Vector2i{1920, 1080}
GAME_NAME :: "Shipbreaker"
SPRITE_SCALE :: 3
FPS :: 60
// Rotation degrees per frame
ROTATION_SPEED :: 3

ship_frame_timer: f32

main :: proc() {
	rl.InitWindow(DEFAULT_RESOLUTION.x, DEFAULT_RESOLUTION.y, GAME_NAME)
	ship_current_frame: int

	rl.SetTargetFPS(FPS)

	ship_path: cstring = "../assets/aseprite/test_ship.png"
	ship := create_ship(ship_path)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		ship_frame_timer += rl.GetFrameTime()
		draw_ship(&ship)

		if rl.IsKeyDown(rl.KeyboardKey.RIGHT) {
			ship.rotation -= ROTATION_SPEED
		}

		if rl.IsKeyDown(rl.KeyboardKey.LEFT) {
			ship.rotation += ROTATION_SPEED
		}

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
