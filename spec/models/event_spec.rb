RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:event) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :date }
    it { should validate_presence_of :email }
    it { should validate_length_of(:description).is_at_most(140) }
  end
end
