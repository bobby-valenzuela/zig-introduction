const std = @import("std");


pub fn main() void {

    // Hard-code the size of the array
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };

    // Infer the size of the array with '_'
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    const length = b.len; // 5

    std.debug.print("Array size: {}\n", .{length});

}
