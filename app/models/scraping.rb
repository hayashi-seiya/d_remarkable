class Scraping
  require "open-uri"

  class << self
    def run
      new.run
    end
  end

  def initialize
    @url = "http://disneyreal.asumirai.info/realtime/disneyland-wait-today.html"
  end

  def run
    scraping
  end

  private

    attr_reader :url

    def scraping
      doc = document_by_html

      doc.xpath("//h4").each do |node|
        puts node.inner_text
      end
    end

    def document_by_html
      charset = nil

      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      Nokogiri::HTML.parse(html, nil, charset)
    end
end
