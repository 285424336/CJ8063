#include "persondelegate.h"

PersonDelegate::PersonDelegate(QObject *parent) :
    QStyledItemDelegate(parent)
{
}

void PersonDelegate::paint(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    if(index.data().canConvert<Person>())
        paintPerson(painter, option, index);
//    else
//        paintLetter(painter, option, index);
}
QSize PersonDelegate::sizeHint(const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    if(index.data().canConvert<Person>())
        return QSize(option.rect.width(), 45);
    else
        return QSize(option.rect.width(), 25);
}
#include <QEvent>
#include <QDebug>
#include <QMouseEvent>
static int g_A = 0;
bool PersonDelegate::editorEvent(QEvent *event, QAbstractItemModel *model, const QStyleOptionViewItem &option, const QModelIndex &index)
{
    //构造一个矩形区域
    qDebug() << "editorEvent" << event->type();
    QRect decorationRect = QRect(option.rect);

    QMouseEvent *mouseEvent = static_cast<QMouseEvent*>(event);//将事件转换为鼠标事件

//    //判断当前事件是鼠标按钮事件，并且鼠标位置是属于当前矩形范围内，就发送deleteItem信号
    if (event->type() == QEvent::MouseButtonPress && decorationRect.contains(mouseEvent->pos()))
    {
//        emit deleteItem(index);
        qDebug()<<"delete";
        g_A = 1;
    } else/* if (event->type() == QEvent::MouseButtonRelease && decorationRect.contains(mouseEvent->pos()))*/ {
        g_A = 0;
    }
    //返回编辑事件
    return QStyledItemDelegate::editorEvent(event, model, option, index);
}
#include <QDebug>
void PersonDelegate::paintPerson(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    const bool isSelected = option.state & QStyle::State_Selected;
    const bool isHovered = option.state & QStyle::State_MouseOver;
    qDebug() << "paintPerson" << isSelected << isHovered << option.state;
    Person tp = index.data().value<Person>();

    painter->save();

//    QLinearGradient backgroundGradient(QPoint(option.rect.x(), option.rect.y()), QPoint(option.rect.x(), option.rect.y()+option.rect.height()));
//    if(isSelected) {
//        //        painter->fillRect(option.rect, QBrush(QColor(49, 49, 49)));
////        backgroundGradient.setColorAt(0, QColor(109, 164, 219));
////        backgroundGradient.setColorAt(1, QColor(61, 138, 212));
////        painter->fillRect(option.rect, QBrush(QColor(Qt::white)));
////                painter->fillRect(option.rect, QBrush(QColor(225, 225, 225)));
    if (1 == g_A) {
        painter->fillRect(option.rect, QBrush(QColor(225, 225, 225)));
    }
//    } else {
////                painter->fillRect(option.rect, QBrush(QColor(Qt::white)));
//        backgroundGradient.setColorAt(0, QColor(Qt::white));
//        backgroundGradient.setColorAt(1, QColor(Qt::white));
////        painter->fillRect(option.rect, QBrush(backgroundGradient));
//    }

//    painter->setPen(QColor(225, 225, 225));
//    if(isSelected)
//    {
//        painter->setPen(QColor(37, 105, 169));
////        painter->drawLine(option.rect.bottomLeft(), option.rect.bottomRight());
//        painter->setPen(Qt::transparent);
//    }
////    painter->drawLine(option.rect.topLeft(), option.rect.topRight());
//    if(!isSelected)
//    {
//        painter->setPen(QColor(248, 248, 248));
////        painter->drawLine(QPoint(option.rect.x(), option.rect.y()+1), QPoint(option.rect.x()+option.rect.width(), option.rect.y()+1));
//    }
    //    QString text = index.model()->data(index, Qt::DisplayRole).toString();
    QRect textRect(option.rect.x()+10, option.rect.y(), option.rect.width()-10, option.rect.height());
    painter->setPen(QColor(69, 69, 69));
    QFont textFont(painter->font());
    textFont.setPixelSize(18);
//    if(isSelected){
//        painter->setPen(QColor(229, 229, 229));
//    }

    textFont.setFamily("Helvetica Neue");
    painter->setFont(textFont);
    painter->drawText(textRect, Qt::AlignLeft|Qt::AlignVCenter, tp.name());

    painter->restore();
}
void PersonDelegate::paintLetter(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    const bool isSelected = option.state & QStyle::State_Selected;
    const bool isHovered = option.state & QStyle::State_MouseOver;

    painter->save();

    QLinearGradient backgroundGradient(QPoint(option.rect.x(), option.rect.y()), QPoint(option.rect.x(), option.rect.y()+option.rect.height()));
    //        painter->fillRect(option.rect, QBrush(QColor(225, 225, 225)));

    backgroundGradient.setColorAt(0, QColor(215, 215, 215));
    backgroundGradient.setColorAt(1, QColor(230, 230, 230));
    painter->fillRect(option.rect, QBrush(backgroundGradient));

    painter->setPen(QColor(213, 213, 213));
    painter->drawLine(option.rect.bottomLeft(), option.rect.bottomRight());

    QFont textFont(painter->font());
    textFont.setPixelSize(18);
    textFont.setFamily("Helvetica Neue");
    painter->setFont(textFont);

    QRect textRect(option.rect.x()+10, option.rect.y(), option.rect.width()-10, option.rect.height());
    painter->setPen(QColor(39, 39, 39));
    painter->drawText(textRect, Qt::AlignLeft|Qt::AlignVCenter, index.model()->data(index).toString());

    painter->restore();
}
