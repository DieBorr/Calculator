#define CALCULATOR_H
#include <QObject>
#include "iostream"
class calculator : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString display_value READ read_display_value NOTIFY display_value_changed)
public:
    explicit calculator(QObject *parent = nullptr);
    //Q_INVOKABLE QString set_display_value();

    struct values {
        int value1;
        int value2;
    };
    Q_INVOKABLE values read_display_value(QString);
    Q_INVOKABLE QString addOperation(QString);
signals:
    void display_value_changed();
public slots:
    //int read_display_value(QString);
    //int read_display_value(QString);
private :

    //QString variable;

};
 // CALCULATOR_H
