#include "Flickable.h"
#include <QPainter>
#include <QMouseEvent>
#include <QPaintEvent>
#include <QDebug>

Flickable::Flickable(QWidget *parent)
    : QWidget(parent)
{   
    m_Offset = 0;
    m_HeightItem = 20;
    m_Highlight = -1;
    m_Selected = -1;
    for (int i = 0; i < 30; ++i) {
        m_TitleVector.append(QString::number(i));
    }
}

Flickable::~Flickable()
{

}

void Flickable::paintEvent(QPaintEvent *event)
{
    QPainter painter(this);
    int startItem = m_Offset / m_HeightItem;
    int y = startItem * m_HeightItem - m_Offset;
    int endItem = startItem + height() / m_HeightItem;
    if (endItem > m_TitleVector.size() - 1) {
        endItem = m_TitleVector.size() - 1;
    }
    qDebug() << startItem << endItem << "m_Offset" << m_Offset;
    for (int i = startItem; i <= endItem; ++i) {
        if (m_Highlight == i) {
            painter.setPen(Qt::blue);
            painter.drawRect(0, y + m_HeightItem * (i - startItem), width(), m_HeightItem);
        } else {
            painter.setPen(Qt::black);
        }
        painter.drawText(0, y + m_HeightItem * (i - startItem), width(), m_HeightItem, Qt::AlignCenter, m_TitleVector.at(i));
    }
    QWidget::paintEvent(event);
}

void Flickable::mousePressEvent(QMouseEvent *event)
{
    int y = event->pos().y() + m_Offset;
    m_Highlight = y / m_HeightItem;
    m_DeltaStart = event->pos().y();
    update();
    QWidget::mousePressEvent(event);
}

void Flickable::mouseMoveEvent(QMouseEvent *event)
{
    qDebug() << "mouseMoveEvent" << event->pos().y();
    m_Highlight = -1;
    int deltaEnd = event->pos().y() - m_DeltaStart;
    qDebug() << "delta" << deltaEnd;
    m_Offset -= deltaEnd;
    if (m_Offset < 0) {
        m_Offset = 0;
    } else if ((m_TitleVector.size() * m_HeightItem - height()) > 0) {
        if (m_Offset > (m_TitleVector.size() * m_HeightItem - height())) {
            m_Offset = m_TitleVector.size() * m_HeightItem - height();
        }
    } else if ((m_TitleVector.size() * m_HeightItem - height()) <= 0) {
        m_Offset = 0;
    }
    qDebug() << "m_Offset" << m_Offset;
    m_DeltaStart = event->pos().y();
    update();
    QWidget::mouseMoveEvent(event);
}
