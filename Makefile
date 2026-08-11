CXX := g++
CXXFLAGS := -Wall -Wextra

TARGET := bin/flowvia
APPDIR := build/Flowvia.AppDir
LINUXDEPLOY := build/tools/linuxdeploy-x86_64.AppImage

.PHONY: all bin appimage clean

all: bin

bin:
	mkdir -p bin
	$(CXX) $(CXXFLAGS) src/main.cpp -o $(TARGET)

appimage: bin
	rm -rf $(APPDIR)
	mkdir -p $(APPDIR)/usr/bin
	cp $(TARGET) $(APPDIR)/usr/bin/flowvia
	chmod +x $(APPDIR)/usr/bin/flowvia
	ln -sf usr/bin/flowvia $(APPDIR)/AppRun
	$(LINUXDEPLOY) --appdir $(APPDIR) --output appimage

clean:
	rm -rf build/bin $(APPDIR) dist