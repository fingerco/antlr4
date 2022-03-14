defprotocol Antlr4.Runtime.TokenSource do
  @moduledoc """
  A source of tokens must provide a sequence of tokens via `next_token/1` and also must reveal it's source of characters; `Antlr4.Runtime.CommonToken`'s text is computed from a `Antlr4.Runtime.CharStream`; it only store indices into the char stream.

  Errors from the lexer are never passed to the parser. Either you want to keep going or you do not upon token recognition error. If you do not want to continue lexing then you do not want to continue parsing. Throw an exception to stop the lexer. If you want to continue lexing then you should not throw an exception to the parser--it has already requested a token. Keep lexing until you get a valid one. Just report errors and keep going, looking for a valid token.
  """
  alias Antlr4.Runtime.Token
  alias Antlr4.Runtime.TokenFactory
  alias Antlr4.Runtime.CharStream

  @doc """
  Return a `Antlr4.Runtime.Token` object from your input stream (usually a `Antlr4.Runtime.CharStream`). Do not fail/return upon lexing error; keep chewing on the characters until you get a good one; errors are not passed through to the parser.
  """
  @spec next_token(t) :: {:ok, Token.t()}
  def next_token(t)

  @doc """
  Get the line number for the current position in the input stream. The first line in the input is line 1.

  Returns {:ok, line_number} for the current position in the input stream, or :untracked if the current token source does not track line numbers.
  """
  @spec line(t) :: {:ok, non_neg_integer} | :untracked
  def line(t)

  @doc """
  Get the index into the current line for the current position in the input stream. The first character on a line has position 0.

  Returns {:ok, char_pos} for the current position in the input stream, or :untracked if the current token source does not track character positions.
  """
  @spec char_pos_in_line(t) :: {:ok, non_neg_integer} | :untracked
  def char_pos_in_line(t)

  @doc """
  Get the `Antlr4.Runtime.CharStream` from which this token source is currently providing tokens.

  Returns The {:ok, `Antlr4.Runtime.CharStream`} associated with the current position in the input, or :none if no input stream is available for the token source.
  """
  @spec input_stream(t) :: {:ok, CharStream.t()} | :none
  def input_stream(t)

  @doc """
  Gets the name of the underlying input source.

  Returns a non-empty string. If such a name is not known, this method returns :unknown
  """
  @spec source_name(t) :: String.t() | :unknown
  def source_name(t)

  @doc """
  Returns source with `Antlr4.Runtime.TokenFactory` this token source should use for creating `Antlr4.Runtime.Token` objects from the input.
  """
  @spec with_token_factory(t, TokenFactory.t()) :: t()
  def with_token_factory(t, factory)

  @doc """
  Gets the `Antlr4.Runtime.TokenFactory` this token source is currently using for creating `Antlr4.Runtime.Token` objects from the input.
  """
  @spec token_factory(t) :: TokenFactory.t()
  def token_factory(t)
end