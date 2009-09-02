import sfml.Graphics

use csfml-graphics
use csfml-window

include unistd | (__USE_BSD)
usleep: extern func(Int)

main: func {
    mode := VideoMode getMode(0)
    win := RenderWindow new(mode, "Hello World!", 1, WindowSettings new(24, 8, 0))
	
    while(win isOpened()) {
        printf("yay")
		win display()
    }
}
