#include <LanguageController.h>

#include <QLocale>
#include <QCoreApplication>
#include <QDir>
#include <QDebug>

#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>

namespace ATQQ::Controllers {

LanguageController::LanguageController(QObject* parent) :
    QObject(parent)
{
    m_translator = new QTranslator(this);
    qApp->installTranslator(m_translator);
}

LanguageController::~LanguageController()
{

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
        qApp->installTranslator(m_translator);

        // QTBUG-102393 in 6.6.3
        if (auto engine = qmlEngine(this)) {
            //engine->markCurrentFunctionAsTranslationBinding();
            engine->retranslate();
        } else {
            qDebug() << "Error";
        }
    } else {
        qDebug() << "Failed to load " << QString(":/ATQQ_%1.qm").arg(m_currLang);
    }
}

} // namespace ATQQ::Сontrollers
