#include <Application.h>

#include "QmlRegisterType.h"

namespace ATQQ::Core {

Application::Application(int& argc, char** argv) :
    QGuiApplication(argc, argv)
{
    setOrganizationName("Organization");
    setOrganizationDomain("organization.com");
}

Application::~Application()
{

}

auto Application::launch() -> void
{
    ViewModels::qmlRegisterTypes();
    // ...
}

} // namespace ATQQ::Core
