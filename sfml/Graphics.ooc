include SFML/Graphics

//use csfml-graphics

import sfml.Windows

//sfRenderWindow: extern sfRenderWindow

Style: class {
    NONE = 0, TITLEBAR = 1, RESIZE = 2, CLOSE = 4, FULLSCREEN = 8 : const static UInt
}

Window: cover from sfWindow*

RenderWindow: cover from sfRenderWindow* {
	
    new: func (mode: VideoMode, title: String, style: UInt, params: WindowSettings) -> This {
        sfRenderWindow_Create(
                    mode,
                    title,
                    style,
                    params
                    )
    }

    destroy: func {
        sfWindow_Destroy(this as Window)
    }

    close: func {
        sfWindow_Close(this as Window)
    }

    isOpened: func -> Bool {
        return sfWindow_IsOpened(this as Window)
    }
    
    display: func {
        sfWindow_Display(this as Window)
    }

    getEvent: func (eventReceived: Event*) -> Bool {
        return sfWindow_GetEvent(this as Window, eventReceived)
    }
}

sfRenderWindow_Create: extern func (VideoMode, String, UInt, WindowSettings)
sfWindow_IsOpened: extern func (Window)
sfWindow_Display: extern func (Window)
sfWindow_Destroy: extern func (Window)
sfWindow_Close: extern func (Window)
sfWindow_GetEvent: extern func (Window, Event)
