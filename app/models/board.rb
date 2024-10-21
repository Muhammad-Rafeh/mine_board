class Board < ApplicationRecord
  validates :name, :height, :width, :number_of_mines, presence: true

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email format" }
end
