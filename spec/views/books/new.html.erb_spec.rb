require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :title => "MyString",
      :description => "MyText",
      :publication_year => 1,
      :price => "9.99",
      :height => 1,
      :weight => 1,
      :depth => 1
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[publication_year]"

      assert_select "input[name=?]", "book[price]"

      assert_select "input[name=?]", "book[height]"

      assert_select "input[name=?]", "book[weight]"

      assert_select "input[name=?]", "book[depth]"
    end
  end
end
