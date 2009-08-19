include SFML/Graphics;

//use csfml-graphics;

import sfml.Windows;

sfRenderWindow: extern sfRenderWindow
ULong: cover from unsigned long

Style: class {
    NONE: const static UInt = 0;
    TITLEBAR: const static UInt = 1;
    RESIZE: const static UInt = 2;
    CLOSE: const static UInt = 4;
    FULLSCREEN: const static UInt = 8;
}

RenderWindow: cover from sfRenderWindow {
    new: func(Mode: videoMode, title: String, style: ULong, Params: windowSettings) -> This {
        sfRenderWindow_Create(
                    Mode videoMode,
                    title,
                    style,
                    ParamsSettings
                    );
    }

    destroy: func {
        sfWindow_Destroy(this);
    }

    close: func {
        sfWindow_Close(this);
    }

    isOpened: func -> Bool {
        return sfWindow_IsOpened(this);
    }
    
    display: func {
        sfWindow_Display(this);
    }
}
