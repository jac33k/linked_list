RSpec.describe LinkedList::Node do

  let!(:node1) { described_class.new(1) }
  let!(:node2) { described_class.new(2, node1) }
  let!(:node3) { described_class.new(3, node2) }

  it 'links nodes correctly' do
    expect(node3.next_node).to eq node2
    expect(node2.next_node).to eq node1
    expect(node3.next_node.next_node).to eq node1
  end

  it 'sets values for nodes' do
    expect(node3.value).to eq 3
    expect(node3.next_node.value).to eq 2
    expect(node3.next_node.next_node.value).to eq 1
  end

end
