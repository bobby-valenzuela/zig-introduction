const std = @import("std");

//          ___ Method 1 (prints to stderr)
pub fn main() void {
    std.debug.print("Hello World, My my name is {s}.\n",.{"Bobby"});
}

//          ___ Method 2
//          pub fn main() !void {
//              const stdout = std.io.getStdOut().writer();
//              try stdout.print("hello world!\n", .{});
//          }




// Compile: zig build-exe hello_world.zig
