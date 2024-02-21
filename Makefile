DEFINES =	-DSYS5  -DBSD_SELECT -DHAS_UNISTD  -DHAS_STDLIB -DHAS_CTYPE -DHAS_SYS_IOCTL -DHAS_SYS_WAIT -DHAS_NCURSES -DHAS_UNISTD -DHAS_STDARG -DHAS_STDLIB -DHAS_SYS_WAIT -DSLCT_HDR

CFLAGS =	-Ofast -march=native -mtune=native -flto -fcommon

LDFLAGS =	-Wl,--allow-multiple-definition -s -fuse-ld=lld

main : aee

install :
	@./install-sh

uninstall :
	@./uninstall-sh

clean :
	rm -f *.o aee

all :	curses

CC = clang

OBJS = aee.o control.o format.o localize.o srch_rep.o delete.o mark.o motion.o keys.o help.o windows.o journal.o file.o

.c.o: 
	$(CC) $(DEFINES) -c $*.c $(CFLAGS)

aee :	$(OBJS)
	$(CC) -o aee $(OBJS) $(CFLAGS) $(LDFLAGS) -lncursesw 

# new_curse doesn't build with new build system, it is deprecated

aee.o: aee.c aee.h new_curse.h aee_version.h
control.o: control.c aee.h new_curse.h 
delete.o: delete.c aee.h new_curse.h 
format.o: format.c aee.h new_curse.h 
help.o: help.c aee.h new_curse.h 
journal.o: journal.c aee.h new_curse.h 
windows.o: windows.c aee.h new_curse.h 
file.o: file.c aee.h new_curse.h 
keys.o: keys.c aee.h new_curse.h 
localize.o: localize.c aee.h new_curse.h 
mark.o: mark.c aee.h new_curse.h 
motion.o: motion.c aee.h new_curse.h 
new_curse.o: new_curse.c aee.h new_curse.h 
srch_rep.o: srch_rep.c aee.h new_curse.h 
xif.o: xif.c aee.h new_curse.h 
new_curse.o: new_curse.c new_curse.h
