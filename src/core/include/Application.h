#pragma once

#include <QGuiApplication>

namespace ATQQ::Core {

class Application : public QGuiApplication
{
    Q_OBJECT

public:
    explicit Application(int& argc, char** argv);
    ~Application();

    auto launch() -> void;

};

} // namespace ATQQ::Core
