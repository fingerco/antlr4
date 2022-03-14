defprotocol Antlr4.Runtime.Tree.ParseTree do
  @moduledoc """
  An interface to access the tree of `Antlr4.Runtime.RuleContext` objects created during a parse that makes the data structure look like a simple parse tree. This node represents both internal nodes, rule invocations, and leaf nodes, token matches.

  The payload is either a `Antlr4.Runtime.Token` or a `Antlr4.Runtime.RuleContext` object.
  """

  @doc """
  Narrow the return type defined in `Antlr4.Runtime.Tree.parent/1`
  """
  @spec parent(t) :: {:ok, t} | nil
  def parent(t)

  @doc """
  Narrow the return type defined in `Antlr4.Runtime.Tree.child/1`
  """
  @spec child(t, i :: non_neg_integer) :: {:ok, t} | :invalid
  def child(t, i)


  @doc """
  Returns a new node with the given parent.
  """
  @spec with_parent(t, parent :: Antlr4.Runtime.RuleContext.t()) :: {:ok, t} | :invalid
  def with_parent(t, parent)

  @doc """
  Apply visitor to tree
  """
  @spec accept(t, visitor :: Antlr4.Runtime.Tree.ParseTreeVisitor.t()) :: {:ok, any} | :invalid
  def accept(t, visitor)


  @doc """
  Return the combined text of all leaf nodes. Does not get any off-channel tokens (if any) so won't return whitespace and comments if they are sent to parser on hidden channel.
  """
  @spec text(t) :: String.t()
  def text(t)

  @doc """
  Specialize toStringTree so that it can print out more information based upon the parser.
  """
  @spec to_string_tree(t, parser :: Antlr4.Runtime.Parser.t()) :: String.t()
  def to_string_tree(t, parser)
end