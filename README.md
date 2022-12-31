# Molasses' Vulkan Renderer
[![Ko-Fi](https://img.shields.io/badge/donate-kofi-blue?style=for-the-badge&logo=ko-fi&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://ko-fi.com/molasses)
[![Patreon](https://img.shields.io/badge/donate-patreon-blue?style=for-the-badge&logo=patreon&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://www.patreon.com/molasseslover)

## License
Molasses' Vulkan Renderer is licensed under the terms
of the [MIT license](LICENSE-MIT.md).

## Dependencies
> **Note**: The list of dependencies is currently incomplete, sorry!

| Dependency | [pkgs.org](https://pkgs.org/)                                                                                                                                            | [brew.sh](https://brew.sh/)                                                                                                                                                                              |
|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GLFW       | [![pkgs.org](https://img.shields.io/badge/install-pkgs-blue?style=for-the-badge&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://pkgs.org/search/?q=glfw)       | [![pkgs.org](https://img.shields.io/badge/install-brew-blue?style=for-the-badge&logo=homebrew&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://formulae.brew.sh/formula/glfw#default)           |
| Uncrustify | [![pkgs.org](https://img.shields.io/badge/install-pkgs-blue?style=for-the-badge&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://pkgs.org/search/?q=uncrustify) | [![pkgs.org](https://img.shields.io/badge/install-brew-blue?style=for-the-badge&logo=homebrew&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://formulae.brew.sh/formula/uncrustify#default)     |
| Vulkan     | [![pkgs.org](https://img.shields.io/badge/install-pkgs-blue?style=for-the-badge&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://pkgs.org/search/?q=vulkann)    | [![pkgs.org](https://img.shields.io/badge/install-brew-blue?style=for-the-badge&logo=homebrew&color=E35B57&logoColor=FFFFFF&labelColor=232323)](https://formulae.brew.sh/formula/vulkan-headers#default) |

## Building

From the project root directory, you can use CMake to build.

```sh
➜ cmake -B bin -DCMAKE_BUILD_TYPE=Release
➜ cmake --build bin -j$(nproc)
```

> **Note**: If you are unfamiliar with `$(nproc)`; it is a command that prints out
how many processing units are available. With the `-j` flag we tell CMake 
to create jobs equal to the number provided by `$(nproc)`. If you are on XNU/macOS,
 `$(nproc)` is not available. You should use `$(sysctl -n hw.physicalcpu)` instead!

Once CMake finishes, the binaries should be available in the directory
equal to CMake's `-B` flag. In the case of the example commands, that should be
in the `bin` directory. 
