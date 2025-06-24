const helloWorld = @import("./hello_world.zig");

pub fn main() void {
    // It's as if the file itself is imported and the public items ("pub") can be directly accessed with dot notation.
    helloWorld.main();
}
