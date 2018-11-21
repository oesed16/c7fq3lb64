class ExpensesController < ApplicationController
  before_action :authenticate_user!, :only => [:index] 
  
  def index
    @expenses = Expense.order("date DESC")
    @expenses = current_user.expenses
    if params[:concept].present?
      @expenses = @expenses.where("concept like '%#{params[:concept]}%'")
    end
    if params[:category_id].present?
      @expenses = @expenses.where(category: params[:category_id])
    end
  end
end
