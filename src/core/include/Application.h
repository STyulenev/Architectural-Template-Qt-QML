#pragma once

#include <QGuiApplication>
#include <QQmlApplicationEngine>

namespace ATQQ::Controllers {
    class LanguageController;
} // namespace ATQQ::Controllers

namespace ATQQ::Core {

class Application : public QGuiApplication
{
    Q_OBJECT

public:
    explicit Application(int& argc, char** argv);
    ~Application();

    auto launch() -> void;
    auto setEngine(QQmlApplicationEngine* newEngine) -> void;

private slots:
    auto engineRetranslate() -> void;

private:
    QQmlApplicationEngine* engine;
    Controllers::LanguageController* languageController;

};

} // namespace ATQQ::Core
