const expect = @import("std").testing.expect;

test "if statement" {
    const a = true;
    var x: u16 = 0;

    // Expression form: 
    // x += if (a) 1 else 2;

    // Standard form
    if (a) {
        x += 1;
    } else {
        x += 2;
    }

    try expect(x == 1);
}
