#include "battery.h"

Battery::Battery(QObject *parent) : QObject{parent}
{
    m_value = 0;
}

double Battery::getBatteryPercentage()
{
    return m_value;
}

QColor Battery::getColor()
{
    return m_color;
}

void Battery::setBatteryPercentage(bool type)
{
    if(type) {
        if (m_value < 1) {
            m_value = m_value + 0.05;
        } else {
            m_value = 1;
        }
    } else {
        if(m_value <= 0) {
            m_value = 0;
        } else {
            m_value = m_value - 0.1;
        }
    }
    updateColor();
    emit batteryPercentageChange();
}

void Battery::updateColor()
{
    if (m_value  <= .05) {
        m_color = QColor("red");
    } else if ((m_value > .05) && (m_value <= .2)) {
        m_color = QColor("orange");
    } else if ((m_value > .2) && (m_value <= .45)) {
        m_color = QColor("yellow");
    } else {
        m_color = QColor("green");
    }
}
