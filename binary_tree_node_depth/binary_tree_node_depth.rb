# Given a binary tree, find its maximum depth.
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)

  return 0 if root == nil
  
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  if left_depth > right_depth
    return left_depth + 1
  else
    return right_depth + 1
  end

end



describe 'max_depth' do 
  let(:root_node) {TreeNode.new(1)}
  let(:nodeL) {TreeNode.new(1)}
  let(:nodeR) {TreeNode.new(1)}
  let(:nodeRL) {TreeNode.new(1)}

  it 'returns the max depth of a node system' do
    root_node.left = nodeL
    nodeR.left = nodeRL
    expect(max_depth(root_node)).to eq(2)
  end

end