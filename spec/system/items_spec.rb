require 'rails_helper'

RSpec.describe "商品検索", type: :system do
  before do
    @item = FactoryBot.create(:item)
  end

  context '商品検索ができるとき' do
    it '検索したキーワード名の商品がある時表示される' do
      # トップページに移動する
        visit root_path
      # フォームにキーワードを入力する
        fill_in 'キーワードから探す', with: @item.name
      # 検索結果ページに遷移する
        find('button[class="search-button"]').click
      # 検索結果ページに検索キーワードの商品が存在することを確認する
        expect(page).to have_content(@item.name)
    end
  end

  context '商品検索ができない時' do
    it '検索したキーワード名の商品がない時、メッセージが表示される' do
      # トップページに移動する
        visit root_path
      # フォームにキーワードを入力する
        fill_in 'キーワードから探す', with: "aaaaaaaa"
      # 検索結果ページに遷移する
        find('button[class="search-button"]').click
      # 検索結果ページに「該当する商品はありませんでした」の文字が存在することを確認する
        expect(page).to have_content("該当する商品はありませんでした")
    end

    it '何も入力せず送信ボタンを押した時、メッセージが表示される' do
      # トップページに移動する
        visit root_path
      # 検索結果ページに遷移する
        find('button[class="search-button"]').click
      # 検索結果ページに「検索ワードを入力してください」の文字が存在することを確認する
        expect(page).to have_content("検索ワードを入力してください")
    end
  end
end
