class Tree
  attr_accessor :children, :node_name

  def initialize name_or_data, children=[]
    if name_or_data.respond_to? :keys
      @node_name = name_or_data.keys.first
      @children = name_or_data[@node_name].collect do |k,v|
        Tree.new k => v
      end
    else
      @children = children
      @node_name = name_or_data
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

ruby_tree = Tree.new( "Ruby",
                      [Tree.new("Reia"),
                       Tree.new("MacRuby")])
puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name }

puts "Family tree"
tree = Tree.new 'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle'=> {'child 3' => {}, 'child 4' => {} }}

tree.visit_all  { |node| puts node.node_name }
