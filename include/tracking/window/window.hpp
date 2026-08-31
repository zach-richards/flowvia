// window.cpp

#include <string>
using namespace std;

class Window {
private:
    int pid;
    string visibleName;
    string className;
public:
    Window(int pid, string visibleName, string className) : pid(pid), visibleName(visibleName), className(className) {}
    int getPid() const { return pid; }
    string getVisibleName() const { return visibleName; }
    string getClassName() const { return className; }
};