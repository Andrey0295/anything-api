require "rails_helper"

RSpec.describe User, type: :model do

    context 'create new user' do
      subject do
       User.create(
          email: 'testemail@bk.com',
          password: 'asdasdasd')
        #   binding.pry
      end
      it 'user-email should be a string' do
        expect(subject.email).to be_a(String)
      end
        it 'user-password should be a string' do
        expect(subject.password).to be_a(String)
      end
        it 'a password should contains min 6 symbols ' do
        expect(subject.password).to have_attributes(size: (be >= 6)) 
      end
      it 'timestamps should be DateTime' do
        expect(subject.created_at).to be_truthy
      end
      it 'user should contains id after, create' do
          expect(subject.id).to be_truthy
      end

    end
end
