#include <Application.h>

#include "QmlRegisterType.h"

#include "LanguageController.h"

namespace ATQQ::Core {

Application::Application(int& argc, char** argv) :
    QGuiApplication(argc, argv),
    engine(nullptr)
{
    setOrganizationName("Organization");
    setOrganizationDomain("organization.com");

    languageController = new Controllers::LanguageController(this);
}

Application::~Application()
{

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
