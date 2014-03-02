class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :relationships, 
			foreign_key: "user_id",
            class_name:  "Relationship",
			dependent: :destroy
	has_many :reverse_relationships, 
			foreign_key: "coach_id",
            class_name:  "Relationship",
			dependent: :destroy
	has_many :coaches, through: :relationships, source: :coach
	has_many :coached, through: :reverse_relationships, source: :user


	def coaching?(other_user)
		relationships.find_by(coach_id: other_user.id)
	end

	def coach!(other_user)
		relationships.create!(coach_id: other_user.id)
	end

	def unchoach!(other_user)
		relationships.find_by(coach_id: other_user.id).destroy
	end

  def name
    self.email
  end
end