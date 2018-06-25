require 'rails_helper'

RSpec.describe Types::Null do
  subject { described_class.new }

  describe '.new' do
    it 'initializes with default arguments' do
      described_class.new
    end

    it 'can be initialized with type' do
      described_class.new(String)
    end
  end

  describe '.of' do
  end

  describe '.default' do
    it 'returns instance of null object' do
      expect(described_class.default).to be_kind_of(described_class)
    end

    it 'returns singleton instance' do
      obj1 = described_class.default
      obj2 = described_class.default
      expect(obj1.object_id).to eq(obj2.object_id)
    end
  end

  it { expect(subject).to be_nil }
  it { expect(subject).to be_empty }
  it { expect(subject).to be_blank }
  it { expect(subject).not_to be_present }
  it { expect(subject.presence).to eq(subject) }

  describe 'missing method' do
    subject { described_class.new(String) }

    it 'raises NoMethodError with method and type names' do
      expect { subject.some_method }.to raise_error(
        NoMethodError, 
        /.+?some_method.+?String.*/
      )
    end
  end
end