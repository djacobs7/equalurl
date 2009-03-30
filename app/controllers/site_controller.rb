class SiteController < ApplicationController
  
  SITE_URL = 'http://equalurl.com/'
  
  def create_new_link
    url = params[:url]
    begin
      random_string = generate_url(url)
      CACHE.set( random_string, url )
      redirect_to "/show/#{random_string}"
    rescue
      redirect_to "/too_short?attempted_url=#{url}"
    end
  end
  
  def redirect_to_link
    url = CACHE.get(params[:key])
    redirect_to url
  end
  
  def show
    @key = params[:key]
    @real_url = CACHE.get(params[:key])
  end
  
  def too_short
    @attempted_url = params[:attempted_url]
  end
  
  private
  
    def generate_url(url)
      raise 'too short' if url.size < (SITE_URL.size + 1)
      characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
      random_string = ''
      1.upto(url.size - SITE_URL.size) do
        random_string << characters.rand
      end
      random_string
    end
end
