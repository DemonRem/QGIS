/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/expression/qgsexpressionnode.h                              *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/






class QgsExpressionNode /Abstract/
{
%Docstring

 Abstract base class for all nodes that can appear in an expression.
%End

%TypeHeaderCode
#include "qgsexpressionnode.h"
%End

%ConvertToSubClassCode
    switch ( sipCpp->nodeType() )
    {
      case QgsExpressionNode::ntUnaryOperator:
        sipType = sipType_QgsExpressionNodeUnaryOperator;
        break;
      case QgsExpressionNode::ntBinaryOperator:
        sipType = sipType_QgsExpressionNodeBinaryOperator;
        break;
      case QgsExpressionNode::ntInOperator:
        sipType = sipType_QgsExpressionNodeInOperator;
        break;
      case QgsExpressionNode::ntFunction:
        sipType = sipType_QgsExpressionNodeFunction;
        break;
      case QgsExpressionNode::ntLiteral:
        sipType = sipType_QgsExpressionNodeLiteral;
        break;
      case QgsExpressionNode::ntColumnRef:
        sipType = sipType_QgsExpressionNodeColumnRef;
        break;
      case QgsExpressionNode::ntCondition:
        sipType = sipType_QgsExpressionNodeCondition;
        break;
      default:
        sipType = 0;
        break;
    }
%End
  public:
    enum NodeType
    {
      ntUnaryOperator,
      ntBinaryOperator,
      ntInOperator,
      ntFunction,
      ntLiteral,
      ntColumnRef,
      ntCondition
    };


    struct NamedNode
    {
      public:

        NamedNode( const QString &name, QgsExpressionNode *node );
%Docstring
 Constructor for NamedNode
 \param name node name
 \param node node
%End

        QString name;
%Docstring
Node name
%End

        QgsExpressionNode *node;
%Docstring
Node
%End
    };

    class NodeList
{

%TypeHeaderCode
#include "qgsexpressionnode.h"
%End
      public:
        virtual ~NodeList();
        void append( QgsExpressionNode *node /Transfer/ );
%Docstring
Takes ownership of the provided node
%End

        void append( QgsExpressionNode::NamedNode *node /Transfer/ );
%Docstring
 Adds a named node. Takes ownership of the provided node.
.. versionadded:: 2.16
%End

        int count() const;
%Docstring
 Returns the number of nodes in the list.
 :rtype: int
%End

        bool hasNamedNodes() const;
%Docstring
 Returns true if list contains any named nodes
.. versionadded:: 2.16
 :rtype: bool
%End

        QList<QgsExpressionNode *> list();
%Docstring
 Get a list of all the nodes.
 :rtype: list of QgsExpressionNode
%End

        QgsExpressionNode *at( int i );
%Docstring
 Get the node at position i in the list.

.. versionadded:: 3.0
 :rtype: QgsExpressionNode
%End

        QStringList names() const;
%Docstring
 Returns a list of names for nodes. Unnamed nodes will be indicated by an empty string in the list.
.. versionadded:: 2.16
 :rtype: list of str
%End

        QgsExpressionNode::NodeList *clone() const /Factory/;
%Docstring
Creates a deep copy of this list. Ownership is transferred to the caller
 :rtype: QgsExpressionNode.NodeList
%End

        virtual QString dump() const;
%Docstring
 :rtype: str
%End

      public:
    };

    virtual ~QgsExpressionNode();

    virtual QgsExpressionNode::NodeType nodeType() const = 0;
%Docstring
 Get the type of this node.

 :return: The type of this node
 :rtype: QgsExpressionNode.NodeType
%End

    virtual QString dump() const = 0;
%Docstring
 Dump this node into a serialized (part) of an expression.
 The returned expression does not necessarily literally match
 the original expression, it's just guaranteed to behave the same way.
 :rtype: str
%End

    QVariant eval( QgsExpression *parent, const QgsExpressionContext *context );
%Docstring
 Evaluate this node with the given context and parent.
 This will return a cached value if it has been determined to be static
 during the prepare() execution.

.. versionadded:: 2.12
 :rtype: QVariant
%End

    virtual QgsExpressionNode *clone() const = 0;
%Docstring
 Generate a clone of this node.
 Ownership is transferred to the caller.

 :return: a deep copy of this node.
 :rtype: QgsExpressionNode
%End

    virtual QSet<QString> referencedColumns() const = 0;
%Docstring
 Abstract virtual method which returns a list of columns required to
 evaluate this node.

 When reimplementing this, you need to return any column that is required to
 evaluate this node and in addition recursively collect all the columns required
 to evaluate child nodes.

 :return: A list of columns required to evaluate this expression
 :rtype: set of str
%End

    virtual QSet<QString> referencedVariables() const = 0;
%Docstring
 Return a set of all variables which are used in this expression.
 :rtype: set of str
%End

    virtual bool needsGeometry() const = 0;
%Docstring
 Abstract virtual method which returns if the geometry is required to evaluate
 this expression.

 This needs to call `needsGeometry()` recursively on any child nodes.

 :return: true if a geometry is required to evaluate this expression
 :rtype: bool
%End

    virtual bool isStatic( QgsExpression *parent, const QgsExpressionContext *context ) const = 0;
%Docstring
 Returns true if this node can be evaluated for a static value. This is used during
 the prepare() step and in case it returns true, the value of this node will already
 be evaluated and the result cached (and therefore not re-evaluated in subsequent calls
 to eval()). In case this returns true, prepareNode() will never be called.

.. versionadded:: 3.0
 :rtype: bool
%End

    bool prepare( QgsExpression *parent, const QgsExpressionContext *context );
%Docstring
 Prepare this node for evaluation.
 This will check if the node content is static and in this case cache the value.
 If it's not static it will call prepareNode() to allow the node to do initialization
 work like for example resolving a column name to an attribute index.

.. versionadded:: 2.12
 :rtype: bool
%End


  protected:


};


/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/expression/qgsexpressionnode.h                              *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
