module TargetsHelper
  PAGES = {}
  IMAGE_RESOURCE_URL = "aj72.jpg"

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
      node['src'] = image_path(IMAGE_RESOURCE_URL)
    end
    doc.to_html
  end
end
