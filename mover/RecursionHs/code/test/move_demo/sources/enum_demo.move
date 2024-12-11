module move_demo::enum_demo;
use std::debug::print;

public enum Color has drop{
    RED,
    GREEN,
    BLUE
}


public fun print_color(c: &Color) {
    match(c) {
        Color::RED => {
            print(&b"Red");
        },
        Color::GREEN => {
            print(&b"Green");
        },
        _ => {
            print(&b"Unknown");
        },
    }
}

#[test]
fun test_move_demo() {
    print_color(&Color::RED);
}