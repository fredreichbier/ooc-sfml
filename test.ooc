import sfml.[Windows, Graphics, System, Network, Audio]

include unistd | (__USE_BSD)
usleep: extern func(Int)

main: func {
    mode := VideoMode getMode(0)
    win := RenderWindow new(mode, "Hello World!", 1, WindowSettings new(24, 8, 0))
	
    printf("yay")
    win display()
    sleep(1.0)
}
