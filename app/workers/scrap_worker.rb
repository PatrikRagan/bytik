class ScrapWorker

  include Sidekiq::Worker
  sidekiq_options retry: true
  def perform
    # do something
    @flats_links = Array[]
    @url = "http://www.nehnutelnosti.sk/kosice-i-sever/2-izbove-byty/predaj?p[param7]=14&p[foto]=1&p[page]=1"
    doc = Nokogiri::HTML(open(@url))
    doc.xpath("//div[@class='advertisement-head ']/h2/a").each do |item|
      puts
      xxx = item.to_s.match(/http:\/\/([^"]*)/)
      @flats_links.push(xxx.to_s)
    end
    @flats_links.reverse.each do |item|
      innerpage = Nokogiri::HTML(open(item))
      flat_content = innerpage.at_css(".popis").to_s.downcase
      flat_content = ActionView::Base.full_sanitizer.sanitize(flat_content)
      active_order = Flat.create(:name => item.to_s, :content => flat_content,  :date_of_scrap => DateTime.now)
      active_order.save
    end

  end

end