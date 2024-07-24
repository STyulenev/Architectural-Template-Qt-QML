#include <AuthenticationViewModel.h>

namespace ATQQ::ViewModels {

AuthenticationViewModel::AuthenticationViewModel(QObject* parent) :
    QObject(parent)
{

}

AuthenticationViewModel::~AuthenticationViewModel()
{

}

auto AuthenticationViewModel::checkUsernameNPassword(const QString& username, const QString& password) -> bool
{
    return (username == "user" && password == "1234");
}

} // namespace ATQQ::ViewModels
