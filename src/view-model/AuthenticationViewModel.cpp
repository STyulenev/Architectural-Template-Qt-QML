#include <AuthenticationViewModel.h>

namespace ATQQ::ViewModels {

AuthenticationViewModel::AuthenticationViewModel(QObject* parent) :
    QObject(parent)
{
    qDebug() << Q_FUNC_INFO;
}

AuthenticationViewModel::~AuthenticationViewModel()
{
    qDebug() << Q_FUNC_INFO;
}

auto AuthenticationViewModel::checkUsernameNPassword(const QString& username, const QString& password) -> bool
{
    qDebug() << Q_FUNC_INFO;

    return (username == "user" && password == "1234");
}

} // namespace ATQQ::ViewModels
