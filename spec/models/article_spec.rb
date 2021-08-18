require "rails_helper"

RSpec.describe Article, type: :model do

    context 'create new article' do
      subject do
        Article.create(
          user_id: 1,
          title: 'Test title',
          body: 'Test Test')
      end
      it 'article-title should be a string' do
        expect(subject.title).to be_a(String)
      end
        it 'article-body should be a string' do
        expect(subject.body).to be_a(String)
      end
      it 'timestamps should be DateTime' do
        expect(subject.created_at).to be_falsey
      end
      it 'user_id should be 1' do
        expect(subject.user_id).to eq(1)
      end
    end

    context 'edit article item' do
      subject do
        Article.create(
          user_id: 1,
          title: 'Test title',
          body: 'Test Test')
      end
      it 'article should be edit title and body' do
        subject.update(title: 'Test article after edit', body: 'Test article body after edit')
        expect(subject.title).to eq('Test article after edit')
        expect(subject.body).to eq('Test article body after edit')
      end
    end

end
