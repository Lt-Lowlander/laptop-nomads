class AddUserAuthentication < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, null: false, default: "member"
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :profile_photo, :string, default: "user/profile-default-photo.png"
    add_column :users, :bio, :text
  end
end
