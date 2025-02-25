INC_DIR = /usr/include/stb
CFLAGS = -std=c++17 -O2 -I$(INC_DIR)
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: ./src/main.cpp
	g++ $(CFLAGS) -o ./bin/VulkanTest ./src/main.cpp $(LDFLAGS)
.PHONY: test clean

test: VulkanTest
	./bin/VulkanTest

clean:
	rm -f ./bin/VulkanTest
