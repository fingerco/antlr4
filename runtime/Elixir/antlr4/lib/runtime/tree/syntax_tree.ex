defprotocol Antlr4.Runtime.Tree.SyntaxTree do
  @moduledoc """
  A tree that knows about an interval in a token stream is some kind of syntax tree. Subinterfaces distinguish between parse trees and other kinds of syntax trees we might want to create.
  """

  @doc """
  Return an `Antlr4.Runtime.Misc.Interval` indicating the index in the `Antlr4.TokenStream` of the first and last token associated with this subtree. If this node is a leaf, then the interval represents a single token and has interval i..i for token index i.

  An interval of i..i-1 indicates an empty interval at position i in the input stream, where 0 <= i <= the size of the input token stream.  Currently, the code base can only have i=0..n-1 but in concept one could have an empty interval after EOF.

  If source interval is unknown, this returns :invalid.

  As a weird special case, the source interval for rules matched after EOF is unspecified.
  """
  @spec source_interval(t) :: {:ok, Antlr4.Runtime.Misc.Interval.t()} | :invalid
  def source_interval(t)
end