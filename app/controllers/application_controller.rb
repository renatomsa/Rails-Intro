class ApplicationController < ActionController::Base
  before_action :set_todos

  private

  def set_todos
    @todos = Todo.all
  end
end
