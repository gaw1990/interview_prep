# Step 1. 
# Impliment a singly linked list as simply as possible

class Node

  attr_accessor :data, :next_node

  def initialize(data, next_node)
    @data = data
    @next_node = next_node
  end

end


# Step 2.
# Write a function that takes the 1st node and integer n and returns the nth node down
# the chain.

def nth_node(node_one, n)
  current_node = node_one
  (n-1).times do 
    current_node = current_node.next_node
  end
  current_node
end 

# Step 3.
# Write a function that takes the first node of a system and theinteger n and removes the 
# nth node from a list, but maintains the integrity of the linked list 
# eg. (n1->n2->n3)=>(minus n2)=>(n1->n3)

def remove_nth_node(node_one, n)
  node_to_remove = nth_node(node_one, n)
  previous_node = nth_node(node_one, (n-1))
  previous_node.next_node = node_to_remove.next_node
  #delete node_to_remove
end

# Step 3.5 
# Write a function that takes a node and deletes it, but maintains the integrity of the list
def remove_node(node)
  next_node = node.next_node
  node.data = next_node.data
  node.next_node = next_node.next_node
end

# Step 4. 
# Write a function that removes all nodes with a specific value


def remove_elements_with_val(node_one, val)
  node = node_one
  loop do 
    break if node.next_node == nil
    remove_node(node) if node.data == val
    node = node.next_node
  end
end




describe 'singley linked list system' do
  let(:lone_node) {Node.new("I'm all alone :(", nil)}
  let(:node1) {Node.new("I'm node one!", node2)}
  let(:node2) {Node.new("I'm node two!", node3)}
  let(:node3) {Node.new("I'm node three!", node4)}
  let(:node4) {Node.new("I'm node four!", node5)}
  let(:node5) {Node.new("I'm node five!", node6)}
  let(:node6) {Node.new("I'm node six!", nil)}

  describe 'Node' do 

    it 'can point to another node' do
      expect(node1.next_node).to eq(node2)
    end

    it 'can hold basic data' do
      expect(node1.data).to eq("I'm node one!")
    end
  end

  describe 'nth_node' do

    it 'finds the 1st node of a 1 node set' do
      expect(nth_node(lone_node, 1)).to eq(lone_node)
    end

    it 'finds the 3rd node of a 6 node set' do
      expect(nth_node(node1, 3)).to eq(node3)
    end
  end

  describe 'remove_nth_node' do
    it 'removes the 3rd node of a 6th node system' do
      remove_nth_node(node1, 3)
      expect(node2.next_node).to eq(node4)
    end
  end

  describe 'remove_elements_with_val' do
    it 'removes any elements in a 6 node set with value \'I\'m node two!\'' do
      remove_elements_with_val(node1, "I'm node two!")
      expect(node1.next_node.data).to eq("I'm node three!")
    end
  end
end