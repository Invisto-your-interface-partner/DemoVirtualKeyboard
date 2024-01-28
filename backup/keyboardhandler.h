#pragma once

#include <QObject>

class KeyboardHandler : public QObject
{
    Q_OBJECT

public:
    explicit KeyboardHandler(QObject *parent = nullptr);

    Q_INVOKABLE void keyPressed(Qt::Key k);

public slots:
    void onFocusObjectChanged(QObject *focusObject);


private:
    QObject *m_focusObject;

};
