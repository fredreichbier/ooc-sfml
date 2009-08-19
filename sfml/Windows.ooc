include SFML/Window;

//use csfml-window;

sfVideoMode: extern sfVideoMode;

VideoMode: cover from sfVideoMode {
    new: func(Width, Height, BitsPerPixel: UInt) -> This{
        mode: VideoMode
        mode Width = Width;
        mode Height = Height;
        mode BitsPerPixel = BitsPerPixel;
        mode
    }

    new: func(Width, Height: UInt) -> This{
        mode: VideoMode
        mode Width = Width;
        mode Height = Height;
        mode BitsPerPixel = 32;
        mode
    }

    getDesktopMode: static func -> VideoMode {
        return new VideoMode(sfVideoMode_GetDesktopMode());
    }

    getMode: static func(size: SizeT) -> VideoMode {
        return new VideoMode(sfVideoMode_GetMode(size));
    }

    getModesCount: static func -> Size {
        return sfVideoMode_GetModesCount();
    }
}

sfWindowSettings: extern sfWindowSettings;

WindowSettings: cover from sfWindowSettings {
    new: func(depthBits, stencilBits, antialiasingLevel: ULong) -> This {
        settings: WindowSettings
        settings DepthBits = depthBits;
        settings StencilBits = stencilBits;
        settings AntialiasingLevel = antialiasingLevel;
        settings
    }

    new: func -> This {
        this(24, 8, 0);
    }
}

