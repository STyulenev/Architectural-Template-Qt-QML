#include "QmlRegisterType.h"

#include <QQmlEngine>

#include <AuthenticationViewModel.h>
#include <TopPanelViewModel.h>

namespace ATQQ::ViewModels {

auto qmlRegisterTypes() -> void
{
    qmlRegisterType<AuthenticationViewModel>("organization.com", 1, 0, "AuthenticationViewModel");
    qmlRegisterType<TopPanelViewModel>("organization.com", 1, 0, "TopPanelViewModel");
    // ...
}

} // ATQQ::ViewModels
