#pragma once

#include <QTranslator>

namespace ATQQ::Controllers {

class LanguageController : public QObject
{
    Q_OBJECT

public:
    explicit LanguageController(QObject* parent = nullptr);
    ~LanguageController();

public slots:
    auto setLanguage(const QString& langugage) -> void;
    auto getLanguage() -> const QString&;

private:
    auto switchTranslator() -> void;

private:
    QTranslator* m_translator;
    QString m_currLang;

};

} // namespace ATQQ::Controllers
