cmake_minimum_required(VERSION 3.5)

project(Architectural-Template-Qt-QML
    VERSION 0.1
    DESCRIPTION "An example architectural template for a multi-page GUI application using Qt/QML"
    HOMEPAGE_URL "https://github.com/STyulenev/Architectural-Template-Qt-QML"
    LANGUAGES CXX
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick LinguistTools REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick LinguistTools REQUIRED)

include(cmake/TranslationUtils.cmake)
add_app_translations_resource(APP_RES ${QM_FILES})

add_subdirectory(src)
add_subdirectory(tests)

set(PROJECT_SOURCES
    main.cpp

    ${APP_RES}
    resource.qrc
    qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(${PROJECT_NAME}
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
else()
    add_executable(${PROJECT_NAME}
       ${PROJECT_SOURCES}
    )
endif()

list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml")
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml/Styles")
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml/UILibrary")
list(REMOVE_DUPLICATES QML_DIRS)
set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "QML import paths")

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick

    ATQQ::Core-lib
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)
