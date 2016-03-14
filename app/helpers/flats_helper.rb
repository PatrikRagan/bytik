#encoding: UTF-8
module FlatsHelper

  def nehnutelnosti_crawler(url, room_count, searchkeyword)

    doc = Nokogiri::HTML(open(url))
    keywords_balcony = Array['balkonom','balkónom','balkon','balkón', 'balkónu','balkonu','balkóna','balkona','loggia','loggiu','loggie','loggiou']
    keywords_without_balcony = Array['bez balkonom','bez balkónom','bez balkon','bez balkón', 'balkónu','bez balkonu','bez balkóna','bez balkona']
    @flats_links = Array[]
    wanted_flats = Array[]

    doc.xpath("//div[@class='advertisement-head ']/h2/a").each do |item|
      puts
      xxx = item.to_s.match(/http:\/\/([^"]*)/)
      @flats_links.push(xxx.to_s)
    end

    @flats_links.reverse.each do |item|
      if Flat.where(:name=> item.to_s).exists?
        next
      end
      innerpage = Nokogiri::HTML(open(item))
      #Rails.logger.debug "#{innerpage}"
      flat_content = innerpage.at_css(".popis").to_s.downcase
      flat_content = ActionView::Base.full_sanitizer.sanitize(flat_content)
      #Rails.logger.debug "#{flat_content}"
      unless innerpage.at_css("#data-price").nil?
        flat_price = innerpage.at_css("#data-price").text.to_s.gsub(/\s+/, "")
        flat_price_i = flat_price[0, flat_price.length - 1].to_i
        #debugger
        if flat_price_i >80000
          next
        end
      end
      #puts "#{innerpage.at_css(".popis").to_s.downcase}"
      #puts
      unless innerpage.at_css(":nth-child(7) strong").nil?
        flat_date_of_creation = innerpage.at_css(":nth-child(7) strong").text.to_s.gsub(/\s+/, "")
      end

      matched = keywords_balcony.any? do |w|
        flat_content =~ /#{w}/
      end

      Integer key_identifier = 0
      #debugger
      if Searchkey.where(keysearch:"#{searchkeyword}").exists?
        key_identifier = Searchkey.where(keysearch:"#{searchkeyword}").first.id
      else
        Searchkey.new(keysearch:"#{searchkeyword}").save
        key_identifier = Searchkey.where(keysearch:"#{searchkeyword}").first.id
      end
      if matched
        wanted_flats.push(item)
        #Rails.logger.debug "#{wanted_flats}"
        #Rails.logger.debug "#{Flat.where(:name=> item.to_s).exists?}"
        unless Flat.where(:name=> item.to_s).exists?
          active_order = Flat.create(:name => item.to_s, :content =>flat_content, :price=>flat_price, :date=>DateTime.now,
                                     :room=>room_count, :searchkey_id=>key_identifier, :date_of_creation=>flat_date_of_creation)
          active_order.save
        end
      end
    end
  end

  def bazos_crawler(url, room_count, searchkeyword)
    #debugger
    @doc = Nokogiri::HTML(open(url))
    @flats_links = Array[]
    wanted_flats = Array[]
    keywords_balcony = Array['balkonom','balkónom','balkon','balkón', 'balkónu','balkonu','balkóna','balkona','loggia','loggiu','loggie','loggiou']
    keyword_sever = Array['sever', 'severu', 'severe','hlinkova','kuzmanyho','tomasikova']

    #debugger
    @doc.xpath("//span[@class=\"nadpis\"]/a").each do |item|
      page_link_regexp = item.to_s.match('\inzerat(.*).php')
      page_link="http://reality.bazos.sk/#{page_link_regexp}"
      @flats_links.push(page_link.to_s)
    end

    @flats_links.reverse.each do |item|
      #if url =="http://reality.bazos.sk/predam/byt-3-1/105?hledat=&hlokalita=04001&humkreis=10&cenaod=&cenado=80000&order="
      #  debugger
      #end

      if Flat.where(:name=> item.to_s).exists?
        next
      end
      innerpage = Nokogiri::HTML(open(item))
      #Rails.logger.debug "#{innerpage}"
      flat_content = innerpage.at_css(".popis").to_s.downcase
      flat_content = ActionView::Base.full_sanitizer.sanitize(flat_content)
      unless innerpage.at_css(".listal b:nth-child(2)").nil?
        flat_price = innerpage.at_css(".listal b:nth-child(2)").text.to_s.gsub(/\s+/, "")
      end
      unless innerpage.at_css(".velikost10").nil?
        flat_date_of_creation = innerpage.at_css(".velikost10").text.to_s.gsub(/\s+/, "")
        flat_date_of_creation = flat_date_of_creation.match('\d(.*)[^\]]')
      end

      balcon_matched = keywords_balcony.any? do |w|
        flat_content =~ /#{w}/
      end
      flat_header = ActionView::Base.full_sanitizer.sanitize(innerpage.at_css(".nadpis").to_s.downcase)
      page_header_sever_matched = keyword_sever.any? do |w|
        flat_header.to_s =~ /#{w}/
      end
      page_content_sever_matched = keyword_sever.any? do |w|
        flat_content =~ /#{w}/
      end
      Integer key_identifier = 0
      #debugger
      if Searchkey.where(keysearch:"#{searchkeyword}").exists?
        key_identifier = Searchkey.where(keysearch:"#{searchkeyword}").first.id
      else
        Searchkey.new(keysearch:"#{searchkeyword}").save
        key_identifier = Searchkey.where(keysearch:"#{searchkeyword}").first.id
      end
      if page_header_sever_matched || page_content_sever_matched
        sever_contained = true
      elsif
      sever_contained = false
      end
      if balcon_matched && sever_contained
        wanted_flats.push(item)
        #Rails.logger.debug "#{wanted_flats}"
        #Rails.logger.debug "#{Flat.where(:name=> item.to_s).exists?}"
        unless Flat.where(:name=> item.to_s).exists?
          active_order = Flat.create(:name => item.to_s, :content =>flat_content, :price=>flat_price, :date=>DateTime.now,
                                     :room=>room_count, :searchkey_id=>key_identifier, :date_of_creation=>flat_date_of_creation[0])
          active_order.save
        end
      end
    end
  end

end
