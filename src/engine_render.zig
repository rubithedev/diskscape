const std = @import("std");
const raylib = @import("raylib");
const constants = @import("constants.zig");

const print = std.debug.print;

const Vector3 = raylib.Vector3;
const Vector2 = raylib.Vector2;
const Camera = raylib.Camera;

pub const RenderCommand = struct {
    // TODO: Implement.
};

pub const InitOptions = struct {
    screen_width: u16 = 800,
    screen_height: u16 = 500,
    target_FPS: u16 = 60,
    camera_fov: f32 = 60.0,
};

pub const EngineRender = struct {
    screen_width: u16,
    screen_height: u16,
    fps: u16,
    camera_fov: f32,
    camera: Camera,

    pub fn init(options: InitOptions) EngineRender {
        raylib.InitWindow(options.screen_width, options.screen_height, "Diskscape");
        raylib.SetTargetFPS(options.target_FPS);

        raylib.DisableCursor();

        // Clears the background for a really smooth and clean white panel.
        {
            raylib.BeginDrawing();
            defer raylib.EndDrawing();

            raylib.ClearBackground(raylib.BLACK);
        }

        return EngineRender{
            .screen_width = options.screen_width,
            .screen_height = options.screen_height,
            .fps = options.target_FPS,
            .camera_fov = options.camera_fov,
            .camera = .{
                .fovy = options.camera_fov,
                .projection = raylib.CAMERA_PERSPECTIVE,
                .up = .{ .x = 0, .y = 1.0, .z = 0 },
                .position = .{ .x = 0, .y = 0, .z = 0 },
            },
        };
    }

    pub fn deinit(self: *EngineRender) void {
        raylib.CloseWindow();

        self.* = undefined;
    }

    pub fn run(_: *const EngineRender) void {
        while (!raylib.WindowShouldClose()) {
            raylib.BeginDrawing();
            defer raylib.EndDrawing();

            raylib.DrawTriangle(
                .{ .x = 400, .y = 150 },
                .{ .x = 250, .y = 450 },
                .{ .x = 550, .y = 450 },
                raylib.RED,
            );
        }
    }
};
