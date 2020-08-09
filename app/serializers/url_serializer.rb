class UrlSerializer
  include FastJsonapi::ObjectSerializer
  attributes :o_url, :s_url, :active
end
