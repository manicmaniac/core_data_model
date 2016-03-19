require 'test_helper'

class UserInfoTest < Minitest::Test
  XML = <<-XML.freeze
  <userInfo>
    <entry key="foo" value="bar" />
    <entry key="qux" value="quux" />
  </userInfo>
  XML
  HASH = { 'foo' => 'bar', 'qux' => 'quux' }.freeze

  def setup
    @user_info = ParseHelper.parse(XML).user_info
  end

  def test_entries
    assert_equal 2, @user_info.entries.count
  end

  def test_access_key
    assert_equal 'bar', @user_info['foo']
  end

  def test_to_hash
    assert_equal HASH, @user_info.to_hash
  end

  class ParseHelper
    include SAXMachine

    element :userInfo, as: :user_info, class: CoreDataModel::UserInfo
  end
end
