/* sfml.Graphics header file, generated with ooc */
#ifndef __sfml_Graphics__
#define __sfml_Graphics__

#include <mango/mangoobject.h>
#include <SFML/Graphics.h>

#include <ooclib.h>
#include <sfml/Windows.h>

typedef struct _Style Style;
typedef struct _StyleClass StyleClass;
typedef sfRenderWindow *RenderWindow;

struct _Style
{
	MangoObject super;
	UInt NONE, TITLEBAR, RESIZE, CLOSE, FULLSCREEN;
};


struct _StyleClass
{
	MangoClass super;
};


const MangoClass *Style_class();

Style *Style_new();
void Style_construct(Style * this);

RenderWindow RenderWindow_new(VideoMode mode, String title, UInt style, WindowSettings params);
void RenderWindow_destroy(RenderWindow this);
void RenderWindow_close(RenderWindow this);
Bool RenderWindow_isOpened(RenderWindow this);
void RenderWindow_display(RenderWindow this);

#endif // __sfml_Graphics__

