include SFML/Graphics

use csfml-graphics

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
	
	getWidth: func -> UInt {
		sfRenderWindow_GetWidth(this)
	}
	
	getHeight: func -> UInt {
		sfRenderWindow_GetHeight(this)
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

    saveToFile: func (filename: String) -> Bool {
        sfImage_SaveToFile(this, filename)
    }

    createMaskFromColor: func (colorKey: Color, alpha: UInt8) {
        sfImage_CreateMaskFromColor(this, colorKey, alpha)
    }

    createMaskFromColor: func ~default_alpha (colorKey: Color) {
        createMaskFromColor(colorKey, 0)
    }

    copy: func (source: Image, destX, destY: UInt, sourceRect: IntRect) {
        /* TODO: should that really take `IntRect`? Shouldn't it take a pointer? */
        sfImage_Copy(this, source, destX, destY, sourceRect)
    }

    copyScreen: func (window: RenderWindow, sourceRect: IntRect) -> Bool {
        sfImage_CopyScreen(this, window, sourceRect)
    }

    copyScreen: func ~default_rect (window: RenderWindow) -> Bool {
        copyScreen(window, new IntRect(0, 0, 0, 0))
    }

    setPixel: func (x, y: UInt, color: Color) {
        sfImage_SetPixel(this, x, y, color)
    }

    getPixel: func (x, y: UInt) -> Color {
        sfImage_GetPixel(this, x, y)
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
	
	getSubRect: func -> IntRect {
		sfSprite_GetSubRect(this)
	}
	
	move: func (offsetX, offsetY: Float) {
		sfSprite_Move(this, offsetX, offsetY)
	}
	
	getX: func -> Float {
		sfSprite_GetX(this)
	}
	
	getY: func -> Float {
		sfSprite_GetY(this)
	}
	
	getCenterX: func -> Float {
		sfSprite_GetCenterX(this)
	}
	
	getCenterY: func -> Float {
		sfSprite_GetCenterY(this)
	}
	
	getWidth: func -> Float {
		sfSprite_GetWidth(this)
	}
	
	getHeight: func -> Float {
		sfSprite_GetHeight(this)
	}
}

IntRect: cover from sfIntRect {
	left: extern(Left) Int
	right: extern(Right) Int
	top: extern(Top) Int
	bottom: extern(Bottom) Int

    new: func (.left, .right, .top, .bottom) {
        rect: IntRect
        rect left = left
        rect right = right
        rect top = top
        rect bottom = bottom
        rect
    }
}

sfRenderWindow_Create: extern func (VideoMode, String, UInt, WindowSettings)
sfWindow_IsOpened: extern func (Window)
sfWindow_Display: extern func (Window)
sfWindow_Destroy: extern func (Window)
sfWindow_Close: extern func (Window)
sfRenderWindow_Clear: extern func (Window, Color)
sfRenderWindow_DrawSprite: extern func (Window, Sprite)
sfRenderWindow_GetWidth: extern func (Window) -> UInt
sfRenderWindow_GetHeight: extern func (Window) -> UInt
sfWindow_GetEvent: extern func (Window, Event)

sfColor_Add: extern func (Color, Color)
sfColor_Modulate: extern func (Color, Color)
sfColor_fromRGB: extern func (UInt8, UInt8, UInt8)

sfImage_CreateFromColor: extern func (UInt, UInt, Color)
sfImage_CreateFromPixels: extern func (UInt, UInt, UInt8)
sfImage_CreateFromFile: extern func (String)
sfImage_CreateFromMemory: extern func (String, SizeT)
sfImage_Destroy: extern func (Image)
sfImage_SaveToFile: extern func (Image, String) -> Bool
sfImage_CreateMaskFromColor: extern func (Image, Color, IntRect)
sfImage_Copy: extern func (Image, Image, UInt, UInt, IntRect)
sfImage_CopyScreen: extern func (Image, RenderWindow, IntRect) -> Bool
sfImage_SetPixel: extern func (Image, UInt, UInt, Color)
sfImage_GetPixel: extern func (Image, UInt, UInt) -> Color

sfSprite_Create: extern func ()
sfSprite_Destroy: extern func (Sprite)
sfSprite_SetImage: extern func (Sprite, Image)
sfSprite_GetSubRect: extern func (Sprite) -> IntRect
sfSprite_Move: extern func (Sprite, Float, Float)
sfSprite_GetX: extern func (Sprite) -> Float
sfSprite_GetY: extern func (Sprite) -> Float
sfSprite_GetCenterX: extern func (Sprite) -> Float
sfSprite_GetCenterY: extern func (Sprite) -> Float
sfSprite_GetWidth: extern func (Sprite) -> Float
sfSprite_GetHeight: extern func (Sprite) -> Float
