package main

import "core:fmt"
import "core:os"
import rl "vendor:raylib"

Vector2 :: rl.Vector2

Vector2i :: [2]i32

DEFAULT_RESOLUTION :: Vector2i{1920, 1080}
GAME_NAME :: "Shipbreaker"
FPS :: 60

main :: proc() {
	rl.InitWindow(DEFAULT_RESOLUTION.x, DEFAULT_RESOLUTION.y, GAME_NAME)
	ship_current_frame: int

	rl.SetTargetFPS(FPS)


	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
