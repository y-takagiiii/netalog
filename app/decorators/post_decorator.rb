class PostDecorator < Draper::Decorator
  delegate_all

  def with_hash_tags
    search_word_array = object.video.search_word.split(/[\p{blank}\s]+/)
    search_word_array.map { |word| "%23" + word }.join("%20")
  end
end
