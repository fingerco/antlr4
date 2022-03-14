defprotocol Antlr4.Runtime.Tree.ParseTreeVisitor do
  @moduledoc """
  This interface defines the basic notion of a parse tree visitor. Generated visitors implement this interface and the `XVisitor` interface for grammar `X`.
  """

  @doc """
  Visit a parse tree, and return a user-defined result of the operation.
  Returns the result of visiting the parse tree.
  """
  @spec visit(t, tree :: Antlr4.Runtime.Tree.ParseTree.t()) :: any
  def visit(t, tree)

  @doc """
  Visit the children of a node, and return a user-defined result of the operation.
  Returns the result of visiting the children of the node.
  """
  @spec visit_children(t, rule_node :: Antlr4.Runtime.Tree.RuleNode.t()) :: any
  def visit_children(t, rule_node)

  @doc """
  Visit a terminal node, and return a user-defined result of the operation.
  Returns the result of visiting the node.
  """
  @spec visit_terminal(t, terminal_node :: Antlr4.Runtime.Tree.TerminalNode.t()) :: any
  def visit_terminal(t, terminal_node)

  @doc """
  Visit an error node, and return a user-defined result of the operation.
  Returns the result of visiting the node.
  """
  @spec visit_error_node(t, error_node :: Antlr4.Runtime.Tree.ErrorNode.t()) :: any
  def visit_error_node(t, error_node)
end