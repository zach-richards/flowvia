APP_NAME := flowvia
APPIMAGE := Flowvia-0.1.0-x86_64.AppImage
SRC      := src/main.cpp
BIN_DIR  := bin
CC       := g++

# OS DETECTION
ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
    BINARY := $(BIN_DIR)/$(APP_NAME).exe
    MKDIR  := if not exist $(BIN_DIR) mkdir $(BIN_DIR)
    RM     := rmdir /S /Q
else
    DETECTED_OS := Linux
    BINARY := $(BIN_DIR)/$(APP_NAME)
    MKDIR  := mkdir -p $(BIN_DIR)
    RM     := rm -rf
endif

.PHONY: bin build clean

bin:
	@echo "Building binary for $(DETECTED_OS)..."
	$(MKDIR)
	$(CC) $(SRC) -o $(BINARY)

build: bin
ifeq ($(DETECTED_OS),Linux)
	@echo "Packaging AppImage..."
	cp $(BINARY) build/Flowvia.AppDir/usr/bin/
	wget -N https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -O build/tools/appimagetool
	chmod +x build/tools/appimagetool
	./build/tools/appimagetool build/Flowvia.AppDir dist/$(APPIMAGE)
else
	@echo "AppImage is Linux-only — skipping on $(DETECTED_OS). Binary is at $(BINARY)."
endif

clean:
	$(RM) $(BIN_DIR)