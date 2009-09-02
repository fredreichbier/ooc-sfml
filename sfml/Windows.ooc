include SFML/Window

use csfml-window

UInt32: cover from sfUint32
UInt8: cover from sfUint8
WindowHandle: cover from sfWindowHandle

VideoMode: cover from sfVideoMode {
    width: extern(Width) UInt
	height: extern(Height) UInt
	bitsPerPixel: extern(BitsPerPixel) UInt

    getDesktopMode: extern(sfVideoMode_GetDesktopMode) static func -> VideoMode
    getMode: extern(sfVideoMode_GetMode) static func (index: SizeT) -> VideoMode
    getModesCount: extern(sfVideoMode_GetModesCount) static func -> SizeT
    isValid: extern(sfVideoMode_IsValid) func -> Bool

    new: static func ~with_bpp (.width, .height, .bitsPerPixel) -> This {
        mode: VideoMode
        mode width = width
        mode height = height
        mode bitsPerPixel = bitsPerPixel
        return mode
    }

    new: static func (.width, .height) -> This {
        This new(width, height, 32)
    }
}

Window: cover from sfWindow* {
    new: extern(sfWindow_Create) static func (mode: VideoMode, title: Char*, style: ULong, params: WindowSettings) -> Window
    new: extern(sfWindow_CreateFromHandle) static func ~fromHandle (handle: WindowHandle, params: WindowSettings) -> Window
    destroy: extern(sfWindow_Destroy) func
    close: extern(sfWindow_Close) func
    isOpened: extern(sfWindow_IsOpened) func -> Bool
    getWidth: extern(sfWindow_GetWidth) func -> UInt
    getHeight: extern(sfWindow_GetHeight) func -> UInt
    getSettings: extern(sfWindow_GetSettings) func -> WindowSettings
    getEvent: extern(sfWindow_GetEvent) func (event: Event*) -> Bool
    useVerticalSync: extern(sfWindow_UseVerticalSync) func (enabled: Bool)
    showMouseCursor: extern(sfWindow_ShowMouseCursor) func (show: Bool)
    setCursorPosition: extern(sfWindow_SetCursorPosition) func (left: UInt, top: UInt)
    setPosition: extern(sfWindow_SetPosition) func (left: Int, top: Int)
    setSize: extern(sfWindow_SetSize) func (width: UInt, height: UInt)
    show: extern(sfWindow_Show) func (state: Bool)
    enableKeyRepeat: extern(sfWindow_EnableKeyRepeat) func (enabled: Bool)
    setIcon: extern(sfWindow_SetIcon) func (width: UInt, height: UInt, pixels: UInt8*)
    setActive: extern(sfWindow_SetActive) func (active: Bool) -> Bool
    display: extern(sfWindow_Display) func
    getInput: extern(sfWindow_GetInput) func -> Input
    setFramerateLimit: extern(sfWindow_SetFramerateLimit) func (limit: UInt)
    getFrameTime: extern(sfWindow_GetFrameTime) func -> Float
    setJoystickThreshold: extern(sfWindow_SetJoystickThreshold) func (threshold: Float)
}

Input: cover from sfInput* {
    isKeyDown: extern(sfInput_IsKeyDown) func (keyCode: KeyCode) -> Bool
    isMouseButtonDown: extern(sfInput_IsMouseButtonDown) func (button: MouseButton) -> Bool
    isJoystickButtonDown: extern(sfInput_IsJoystickButtonDown) func (joyId: UInt, button: UInt) -> Bool
    getMouseX: extern(sfInput_GetMouseX) func -> Int
    getMouseY: extern(sfInput_GetMouseY) func -> Int
    getJoystickAxis: extern(sfInput_GetJoystickAxis) func (joyId: UInt, axis: JoyAxis) -> Float
}

WindowSettings: cover from sfWindowSettings {
    depthBits: extern(DepthBits) UInt
    stencilBits: extern(StencilBits) UInt
    antialiasingLevel: extern(AntialiasingLevel) UInt

    new: static func (.depthBits, .stencilBits, .antialiasingLevel) -> This {
        this: WindowSettings
        this depthBits = depthBits
        this stencilBits = stencilBits
        this antialiasingLevel = antialiasingLevel
        this
    }

    new: static func ~default -> This {
        This new(24, 8, 0)
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
    joyMoved = 15 : static const Int
}
