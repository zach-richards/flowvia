#include <string>
#include <vector>
#include <stdexcept>
using namespace std;

#include "window.hpp"

class WindowList {
private:
    vector<Window> windows;

public:
    void addWindow(const Window& window) {
        windows.push_back(window);
    }

    const vector<Window>& getWindows() const {
        return windows;
    }

    Window getWindowByPid(int pid) const {
        for (const auto& window : windows) {
            if (window.getPid() == pid) {
                return window;
            }
        }
        throw std::runtime_error("Window not found");
    }
};