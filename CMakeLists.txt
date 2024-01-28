cmake_minimum_required(VERSION 3.16)

project(VirtualKeyboardDemoProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(app
    main.cpp
    keyboardhandler.cpp
    keyboardhandler.h
)

qt_add_qml_module(app
    URI "/"
    VERSION 1.0
    QML_FILES
        Main.qml
        Keyboard.qml
        KeyboardButton.qml
    RESOURCES
        images/backward_icon.svg
        images/captial_icon.svg
        images/keyboard_icon.svg
        images/keyboard_close_icon.png
        images/noun-return.png
        fonts/VAG_Rounded_Regular.ttf

)

target_link_libraries(app
    PRIVATE Qt6::Quick )

install(TARGETS app
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
