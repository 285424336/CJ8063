#ifndef FLICKABLE_H
#define FLICKABLE_H

#include <QWidget>
#include <QList>

class Flickable : public QWidget
{
    Q_OBJECT
public:
    explicit Flickable(QWidget *parent = nullptr);
    ~Flickable();

protected:
    void paintEvent(QPaintEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;

private:
    int m_Offset;
    int m_HeightItem;
    int m_Highlight;
    int m_Selected;
    int m_DeltaStart;
    QList<QString> m_TitleVector;
};

#endif // FLICKABLE_H
