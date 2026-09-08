// window.cpp

#include "../../include/tracking/window.hpp"

Window::Window(int pid, string visibleName, string className) : pid(pid), visibleName(visibleName), className(className) {}

int Window::getPid() const { return pid; }
string Window::getVisibleName() const { return visibleName; }
string Window::getClassName() const { return className; }

void runWindowTrackingLoop() {
    unordered_map<int, Window> activeWindows;

    for (const auto& pair : activeWindows) {
        const Window& window = pair.second;
        // Process each window
    }

    return 0;
}

void listWindow(unordered_map<int, Window>& activeWindows) {
    // Implementation for listing windows goes here
}