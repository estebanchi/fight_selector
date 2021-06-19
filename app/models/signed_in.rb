class SignedIn < ApplicationRecord
  belongs_to :fighter
  belongs_to :tournament
end
