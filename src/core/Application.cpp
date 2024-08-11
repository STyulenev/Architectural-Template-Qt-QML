#include <Application.h>

#include "QmlRegisterType.h"

#include "LanguageController.h"
#include "LoggingController.h"

namespace ATQQ::Core {

Application::Application(int& argc, char** argv) :
    QGuiApplication(argc, argv),
    engine(nullptr)
{
    Controllers::LoggingController::instance()->setDebugMessageHandler();

    setApplicationName("Architectural-Template-Qt-QML");
    setOrganizationName("Organization");
    setOrganizationDomain("organization.com");

    languageController = new Controllers::LanguageController(this);

    qDebug() << Q_FUNC_INFO;
}

Application::~Application()
{
    qDebug() << Q_FUNC_INFO;
}

auto Application::launch() -> void
{
    if (!engine) {
        qApp->exit(1);
    }

    ViewModels::qmlRegisterTypes();
    // ...

    connect(languageController, &Controllers::LanguageController::languageChanged, this, &Application::engineRetranslate);

    this->setProperty("LanguageController", QVariant::fromValue<QObject*>(languageController));
}

auto Application::setEngine(QQmlApplicationEngine* engine) -> void
{
    this->engine = engine;
}

auto Application::engineRetranslate() -> void
{
    engine->retranslate();
}

} // namespace ATQQ::Core
