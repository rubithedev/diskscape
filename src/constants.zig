const raylib = @import("raylib");

const Vector2 = raylib.Vector2;

const GRAVITY: f32 = 32.0;
const MAX_SPEED: f32 = 20.0;
const CROUCH_SPEED: f32 = 5.0;
const JUMP_FORCE: f32 = 12.0;
const MAX_ACCEL: f32 = 150.0;
const FRICTION: f32 = 0.86;
const AIR_DRAG: f32 = 0.98;
const CONTROL: f32 = 15.0;
const CROUCH_HEIGHT: f32 = 0.0;
const STAND_HEIGHT: f32 = 1.0;
const BOTTOM_HEIGHT: f32 = 0.5;
const SENSITIVITY: Vector2 = .{ .x = 0.001, .y = 0.001 };
