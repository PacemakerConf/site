class AddRegistrationDeadline < ActiveRecord::Migration
  def change
  	add_column :conferences, :registration_deadline, :date
  end
end
