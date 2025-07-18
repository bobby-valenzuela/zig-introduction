# Zig-introduction
Trying my hands at some Zig

<br />

__Running a program__  
```bash
zig run program.zig
```

<br />

__Building an exe (linux)__
```bash
zig build-exe program.zig
```
<br />

__Building an exe (windows)__
```bash
zig build-exe program.zig -target x86_64-windows
```
<br />

__Compiling a C program__
```bash
zig cc program.c -o app
```
<br />

__Running Tests__
```bash
zig test test.zig
```
<br />

__Re-encode file as UTF-8__
```bash
zig fmt main.zig
```


<br />

<br />

# Data Types in Zig

Zig is a systems programming language with a focus on simplicity, performance, and safety. Its type system is explicit, statically typed, and designed to avoid hidden control flow or implicit conversions. Below is a comprehensive overview of Zig's data types, organized by category.

## 1. Primitive Types
These are the fundamental building blocks in Zig.

- **Integers**:
  - Signed: `i8`, `i16`, `i32`, `i64`, `i128` (8, 16, 32, 64, or 128-bit signed integers).
  - Unsigned: `u8`, `u16`, `u32`, `u64`, `u128` (8, 16, 32, 64, or 128-bit unsigned integers).
  - Arbitrary bit-width: `iN` or `uN` (e.g., `u3` for a 3-bit unsigned integer, ranging from 0 to 7).
  - Special: `isize`, `usize` (platform-dependent, matches pointer size; e.g., 64-bit on x86_64).

- **Floating-Point**:
  - `f16`, `f32`, `f64`, `f80`, `f128` (half, single, double, extended, and quad-precision floats).
  - Follows IEEE 754 standards where supported by the platform.

- **Boolean**:
  - `bool`: Either `true` or `false`.

- **Void**:
  - `void`: Represents the absence of a type or value, often used for functions that return nothing.

- **No Return**:
  - `noreturn`: Indicates a function never returns (e.g., loops infinitely or exits), used for functions like `std.process.exit`.

- **Null**:
  - `null`: A literal representing the absence of a value, used with optional types.

- **Undefined**:
  - `undefined`: A special value for uninitialized variables. Zig requires explicit initialization to avoid undefined behavior, but `undefined` can be used to defer initialization (use with caution).

## 2. Composite Types
These types are built from primitives or other types.

- **Arrays**:
  - Fixed-size sequence of elements of the same type.
  - Syntax: `[N]T` (e.g., `[5]u32` for an array of 5 unsigned 32-bit integers).
  - Can be indexed at compile-time or runtime.
  - Special case: `[0]T` (zero-length array).

- **Slices**:
  - A runtime view into a sequence of elements (like a pointer and length).
  - Syntax: `[]T` (e.g., `[]u8` for a slice of bytes, often used for strings).
  - Fields: `.ptr` (pointer to data), `.len` (length of slice).
  - Common for dynamic arrays or substrings.

- **Pointers**:
  - Single-item pointers: `*T` (e.g., `*i32` for a pointer to a 32-bit integer).
  - Many-item pointers: `[*]T` (pointer to an unknown number of items).
  - Slices as pointers: `[]T` (includes length).
  - Optional pointers: `?*T` (nullable pointer).
  - Pointers can have alignment or const/volatile qualifiers (e.g., `*align(4) const T`).

- **Structs**:
  - User-defined types with named fields.
  - Syntax:
    ```zig
    const Point = struct {
        x: f32,
        y: f32,
    };
    ```
  - Supports methods, default values, and anonymous structs (e.g., `.{ .x = 1, .y = 2 }`).
  - Packed structs (`packed struct`) for bit-level control of layout.

- **Unions**:
  - A type where only one field is active at a time.
  - Syntax:
    ```zig
    const Value = union {
        int: i32,
        float: f32,
    };
    ```
  - Tagged unions (`union(enum)`) use an enum to track the active field:
    ```zig
    const Value = union(enum) {
        int: i32,
        float: f32,
    };
    ```

- **Enums**:
  - A type representing a fixed set of named values.
  - Syntax:
    ```zig
    const Color = enum {
        red,
        green,
        blue,
    };
    ```
  - Can have explicit integer tags (e.g., `enum(u8) { red = 1, green = 2, blue = 3 }`).
  - Supports methods and exhaustive switching.

## 3. Optional Types
- Denoted by `?T` (e.g., `?i32` for a nullable 32-bit integer).
- Represents a value that is either `T` or `null`.
- Used with pointers, structs, or other types to indicate optionality.
- Accessed safely with `if` or `orelse` (e.g., `if (opt_val) |val| {...} else {...}`).

## 4. Error Types
- Zig uses error unions for error handling.
- Syntax: `!T` (e.g., `!i32` means a value of type `i32` or an error).
- Errors are defined in error sets:
  ```zig
  const MyError = error { OutOfMemory, InvalidInput };
  ```
- Error unions are handled with `try`, `catch`, or explicit checks:
  ```zig
  fn mightFail() MyError!i32 { ... }
  const result = try mightFail(); // Propagates error
  ```

## 5. Vector Types
- For SIMD operations.
- Syntax: `vector(N, T)` (e.g., `vector(4, f32)` for a 4-element vector of 32-bit floats).
- Supported where hardware allows; operations are optimized for SIMD.

## 6. Opaque Types
- `opaque`: Represents a type with unknown size or structure, often used for interoperability with C (e.g., external structs with unknown layout).
- Syntax: `opaque {}`.
- Useful for type-safe handles or pointers to external data.

## 7. Function Types
- Functions are first-class types in Zig.
- Syntax: `fn(params) return_type` (e.g., `fn(i32, i32) i32` for a function taking two `i32` and returning an `i32`).
- Can be stored in variables or passed as arguments.

## 8. Comptime Types
- Zig’s compile-time evaluation allows types to be manipulated at compile time.
- `comptime T` ensures a value is known at compile time.
- `type`: The type of types, used for metaprogramming (e.g., returning a type from a function).
- Example:
  ```zig
  fn ArrayOf(comptime T: type, n: usize) type {
      return [n]T;
  }
  const FiveInts = ArrayOf(i32, 5); // [5]i32
  ```

## 9. Special Types and Literals
- **C Types**: For C interoperability, Zig provides `c_int`, `c_uint`, `c_long`, etc., matching C’s ABI.
- **String Literals**: `[]const u8` (e.g., `"hello"` is a constant byte slice).
- **Comptime Integers/Floats**: `comptime_int`, `comptime_float` for compile-time calculations.
- **Anytype**: Used in generic functions to infer types at compile time.

## Notes on Usage
- **Type Safety**: Zig enforces strict typing with no implicit casts (e.g., use `@intCast` for explicit integer conversion).
- **Compile-Time Reflection**: Use `@typeInfo`, `@TypeOf`, or `@typeName` to inspect types.
- **Memory Management**: Zig has no garbage collector; types like slices and pointers require manual memory handling (often via `std.mem.Allocator`).
- **Zig Standard Library**: The `std` library provides utilities for working with types (e.g., `std.ArrayList` for dynamic arrays).

## Example
```zig
const std = @import("std");

const MyStruct = struct {
    value: i32,
    optional: ?[]const u8,
};

pub fn main() !void {
    const point = MyStruct{ .value = 42, .optional = "hello" };
    std.debug.print("Value: {}, Optional: {?s}\n", .{point.value, point.optional});
}
```
