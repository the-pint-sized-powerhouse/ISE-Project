# ISE Project

This document (the brief) can also be read on the GitHub Repository that I have linked below.
URL: https://github.com/the-pint-sized-powerhouse/ISE-Project

## Overview

I have designed a reproducible operating system based on NixOS. NixOS is an open-source Linux distribution which utilises the Nix package manager. It uses an immutable design and has an atomic update model. All programs, services and system configurations must be declared in the Nix coding language. I designed my OS with productivity in mind, while also putting great consideration into the aesthetics and the ease of use of the user-interface. I utilised the home-manager module for NixOS to declaratively manage my user-environment.

## Reason for project

This project began as a consequence of my issues with modern Windows. Microsoft’s abandonment of the simplicity of older verisons of Windows aswell as the pre-installed bloatware and spyware, which Microsoft uses to collect user data, led to me becoming extremely unhappy the user experience. So I began to research alternatives to Windows in March of 2016.
I discovered light-weight Linux Distributions. These distributions are designed to utilise minimal amounts of storage, while remaining powerful and flexible. I settled on Gentoo, which is a source based Linux distribution wtih the user build having to build all of their software from source. The complime times soon began to become a burden so I would end up abandoning it.
Upon discovering NixOS I discovered it met all expectations. NixOS, which is incredibly light-weight (it runs on 1gb of RAM despite all of my customisations), also has a declarative package manager, which allows me to manage my software and dependencies with ease while allowing for the reproducibility of my system.

# Benefits of NixOS

NixOS’ main selling-point is its fully declarative system-configuration. Your entire system-configuration is placed within a Nix Flake. This file (flake.nix in the repository) is responsible for all inputs and outputs of the system. For instance the Nix Packages repository is inputted by the Flake, it is then given the variable nixpkgs as well as being assigned certain attributes, nixpkgs can now be utilised all throughout the file tree declaratively. All input versions are then automatically locked in the flake.lock file so that there versions do not change unless updated, this ensure that no software breaks due to unexpected or unintentional updates.

# Design philosophy

Due to my interest in UNIX based operating systems I decided to employ the UNIX Design Philosophy as defined by Ken Thompson and documented by Doug McIlroy in the Bell System Technical Journal in 1978. The modularisation of my files ensured that editing and maintaining my code would be easy due to its well structured layout in separate files. Each nix file is designed to do one thing, as simply and efficiently as possible. My code is also easily testable due to the modularisation of my file tree resulting in the isolation of error messages to individual files.

# Hyprland

In order to improve my productivity, I implimented a dynamic tiling compositor (DTC) to my configuration. A DTC automatically resizes any windows on the screen, ensuring that windows never overlap. They also allow for the creation of workspaces which are used to keep applications open on a virtual desktop. The DTC I decided to use is Hyprland by Vaxry. Hyprland while also being reasonably light-weight and open-source, also contains many aesthetic options which can be applied using a nix wrapper, such as;

- The option to make window backgrounds opaque
- Animations when changing workspace and moving windows
- Coloured window borders
- Collapsible scratch-pads which can be used to create a floating window for applications that are regularly used alongside other programs.
- And countless other features.

# Home-manager and Stylix

Home-manager is a module which can be inputted into the Nix Flake, it can then be used to declaratively configure the user environment using nix wrappers. Some examples of my uses of Home-Manager are;
- My creation of the UI, such as the desktop shell
- Customisation of 35 apps, including my terminal emulator, git settings, my browser and many others
- Managing user settings such as my username and networking settings
The Stylix module for Home-Manager is used to automatically customise the colours of all my applications so that they follow any Base16 colour scheme chosen. This means that all of the UI elements and applications seem to be completely integrated into the user-experience.

# Conclusion

I’m most proud of my declerative configuration of NeoVim using the NixVim module for Home-Manager. NixVim allowed me to configure Neovim, including all of its plugins, keymaps and settings, through the use of nix code. I have succesfully created a fully-functional IDE within the terminal. This includes code completion using LSPs, a working sidebar file-browser, a markdown environment and several other features which can be explored in the “modules/nixvim/” folder of the repository.
