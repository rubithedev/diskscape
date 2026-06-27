const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const raylib = b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "diskscape",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    exe.root_module.addImport("raylib", raylib.module("raylib"));
    exe.root_module.linkLibrary(raylib.artifact("raylib"));

    exe.root_module.linkSystemLibrary("GL", .{});
    exe.root_module.linkSystemLibrary("X11", .{});
    exe.root_module.linkSystemLibrary("Xrandr", .{});
    exe.root_module.linkSystemLibrary("Xinerama", .{});
    exe.root_module.linkSystemLibrary("Xi", .{});
    exe.root_module.linkSystemLibrary("Xcursor", .{});

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| run_cmd.addArgs(args);
    const run_step = b.step("run", "Runs the debug application");
    run_step.dependOn(&run_cmd.step);
}
