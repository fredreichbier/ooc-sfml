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

    clear: func (color: Color) {
        sfRenderWindow_Clear(this, color)
    }

    getEvent: func (eventReceived: Event*) -> Bool {
        return sfWindow_GetEvent(this as Window, eventReceived)
    }
}

UInt8: cover from sfUint8

Colors: class {
/*    black : static const Color = Color fromRGB(0, 0, 0)
    white : static const Color = Color fromRGB(255, 255, 255)
    red : static const Color = Color fromRGB(255, 0, 0)
    green : static const Color = Color fromRGB(0, 255, 0)
    blue : static const Color = Color fromRGB(0, 0, 255)
    yellow : static const Color = Color fromRGB(255, 255, 0)
    magenta : static const Color = Color fromRGB(255, 0, 255)
    cyan : static const Color = Color fromRGB(0, 255, 255) */
}

Color: cover from sfColor {
    r, g, b, a: extern UInt8

    fromRGB: static func (r, g, b: UInt8) -> Color {
        return fromRGBA(r, g, b, 255 as UInt8)
    }

    fromRGBA: static func (r, g, b, a: UInt8) -> Color {
        Color color
        color r = r
        color g = g
        color b = b
        color a = a
        return color
    }

    add: func (b: Color) -> Color {
        return SfColor_Add(this, b)
    }

    modulate: func (b: Color) -> Color {
        return SfColor_Modulate(this, b);
    }
}

sfRenderWindow_Create: extern func (VideoMode, String, UInt, WindowSettings)
sfWindow_IsOpened: extern func (Window)
sfWindow_Display: extern func (Window)
sfWindow_Destroy: extern func (Window)
sfWindow_Close: extern func (Window)
sfRenderWindow_Clear: extern func (Window, Color)
sfWindow_GetEvent: extern func (Window, Event)

sfColor_Add: extern func(Color, Color)
sfColor_Modulate: extern func(Color, Color)
sfColor_fromRGB: extern func(UInt8, UInt8, UInt8)
