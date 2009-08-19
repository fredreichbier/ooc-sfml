include SFML/Graphics

//use csfml-graphics

import sfml.Windows

//sfRenderWindow: extern sfRenderWindow

Style: class {
    NONE = 0, TITLEBAR = 1, RESIZE = 2, CLOSE = 4, FULLSCREEN = 8 : const static UInt
}

RenderWindow: cover from sfRenderWindow* {
	
    new: func(mode: VideoMode, title: String, style: UInt, params: WindowSettings) -> This {
        sfRenderWindow_Create(
                    mode,
                    title,
                    style,
                    params
                    )
    }

    destroy: func {
        sfWindow_Destroy(this)
    }

    close: func {
        sfWindow_Close(this)
    }

    isOpened: func -> Bool {
        return sfWindow_IsOpened(this)
    }
    
    display: func {
        sfWindow_Display(this)
    }
}

sfRenderWindow_Create: extern func (VideoMode, String, UInt, WindowSettings)
sfWindow_IsOpened: extern func (RenderWindow)
sfWindow_Display: extern func (RenderWindow)
sfWindow_Destroy: extern func (RenderWindow)
sfWindow_Close: extern func (RenderWindow)
