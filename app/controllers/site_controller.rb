class SiteController < ApplicationController
  
  require 'cgi'
  
  SITE_URL = 'http://equalurl.com/'
  
  def create_new_link
    url = (params[:url])
    url = formalize_url(url)
    if url.size < (SITE_URL.size + 1)
      url = url_with_www(url)
    end
    
    if url.size < (SITE_URL.size + 1)
      redirect_to "/too_short?attempted_url=#{url}"
    else
      random_string = generate_url(url)
      redirect_to "/show/#{random_string}"      
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
  
    def formalize_url(url)
      url.strip!
      if /^http:\/\//.match(url)
        return url
      else
        return "http://#{url}"
      end
    end
  
    def generate_url(url)
      raise 'too short' if url.size < (SITE_URL.size + 1)
      
      existing_key = CACHE.get( CGI::escape( "existing_link_#{url}") )
      if existing_key
        CACHE.set( existing_key, CGI::escape(url) )
        return existing_key
      end
      
      characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
      
      while true
        random_string = ''
        1.upto(url.size - SITE_URL.size) do
          random_string << characters.rand
        end
        
        break if !CACHE.get(random_string)
        logger.debug "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~I just had a collision with #{random_string}, which already existed as it turns out...~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      end
      
      
      CACHE.set( random_string, CGI::escape(url) )
      CACHE.set( CGI::escape( "existing_link_#{url}" ), random_string )
      random_string
    end
    
    def url_with_www(url)
      url.strip!
      important_part = /^http:\/\/(.*)$/.match(url)[1]
      if /^www\./.match(important_part)
        return url
      else
        return "http://www.#{important_part}"
      end
    end
end
