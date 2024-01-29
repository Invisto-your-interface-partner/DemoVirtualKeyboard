#include "keyboardhandler.h"
#include <QKeyEvent>
#include <QCoreApplication>
#include <QDebug>

KeyboardHandler::KeyboardHandler(QObject *parent)
    : QObject{parent}
    , m_focusObject(nullptr)
    , m_showKeyboard(false)
    , m_useNumericKeyboard(false)
    , m_useCaps(false)
{}

void KeyboardHandler::keyPressed(const QString& character)
{
    if (m_focusObject)
    {
        if (m_focusObject)
        {
            QKeyEvent keyPressEvent = QKeyEvent(QEvent::Type::KeyPress, Qt::Key_1, Qt::NoModifier, /*QKeySequence(k).toString()*/character);
            QCoreApplication::sendEvent(m_focusObject, &keyPressEvent);
        }
    }
}

void KeyboardHandler::backSpacePressed()
{
    QKeyEvent keyPressEvent = QKeyEvent(QEvent::Type::KeyPress, Qt::Key_Backspace, Qt::NoModifier);//, /*QKeySequence(k).toString()*/"汉");
    QCoreApplication::sendEvent(m_focusObject, &keyPressEvent);
}

void KeyboardHandler::enterPressed()
{
    QKeyEvent keyPressEvent = QKeyEvent(QEvent::Type::KeyPress, Qt::Key_Tab, Qt::NoModifier);//, /*QKeySequence(k).toString()*/"汉");
    QCoreApplication::sendEvent(m_focusObject, &keyPressEvent);
}

void KeyboardHandler::hideKeyboard()
{
    qDebug() << "Request to close keyboard.";
    m_showKeyboard = false;
    emit showKeyboardChanged();
}

void KeyboardHandler::requestNumericKeyboard()
{
    m_useNumericKeyboard = true;
    emit useNumericKeyboardChanged();
}

void KeyboardHandler::requestMainKeyboard()
{
    m_useNumericKeyboard = false;
    emit useNumericKeyboardChanged();
}

bool KeyboardHandler::showKeyboard() const
{
    return m_showKeyboard;
}

bool KeyboardHandler::useNumericKeyboard() const
{
    return m_useNumericKeyboard;
}

bool KeyboardHandler::useCaps() const
{
    return m_useCaps;
}

void KeyboardHandler::setUseCaps(bool useCaps)
{
    if (m_useCaps != useCaps)
    {
        m_useCaps = useCaps;
        emit useCapsChanged();
    }
}

QObject *KeyboardHandler::focusObject() const
{
    return m_focusObject;
}

void KeyboardHandler::onFocusObjectChanged(QObject *focusObject)
{
    m_showKeyboard = false;
    m_focusObject = focusObject;
    if (m_focusObject != nullptr)
    {
        auto className = focusObject->metaObject()->className();
        if (QString::fromStdString(className).compare("QQuickTextInput", Qt::CaseSensitive) == 0)
        {
            auto inputMethodHintsProperty = focusObject->property("inputMethodHints");
            if (inputMethodHintsProperty.isNull() == false)
            {
                bool ok;
                auto inputMethodHintsValue = inputMethodHintsProperty.toInt(&ok);
                if (inputMethodHintsValue == static_cast<int>(Qt::ImhFormattedNumbersOnly))
                {
                    m_useNumericKeyboard = true;
                }
                else
                {
                    m_useNumericKeyboard = false;
                }
                emit useNumericKeyboardChanged();
            }

            m_showKeyboard = true;
        }
        else if (QString::fromStdString(className).compare("QQuickTextEdit", Qt::CaseSensitive) == 0)
        {
            m_useNumericKeyboard = false;
            emit useNumericKeyboardChanged();
            m_showKeyboard = true;
        }
    }

    emit showKeyboardChanged();
}
