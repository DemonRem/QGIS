/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/gui/symbology/qgsbrushstylecombobox.h                            *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/



class QgsBrushStyleComboBox : QComboBox
{

%TypeHeaderCode
#include "qgsbrushstylecombobox.h"
%End
  public:
    QgsBrushStyleComboBox( QWidget *parent /TransferThis/ = 0 );

    Qt::BrushStyle brushStyle() const;
%Docstring
 :rtype: Qt.BrushStyle
%End

    void setBrushStyle( Qt::BrushStyle style );

  protected:
    QIcon iconForBrush( Qt::BrushStyle style );
%Docstring
 :rtype: QIcon
%End

};

/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/gui/symbology/qgsbrushstylecombobox.h                            *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
