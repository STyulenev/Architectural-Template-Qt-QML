# Architectural-Template-Qt-QML

Пример архитектурного шаблона для многостраничного приложения с графическим интерфейсом, использующего Qt/QML.

## Добавление новых языков

В корне папки выполняем команду, с нужным языковым кодом (например, es_ES - Испанский):
```shell
lupdate * -ts res/languages/ATQQ_es_ES.ts
```
далее требуется открыть данный файл утилитой и вставить перевод.
```shell
linguist
```

## Сборка проекта

Проект может быть собран из QtCreator или из папки build командами:

### CMake:

```bash
cmake ..
make
```
> Для debug - "cmake -DCMAKE_BUILD_TYPE=Debug ..", для release - "cmake -DCMAKE_BUILD_TYPE=Release .."

### QMake:

В данный момент сборка QMake отсутствует.

## Сборка с Docker

1. Установить Docker (для ОС Windows потребуется дополнительно WSL2).
2. Запустить VcXsrv Windows X Server (для ОС Windows).
3. Указать ip в переменную IP_ADDRESS (для перенаправления GUI).
4. Создать образ:
```bash
docker build -t docker-gui -f .\deploy\Dockerfile-Qt-6-5 --build-arg IP_ADDRESS='your ip addres' .
```
5. Запуск контейнера:
```bash
docker run docker-gui
```

## Тестирование QML

Для тестов создан подпроект tests/qmltests. При сборки с ключом --target all или отдельной целью будет создан исполняемый файл с тестами QML-компонентов - QMLTest. Чтобы запустить тесты через консоль, необходимо воспользоваться утилитой qmltestrunner:
```bash
qmltestrunner -input tst_LanguageListModel.qml
```