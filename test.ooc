import sfml.Graphics, sfml.Windows

include unistd | (__USE_BSD)
usleep: extern func(Int)

main: func {
    mode := new VideoMode(600, 470)
    win := new RenderWindow(mode, "Hello World!", Style TITLEBAR, new WindowSettings)
    image := new Image("data/cool_sprite.jpg")
    sprite := new Sprite(image)
    box := new BouncingBox(win)
	
    while(win isOpened()) {
        printf("yay")
        evt: Event
        while(win getEvent(evt&)) {
            if(evt type == EventType closed) {
                win close()
            }
        }
        win draw(sprite)
		box update()
		
		win display()
    }
}

BouncingBox: class {
	
	win: RenderWindow
	velX := 1.5
	velY := 1.5
	sprite := new Sprite(new Image("data/cache.png"))
	width := sprite getWidth()
	height := sprite getHeight()
	//halfWidth := sprite getWidth() / 2
	//halfHeight := sprite getHeight() / 2
	halfWidth := 75.0; halfHeight := 75.0
	
	new: func(=win) {
		sprite move(-width / 4, -height / 4)
	}
	
	update: func {
		sprite move(velX, velY)
		
		x := sprite getX() + width / 2
		y := sprite getY() + sprite getHeight() / 2
		
		if((x + halfWidth > win getWidth()) || (x - halfWidth < 0))
			velX = -velX
		
		if((y + halfHeight > win getHeight()) || (y - halfHeight < 0))
			velY = -velY
			
		win draw(sprite)
	}
	
}
