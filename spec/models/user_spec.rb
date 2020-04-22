RSpec.describe User, type: :model do
    describe 'DB table' do
        it { is_expected.to have_db_column :id }
        it { is_expected.to have_db_column :email }
        it { is_expected.to have_db_column :name }
    end

    describe 'Validations' do
        it { is_expected.to validate_presence_of :name }
    end

    describe 'factory' do
        it 'has a valid factory' do
            expect( create( :user) ).to be_valid
        end
    end

end