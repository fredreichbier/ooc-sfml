include SFML/Window

//use csfml-window

VideoMode: cover from sfVideoMode {
	
	Width, Height, BitsPerPixel: extern Int
	
    new: func ~with_bpp (width, height, bitsPerPixel: UInt) -> This {
        mode: VideoMode
        mode Width = width
        mode Height = height
        mode BitsPerPixel = bitsPerPixel
        mode
    }

    new: func (width, height: UInt) -> This {
        this(width, height, 32)
    }

    getDesktopMode: static func -> VideoMode {
        return sfVideoMode_GetDesktopMode()
    }

    getMode: static func (size: SizeT) -> VideoMode {
        return sfVideoMode_GetMode(size)
    }

    getModesCount: static func -> SizeT {
        return sfVideoMode_GetModesCount()
    }
	
}

sfVideoMode_GetModesCount: extern func -> SizeT
sfVideoMode_GetDesktopMode: extern func -> VideoMode
sfVideoMode_GetMode: extern func (SizeT) -> VideoMode

WindowSettings: cover from sfWindowSettings {
	
	DepthBits, StencilBits, AntialiasingLevel: extern ULong
	
    new: func (depthBits, stencilBits, antialiasingLevel: ULong) -> This {
        settings: WindowSettings
        settings DepthBits = depthBits
        settings StencilBits = stencilBits
        settings AntialiasingLevel = antialiasingLevel
        settings
    }

    new: func ~default -> This {
        this(24, 8, 0)
    }
}

Event: cover from union sfEvent
/* "we don't need no con-struc-atioooooon" */

JoyButtonEvent: cover from struct sfJoyButtonEvent {
    JoystickId: extern UInt
    Button: extern UInt
}

JoyAxis: cover from sfJoyAxis
/* TODO */

JoyMoveEvent: cover from struct sfJoyMoveEvent {
    JoystickId: extern UInt
    Axis: extern JoyAxis
    Position: extern Float
}

KeyCode: cover from sfKeyCode
/* TODO */

KeyEvent: cover from struct sfKeyEvent {
    Code: extern KeyCode
    Alt, Control, Shift: extern Bool
}

MouseButton: cover from sfMouseButton
/* TODO */

MouseButtonEvent: cover from struct sfMouseButtonEvent {
    Button: extern MouseButton
    X, Y: extern Int
}

MouseMoveEvent: cover from struct sfMouseMoveEvent {
    X, Y: extern Int
}

MouseWheelEvent: cover from struct sfMouseWheelEvent {
    Delta: extern Int
}

SizeEvent: cover from struct sfSizeEvent {
    Width, Height: extern UInt
}

UInt32: cover from sfUint32

TextEvent: cover from struct sfTextEvent {
    Unicode: extern UInt32
}

EventType: class {
    closed: const static Int = 0
    resized: const static Int = 1
    lostFocus: const static Int = 2
    gainedFocus: const static Int = 3
    textEntered: const static Int = 4
    keyPressed: const static Int = 5
    keyReleased: const static Int = 6
    mouseWheelMoved: const static Int = 7
    mouseButtonPressed: const static Int = 8
    mouseButtonReleased: const static Int = 9
    mouseMoved: const static Int = 10 
    mouseEntered: const static Int = 11
    mouseLeft: const static Int = 12
    joyButtonPressed: const static Int = 13
    joyButtonReleased: const static Int = 14
    joyMoved: const static Int = 15
}
