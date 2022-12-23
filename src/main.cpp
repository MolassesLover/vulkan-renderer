#include "include/TEMPORARYNAME.h"
#include "include/vulkan_interface.hpp"

int main() {
    std::cout << "Running TEMPORARYNAME!" << '\n';

    VulkanApplication app;

    try {
        app.run();
    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}