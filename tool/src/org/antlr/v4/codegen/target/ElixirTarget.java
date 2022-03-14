package org.antlr.v4.codegen.target;

import org.antlr.v4.codegen.CodeGenerator;
import org.antlr.v4.tool.Grammar;
import org.antlr.v4.parse.ANTLRParser;
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

	public String getRecognizerFileName(boolean header) {
		CodeGenerator gen = getCodeGenerator();
		Grammar g = gen.g;
		assert g!=null;
		String name;
		switch ( g.getType()) {
			case ANTLRParser.PARSER:
				name = g.name.endsWith("Parser") ? g.name.substring(0, g.name.length()-6) : g.name;
				return name.toLowerCase()+"_parser.ex";
			case ANTLRParser.LEXER:
				name = g.name.endsWith("Lexer") ? g.name.substring(0, g.name.length()-5) : g.name; // trim off "lexer"
				return name.toLowerCase()+"_lexer.ex";
			case ANTLRParser.COMBINED:
				return g.name.toLowerCase()+"_parser.ex";
			default :
				return "INVALID_FILE_NAME";
		}
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

	@Override
	public boolean wantsBaseListener() {
		return false;
	}

	@Override
	public boolean wantsBaseVisitor() {
		return false;
	}
}
