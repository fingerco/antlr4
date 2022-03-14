defprotocol Antlr4.Runtime.TokenFactory do
  @moduledoc """
  The default mechanism for creating tokens. It's used by default in Lexer and the error handling strategy (to create missing tokens). Notifying the parser of a new factory means that it notifies its token source and error strategy.
  """
  alias Antlr4.Runtime.Token
  alias Antlr4.Runtime.TokenSource
  alias Antlr4.Runtime.CharStream

  @doc """
  This is the method used to create tokens in the lexer and in the error handling strategy. If text!=null, than the start and stop positions are wiped to -1 in the text override is set in the CommonToken.
  """
  @spec create(source :: {TokenSource.t(), CharStream.t()}, type :: integer, text :: String.t(), channel :: integer, start :: integer, stop :: integer, line :: non_neg_integer, char_pos_in_line :: non_neg_integer) :: Token.t()
  def create(source, type, text, channel, start, stop, line, char_pos_in_line)

  @doc """
  Generically useful
  """
  @spec create(type :: integer, text :: String.t()) :: Token.t()
  def create(type, text)
end