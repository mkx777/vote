class Candidate < ApplicationRecord
  validates :name, presence: true # 一定要輸入 name
end
