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

//sfWindowSettings: extern sfWindowSettings

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

sfVideoMode_GetModesCount: extern func -> SizeT
sfVideoMode_GetDesktopMode: extern func -> VideoMode
sfVideoMode_GetMode: extern func (SizeT) -> VideoMode
