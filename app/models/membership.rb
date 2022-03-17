class Membership < ApplicationRecord

  belongs_to :gym, dependent: :destroy
  belongs_to :client

  validates :client_id, uniqueness: true

end
