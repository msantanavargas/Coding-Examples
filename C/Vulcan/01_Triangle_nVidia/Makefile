CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

MyTriangle: ./src/main.cpp
	g++ $(CFLAGS) -o ./bin/MyTriangle ./src/main.cpp $(LDFLAGS)
.PHONY: test clean

test: MyTriangle
	mangohud ./bin/MyTriangle

clean:
	rm -f ./bin/MyTriangle
