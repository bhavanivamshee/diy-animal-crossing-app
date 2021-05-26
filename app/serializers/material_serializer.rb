class MaterialSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :diy
end
