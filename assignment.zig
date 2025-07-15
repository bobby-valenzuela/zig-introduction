const std = @import("std");


pub fn main() void {

    // Assignment
    const num_const: i32 = 5; // signed 32-bit constant
    var num_var: u32 = 5000; // unsigned 32-bit variable
    num_var = 5001;
    std.debug.print("[1] num_const {} | num_var: {}\n", .{num_const,num_var} );
    


    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 5000);
    inferred_variable = 5001;
    std.debug.print("[2] inferred_constant {} | inferred_variable: {}\n", .{inferred_constant,inferred_variable} );

    // Undefined
    const a: i32 = undefined;
    var b: u32 = undefined;
    b = 1;
    std.debug.print("[3] a {} | b: {}\n", .{a,b} );



}
