module Jekyll
  module Converters

    class Markdown::Pypedown
      def initialize(config)
        @config = config
        if @config['pypedown']
          %w[auto_ids auto_id_prefix default_lang entity_output footnote_nr smart_quotes toc_levels indent input].each do |key|
            @config['pypedown'][key] = @config['kramdown'][key] unless @config['pypedown'][key]
          end
        elsif
          @config['pypedown'] = @config['kramdown']
        end
      end

      def convert(content)
        options = Jekyll::Utils.symbolize_hash_keys(@config["pypedown"])
        html = Kramdown::Document.new(content, options).to_html_pygments

        return Typogruby.improve(html)
      end
    end

  end
end
