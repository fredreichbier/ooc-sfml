import sfml.Graphics, sfml.Windows

main: func -> Int{
    mode := new VideoMode(600, 480, 32)
    window := new RenderWindow(mode, "Hello World!", Style TITLEBAR, new WindowSettings)

    running := true
    while(running) {
        window display()
    }
    return 0
}
