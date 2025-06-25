#include "battery.h"

Battery::Battery(QObject *parent) : QObject{parent}
{
    m_value = 0;
    s_value = 0;
    p_equation = 0;
    p_equation = false;

}

int Battery::getValue()
{
    return m_value;
}

QColor Battery::getColor()
{
    return m_color;
}

void Battery::setValue(int data)
{
    if(p_equation) {
        if (m_value < m_height) {
            m_value = data + s_value;
        } else {
            m_value = m_height;
        }
        updateColor();
        emit increase();
    } else {
        if (m_value <= 0) {
            m_value = 0;
        } else {
            m_value = data - s_value;
        }
        updateColor();
        emit decrease();
    }
}


void Battery::increased(int value)
{
    p_equation = true;
    setValue(value);
}

void Battery::decreased(int value)
{
    p_equation = false;
    setValue(value);
}

void Battery::seedValueSetted(int value, int height)
{
    s_value = value;
    m_height = height;
}

void Battery::updateColor()
{
    if (m_value  <= m_height *.05) {
        m_color = QColor("red");
    } else if ((m_value > m_height *.05) && (m_value <= m_height *.2)) {
        m_color = QColor("orange");
    } else if ((m_value > m_height *.2) && (m_value <= m_height *.45)) {
        m_color = QColor("yellow");
    } else {
        m_color = QColor("green");
    }
}
