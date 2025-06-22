const std = @import("std");

pub fn main() void {
    std.debug.print("Hello World, My my name is {s}.\n",.{"Bobby"});
}


// Compile: zig build-exe hello_world.zig`
