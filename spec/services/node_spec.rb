require 'rails_helper.rb'
require 'rgl/adjacency'
require 'rgl/dot'

RSpec.describe "create directed graph of people" do
  dg = RGL::DirectedAdjacencyGraph['tom','jane' ,'jane','jill' ,'tom','jill' ,'tom','bill' ,'jill','bob' ,'bob','tom' ,'bill','jill' ,'bill','jim' ,'jim','nancy' ,'nancy','jill' ,'jane','nancy' ,'susan','jim', 'pete','bill' ,'ted','pete' ,'pete','nancy' ,'ted','tom' ,'ted','bill' ,'bill','jane' ,'pete','susan' ,'susan','jane', 'susan','bill' ,'jane','bob' ,'bob','jill' ,'bob','nancy' ,'nancy','jane' ,'nancy','jim' ,'bob','jane' ,'jim','bob' ,'jim','susan' ,'jill','jane' ,'jill','tom']
  #edges = dg.edges
  graphService = Graph.instance
  
  dg.edges.each do |n|
    tmp = n.to_s.split('-')
    left = tmp[0].split('(')[1]
    right = tmp[1].split(')')[0]
    #n = new Node(left)
    puts left + ' : ' + right
  end
  dg.write_to_graphic_file('jpg')
end
