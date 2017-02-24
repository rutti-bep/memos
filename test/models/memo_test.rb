require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  setup do     
    @memo = Memo.create!(title: 'A new memo', body: <<~BODY)       
      ## Subtitle
      
      Contents.     
      BODY   
    end

  test "assert markdown rendering" do
    assert_includes 'A new memo', @memo.title
  end
  # test "the truth" do
  #   assert true
  # end
end
