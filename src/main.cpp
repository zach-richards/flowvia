// main.cpp

#include <thread>
using namespace std;

#include "../include/tracking/window.hpp"

int main() {
    // initializeCognitiveModel();

    thread windowTrackingThread(window::runWindowTrackingLoop);
    // std::thread inputTrackingThread(tracking::input::runInputTrackingLoop());

    return 0;
}