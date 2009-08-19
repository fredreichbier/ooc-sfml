import sfml.Graphics;

main: func -> Int{
    mode := new VideoMode(600, 480, 32);
    window = new Window(mode, "Hello World!", RenderWindow TITLEBAR, new WindowSettings);

    running := true;
    while(running) {
        window display();
    }
    return 0;
}
