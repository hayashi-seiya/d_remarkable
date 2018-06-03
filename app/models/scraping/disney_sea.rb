class Scraping::DisneySea
  require "open-uri"

  class << self
    def run
      new.run
    end
  end

  def initialize
    @sea = Park.find_by(name: "sea")
    @base_url = "http://disneyreal.asumirai.info"
    @index_url = "http://disneyreal.asumirai.info/realtime/disneysea-wait-today.html"
  end

  def run
    scraping
  end

  private

  attr_reader :sea, :base_url, :index_url

  def scraping
    # attractionにまとめて保存する用の配列
    attraction_params = []

    doc = document_by_index_url
    attractions = doc.xpath("//ul[@class='wait-time']/li")
    attractions.each do |attraction|
      attraction_param = sea.attractions.build

      # アトラクション名
      attraction_param.name = attraction.xpath("a/ul/li[@class='about']/h4").text

      attraction_url = attraction.xpath("a").attribute("href").value # attraction 詳細ページへのリンク
      attraction_documents = document_by_attraction_url(attraction_url)
      attraction_documents.xpath("//table[@class='realtime']").each do |attraction_document|
        # 待ち時間
        waiting_time = attraction_document.xpath("//td[@class='waittime']").text.strip
        attraction_param.waiting_time = waiting_time

        # 営業時間
        # ref: https://goo.gl/HLGbfD
        business_hours = attraction_document.xpath("//th[contains(text(), '運営時間')]/following-sibling::td[1]").text
        attraction_param.business_hours_open = business_hours.split("–")[0]
        attraction_param.business_hours_close = business_hours.split("–")[1]
      end

      attraction_params << attraction_param
    end

    Attraction.import(attraction_params)
  end

  # TODO: テスト書き終わったらこのコメントは消す
  # ラッパーメソッドにしておけばテストの時にスタブ化できそう
  def document_by_index_url
    html = open(index_url).read

    # 文字化け対策のために強制的にutf-8に変換
    # ref: https://qiita.com/foloinfo/items/435f0409a6e33929ef3c
    Nokogiri::HTML.parse(html, nil, "utf-8")
  end

  def document_by_attraction_url(attraction_url)
    attraction_url.slice!("..") # ../attraction/tl_spmountain.html のようになっているため

    html = open(base_url + attraction_url).read
    Nokogiri::HTML.parse(html, nil, "utf-8")
  end
end
