#include "keyboardhandler.h"
#include <QKeyEvent>
#include <QCoreApplication>
#include <QDebug>

KeyboardHandler::KeyboardHandler(QObject *parent)
    : QObject{parent}
    , m_focusObject(nullptr)
{}

void KeyboardHandler::keyPressed(Qt::Key k)
{
    if (m_focusObject)
    {
        QKeyEvent keyPressEvent = QKeyEvent(QEvent::Type::KeyPress, k, Qt::NoModifier, /*QKeySequence(k).toString()*/"汉");
        QCoreApplication::sendEvent(m_focusObject, &keyPressEvent);
    }
}

void KeyboardHandler::onFocusObjectChanged(QObject *focusObject)
{
    m_focusObject = focusObject;    
}
