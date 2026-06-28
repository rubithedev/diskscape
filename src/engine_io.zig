const std = @import("std");
const Io = std.Io;
const File = std.Io.File;
const math = std.math;

pub const Error = error{
    OutOfFileBoundsPosition,
};

pub const EngineIO = struct {
    io: Io,
    file: File,

    pub fn init(io: Io, file_name: []const u8) !EngineIO {
        return EngineIO{
            .io = io,
            .file = try Io.Dir.cwd().openFile(io, file_name, .{}),
        };
    }

    pub fn deinit(self: *EngineIO) void {
        self.file.close(self.io);

        self.* = undefined;
    }

    fn getFileSize(self: *const EngineIO) !u64 {
        return (try self.file.stat(self.io)).size;
    }

    pub fn loadChunk(self: *const EngineIO, x: u64, y: u64) ![4096]u8 {
        var chunk: [4096]u8 = undefined;
        var reader = self.file.reader(self.io, &chunk);

        const file_size = try self.getFileSize();
        const ratio = math.sqrt(file_size);
        const flatPosition = y * ratio + x;
        const seekPosition = flatPosition - 2048;

        if (seekPosition + 4096 > file_size) {
            return Error.OutOfFileBoundsPosition;
        }

        try reader.seekTo(seekPosition);
        _ = try reader.interface.take(4096);

        return chunk;
    }
};
