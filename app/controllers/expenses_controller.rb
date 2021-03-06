class ExpensesController < ApplicationController
  authorize_resource

  def index
    @expenses = Expense.all
  end

  def new
    @categories = categories
    @expense = Expense.new
  end

  def create
    expense_creator = CreateExpensesWithReceipt.new(expense_params)
    if expense_creator.create
      flash[:notice] = 'Success'
      redirect_to expenses_path
    else
      @categories = categories
      @expense = expense_creator.expense
      render :new
    end
  end

  def edit
    @categories = Category.subcategories
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    expense_updater = UpdateExpenseAndReceipt.new(@expense)
    if expense_updater.update(expense_params)
      redirect_to expenses_path
    else
      @categories = Category.subcategories
      render :edit
    end
  end

  private

  def categories
    Category.main.map { |category| [category.name, category.id] }
  end

  def expense_params
    params.require(:expense).permit(:description, :amount,
      :category_id, :paid_on, :supplier, :vat, :cost_center,
      :payment_method, :picture).merge(user_id: current_user.id)
  end
end
