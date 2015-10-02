RSpec.describe LinkedList::Stack do

  let!(:node1) { LinkedList::Node.new(1) }
  let!(:node2) { LinkedList::Node.new(2, node1) }
  let!(:node3) { LinkedList::Node.new(3, node2) }

  let(:stack) { described_class.new }


  context 'basic interface' do
    it 'allows to push value on stack' do
      expect(stack.push(node1)).to include node1
    end

    it 'allows to pop value from stack' do
      stack.push(node1)
      expect(stack.pop).to eq node1
    end
  end

  context '#to_linked_list' do
    let(:linked_list) { stack.to_linked_list }

    it 'creates linked list from stack' do
      stack.push node3
      stack.push node2
      stack.push node1

      expect(linked_list.value).to eq node1.value
      expect(linked_list.next_node.value).to eq node2.value
      expect(linked_list.next_node.next_node.value).to eq node3.value
    end
  end

end
