defprotocol Antlr4.Runtime.Tree do
  @moduledoc """
  The basic notion of a tree has a parent, a payload, and a list of children.
  It is the most abstract interface for all the trees used by ANTLR.
  """

  @doc """
  The parent of this node. If the return value is null, then this node is the root of the tree.
  """
  @spec parent(t) :: {:ok, parent_tree :: t} | nil
  def parent(t)

  @doc """
  This method returns whatever object represents the data at this node. For a leaf node or a `Antlr4.Runtime.RuleContext` object representing a rule invocation. For abstract syntax trees (ASTs), this is a `Antlr4.Runtime.Token` object.
  """
  @spec payload(t) :: {:ok, any} | nil
  def payload(t)

  @doc """
  If there are children, get the {@code i}th value indexed from 0.
  """
  @spec child(t, i :: non_neg_integer) :: {:ok, child_tree :: t} | {:error, :invalid_child}
  def child(t, i)

  @doc """
  How many children are there? If there is none, then this node represents a leaf node.
  """
  @spec child_count(t) :: non_neg_integer
  def child_count(t)

  @doc """
  Print out a whole tree, not just a node, in LISP format `(root child1 .. childN)`. Print just a node if this is a leaf.
  """
  @spec to_string_tree(t) :: String.t()
  def to_string_tree(t)
end