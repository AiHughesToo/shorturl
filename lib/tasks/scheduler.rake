desc 'clean up links'
task :clean_url_links => environment do
  require 'net/http'
  @links = Link.all

  @links.each do |link|
    # lets see if this url uses ssl. if so we want to know.
    # as testing ssl urls with req.use_ssl off may result in false fail

    if link.main_url[0...5] == 'https'
      secure = true
      else secure = false
    end
    url = URI.parse(link.main_url)
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = secure
    res = req.request_head(url.path)
    if res.code == '404'
      link.destroy!
    end
  end
end