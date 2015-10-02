RSpec.describe LinkedList::Utils::FloydsCheck do

  let(:node1) { LinkedList::Node.new(1) }
  let(:node2) { LinkedList::Node.new(2, node1) }
  let(:node3) { LinkedList::Node.new(3, node2) }
  let(:node4) { LinkedList::Node.new(4, node3) }

  let(:floyds_check) { described_class.new }

  context 'linked list does not have cycles' do
    it 'returns false' do
      expect(floyds_check.(node4)).to be_falsey
    end
  end

  context 'linked list has cycles' do
    before do
      node2.next_node = node4
    end

    it 'returns true' do
      expect(floyds_check.(node4)).to be_truthy
    end
  end
end
