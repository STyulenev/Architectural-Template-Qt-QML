#include <Application.h>

namespace Core {

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
    // ...
}

} // namespace Core
