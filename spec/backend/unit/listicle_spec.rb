describe Listicle do
  it { is_expected.to be_a Listicle }

  describe 'Initialisation' do
    it 'has a list of prefixes' do
      expect(subject.prefixes).to be_a Array
    end

    it 'has a list of suffixes' do
      expect(subject.suffixes).to be_a Array
    end
  end

  describe '#generate' do
    it { is_expected.to respond_to :generate }

    it 'returns a listicle string' do
      expect(subject.generate(5)).to eq('Top 5 ways to run tests.')
    end
  end
end
