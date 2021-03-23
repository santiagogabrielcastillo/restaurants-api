json.array! @comments do |comment|
  json.extract! comment, :id, :content
end
