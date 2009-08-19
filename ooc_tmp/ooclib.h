/* ooclib header file, generated with ooc */
#ifndef __ooclib__
#define __ooclib__

#include <mango/mangoobject.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <memory.h>
#include <gc/gc.h>
#include <string.h>


typedef char Char;
typedef Char *String;
typedef int Int;
typedef void *Pointer;
typedef unsigned int UInt;
typedef float Float;
typedef double Double;
typedef long double LDouble;
typedef short Short;
typedef long Long;
typedef unsigned long ULong;
typedef long long LLong;
typedef void Void;
typedef bool Bool;
typedef size_t SizeT;
typedef uint8_t Octet;

Int String_length(String this);
void println(String str);
void println_empty();
Pointer gc_malloc(SizeT size);
Pointer gc_realloc(Pointer ptr, SizeT size);
Pointer gc_calloc(SizeT nmemb, SizeT size);

#endif // __ooclib__

