defprotocol Antlr4.Runtime.Token do
  @moduledoc """
  A token has properties: text, type, line, character position in the line (so we can ignore tabs), token channel, index, and source from which we obtained this token.
  """

  @doc """
  Get the text of the token.
  """
  @spec text(t) :: String.t()
  def text(t)

  @doc """
  Get the token type of the token
  """
  @spec type(t) :: integer
  def type(t)

  @doc """
  The line number on which the 1st character of this token was matched
  """
  @spec line(t) :: non_neg_integer
  def line(t)

  @doc """
  The index of the first character of this token relative to the beginning of the line at which it occurs, 0..n-1
  """
  @spec char_pos_in_line(t) :: non_neg_integer
  def char_pos_in_line(t)

  @doc """
  Return the channel this token. Each token can arrive at the parser on a different channel, but the parser only "tunes" to a single channel. The parser ignores everything not on DEFAULT_CHANNEL.
  """
  @spec channel(t) :: integer
  def channel(t)

  @doc """
  An index from 0..n-1 of the token object in the input stream. This must be valid in order to print token streams and use TokenRewriteStream.
  """
  @spec token_idx(t) :: non_neg_integer | :invalid
  def token_idx(t)

  @doc """
  The starting character index of the token
  This method is optional; return :not_implemented if not implemented.
  """
  @spec start_idx(t) :: non_neg_integer | :not_implemented
  def start_idx(t)

  @doc """
  The last character index of the token.
  This method is optional; return :not_implemented if not implemented.
  """
  @spec stop_idx(t) :: non_neg_integer | :not_implemented
  def stop_idx(t)

  @doc """
  Gets the `Antlr4.Runtime.TokenSource` which created this token.
  """
  @spec token_source(t) :: Antlr4.Runtime.TokenSource.t()
  def token_source(t)

  @doc """
  Gets the `Antlr4.Runtime.CharStream` from which this token was derived.
  """
  @spec input_stream(t) :: Antlr4.Runtime.CharStream.t()
  def input_stream(t)
end