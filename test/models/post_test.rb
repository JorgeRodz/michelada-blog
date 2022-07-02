require "test_helper"

class PostTest < ActiveSupport::TestCase
  test 'it is not valid without title' do
    post = Post.new

    assert_not post.valid?
    assert_equal ["can't be blank"], post.errors.messages[:title]
  end

  test 'it is not valid without content' do
    post = Post.new

    #binding.irb
    assert_not post.valid?
    assert_equal ["can't be blank"], post.errors.messages[:content]
  end

  test 'it is valid with title and content' do
    post = Post.new(title: 'My post', content: 'My new blog post')

    assert post.valid?
  end
end
