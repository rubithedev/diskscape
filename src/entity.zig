const std = @import("std");
const id = @import("utils/uuid.zig");
const UUID = id.UUID;

pub const Transform = struct {
    x: f32,
    y: f32,

    pub fn init(x: f32, y: f32) Transform {
        return Transform{
            .x = x,
            .y = y,
        };
    }

    pub fn updatePosition(self: Transform, x: f32, y: f32) Transform {
        self.x = x;
        self.y = y;

        return self;
    }

    // TODO: The rest of the translation functions.
};

pub const Entity = struct {
    id: UUID,
    tf: Transform,

    pub fn init() Entity {
        return Entity{
            .id = id.newV4(),
            .transform = Transform.init(),
        };
    }

    pub fn transform(self: Entity) Transform {
        return self.tf;
    }
};
