#ifndef BATTERY_H
#define BATTERY_H

#include <QObject>
#include <QVariant>
#include <QDebug>
#include <QColor>

class Battery : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int batteryPercentage  READ getBatteryPercentage WRITE setBatteryPercentage )
    Q_PROPERTY(QColor color READ getColor)
public:
    explicit Battery(QObject *parent = nullptr);

    int getBatteryPercentage();
    void setBatteryPercentage(int data);

    QColor getColor();

signals:
    void increase();
    void decrease();
    void seedValueSet();

public slots:
    void increased(int value);
    void decreased(int value);
    void seedValueSetted(int value, int height);

private:
    void updateColor();

    int m_value;
    int s_value;
    int m_height;
    bool p_equation;
    QColor m_color;
};



#endif // BATTERY_H
