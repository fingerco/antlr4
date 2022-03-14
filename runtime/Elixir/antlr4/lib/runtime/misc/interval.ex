defmodule Antlr4.Runtime.Misc.Interval do
  @enforce_keys   [:a, :b]
  defstruct       [:a, :b]
  @type t() :: %__MODULE__{a: non_neg_integer, b: non_neg_integer}

  @spec size(t) :: non_neg_integer
  def size(interval) do
    cond do
      interval.b < interval.a -> 0
      true -> interval.b - interval.a + 1
    end
  end
end