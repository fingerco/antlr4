defprotocol Antlr4.Runtime.Tree.RuleNode do
  @spec rule_context(t) :: Antlr4.Runtime.RuleContext.t()
  def rule_context(t)
end