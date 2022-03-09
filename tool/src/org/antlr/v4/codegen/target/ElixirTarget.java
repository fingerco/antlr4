package org.antlr.v4.codegen.target;

import org.antlr.v4.codegen.CodeGenerator;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.StringRenderer;
import org.antlr.v4.codegen.Target;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

public class ElixirTarget extends Target {
	protected static final HashSet<String> reservedWords = new HashSet<>(Arrays.asList(
			// https://hexdocs.pm/elixir/1.13.3/syntax-reference.html
			"true", "false", "nil",
			"when", "and", "or", "not", "in",
			"fn",
			"do", "end", "catch", "rescue", "after", "else"
	));

	public ElixirTarget(CodeGenerator gen) {
		super(gen);
	}

	@Override
	public Set<String> getReservedWords() {
		return reservedWords;
	}

	@Override
	protected STGroup loadTemplates() {
		STGroup result = super.loadTemplates();
		result.registerRenderer(String.class, new ElixirTarget.JavaStringRenderer(), true);
		return result;
	}

	protected static class JavaStringRenderer extends StringRenderer {
		@Override
		public String toString(Object o, String formatString, Locale locale) {
			if ("java-escape".equals(formatString)) {
				// 5C is the hex code for the \ itself
				return ((String)o).replace("\\u", "\\u005Cu");
			}

			return super.toString(o, formatString, locale);
		}
	}
}
