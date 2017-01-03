class AddFieldsToWordListParsers < ActiveRecord::Migration[5.0]
  def change
    add_column :word_list_parsers, :name, :string
  end
end
