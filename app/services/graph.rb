require 'rgl/implicit'
class Graph
  def module_graph
    RGL::ImplicitGraph.new { |g|
      g.vertex_iterator { |b|
        ObjectSpace.each_object(Module, &b)
      }
      g.adjacent_iterator { |x, b|
        x.ancestors.each { |y|
          b.call(y) unless x == y || y == Kernel || y == Object
        }
      }
      g.directed = true
    }
  end
end