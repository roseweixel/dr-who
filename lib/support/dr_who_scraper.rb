class DrWhoScraper
  URL = "http://www.thedoctorwhosite.co.uk/doctorwho/"
  attr_accessor :url, :nokogiri_doc, :doctors, :doctor_items
  def initialize
    @url = URL
    @nokogiri_doc = Nokogiri::HTML(open(url))
    @doctors = []
    @doctor_items = nokogiri_doc.css('ul.col-5 li')
  end

  def get_doctors
    @doctor_items.each do |item|
      if is_numable?(item)
        doctor_string = item.children.last.text
        doctor_parts = doctor_string.scan(/(The \d+\w+ Doctor)(\w+ \w+)/).flatten
        @doctors << {name: doctor_parts[0], actor: doctor_parts[1], number: get_number(item)}
      end
    end
    @doctors.uniq!
  end

  def get_number(doctor_item)
    num_string = doctor_item.children.last.text.split[1]
    Chronic::Numerizer.numerize(num_string).to_i
  end

  def is_numable?(doctor_item)
    info_array = doctor_item.children.last.text.split
    info_array[1][0].to_i != 0
  end
end


  # def featured_titles
  #   featured_titles = nokogiri_doc.css('div#featured h1.title a')
  #   featured_titles.each_with_index do |item, index|
  #     name = item.text
  #     #binding.pry
  #     url = item.attributes["href"].value
  #     @articles << Article.new(name, url)
  #     puts "#{index+1}. #{name}"
  #   end
  # end