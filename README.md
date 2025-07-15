# zig-introduction
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

__Re-encode file as UTF-8__
```bash
zig fmt main.zig
```
