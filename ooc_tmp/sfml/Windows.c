/* sfml.Windows source file, generated with ooc */
#include "Windows.h"
VideoMode VideoMode_new_with_bpp(UInt width, UInt height, UInt bitsPerPixel)
{
	VideoMode mode;
	mode.Width = width;
	mode.Height = height;
	mode.BitsPerPixel = bitsPerPixel;
	return mode;
}


VideoMode VideoMode_new(UInt width, UInt height)
{
	return VideoMode_construct_with_bpp(width, height, 32);
}


VideoMode VideoMode_getDesktopMode()
{
	return sfVideoMode_GetDesktopMode();
}


VideoMode VideoMode_getMode(SizeT size)
{
	return sfVideoMode_GetMode(size);
}


SizeT VideoMode_getModesCount()
{
	return sfVideoMode_GetModesCount();
}


WindowSettings WindowSettings_new(ULong depthBits, ULong stencilBits, ULong antialiasingLevel)
{
	WindowSettings settings;
	settings.DepthBits = depthBits;
	settings.StencilBits = stencilBits;
	settings.AntialiasingLevel = antialiasingLevel;
	return settings;
}


WindowSettings WindowSettings_new_default()
{
	return WindowSettings_construct(24, 8, 0);
}


