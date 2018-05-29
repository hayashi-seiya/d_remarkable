class Scraping::DisneyLand
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

      # TODO: ul.wait-timeないのh4を取り出せるように
      doc.xpath("//h4").each do |node|
        puts node.inner_text
      end
    end

    def document_by_html
      html = open(url).read

      # 文字ボケの対策のために強制的にutf-8に変換
      # ref: https://qiita.com/foloinfo/items/435f0409a6e33929ef3c
      Nokogiri::HTML.parse(html, nil, "utf-8")
    end
end
