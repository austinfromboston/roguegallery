class PagesController < ApplicationController
  TARGET_PAGE="http://nicklally.com"
  TARGET_PAGE="http://nytimes.com"
  TARGET_PAGE="http://danm.ucsc.edu"

  skip_authorization_check

  def root
  end

  def thief
    @@framesrc ||= pull_site
    @src = @@framesrc
    render "thief", layout: false
  end

protected

  def pull_site
    require "open-uri"
    src = ""
    open(TARGET_PAGE) do |f|
      src << f.read
    end
    doc = Nokogiri.parse src
    doc.css("img").each do |node|
      node['src'] = "http://www.nicklally.com/wp-content/uploads/2011/10/aj7.jpg"
    end
    doc.to_html
  end

end
