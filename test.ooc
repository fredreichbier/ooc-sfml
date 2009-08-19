import sfml.Graphics, sfml.Windows

main: func -> Int{
    mode := new VideoMode(600, 480, 32)
    app := new RenderWindow(mode, "Hello World!", Style TITLEBAR, new WindowSettings)
	printf("Style TITLEBAR = %d\n", Style TITLEBAR)

    while(app isOpened()) {
        evt: Event
        while(app getEvent(evt&)) {
            if(evt Type == EventType closed) {
                app close()
            }
        }
    }
    return 0
}
