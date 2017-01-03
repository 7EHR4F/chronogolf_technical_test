class AddAttachmentWordlistToWordListParsers < ActiveRecord::Migration
  def self.up
    change_table :word_list_parsers do |t|
      t.attachment :wordlist
    end
  end

  def self.down
    remove_attachment :word_list_parsers, :wordlist
  end
end
