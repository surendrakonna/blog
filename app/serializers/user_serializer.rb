class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :created_at, :updated_at
end
