
count = 0
(1..16).each do |item|
  print "#{item} "
  #count = (count + 1)
  #puts if (count % 4) == 0
  puts if ((count = count + 1)  % 4) == 0
end

(1..16).each_slice(4) do |slice|
  puts slice.join(" ")
end


class Tree
  attr_accessor :children, :node_name

  def initialize name, children=[]
    @children = children
    @node_name = name
  end

  def initialize tree={}
    tree.keys.each do |key|
      @node_name = key
      @children = Tree.new # TODO
    end
  end

  def visit_all &block
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit &block
    block.call self
  end
end

tree = Tree.new 'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle'=> {'child 3' => {}, 'child 4' => {} }}

tree.visit_all  { |node| puts node.node_name }
