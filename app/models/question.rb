class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  # Kaminari paginator
  paginates_per 5

  # Callback
  after_create :set_statistic

  scope :_search_, -> (page, term){
    includes(:answers)
      .where("lower(description) like ?", "%#{term.downcase}%")
      .page(page)
  }

  scope :_search_subject_, -> (page, subject_id){
    includes(:answers, :subject)
      .where(subject_id: subject_id)
      .page(page)
  }


  scope :last_questions, -> (page){
    includes(:answers).order('created_at desc').page(page)
  }

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end
end
