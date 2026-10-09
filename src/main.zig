
const std = @import("std");

const lbm = @import("lbm.zig");

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
    std.debug.print("Run `zig build test` to run the tests.\n", .{});
}

test "simple test" {
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(std.testing.allocator);

    try list.append(std.testing.allocator, 42);

    try std.testing.expectEqual(@as(i32, 42), list.pop().?);
}
