/* sfml.Graphics source file, generated with ooc */
#include "Graphics.h"


static void Style_initialize(Style *this)
{
	this->NONE = 0;
	this->TITLEBAR = 1;
	this->RESIZE = 2;
	this->CLOSE = 4;
	this->FULLSCREEN = 8;
}



static void Style_destroy(Style *this)
{
	{
		const MangoClass * super = ((MangoObject *) this)->class->super;
		if(super) super->destroy((MangoObject *) this);
	}
	
	
}


Style *Style_new()
{
	Style *this = (Style *) mango_object_new(Style_class());
	Style_construct(this);
	return this;
}

void Style_construct(Style * this)
{
}

const MangoClass *Style_class()
{
	static const StyleClass class = 
	{
		{
			.size = sizeof(Style),
			.name = "Style",
			.initialize = (void (*)(MangoObject *))Style_initialize,
			.destroy = (void (*)(MangoObject *))Style_destroy,
		},
	};
	return (const MangoClass *) &class;
}


RenderWindow RenderWindow_new(VideoMode mode, String title, UInt style, WindowSettings params)
{
	return sfRenderWindow_Create(mode, title, style, params);
}


void RenderWindow_destroy(RenderWindow this)
{
	sfWindow_Destroy(this);
}


void RenderWindow_close(RenderWindow this)
{
	sfWindow_Close(this);
}


Bool RenderWindow_isOpened(RenderWindow this)
{
	return sfWindow_IsOpened(this);
}


void RenderWindow_display(RenderWindow this)
{
	sfWindow_Display(this);
}


