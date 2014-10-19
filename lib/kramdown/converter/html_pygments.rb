module Kramdown
  module Converter

    class HtmlPygments < Html
      attr_accessor :indent

      def initialize(root, options)
        super
        @footnote_counter = @footnote_start = @options[:footnote_nr]
        @footnotes = []
        @footnotes_by_name = {}
        @footnote_location = nil
        @toc = []
        @toc_code = nil
        @indent = @options[:indent] || 4
        @stack = []
        @coderay_enabled = false
      end

      def convert_codeblock(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr) || @options[:default_lang]
        code = pygmentize(el.value, lang)
        code_attr = {}
        code_attr['class'] = "language-#{lang}" if lang
        "#{' '*indent}<pre#{html_attributes(attr)}><code#{html_attributes(code_attr)}>#{code}</code></pre>\n"
      end

      def convert_codespan(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr) || @options[:default_lang]
        code = pygmentize(el.value, lang)
        if lang
          if attr.has_key?('class')
            attr['class'] += " language-#{lang}"
          else
            attr['class'] = "language-#{lang}"
          end
        end
        "<code#{html_attributes(attr)}>#{code}</code>"
      end

      def pygmentize(code, lang)
        if lang
          Pygments.highlight(code,
            :lexer => lang,
            :options => { :encoding => 'utf-8', :nowrap => true, :startinline => true })
        else
          escape_html(code)
        end
      end
    end

  end
end
