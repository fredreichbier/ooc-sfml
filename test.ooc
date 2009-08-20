import sfml.Graphics, sfml.Windows

include unistd | (__USE_BSD)

usleep: extern func(Int)

main: func -> Int{
    mode := new VideoMode(600, 470)
    app := new RenderWindow(mode, "Hello World!", Style TITLEBAR, new WindowSettings)
    image := new Image("cool_sprite.jpg")
    sprite := new Sprite(image)
    
    while(app isOpened()) {
        evt: Event
        while(app getEvent(evt&)) {
            if(evt type == EventType closed) {
                app close()
            }
        }
        app draw(sprite)
		app display()
		usleep(20_000)
    }
    return 0
}
