#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include "hello_world.h"

void hello(char *buffer, const char *name)
{
    if (name == NULL)
    {
        // Copies the string to buffer
        strcpy(buffer, "Hello, World!");
    }
    else
    {
        // sends formatted output to buffer
        sprintf(buffer, "Hello, %s!", name);
    }
}
