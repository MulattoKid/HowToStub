all: linux mac

linux:
	gcc -I./ -shared -o lib/libmessage.so message.c
	gcc -I./ -shared -o stub_lib/libmessage.so stub_message.c
	gcc -I./ -L./stub_lib -lmessage -o main main.c

mac:
	gcc -I./ -dynamiclib -o lib/libmessage.dylib message.c
	gcc -I./ -dynamiclib -o stub_lib/libmessage.dylib stub_message.c
	gcc -I./ -L./stub_lib -lmessage -o main main.c