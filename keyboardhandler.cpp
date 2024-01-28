#include "keyboardhandler.h"
#include <QKeyEvent>
#include <QCoreApplication>
#include <QDebug>

KeyboardHandler::KeyboardHandler(QObject *parent)
    : QObject{parent}
    , m_focusObject(nullptr)
    , m_showKeyboard(false)
    , m_useNumericKeyboard(false)
{}

void KeyboardHandler::keyPressed(Qt::Key k)
{
    if (m_focusObject)
    {
        QKeyEvent keyPressEvent = QKeyEvent(QEvent::Type::KeyPress, k, Qt::NoModifier, /*QKeySequence(k).toString()*/"汉");
        QCoreApplication::sendEvent(m_focusObject, &keyPressEvent);
    }
}

void KeyboardHandler::hideKeyboard()
{
    qDebug() << "Request to close keyboard.";
    m_showKeyboard = false;
    emit showKeyboardChanged();


}

bool KeyboardHandler::showKeyboard() const
{
    return m_showKeyboard;
}

bool KeyboardHandler::useNumericKeyboard() const
{
    return m_useNumericKeyboard;
}

QObject *KeyboardHandler::focusObject() const
{
    return m_focusObject;
}

void KeyboardHandler::onFocusObjectChanged(QObject *focusObject)
{
    // if (focusObject)
    // {
    //     qDebug() << "object got focus " << focusObject << " of type " << focusObject->metaObject()->className();
    // }

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
    }

    emit showKeyboardChanged();
}
