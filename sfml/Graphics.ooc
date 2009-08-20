include SFML/Graphics

//use csfml-graphics

import sfml.Windows

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

    draw: func ~sprite (sprite: Sprite) {
        sfRenderWindow_DrawSprite(this, sprite)
    }
}

UInt8: cover from sfUint8

Colors: class {
    black = Color fromRGB(0, 0, 0),
    white = Color fromRGB(255, 255, 255),
    red = Color fromRGB(255, 0, 0),
    green = Color fromRGB(0, 255, 0),
    blue = Color fromRGB(0, 0, 255),
    yellow = Color fromRGB(255, 255, 0),
    magenta = Color fromRGB(255, 0, 255),
    cyan = Color fromRGB(0, 255, 255),
	niceBlue = Color fromRGB(5, 162, 202) : static const Color
}

Color: cover from sfColor {
    r, g, b, a: extern UInt8

    fromRGB: static func (r, g, b: UInt8) -> Color {
        return This fromRGBA(r, g, b, 255 as UInt8)
    }

    fromRGBA: static func (r, g, b, a: UInt8) -> Color {
        color: Color
        color r = r
        color g = g
        color b = b
        color a = a
        return color
    }

    add: func (b: Color) -> Color {
        return sfColor_Add(this, b)
    }

    modulate: func (b: Color) -> Color {
        return sfColor_Modulate(this, b);
    }
	
	print: func {
		printf ("Color (%u, %u, %u, %u)\n", r, g, b, a)
	}
}

Image: cover from sfImage* {
    new: func ~from_color (width, height: UInt, color: Color@) {
        sfImage_CreateFromColor(width, height, color)
    }

    new: func ~from_pixels (width, height: UInt, data: UInt8*) {
        sfImage_CreateFromPixels(width, height, data)
    }

    new: func ~from_file (filename: String) {
        sfImage_CreateFromFile(filename)
    }

    new: func ~from_memory (data: String, sizeInBytes: SizeT) {
        sfImage_CreateFromMemory(data, sizeInBytes)
    }

    destroy: func {
        sfImage_Destroy(this)
    }
}

Sprite: cover from sfSprite* {
    new: func {
        sfSprite_Create()
    }

    new: func ~from_image (image: Image) {
        this := this()
        this setImage(image)
        this
    }

    destroy: func {
        sfSprite_Destroy(this)
    }

    setImage: func (image: Image) {
        sfSprite_SetImage(this, image)
    }
}

sfRenderWindow_Create: extern func (VideoMode, String, UInt, WindowSettings)
sfWindow_IsOpened: extern func (Window)
sfWindow_Display: extern func (Window)
sfWindow_Destroy: extern func (Window)
sfWindow_Close: extern func (Window)
sfRenderWindow_Clear: extern func (Window, Color)
sfRenderWindow_DrawSprite: extern func (Window, Sprite)
sfWindow_GetEvent: extern func (Window, Event)

sfColor_Add: extern func(Color, Color)
sfColor_Modulate: extern func(Color, Color)
sfColor_fromRGB: extern func(UInt8, UInt8, UInt8)

sfImage_CreateFromColor: extern func (UInt, UInt, Color)
sfImage_CreateFromPixels: extern func (UInt, UInt, UInt8)
sfImage_CreateFromFile: extern func (String)
sfImage_CreateFromMemory: extern func (String, SizeT)
sfImage_Destroy: extern func (Image)

sfSprite_Create: extern func()
sfSprite_Destroy: extern func(Sprite)
sfSprite_SetImage: extern func(Sprite, Image)
