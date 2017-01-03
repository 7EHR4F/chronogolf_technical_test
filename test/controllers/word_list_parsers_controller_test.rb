require 'test_helper'

class WordListParsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_list_parser = word_list_parsers(:one)
  end

  test "should get index" do
    get word_list_parsers_url
    assert_response :success
  end

  test "should get new" do
    get new_word_list_parser_url
    assert_response :success
  end

  test "should create word_list_parser" do
    assert_difference('WordListParser.count') do
      post word_list_parsers_url, params: { word_list_parser: {  name: "test", wordlist: Rack::Test::UploadedFile.new('wordlist.txt', 'text/x-c') } }
    end

    assert_redirected_to word_list_parser_url(WordListParser.last)
  end

  test "should show word_list_parser" do
    get word_list_parser_url(@word_list_parser)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_list_parser_url(@word_list_parser)
    assert_response :success
  end

  test "should update word_list_parser" do
    patch word_list_parser_url(@word_list_parser), params: { word_list_parser: {   name: "test", wordlist_file_name: 'wordlist.txt', wordlist_content_type: 'text/x-c', wordlist_file_size: 1.megabyte, wordlist_updated_at: DateTime.now} }
    assert_redirected_to word_list_parser_url(@word_list_parser)
  end

  test "should destroy word_list_parser" do
    assert_difference('WordListParser.count', -1) do
      delete word_list_parser_url(@word_list_parser)
    end

    assert_redirected_to word_list_parsers_url
  end
end
