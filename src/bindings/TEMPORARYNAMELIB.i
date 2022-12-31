%module TEMPORARYNAME
%{
/* Includes the header in the wrapper code */
#include "../include/TEMPORARYNAME.h"
#include "../include/vulkan_interface.hpp"
%}

/* Parse the header file to generate wrappers */
%include "../include/TEMPORARYNAME.h"
%include "../include/vulkan_interface.hpp"