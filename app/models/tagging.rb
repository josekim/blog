class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :post

  validates :tag_id, uniqueness: {scope: :post_id, message: "You can't have duplicate tags"}
end
