#pragma once

#include <QGuiApplication>

namespace Core {

class Application : public QGuiApplication
{
    Q_OBJECT

public:
    explicit Application(int& argc, char** argv);
    ~Application();

    auto launch() -> void;

};

} // namespace Core
