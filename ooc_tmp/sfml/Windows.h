/* sfml.Windows header file, generated with ooc */
#ifndef __sfml_Windows__
#define __sfml_Windows__

#include <mango/mangoobject.h>
#include <SFML/Window.h>

#include <ooclib.h>

typedef sfVideoMode VideoMode;
typedef sfWindowSettings WindowSettings;

VideoMode VideoMode_new_with_bpp(UInt width, UInt height, UInt bitsPerPixel);
VideoMode VideoMode_new(UInt width, UInt height);
VideoMode VideoMode_getDesktopMode();
VideoMode VideoMode_getMode(SizeT size);
SizeT VideoMode_getModesCount();
WindowSettings WindowSettings_new(ULong depthBits, ULong stencilBits, ULong antialiasingLevel);
WindowSettings WindowSettings_new_default();

#endif // __sfml_Windows__

