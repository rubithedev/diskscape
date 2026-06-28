const std = @import("std");
const id = @import("utils/uuid.zig");
const UUID = id.UUID;

pub const Entity = struct {
    id: UUID,

    pub fn init() Entity {
        return Entity{
            .id = id.newV4(),
        };
    }
};
