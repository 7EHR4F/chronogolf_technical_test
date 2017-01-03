class CreateWordListParsers < ActiveRecord::Migration[5.0]
  def change
    create_table :word_list_parsers do |t|

      t.timestamps
    end
  end
end
