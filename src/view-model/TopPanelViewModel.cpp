#include <TopPanelViewModel.h>

namespace ATQQ::ViewModels {

TopPanelViewModel::TopPanelViewModel(QObject* parent) :
    QObject(parent)
{
    m_languageController = new Controllers::LanguageController(this);
}

TopPanelViewModel::~TopPanelViewModel()
{

}

auto TopPanelViewModel::getLanguage() -> const QString&
{
    return m_languageController->getLanguage();
}

auto TopPanelViewModel::setLanguage(const QString& language) -> void
{
    m_languageController->setLanguage(language);

    emit languageChanged();
}

} // namespace ATQQ::ViewModels
