require 'singleton'

class Graph
  include Singleton
  
  def initialize
    @nodeMutex = Mutex.new
    @nodeMap ||= {}
  end

  def synchronize(&block)
    @cacheMutex.synchronize(&block)
  end

  def put(key, node)
    synchronize do
      if !@nodeMap.has_key?(key)
        @nodeMap[key] = node
      end

      @nodeMap[key]
    end
  end

  def get(key)
    synchronize do
      @nodeMap[key]
    end
  end
end