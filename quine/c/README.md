quine.c is a C program that when compiled and run prints out its own source code.
```
$ gcc quine.c
$ ./a.out
#include <stdio.h>
int main(){
char*s="#include <stdio.h>%cint main(){%cchar*s=%c%s%c;%cprintf(s,10,10,34,s,34,10);return 0;}";
printf(s,10,10,34,s,34,10);return 0;}
```
To confirm that the output is the same as quine.c
```
$ ./a.out | diff quine.c -
$
```
