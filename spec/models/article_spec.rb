require 'rails_helper'

RSpec.describe "Articleモデルのテスト", type: :model do
  context "データが正しく保存される" do
    before do
      @article = Article.new
      @article.title = "Hello World"
      @article.body = "今日も晴れです。"
      @article.member_id = 1
      @article.category_id = 1
      @article.save
    end
    it "全て入力してあるので保存される" do
      expect(@article).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @article = Article.new
      @article.title = ""
      @article.body = "今日も晴れです。"
      @article.member_id = 1
      @article.category_id = 1
      @article.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@article).to be_invalid
      expect(@article.errors[:title]).to include("を入力してください")
    end
  end
  describe "アソシエーションのテスト" do
    context "Memberモデルとの関係" do
      it "N:1となっている" do
        expect(Article.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end
  end
end
