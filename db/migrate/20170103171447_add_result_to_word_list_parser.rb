class AddResultToWordListParser < ActiveRecord::Migration[5.0]
  def change
    add_column :word_list_parsers, :result, :string
  end
end
