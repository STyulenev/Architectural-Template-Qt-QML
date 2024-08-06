#include <TopPanelViewModel.h>

#include <QGuiApplication>

#include "LanguageController.h"

namespace ATQQ::ViewModels {

TopPanelViewModel::TopPanelViewModel(QObject* parent) :
    QObject(parent)
{
    m_languageController = qobject_cast<Controllers::LanguageController*>(qApp->property("LanguageController").value<QObject*>());

    connect(m_languageController, &Controllers::LanguageController::languageChanged, this, &TopPanelViewModel::languageChanged);

    qDebug() << Q_FUNC_INFO;
}

TopPanelViewModel::~TopPanelViewModel()
{
    qDebug() << Q_FUNC_INFO;
}

auto TopPanelViewModel::getLanguage() -> const QString&
{
    return m_languageController->getLanguage();
}

auto TopPanelViewModel::setLanguage(const QString& language) -> void
{
    m_languageController->setLanguage(language);
}

} // namespace ATQQ::ViewModels
