import sfml.Graphics;

func main -> Int{
    VideoMode mode = new(600, 480, 32);
    RenderWindow window = new(mode, "Hello World!", RenderWindow.TITLEBAR, new WindowSettings);

    Bool running = true;
    while(running) {
        window.display();
    }
    return 0;
}
