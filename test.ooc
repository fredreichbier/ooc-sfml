import sfml/[Graphics, Windows]
 
include unistd | (__USE_BSD)
usleep: extern func(Int)
 
main: func {
    mode := VideoMode new(600, 470)
    win := RenderWindow new(mode, "Hello World!", Style TITLEBAR, WindowSettings new())
    image := Image new("data/cool_sprite.jpg")
    sprite := Sprite new()
    sprite setImage(image)
    box := BouncingBox new(win)
 
    while(win isOpened()) {
        evt: Event
        while(win getEvent(evt&)) {
            if(evt type == EventType closed) {
                win close()
            }
        }
        win drawSprite(sprite)
      box update()
 
      win display()
    }
}
 
BouncingBox: class {
 
   win: RenderWindow
   velX := 1.5
   velY := 1.5
   sprite := Sprite new()
   width := sprite getWidth()
   height := sprite getHeight()
   //halfWidth := sprite getWidth() / 2
   //halfHeight := sprite getHeight() / 2
   halfWidth := 75.0; halfHeight := 75.0
 
   init: func(=win) {
       sprite setImage(Image new("data/cache.png"))
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
 
      win drawSprite(sprite)
   }
 
}
