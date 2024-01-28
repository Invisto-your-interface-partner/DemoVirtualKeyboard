cmake_minimum_required(VERSION 3.16)

project(keyboard VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 ${PROJECT_VERSION} REQUIRED Quick)
#find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS BuildInternals Core) # special case
#find_package(Qt6 ${PROJECT_VERSION} QUIET CONFIG OPTIONAL_COMPONENTS Qml QmlTools Quick) # special case

qt_standard_project_setup()

qt_add_executable(KeyboardDemoApplication
    main.cpp
    
    keyboardhandler.cpp
    keyboardhandler.h
)

qt_add_qml_module(KeyboardDemoApplication
    URI keyboard
    VERSION 1.0
    QML_FILES Main.qml Keyboard.qml
)

target_link_libraries(KeyboardDemoApplication
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS KeyboardDemoApplication
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
