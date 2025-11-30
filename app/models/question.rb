class Question < ApplicationRecord
  belongs_to :quiz
  has_many :responses, dependent: :destroy
  validates :content, :question_type, :correct_answer, presence: true
  validates :question_type, inclusion: { in: %w[mcq true_false text] }
  # validate :options_format

   def self.ransackable_associations(auth_object = nil)
    %w[quiz responses]
  end

  def self.ransackable_attributes(auth_object = nil)
  %w[id content question_type correct_answer quiz_id created_at updated_at]
end


  private

  def options_format
    return unless question_type == 'mcq' && options.present?
    unless options.is_a?(Array) && options.all? { |opt| opt.is_a?(String) }
      errors.add(:options, 'must be a JSON array of strings')
    end
  end
end
