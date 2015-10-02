RSpec.describe LinkedList::Utils::PrintReversed do
  let(:node1) { LinkedList::Node.new(1) }
  let(:node2) { LinkedList::Node.new(2, node1) }
  let(:node3) { LinkedList::Node.new(3, node2) }

  let(:print_reversed) { described_class.new }

  it 'prints reversed list' do
    expect{ print_reversed.(node3) }.to output(/3 --> 2 --> 1 --> nil/).to_stdout_from_any_process
    expect{ print_reversed.(node3) }.to output(/1 --> 2 --> 3 --> nil/).to_stdout_from_any_process
  end

  it 'does not use mutation' do
    print_reversed.(node3)

    expect(node3.next_node).to eq node2
    expect(node2.next_node).to eq node1
    expect(node3.next_node.next_node).to eq node1
  end
end
