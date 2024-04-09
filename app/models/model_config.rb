class ModelConfig < ApplicationRecord
  belongs_to :model_server
  has_many :messages, as: :author

  scope :embedding, -> { where(embedding: true) }

  def description
    "#{name}@#{model_server.name}"
  end
end
