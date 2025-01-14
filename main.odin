package main

import "core:fmt"
import "core:os"
import rl "vendor:raylib"

CORNFLOWER :: rl.Color{130, 163, 255, 255}

main :: proc() {
	fmt.println("hey")

	rl.InitWindow(800, 600, "my window")

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(CORNFLOWER)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
