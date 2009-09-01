include SFML/Window

use csfml-window

VideoMode: cover from sfVideoMode {
	
	width: extern(Width) UInt
	height: extern(Height) UInt
	bitsPerPixel: extern(BitsPerPixel) UInt
	
    new: static func ~with_bpp (.width, .height, .bitsPerPixel) -> This {
        mode: VideoMode
        mode width = width
        mode height = height
        mode bitsPerPixel = bitsPerPixel
        return mode
    }

    new: static func (.width, .height) -> This {
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
	
	depthBits : extern(DepthBits) ULong
	stencilBits : extern(StencilBits) ULong
	antialiasingLevel : extern(AntialiasingLevel) ULong
	
    new: static func (.depthBits, .stencilBits, .antialiasingLevel) -> This {
        settings: WindowSettings
        settings depthBits = depthBits
        settings stencilBits = stencilBits
        settings antialiasingLevel = antialiasingLevel
        settings
    }

    new: static func ~default -> This {
        this(24, 8, 0)
    }
}

Event: cover from sfEvent {
    type: extern(Type) Int
}

JoyButtonEvent: cover from struct sfJoyButtonEvent {
    type: extern(Type) Int
	joystickId: extern(JoystickId) UInt
	button: extern(Button) UInt
}

JoyAxis: cover from sfJoyAxis
/* TODO */

JoyMoveEvent: cover from struct sfJoyMoveEvent {
    type: extern(Type) Int
	joystickId: extern(JoystickId) UInt
	axis: extern(Axis) JoyAxis
	position: extern(Position) Float
}

KeyCode: cover from sfKeyCode
/* TODO */

KeyEvent: cover from struct sfKeyEvent {
    type: extern(Type) Int
    code: extern(Code) KeyCode
	alt: extern(Alt) Bool
	control: extern(Control) Bool
	shift: extern(Shift) Bool
}

MouseButton: cover from sfMouseButton
/* TODO */

MouseButtonEvent: cover from struct sfMouseButtonEvent {
    type: extern(Type) Int
    button: extern(Button) MouseButton
    x: extern(X) Int
	y: extern(Y) Int
}

MouseMoveEvent: cover from struct sfMouseMoveEvent {
    type: extern(Type) Int
	x: extern(X) Int
	y: extern(Y) Int
}

MouseWheelEvent: cover from struct sfMouseWheelEvent {
    type: extern(Type) Int
    delta: extern(Delta) Int
}

SizeEvent: cover from struct sfSizeEvent {
    type: extern(Type) Int
	width: extern(Width) UInt
	height: extern(Height) UInt
}

UInt32: cover from sfUint32

TextEvent: cover from struct sfTextEvent {
    type: extern(Type) Int
    unicode: extern(Unicode) UInt32
}

EventType: class {
    closed = 0,
    resized = 1,
	lostFocus = 2,
	gainedFocus = 3,
	textEntered = 4,
    keyPressed = 5,
	keyReleased = 6,
    mouseWheelMoved = 7,
	mouseButtonPressed = 8,
    mouseButtonReleased = 9,
	mouseMoved = 10,
    mouseEntered = 11,
    mouseLeft = 12,
    joyButtonPressed = 13,
    joyButtonReleased = 14,
    joyMoved = 15 : const static Int
}
