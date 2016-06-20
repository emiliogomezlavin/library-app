class AddLibraryIdToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :library, index: true, foreign_key: true
  end
end
