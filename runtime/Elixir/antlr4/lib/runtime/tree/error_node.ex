defprotocol Antlr4.Runtime.Tree.ErrorNode do
  @spec symbol(t) :: Antlr4.Runtime.Token.t()
  def symbol(t)
end