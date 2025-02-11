require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :text}

    let(:user){create(:user)}
    it "is valid with a title and text of valid length" do
      article = Article.new(title:"0123456789", text:"0123456789", user: User.first)
      expect(article).to be_valid
    end  
      it "is valid with a title longer of valid length" do
      article = Article.new(title:"0"*141, text:"0123456789", user: User.first)
      expect(article).not_to be_valid
    end  
      it "is valid with a text longer of valid length" do
      article = Article.new(title:"0"*10, text:"0"*4001, user: User.first)
      expect(article).not_to be_valid
    end  
      it "is valid with a title shorter of valid length" do
      article = Article.new(title:"0"*8, text:"0"*400, user: User.first)
      expect(article).not_to be_valid
    end
      it "is valid with a text shorter of valid length" do
      article = Article.new(title:"0"*10, text:"0"*5, user: User.first)
      expect(article).not_to be_valid
    end
  end
   describe "assotiations" do 
  it { should have_many :comments}
  it { should belong_to :user}
  end

  describe "#subject" do
    
    let(:article) { create(:article, title: '0123456789', user: User.first) }

    it "returns the title as subject" do
      expect(article.subject).to eq '0123456789'
    end
  end

  describe "#last_comment" do

    let(:comment) {create(:comment, body: 'cmbdy67891', article: Article.first)}
    it "returns the last comment" do
      expect(comment.body).to eq 'cmbdy67891'
    end
  end


  describe "#last_comment" do
      let(:article){create(:article, :with_comments, user: User.first)}
    it "returns the last of 3 comments" do
      expect(article.last_comment.body).to eq "Comment body 3"
    end
  end
end