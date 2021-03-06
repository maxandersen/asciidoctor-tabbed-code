require "asciidoctor-tabbed-code/version"

require 'asciidoctor/extensions'

# An extension that tabs code blocks
# port of https://github.com/bmuschko/asciidoctorj-tabbed-code-extension

include Asciidoctor::Logging

# Usage, see sample.adoc
module Asciidoctor
  module Tabbed
    module Code
      class TabbedCode < Asciidoctor::Extensions::DocinfoProcessor
      use_dsl
      logger.error message_with_context "in tabbedcode"

      TABBED_CODE_CSS_FILE_PATH_ATTRIBUTE = "tabbed-code-css-path"
      TABBED_CODE_JS_FILE_PATH_ATTRIBUTE = "tabbed-code-js-path"
      DEFAULT_CSS_FILE_PATH = "/codeBlockSwitch.css"
      DEFAULT_JS_FILE_PATH = "/codeBlockSwitch.js"

      def process doc
        
        if (doc.basebackend? 'html')
          extdir = ::File.join(::File.dirname __FILE__)
          cssPath = DEFAULT_CSS_FILE_PATH unless doc.attributes[TABBED_CODE_CSS_FILE_PATH_ATTRIBUTE]
          jsPath = DEFAULT_JS_FILE_PATH unless doc.attributes[TABBED_CODE_JS_FILE_PATH_ATTRIBUTE]
          css = doc.read_asset %(#{extdir}/#{cssPath})
          js = doc.read_asset %(#{extdir}/#{jsPath})
          return modifyHeadHtml(css, js)
        end
      end

      def modifyHeadHtml css, js
        ['<style>', css, '</style>',
        '<script src="https://cdnjs.cloudflare.com/ajax/libs/zepto/1.2.0/zepto.min.js"></script>',
        '<script type="text/javascript">', js, '</script>'] * "\n"
      end
    end
  end
end
end

Asciidoctor::Extensions.register :markup do
  docinfo_processor Asciidoctor::Tabbed::Code::TabbedCode
end
