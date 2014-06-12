class Book < ActiveRecord::Base
	validates :name, presence: { message: "El campo no puede estar vacio" }
	has_many :pages
end