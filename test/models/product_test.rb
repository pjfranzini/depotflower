require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
  	@product = Product.new
    @product.invalid?
  end
  test "product attributes must not be empty" do
    assert @product.invalid?
  end
  test "title_error" do
    assert @product.errors[:title].any?
  end
  test "description_error" do
    assert @product.errors[:description].any?
  end
  test "price_error" do
    assert @product.errors[:price].any?
  end
  test "imgurl_error" do
    assert @product.errors[:image_url].any?
  end
  test "product price must be positive" do
    product = Product.new(title:       "My Book Title",
                          description: "yyy",
                            latin_name: 'Papaver Rhoes',
                          image_url:   "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], 
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end
  def new_product(image_url)
    Product.new(title:       "My Book Title",
                description: "yyy",
                price:       1,
                latin_name: 'Papaver Rhoes',
                image_url:   image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  test "product is not valid without a unique title" do
    product = Product.new(title:       products(:ruby).title,
                          description: "yyy",
                            latin_name: 'Papaver Rhoes',
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
  test "title must have a certain length" do
    product = products(:poppy)
    assert product.valid?
    # assert product.invalid?
    # assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]
  end
  #   test "latin_name must have a certain length" do
  #   product = products(:poppy)

  #   assert product.invalid?
  #   assert_equal ["is too short (minimum is 10 characters)"], product.errors[:latin_name]
  # end
end
