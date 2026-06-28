const std = @import("std");
// const EngineIo = @import("engine_io.zig").EngineIO;
const EngineRender = @import("engine_render.zig").EngineRender;

const print = std.debug.print;

pub fn main(_: std.process.Init) !void {
    var engine_render = EngineRender.init(.{});
    defer engine_render.deinit();

    engine_render.run();
}
