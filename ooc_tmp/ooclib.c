/* ooclib source file, generated with ooc */
#include "ooclib.h"
Int String_length(String this)
{
	return strlen(this);
}


void println(String str)
{
	printf("%s\n", str);
}

void println_empty()
{
	printf("\n");
}

Pointer gc_malloc(SizeT size)
{
	return GC_malloc(size);
}

Pointer gc_realloc(Pointer ptr, SizeT size)
{
	return GC_realloc(ptr, size);
}

Pointer gc_calloc(SizeT nmemb, SizeT size)
{
	return GC_malloc(nmemb * size);
}

