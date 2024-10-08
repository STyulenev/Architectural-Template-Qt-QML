#include <LanguageController.h>

#include <QLocale>
#include <QCoreApplication>
#include <QDir>
#include <QDebug>

namespace ATQQ::Controllers {

LanguageController::LanguageController(QObject* parent) :
    QObject(parent)
{
    m_translator = new QTranslator(this);
    qApp->installTranslator(m_translator);

    qDebug() << Q_FUNC_INFO;
}

LanguageController::~LanguageController()
{
    qDebug() << Q_FUNC_INFO;
}

auto LanguageController::setLanguage(const QString& langugage) -> void
{
    m_currLang = langugage;

    switchTranslator();
}

auto LanguageController::getLanguage() -> const QString&
{
    return m_currLang;
}

auto LanguageController::switchTranslator() -> void
{
    QLocale locale = QLocale(m_currLang);
    QLocale::setDefault(locale);

    qApp->removeTranslator(m_translator);

    if (m_translator->load(QString(":/ATQQ_%1.qm").arg(m_currLang))) {
        QCoreApplication::installTranslator(m_translator);

        emit languageChanged();
    } else {
        qDebug() << "Failed to load " << QString(":/ATQQ_%1.qm").arg(m_currLang);
    }
}

} // namespace ATQQ::Сontrollers
