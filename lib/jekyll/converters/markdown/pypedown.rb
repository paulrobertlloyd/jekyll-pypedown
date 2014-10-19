module Jekyll
  module Converters

    class Markdown::Pypedown
      def initialize(config)
        @config = config

        # Kramdown
        if @config['pypedown']
          %w[auto_ids auto_id_prefix default_lang entity_output footnote_nr smart_quotes toc_levels indent input].each do |key|
            @config['pypedown'][key] = @config['kramdown'][key] unless @config['pypedown'][key]
          end
        elsif
          @config['pypedown'] = @config['kramdown']
        end

        # Typogruby
        if @config['pypedown']['typogruby'].nil?
          @typogruby_enabled = true
        else
          @typogruby_enabled = false
        end
      end

      def convert(content)
        options = Jekyll::Utils.symbolize_hash_keys(@config["pypedown"])
        html = Kramdown::Document.new(content, options).to_html_pygments

        if @typogruby_enabled == true
          return Typogruby.improve(html)
        else
          return html
        end
      end
    end

  end
end
