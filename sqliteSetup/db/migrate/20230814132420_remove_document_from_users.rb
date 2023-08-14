class RemoveDocumentFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_columns :users, :document
  end
end
