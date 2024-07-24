#pragma once

#include <QAbstractListModel>

namespace ATQQ::ViewModels {

class AuthenticationViewModel : public QObject
{
    Q_OBJECT

public:
    explicit AuthenticationViewModel(QObject* parent = 0);
    ~AuthenticationViewModel();

public slots:
    auto checkUsernameNPassword(const QString& username, const QString& password) -> bool;

};

} // namespace ATQQ::ViewModels
