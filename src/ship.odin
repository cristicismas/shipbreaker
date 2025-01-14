package main

import "core:fmt"
import rl "vendor:raylib"

SHIP_FRAMES :: 3
FRAME_DURATION: f32 : 0.3

Ship :: struct {
	position:      Vector2,
	rotation:      f32,
	texture:       rl.Texture,
	current_frame: int,
	max_frames:    int,
	scale:         f32,
}

draw_ship :: proc(ship: ^Ship) {
	ship_texture := ship.texture

	ship_width := f32(ship_texture.width)
	ship_height := f32(ship_texture.height)

	if ship_frame_timer > FRAME_DURATION {
		ship.current_frame += 1
		ship_frame_timer = 0

		if ship.current_frame == SHIP_FRAMES {
			ship.current_frame = 0
		}
	}

	// handles which frame to draw
	draw_ship_rectangle := rl.Rectangle {
		x      = f32(ship.current_frame) * ship_width / f32(SHIP_FRAMES),
		y      = 0,
		width  = ship_width / f32(SHIP_FRAMES),
		height = ship_height,
	}

	// handles scale
	dest_ship_rectangle := rl.Rectangle {
		x      = 0,
		y      = 0,
		width  = ship_width * SPRITE_SCALE / f32(SHIP_FRAMES),
		height = ship_height * SPRITE_SCALE,
	}

	transform_origin := get_screen_center()

	rl.DrawTexturePro(
		ship_texture,
		draw_ship_rectangle,
		dest_ship_rectangle,
		ship.position,
		ship.rotation,
		rl.WHITE,
	)
}

create_ship :: proc(asset_path: cstring) -> Ship {
	BOTTOM_OFFSET :: 100
	ship_texture := rl.LoadTexture(asset_path)

	ship_width := f32(ship_texture.width)
	ship_height := f32(ship_texture.height)

	screen_center_x := get_screen_center().x

	position_x := -(screen_center_x - ship_width / 2)

	screen_bottom := cast(f32)(-DEFAULT_RESOLUTION.y + ship_texture.height * SPRITE_SCALE)
	position_y := screen_bottom + BOTTOM_OFFSET

	ship := Ship {
		texture  = ship_texture,
		position = {position_x, position_y},
	}

	return ship
}
