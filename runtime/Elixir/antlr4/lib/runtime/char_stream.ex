defprotocol Antlr4.Runtime.CharStream do
  alias Antlr4.Runtime.Misc.Interval
  @moduledoc """
  A source of characters for an ANTLR lexer.
  """

  @doc """
  This method returns the text for a range of characters within this input stream.

  Returns :invalid if `interval.b < interval.a - 1` or if `interval.b` lies past the end of the stream
  Returns :unsupported if the stream does not support getting the text of the specified interval.
  """
  @spec text(t, interval :: Interval) :: {:ok, String.t()} | :invalid | :unsupported
  def text(t, interval)
end