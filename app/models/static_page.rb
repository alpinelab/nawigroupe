class StaticPage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,     type: String, default: ""
  field :slug,      type: String, default: ""
  field :menu_rank, type: Integer
  embeds_many :contents
end



class Content
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,    type: String
  field :body,     type: String
  # field :media,    type:
  field :language, type: String, default: "fr"

  embedded_in :static_page
end