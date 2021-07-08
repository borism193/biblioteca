class Book < ApplicationRecord
  enum status: [:prestado, :en_libreria]
end
