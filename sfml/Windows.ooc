include SFML/Window;

use csfml-window;

ctype sfVideoMode;
typedef sfVideoMode SfVideoMode;

class VideoMode {
    SfVideoMode videoMode;

    func new(=videoMode);

    func new(UInt Width, UInt Height, UInt BitsPerPixel) {
        this.videoMode.Width = Width;
        this.videoMode.Height = Height;
        this.videoMode.BitsPerPixel = BitsPerPixel;
    }

    func new(UInt Width, UInt Height) {
        this.videoMode.Width = Width;
        this.videoMode.Height = Height;
        this.videoMode.BitsPerPixel = 32;
    }

    static func getDesktopMode -> VideoMode {
        return new VideoMode(sfVideoMode_GetDesktopMode());
    }

    static func getMode(Size size) -> VideoMode {
        return new VideoMode(sfVideoMode_GetMode(size));
    }

    static func getModesCount -> Size {
        return sfVideoMode_GetModesCount();
    }
}

ctype sfWindowSettings;
typedef sfWindowSettings SfWindowSettings;

class WindowSettings {
    SfWindowSettings windowSettings;

    func new(UInt depthBits, UInt stencilBits, UInt antialiasingLevel) {
        this.windowSettings.DepthBits = depthBits;
        this.windowSettings.StencilBits = stencilBits;
        this.windowSettings.AntialiasingLevel = antialiasingLevel;
    }

    func new {
        this(24, 8, 0);
    }
}

