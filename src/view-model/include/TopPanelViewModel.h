#pragma once

#include <QObject>

namespace ATQQ::Controllers {
    class LanguageController;
} // namespace ATQQ::Controllers

namespace ATQQ::ViewModels {

class TopPanelViewModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString language READ getLanguage WRITE setLanguage NOTIFY languageChanged)

public:
    explicit TopPanelViewModel(QObject* parent = 0);
    ~TopPanelViewModel();

public slots:
    auto getLanguage() -> const QString&;
    auto setLanguage(const QString& language) -> void;

signals:
    auto languageChanged() -> void;

private:
    Controllers::LanguageController* m_languageController;

};

} // namespace ATQQ::ViewModels
