class ExpensesController < ApplicationController
  def index
    @expenses = Expense.order("date DESC")
    if params[:concept].present?
      @expenses = @expenses.where("concept like '%#{params[:concept]}%'")
    end
    if params[:category_id].present?
      @expenses = @expenses.where(category: params[:category_id])
    end
  end
end
