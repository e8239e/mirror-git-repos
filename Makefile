CC = zig cc
CXX = zig c++
CFLAGS = -target x86_64-linux-musl -flto -O3 -std=c++20 -pedantic -Wall -Werror -static -pie -pipe
CXXFLAGS = $(CFLAGS)

all: build
build: mirror-git-repos

clean:
	rm -f *.o mirror-git-repos

test: build
	./test.sh
