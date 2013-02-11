module TargetsHelper
  PAGES = {}
  IMAGE_RESOURCE_URL = "http://www.nicklally.com/wp-content/uploads/2011/10/aj7.jpg"

  def pull_site(target)
    PAGES[target.shorturl] ||=  pull_source(target)
  end

  def pull_source(target)
    require "open-uri"
    src = ""
    open(target.url) do |f|
      src << f.read
    end
    doc = Nokogiri.parse src
    doc.css("img").each do |node|
      node['src'] = IMAGE_RESOURCE_URL
    end
    doc.to_html
  end
end
