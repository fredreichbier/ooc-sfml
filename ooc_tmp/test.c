/* test source file, generated with ooc */
#include "test.h"
Int main()
{
	VideoMode mode = VideoMode_new_with_bpp(600, 480, 32);
	RenderWindow window = RenderWindow_new(mode, "Hello World!", Style->TITLEBAR, WindowSettings_new_default());
	Bool running = true;
	
	return 0;
}

