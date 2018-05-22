require 'singleton'

class Cache
  include Singleton
  
  def initialize
    @cacheMutex = Mutex.new
    @cacheStore ||= {}
  end

  def synchronize(&block)
    # to see what it does without the mutex in this example:
    # 1) comment this line
    @cacheMutex.synchronize(&block)
    # 2) uncomment this line
    # yield
  end

  def put(key, value)
    raise "key must be an Object" unless key.kind_of? Object
    raise "value must be an Object" unless value.kind_of? Object
    synchronize do
      if !@cacheStore.has_key?(key)
        @cacheStore[key] = value
      end

      @cacheStore[key]
    end
  end

  def get(key)
    raise "key must be an Object" unless key.kind_of? Object
    synchronize do
      @cacheStore[key]
    end
  end
end