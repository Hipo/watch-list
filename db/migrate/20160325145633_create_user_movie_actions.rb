class CreateUserMovieActions < ActiveRecord::Migration
  def change
    create_table :user_movie_actions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true
      t.integer :action_type
    end
  end
end
