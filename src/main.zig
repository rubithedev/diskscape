const std = @import("std");
const rl = @import("raylib");

pub fn main(init: std.process.Init) !void {
    try std.Io.File.stdout().writeStreamingAll(init.io, "Hello World!\n");

    rl.InitWindow(800, 600, "Triangle");
    defer rl.CloseWindow();

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);

        rl.DrawTriangle(
            .{ .x = 400, .y = 150 },
            .{ .x = 250, .y = 450 },
            .{ .x = 550, .y = 450 },
            rl.RED,
        );
    }
}
