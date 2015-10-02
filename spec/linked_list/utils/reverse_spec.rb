RSpec.describe LinkedList::Utils::Reverse do

  let(:reverse) { described_class.new }

  context 'not memoized nodes' do
    def node1
      LinkedList::Node.new(1)
    end

    def node2
      LinkedList::Node.new(2, node1)
    end

    def node3
      LinkedList::Node.new(3, node2)
    end

    it 'prints reversed list' do
      expect{ reverse.(node3) }.to output(/3 --> 2 --> 1 --> nil/).to_stdout_from_any_process
      expect{ reverse.(node3) }.to output(/1 --> 2 --> 3 --> nil/).to_stdout_from_any_process
    end
  end

  context 'memoized nodes' do
    let(:node1) { LinkedList::Node.new(1) }
    let(:node2) { LinkedList::Node.new(2, node1) }
    let(:node3) { LinkedList::Node.new(3, node2) }

    it 'uses mutation' do
      reverse.(node3)

      expect(node1.next_node).to eq node2
      expect(node2.next_node).to eq node3
      expect(node1.next_node.next_node).to eq node3
    end
  end
end
