import sfml.Graphics, sfml.Windows

//include unistd | _BSD_SOURCE
include unistd
usleep: extern func(Int)

main: func -> Int{
    mode := new VideoMode(600, 480, 32)
    app := new RenderWindow(mode, "Hello World!", Style TITLEBAR, new WindowSettings)

	//Colors magenta print()

    while(app isOpened()) {
        evt: Event
        while(app getEvent(evt&)) {
            if(evt Type == EventType closed) {
                app close()
            }
        }
        app clear(Colors niceBlue)
		app display()
		usleep(20_000)
    }
    return 0
}
