include SFML/Graphics
include SFML/Graphics/Glyph
include SFML/Graphics/Font

sfUint8: extern cover
sfUint32: extern cover
sfBool: extern cover
sfIntRect: extern cover
sfFloatRect: extern cover
sfKeyCode: extern cover
sfMouseButton: extern cover
sfEvent: extern cover
sfJoyAxis: extern cover
sfWindowHandle: extern cover
sfBlendMode: extern cover
Clock:  cover from sfClock* {
    new: extern(sfClock_Create) static func -> Clock
    destroy: extern(sfClock_Destroy) func
    getTime: extern(sfClock_GetTime) func -> Float
    reset: extern(sfClock_Reset) func
}
Color:  cover from sfColor {
    new: extern(sfColor_FromRGB) static func ~rGB (r: sfUint8, g: sfUint8, b: sfUint8) -> Color
    new: extern(sfColor_FromRGBA) static func ~rGBA (r: sfUint8, g: sfUint8, b: sfUint8, a: sfUint8) -> Color
    add: extern(sfColor_Add) func (color2: Color) -> Color
    modulate: extern(sfColor_Modulate) func (color2: Color) -> Color
}
Context:  cover from sfContext* {
    new: extern(sfContext_Create) static func -> Context
    destroy: extern(sfContext_Destroy) func
    setActive: extern(sfContext_SetActive) func (active: sfBool)
}
Font:  cover from sfFont*
FloatRect:  cover from sfFloatRect* {
    offset: extern(sfFloatRect_Offset) func (offsetX: Float, offsetY: Float)
    contains: extern(sfFloatRect_Contains) func (x: Float, y: Float) -> sfBool
    intersects: extern(sfFloatRect_Intersects) func (rect2: FloatRect, overlappingRect: FloatRect) -> sfBool
}
Glyph:  cover from sfGlyph*
Image:  cover from sfImage* {
    new: extern(sfImage_Create) static func -> Image
    new: extern(sfImage_CreateFromColor) static func ~fromColor (width: UInt, height: UInt, color: Color) -> Image
    new: extern(sfImage_CreateFromPixels) static func ~fromPixels (width: UInt, height: UInt, data: sfUint8*) -> Image
    new: extern(sfImage_CreateFromFile) static func ~fromFile (filename: Char*) -> Image
    new: extern(sfImage_CreateFromMemory) static func ~fromMemory (data: Char*, sizeInBytes: SizeT) -> Image
    destroy: extern(sfImage_Destroy) func
    saveToFile: extern(sfImage_SaveToFile) func (filename: Char*) -> sfBool
    createMaskFromColor: extern(sfImage_CreateMaskFromColor) func (colorKey: Color, alpha: sfUint8)
    copy: extern(sfImage_Copy) func (source: Image, destX: UInt, destY: UInt, sourceRect: sfIntRect)
    copyScreen: extern(sfImage_CopyScreen) func (window: RenderWindow, sourceRect: sfIntRect) -> sfBool
    setPixel: extern(sfImage_SetPixel) func (x: UInt, y: UInt, color: Color)
    getPixel: extern(sfImage_GetPixel) func (x: UInt, y: UInt) -> Color
    getPixelsPtr: extern(sfImage_GetPixelsPtr) func -> sfUint8*
    bind: extern(sfImage_Bind) func
    setSmooth: extern(sfImage_SetSmooth) func (smooth: sfBool)
    getWidth: extern(sfImage_GetWidth) func -> UInt
    getHeight: extern(sfImage_GetHeight) func -> UInt
    isSmooth: extern(sfImage_IsSmooth) func -> sfBool
}
IntRect:  cover from sfIntRect* {
    offset: extern(sfIntRect_Offset) func (offsetX: Int, offsetY: Int)
    contains: extern(sfIntRect_Contains) func (x: Int, y: Int) -> sfBool
    intersects: extern(sfIntRect_Intersects) func (rect2: IntRect, overlappingRect: IntRect) -> sfBool
}
Input:  cover from sfInput* {
    isKeyDown: extern(sfInput_IsKeyDown) func (keyCode: sfKeyCode) -> sfBool
    isMouseButtonDown: extern(sfInput_IsMouseButtonDown) func (button: sfMouseButton) -> sfBool
    isJoystickButtonDown: extern(sfInput_IsJoystickButtonDown) func (joyId: UInt, button: UInt) -> sfBool
    getMouseX: extern(sfInput_GetMouseX) func -> Int
    getMouseY: extern(sfInput_GetMouseY) func -> Int
    getJoystickAxis: extern(sfInput_GetJoystickAxis) func (joyId: UInt, axis: sfJoyAxis) -> Float
}
Mutex:  cover from sfMutex* {
    new: extern(sfMutex_Create) static func -> Mutex
    destroy: extern(sfMutex_Destroy) func
    lock: extern(sfMutex_Lock) func
    unlock: extern(sfMutex_Unlock) func
}
PostFX:  cover from sfPostFX* {
    new: extern(sfPostFX_CreateFromFile) static func ~fromFile (filename: Char*) -> PostFX
    new: extern(sfPostFX_CreateFromMemory) static func ~fromMemory (effect: Char*) -> PostFX
    destroy: extern(sfPostFX_Destroy) func
    setParameter1: extern(sfPostFX_SetParameter1) func (name: Char*, x: Float)
    setParameter2: extern(sfPostFX_SetParameter2) func (name: Char*, x: Float, y: Float)
    setParameter3: extern(sfPostFX_SetParameter3) func (name: Char*, x: Float, y: Float, z: Float)
    setParameter4: extern(sfPostFX_SetParameter4) func (name: Char*, x: Float, y: Float, z: Float, w: Float)
    setTexture: extern(sfPostFX_SetTexture) func (name: Char*, texture: Image)
    canUsePostFX: extern(sfPostFX_CanUsePostFX) static func -> sfBool
}
/*Random:  cover from sfRandom* {
    setSeed: extern(sfRandom_SetSeed) static func (seed: UInt)
    getSeed: extern(sfRandom_GetSeed) static func -> UInt
    float: extern(sfRandom_Float) static func (begin: Float, end: Float) -> Float
    int: extern(sfRandom_Int) static func (begin: Int, end: Int) -> Int
}*/
RenderWindow:  cover from sfRenderWindow* {
    new: extern(sfRenderWindow_Create) static func (mode: VideoMode, title: Char*, style: ULong, params: WindowSettings) -> RenderWindow
    new: extern(sfRenderWindow_CreateFromHandle) static func ~fromHandle (handle: sfWindowHandle, params: WindowSettings) -> RenderWindow
    destroy: extern(sfRenderWindow_Destroy) func
    close: extern(sfRenderWindow_Close) func
    isOpened: extern(sfRenderWindow_IsOpened) func -> sfBool
    getWidth: extern(sfRenderWindow_GetWidth) func -> UInt
    getHeight: extern(sfRenderWindow_GetHeight) func -> UInt
    getSettings: extern(sfRenderWindow_GetSettings) func -> WindowSettings
    getEvent: extern(sfRenderWindow_GetEvent) func (event: sfEvent*) -> sfBool
    useVerticalSync: extern(sfRenderWindow_UseVerticalSync) func (enabled: sfBool)
    showMouseCursor: extern(sfRenderWindow_ShowMouseCursor) func (show: sfBool)
    setCursorPosition: extern(sfRenderWindow_SetCursorPosition) func (left: UInt, top: UInt)
    setPosition: extern(sfRenderWindow_SetPosition) func (left: Int, top: Int)
    setSize: extern(sfRenderWindow_SetSize) func (width: UInt, height: UInt)
    show: extern(sfRenderWindow_Show) func (state: sfBool)
    enableKeyRepeat: extern(sfRenderWindow_EnableKeyRepeat) func (enabled: sfBool)
    setIcon: extern(sfRenderWindow_SetIcon) func (width: UInt, height: UInt, pixels: sfUint8*)
    setActive: extern(sfRenderWindow_SetActive) func (active: sfBool) -> sfBool
    display: extern(sfRenderWindow_Display) func
    getInput: extern(sfRenderWindow_GetInput) func -> Input
    setFramerateLimit: extern(sfRenderWindow_SetFramerateLimit) func (limit: UInt)
    getFrameTime: extern(sfRenderWindow_GetFrameTime) func -> Float
    setJoystickThreshold: extern(sfRenderWindow_SetJoystickThreshold) func (threshold: Float)
    drawPostFX: extern(sfRenderWindow_DrawPostFX) func (postFX: PostFX)
    drawSprite: extern(sfRenderWindow_DrawSprite) func (sprite: Sprite)
    drawShape: extern(sfRenderWindow_DrawShape) func (shape: Shape)
    drawString: extern(sfRenderWindow_DrawString) func (string: String)
    capture: extern(sfRenderWindow_Capture) func -> Image
    clear: extern(sfRenderWindow_Clear) func (color: Color)
    setView: extern(sfRenderWindow_SetView) func (view: View)
    getView: extern(sfRenderWindow_GetView) func -> View
    getDefaultView: extern(sfRenderWindow_GetDefaultView) func -> View
    convertCoords: extern(sfRenderWindow_ConvertCoords) func (windowX: UInt, windowY: UInt, viewX: Float*, viewY: Float*, targetView: View)
    preserveOpenGLStates: extern(sfRenderWindow_PreserveOpenGLStates) func (preserve: sfBool)
}
Shape:  cover from sfShape* {
    new: extern(sfShape_Create) static func -> Shape
    new: extern(sfShape_CreateLine) static func ~line (p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, thickness: Float, col: Color, outline: Float, outlineCol: Color) -> Shape
    new: extern(sfShape_CreateRectangle) static func ~rectangle (p1X: Float, p1Y: Float, p2X: Float, p2Y: Float, col: Color, outline: Float, outlineCol: Color) -> Shape
    new: extern(sfShape_CreateCircle) static func ~circle (x: Float, y: Float, radius: Float, col: Color, outline: Float, outlineCol: Color) -> Shape
    destroy: extern(sfShape_Destroy) func
    setX: extern(sfShape_SetX) func (x: Float)
    setY: extern(sfShape_SetY) func (y: Float)
    setPosition: extern(sfShape_SetPosition) func (x: Float, y: Float)
    setScaleX: extern(sfShape_SetScaleX) func (scale: Float)
    setScaleY: extern(sfShape_SetScaleY) func (scale: Float)
    setScale: extern(sfShape_SetScale) func (scaleX: Float, scaleY: Float)
    setRotation: extern(sfShape_SetRotation) func (rotation: Float)
    setCenter: extern(sfShape_SetCenter) func (x: Float, y: Float)
    setColor: extern(sfShape_SetColor) func (color: Color)
    setBlendMode: extern(sfShape_SetBlendMode) func (mode: sfBlendMode)
    getX: extern(sfShape_GetX) func -> Float
    getY: extern(sfShape_GetY) func -> Float
    getScaleX: extern(sfShape_GetScaleX) func -> Float
    getScaleY: extern(sfShape_GetScaleY) func -> Float
    getRotation: extern(sfShape_GetRotation) func -> Float
    getCenterX: extern(sfShape_GetCenterX) func -> Float
    getCenterY: extern(sfShape_GetCenterY) func -> Float
    getColor: extern(sfShape_GetColor) func -> Color
    getBlendMode: extern(sfShape_GetBlendMode) func -> sfBlendMode
    move: extern(sfShape_Move) func (offsetX: Float, offsetY: Float)
    scale: extern(sfShape_Scale) func (factorX: Float, factorY: Float)
    rotate: extern(sfShape_Rotate) func (angle: Float)
    transformToLocal: extern(sfShape_TransformToLocal) func (pointX: Float, pointY: Float, x: Float*, y: Float*)
    transformToGlobal: extern(sfShape_TransformToGlobal) func (pointX: Float, pointY: Float, x: Float*, y: Float*)
    addPoint: extern(sfShape_AddPoint) func (x: Float, y: Float, col: Color, outlineCol: Color)
    enableFill: extern(sfShape_EnableFill) func (enable: sfBool)
    enableOutline: extern(sfShape_EnableOutline) func (enable: sfBool)
    setOutlineWidth: extern(sfShape_SetOutlineWidth) func (width: Float)
    getOutlineWidth: extern(sfShape_GetOutlineWidth) func -> Float
    getNbPoints: extern(sfShape_GetNbPoints) func -> UInt
    getPointPosition: extern(sfShape_GetPointPosition) func (index: UInt, x: Float*, y: Float*)
    getPointColor: extern(sfShape_GetPointColor) func (index: UInt) -> Color
    getPointOutlineColor: extern(sfShape_GetPointOutlineColor) func (index: UInt) -> Color
    setPointPosition: extern(sfShape_SetPointPosition) func (index: UInt, x: Float, y: Float)
    setPointColor: extern(sfShape_SetPointColor) func (index: UInt, color: Color)
    setPointOutlineColor: extern(sfShape_SetPointOutlineColor) func (index: UInt, color: Color)
}
Sprite:  cover from sfSprite* {
    new: extern(sfSprite_Create) static func -> Sprite
    destroy: extern(sfSprite_Destroy) func
    setX: extern(sfSprite_SetX) func (x: Float)
    setY: extern(sfSprite_SetY) func (y: Float)
    setPosition: extern(sfSprite_SetPosition) func (x: Float, y: Float)
    setScaleX: extern(sfSprite_SetScaleX) func (scale: Float)
    setScaleY: extern(sfSprite_SetScaleY) func (scale: Float)
    setScale: extern(sfSprite_SetScale) func (scaleX: Float, scaleY: Float)
    setRotation: extern(sfSprite_SetRotation) func (rotation: Float)
    setCenter: extern(sfSprite_SetCenter) func (x: Float, y: Float)
    setColor: extern(sfSprite_SetColor) func (color: Color)
    setBlendMode: extern(sfSprite_SetBlendMode) func (mode: sfBlendMode)
    getX: extern(sfSprite_GetX) func -> Float
    getY: extern(sfSprite_GetY) func -> Float
    getScaleX: extern(sfSprite_GetScaleX) func -> Float
    getScaleY: extern(sfSprite_GetScaleY) func -> Float
    getRotation: extern(sfSprite_GetRotation) func -> Float
    getCenterX: extern(sfSprite_GetCenterX) func -> Float
    getCenterY: extern(sfSprite_GetCenterY) func -> Float
    getColor: extern(sfSprite_GetColor) func -> Color
    getBlendMode: extern(sfSprite_GetBlendMode) func -> sfBlendMode
    move: extern(sfSprite_Move) func (offsetX: Float, offsetY: Float)
    scale: extern(sfSprite_Scale) func (factorX: Float, factorY: Float)
    rotate: extern(sfSprite_Rotate) func (angle: Float)
    transformToLocal: extern(sfSprite_TransformToLocal) func (pointX: Float, pointY: Float, x: Float*, y: Float*)
    transformToGlobal: extern(sfSprite_TransformToGlobal) func (pointX: Float, pointY: Float, x: Float*, y: Float*)
    setImage: extern(sfSprite_SetImage) func (image: Image)
    setSubRect: extern(sfSprite_SetSubRect) func (subRect: sfIntRect)
    resize: extern(sfSprite_Resize) func (width: Float, height: Float)
    flipX: extern(sfSprite_FlipX) func (flipped: sfBool)
    flipY: extern(sfSprite_FlipY) func (flipped: sfBool)
    getImage: extern(sfSprite_GetImage) func -> Image
    getSubRect: extern(sfSprite_GetSubRect) func -> sfIntRect
    getWidth: extern(sfSprite_GetWidth) func -> Float
    getHeight: extern(sfSprite_GetHeight) func -> Float
    getPixel: extern(sfSprite_GetPixel) func (x: UInt, y: UInt) -> Color
}
String:  cover from sfString* {
    new: extern(sfString_Create) static func -> String
    destroy: extern(sfString_Destroy) func
    setX: extern(sfString_SetX) func (x: Float)
    setY: extern(sfString_SetY) func (y: Float)
    setPosition: extern(sfString_SetPosition) func (left: Float, top: Float)
    setScaleX: extern(sfString_SetScaleX) func (scale: Float)
    setScaleY: extern(sfString_SetScaleY) func (scale: Float)
    setScale: extern(sfString_SetScale) func (scaleX: Float, scaleY: Float)
    setRotation: extern(sfString_SetRotation) func (rotation: Float)
    setCenter: extern(sfString_SetCenter) func (x: Float, y: Float)
    setColor: extern(sfString_SetColor) func (color: Color)
    setBlendMode: extern(sfString_SetBlendMode) func (mode: sfBlendMode)
    getX: extern(sfString_GetX) func -> Float
    getY: extern(sfString_GetY) func -> Float
    getScaleX: extern(sfString_GetScaleX) func -> Float
    getScaleY: extern(sfString_GetScaleY) func -> Float
    getRotation: extern(sfString_GetRotation) func -> Float
    getCenterX: extern(sfString_GetCenterX) func -> Float
    getCenterY: extern(sfString_GetCenterY) func -> Float
    getColor: extern(sfString_GetColor) func -> Color
    getBlendMode: extern(sfString_GetBlendMode) func -> sfBlendMode
    move: extern(sfString_Move) func (offsetX: Float, offsetY: Float)
    scale: extern(sfString_Scale) func (factorX: Float, factorY: Float)
    rotate: extern(sfString_Rotate) func (angle: Float)
    transformToLocal: extern(sfString_TransformToLocal) func (pointX: Float, pointY: Float, x: Float*, y: Float*)
    transformToGlobal: extern(sfString_TransformToGlobal) func (pointX: Float, pointY: Float, x: Float*, y: Float*)
    setText: extern(sfString_SetText) func (text: Char*)
    setUnicodeText: extern(sfString_SetUnicodeText) func (text: sfUint32*)
    setFont: extern(sfString_SetFont) func (font: Font)
    setSize: extern(sfString_SetSize) func (size: Float)
    setStyle: extern(sfString_SetStyle) func (style: ULong)
    getUnicodeText: extern(sfString_GetUnicodeText) func -> sfUint32*
    getText: extern(sfString_GetText) func -> Char*
    getFont: extern(sfString_GetFont) func -> Font
    getSize: extern(sfString_GetSize) func -> Float
    getStyle: extern(sfString_GetStyle) func -> ULong
    getCharacterPos: extern(sfString_GetCharacterPos) func (index: SizeT, x: Float*, y: Float*)
    getRect: extern(sfString_GetRect) func -> sfFloatRect
}
Thread:  cover from sfThread* {
    new: extern(sfThread_Create) static func (function: Func, userData: Void*) -> Thread
    destroy: extern(sfThread_Destroy) func
    launch: extern(sfThread_Launch) func
    wait: extern(sfThread_Wait) func
    terminate: extern(sfThread_Terminate) func
}
View:  cover from sfView* {
    new: extern(sfView_Create) static func -> View
    new: extern(sfView_CreateFromRect) static func ~fromRect (rect: sfFloatRect) -> View
    destroy: extern(sfView_Destroy) func
    setCenter: extern(sfView_SetCenter) func (x: Float, y: Float)
    setHalfSize: extern(sfView_SetHalfSize) func (halfWidth: Float, halfHeight: Float)
    setFromRect: extern(sfView_SetFromRect) func (viewRect: sfFloatRect)
    getCenterX: extern(sfView_GetCenterX) func -> Float
    getCenterY: extern(sfView_GetCenterY) func -> Float
    getHalfSizeX: extern(sfView_GetHalfSizeX) func -> Float
    getHalfSizeY: extern(sfView_GetHalfSizeY) func -> Float
    getRect: extern(sfView_GetRect) func -> sfFloatRect
    move: extern(sfView_Move) func (offsetX: Float, offsetY: Float)
    zoom: extern(sfView_Zoom) func (factor: Float)
}
VideoMode:  cover from sfVideoMode {
    getDesktopMode: extern(sfVideoMode_GetDesktopMode) static func -> VideoMode
    getMode: extern(sfVideoMode_GetMode) static func (index: SizeT) -> VideoMode
    getModesCount: extern(sfVideoMode_GetModesCount) static func -> SizeT
    isValid: extern(sfVideoMode_IsValid) func -> sfBool
}
Window:  cover from sfWindow* {
    new: extern(sfWindow_Create) static func (mode: VideoMode, title: Char*, style: ULong, params: WindowSettings) -> Window
    new: extern(sfWindow_CreateFromHandle) static func ~fromHandle (handle: sfWindowHandle, params: WindowSettings) -> Window
    destroy: extern(sfWindow_Destroy) func
    close: extern(sfWindow_Close) func
    isOpened: extern(sfWindow_IsOpened) func -> sfBool
    getWidth: extern(sfWindow_GetWidth) func -> UInt
    getHeight: extern(sfWindow_GetHeight) func -> UInt
    getSettings: extern(sfWindow_GetSettings) func -> WindowSettings
    getEvent: extern(sfWindow_GetEvent) func (event: sfEvent*) -> sfBool
    useVerticalSync: extern(sfWindow_UseVerticalSync) func (enabled: sfBool)
    showMouseCursor: extern(sfWindow_ShowMouseCursor) func (show: sfBool)
    setCursorPosition: extern(sfWindow_SetCursorPosition) func (left: UInt, top: UInt)
    setPosition: extern(sfWindow_SetPosition) func (left: Int, top: Int)
    setSize: extern(sfWindow_SetSize) func (width: UInt, height: UInt)
    show: extern(sfWindow_Show) func (state: sfBool)
    enableKeyRepeat: extern(sfWindow_EnableKeyRepeat) func (enabled: sfBool)
    setIcon: extern(sfWindow_SetIcon) func (width: UInt, height: UInt, pixels: sfUint8*)
    setActive: extern(sfWindow_SetActive) func (active: sfBool) -> sfBool
    display: extern(sfWindow_Display) func
    getInput: extern(sfWindow_GetInput) func -> Input
    setFramerateLimit: extern(sfWindow_SetFramerateLimit) func (limit: UInt)
    getFrameTime: extern(sfWindow_GetFrameTime) func -> Float
    setJoystickThreshold: extern(sfWindow_SetJoystickThreshold) func (threshold: Float)
}
WindowSettings:  cover from sfWindowSettings {
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

}

sleep: extern(sfSleep) func (duration: Float)

