const std = @import("std");
const EngineIo = @import("engine_io.zig").EngineIO;

const print = std.debug.print;

pub fn main(init: std.process.Init) !void {
    const engine_io = try EngineIo.init(init.io, "fs.iso");
    defer engine_io.deinit();

    const chunk = try engine_io.loadChunk(1, 1);
    for (chunk) |byte| if (byte != 0) print("\nByte: 0x{X}\n", .{byte}) else print(".", .{});
}
