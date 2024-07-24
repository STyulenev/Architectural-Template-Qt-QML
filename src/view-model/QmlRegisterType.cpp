#include "QmlRegisterType.h"

#include <QQmlEngine>

#include <AuthenticationViewModel.h>

namespace ATQQ::ViewModels {

auto qmlRegisterTypes() -> void
{
    qmlRegisterType<AuthenticationViewModel>("organization.com", 1, 0, "AuthenticationViewModel");
    // ...
}

} // ATQQ::ViewModels
