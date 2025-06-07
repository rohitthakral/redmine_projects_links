class ProjectLink < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: 'User'

  validates :title, presence: { message: "Title can't be blank" }
  validates :url, presence: { message: "URL can't be blank" }, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }
  validates :author_id, :project_id, presence: true
end