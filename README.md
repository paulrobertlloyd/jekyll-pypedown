jekyll-pypedown
===============

A Jekyll plugin that enables Pygments syntax highlighting for kramdown-parsed fenced code blocks, and adds typographic styling hooks using Typogruby.

## Installation

1. Add `gem 'jekyll-pypedown'` to your site's Gemfile
2. Add the following lines to your site's `_config.yml`:

```yaml
markdown: Pypedown

gems:
  - jekyll-pypedown
```

## Usage

### Syntax highlighting with Pygments

By default, Jekyll only uses Pygments to highlight code contained within Liquid `{% highlight %}` tags. This plugin adapts Kramdown so that it uses Pygments for fenced code blocks too, meaning you can use more Markdown and less Liquid. For example:

    ~~~ ruby
    print "Hello World"
    ~~~

If you prefer, setting `input: GFM` in Pypedown's config will enable Github flavored code fencing:

    ``` ruby
    print "Hello World"
    ```

Inline code spans can also be highlighted:

    Or inline code like this: `\section{foo}`{:.language-latex}

### Typographic improvments with Typogruby

Content is filtered through [Typogruby](http://avdgaag.github.io/typogruby/) by [Arjan van der Gaag](http://arjanvandergaag.nl/). This adds classes to HTML documents, which can be styled with CSS to make your text look better. For example:

    "Typogruby makes HTML look smarter & better, don't you think?"

is turned into:

~~~ html
<span class="dquo">&ldquo;</span>Typogruby makes
<span class="caps">HTML</span> look smarter
<span class="amp">&amp;</span> better,
don&rsquo;t you&nbsp;think?&rdquo;
~~~

## Configuration

Pypedown accepts a number of [kramdown configuaration options](http://kramdown.gettalong.org/options.html), as well as a few specific to Pypedown. Here are the accepted values alongside their defaults:

```yaml
pypedown:
  auto_ids: # true
  auto_id_prefix: # nil
  default_lang: # nil
  entity_output: # :as_char
  footnote_nr: # 1
  smart_quotes: # lsquo,rsquo,ldquo,rdquo
  toc_levels: # 1..6
  typogruby: # true
  indent: # 4
  input: # nil
```

## Tested with

* ruby 2.1.2p95
* jekyll 2.4.0
* kramdown 1.4.2
* pygments.rb 0.6.0
* typogruby 1.0.17

## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request

## Acknowledgements

Based on [an initial idea](http://bloerg.net/2013/03/07/using-kramdown-instead-of-maruku.html) by [Matthias Vogelgesang](http://bloerg.net/), and the following plugins:

* [krampygs](https://github.com/navarroj/krampygs) by [Juan Antonio Navarro Pérez](http://nokyotsu.com/research/)
* [Kramdown with Pygments](https://github.com/mvdbos/kramdown-with-pygments) by [Matthijs van den Bos](https://github.com/mvdbos)
