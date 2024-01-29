#pragma once

#include <QObject>

class KeyboardHandler : public QObject
{
    Q_OBJECT

public:
    explicit KeyboardHandler(QObject *parent = nullptr);

    Q_PROPERTY(bool showKeyboard READ showKeyboard NOTIFY showKeyboardChanged)
    Q_PROPERTY(bool useNumericKeyboard READ useNumericKeyboard NOTIFY useNumericKeyboardChanged)
    Q_PROPERTY(bool useCaps READ useCaps WRITE setUseCaps NOTIFY useCapsChanged)
    Q_PROPERTY(QObject* focusObject READ focusObject NOTIFY focusObjectChanged)

    Q_INVOKABLE void keyPressed(const QString &character);
    Q_INVOKABLE void backSpacePressed();
    Q_INVOKABLE void hideKeyboard();

public:
    bool showKeyboard() const;
    bool useNumericKeyboard() const;
    bool useCaps() const;
    void setUseCaps(bool useCaps);
    QObject* focusObject() const;

public slots:
    void onFocusObjectChanged(QObject *focusObject);

signals:
    void showKeyboardChanged();
    void useNumericKeyboardChanged();
    void useCapsChanged();
    void focusObjectChanged();


private:
    QObject *m_focusObject;
    bool m_showKeyboard;
    bool m_useNumericKeyboard;
    bool m_useCaps;
};
