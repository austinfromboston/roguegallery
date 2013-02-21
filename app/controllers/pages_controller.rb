class PagesController < ApplicationController
  TARGET_PAGE="http://nicklally.com"

  skip_authorization_check

  def root
    @target = Target.order("RANDOM()").first
    render "thief", layout: false
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
      node['src'] = image_path "aj7.jpg"
    end
    doc.to_html
  end

end
