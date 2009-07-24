include SFML/Graphics;

use csfml-graphics;

import sfml.Windows;

ctype sfRenderWindow;
typedef sfRenderWindow SfRenderWindow;

typedef unsigned long ULong;

class RenderWindow {
    SfRenderWindow* window;

    const static UInt NONE = 0;
    const static UInt TITLEBAR = 1;
    const static UInt RESIZE = 2;
    const static UInt CLOSE = 4;
    const static UInt FULLSCREEN = 8;

    func new(VideoMode Mode, String title, ULong style, WindowSettings Params) {
        this.window = sfRenderWindow_Create(
                        Mode.videoMode,
                        title,
                        style,
                        Params.windowSettings
                        );
    }

    /* TODO: wrap sfRenderWindow_CreateFromHandle */

    func destroy {
        sfWindow_Destroy(this.window);
    }

    func close {
        sfWindow_Close(this.window);
    }

    func isOpened -> Bool {
        return sfWindow_IsOpened(this.window);
    }
    
    func display {
        sfWindow_Display(this.window);
    }
}
