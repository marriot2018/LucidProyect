#ifndef BATTERY_H
#define BATTERY_H

#include <QObject>
#include <QVariant>
#include <QDebug>
#include <QColor>

class Battery : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double batteryPercentage  READ getBatteryPercentage WRITE setBatteryPercentage NOTIFY batteryPercentageChange)
    Q_PROPERTY(QColor color READ getColor)
public:
    explicit Battery(QObject *parent = nullptr);

    double getBatteryPercentage();
    Q_INVOKABLE void setBatteryPercentage(bool type);

    QColor getColor();

signals:
    void batteryPercentageChange();

private:
    void updateColor();

    double m_value;
    QColor m_color;
};
#endif // BATTERY_H
