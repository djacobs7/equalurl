require 'memcache'

memcache_options = {
   :compression => true,
   :debug => false,
   :namespace => "mem-#{RAILS_ENV}",
   :readonly => false,
   :urlencode => false
}

memcache_servers =  ['localhost:11211']
CACHE = MemCache.new(memcache_servers)
CACHE.servers = memcache_servers