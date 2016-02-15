class ChangeColumnNameFromTypeToKind < ActiveRecord::Migration
  def change
    remove_column :bikes, :type
    add_column :bikes, :kind, :string
  end
end
