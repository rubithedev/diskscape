const raylib = @import("raylib");

const Vector3 = raylib.Vector3;

const Body = struct {
    position: Vector3,
    velocity: Vector3,
    dir: Vector3,
    is_grounded: bool,
};
