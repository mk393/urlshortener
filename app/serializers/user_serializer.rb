class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :token
end
