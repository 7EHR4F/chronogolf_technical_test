class WordListParser < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, :within => 4..20
  has_attached_file :wordlist
  validates_attachment_content_type :wordlist, content_type: ['text/x-c']


  ###BEGIN FAST VERSION
  def check_matches(left_words, right_words, target_words)
	result = []
	left_words.each do |left|
		right_words.each do |right|
			if ((left.length + right.length) == target_words.first.length) && (target_words.include?(left + right))
                            result << (left + right)
			end
		end
	end	      
	self.update(result: result.map {|str| "\"#{str}\""}.join(','))
	return result
  end
  
  def process_word_list(word_length)
    target_words = []
    other_lengths = []
    IO.foreach(self.wordlist.path) do |word|
	word.chomp!.downcase!
	target_words << word if (word.length == word_length) && (!target_words.include? word)
	other_lengths << word if (!word.blank?) && (word.length < word_length - 1) && (!other_lengths.include? word)
    end
    left_words = []
    right_words = []
    other_lengths.each do |other|
      target_words.each do |target|
        left_words << other if  (target.start_with?(other)) && (!left_words.include? other)
	right_words << other if (target.end_with?(other)) && (!right_words.include? other)
      end
    end
    check_matches(left_words, right_words, target_words)
  end

  ###END SLOW VERSION

  ###BEGIN QUICK VERSION

  def quick_process_word_list(word_length)
    target_words = []
    other_lengths = []
    IO.foreach(self.wordlist.path) do |word|
	word.chomp!.downcase!
	target_words << word if (word.length == word_length) && (!target_words.include? word)
	other_lengths << word if (!word.blank?) && (word.length < word_length - 1) && (!other_lengths.include? word)
    end
    database = []
    other_lengths.each do |other|
      target_words.each do |target|
       		if target.start_with?(other)
			to_concat = { target: target, left: other}
			database << to_concat
			to_concat = nil
		end	
      end
    end
    other_lengths.each do |other|
	target_words.each do |target|
		if target.end_with?(other)
			record = database.find {|entry| entry[:target] == target }
			if record
			  record[:right] = other if record[:left].length + other.length == word_length
			end
		end
	end
    end
    tmp = database.each.select{|i| i[:right] != nil }
    self.update(result: tmp.map {|str| "\"#{str}\""}.join(','))
    return database.each.select{|i| i[:right] != nil }
 end
  ###END QUICK VERSION
end
