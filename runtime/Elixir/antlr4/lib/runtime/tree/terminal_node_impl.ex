defmodule Antlr4.Runtime.Tree.TerminalNodeImpl do
  alias Antlr4.Runtime.Token
  alias Antlr4.Runtime.Misc.Interval
  alias Antlr4.Runtime.Tree.SyntaxTree
  alias Antlr4.Runtime.Tree.ParseTree
  alias Antlr4.Runtime.Tree.TerminalNode
  alias Antlr4.Runtime.Tree.ParseTreeVisitor

  @enforce_keys [:symbol]
  defstruct     [:symbol, :parent]
  @type t() :: %__MODULE__{symbol: Antlr4.Runtime.Token.t(), parent: Antlr4.Runtime.Tree.ParseTree.t() | nil}

  defimpl TerminalNode, for: __MODULE__ do
    def symbol(n), do: n.symbol
  end

  defimpl ParseTree, for: __MODULE__ do
    def accept(n, v) do
      ParseTreeVisitor.visit_terminal(v, n)
    end

    def child(_, _) do
      :invalid
    end

    def parent(n) do
      n.parent
    end

    def text(n) do
      Token.text(n.symbol)
    end

    def to_string_tree(n) do
      String.Chars.to_string(n)
    end

    def to_string_tree(n, _) do
      String.Chars.to_string(n)
    end

    def with_parent(n, p) do
      {:ok, %{n | parent: p}}
    end
  end

  defimpl SyntaxTree, for: __MODULE__ do
    def source_interval(%{symbol: sym}) do
      {:ok, %Interval{a: sym.token_index, b: sym.token_index}}
    end
  end

  defimpl String.Chars, for: __MODULE__ do
    def to_string(%{symbol: Token.EOF}) do
      "<EOF>"
    end

    def to_string(%{symbol: sym}) do
      Token.text(sym)
    end
  end
end