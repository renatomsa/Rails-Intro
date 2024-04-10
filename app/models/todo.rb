class Todo < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user

  def progress
    return 0 if tasks.empty?

    completed_tasks = tasks.where(done: true).count
    total_tasks = tasks.count

    (completed_tasks.to_f / total_tasks * 100).round(2)
  end
end
