class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_user_authenticated,except: [:index, :search]
  before_action :find_employee, only: [:update, :destroy]

  def index
    @employees = Employee.all
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      format.json {render :create}
    end
  end

  def search_employee
    search_key = params['search_key']
    @employees = Employee.where('lower(name) LIKE ? OR lower(description) LIKE ? OR emp_id LIKE ? OR CAST(salary AS VARCHAR(9)) LIKE ? OR CAST(age AS VARCHAR(9)) LIKE ?',search_key,search_key, search_key, search_key, search_key)
    respond_to do |format|
      format.json{ render :search}
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.json {render :update}
      else
        format.json {render json: @employee.errors, status: :unprocessible_entity, msg: "Unsuccessful"}
      end  
    end
  end

  def destroy
    respond_to do |format|
      if @employee.destroy
        format.json {render json: {msg: "Successfully destroyed", status: 200}}
      else
        format.json {render json: {msg: "Unsuccessful", errors: @employee.errors, status: 200 }}
      end
    end
  end

  def search
  end



  private 

  def find_employee
    @employee = Employee.find(params[:id])
    return @employee if @employee
    rescue ActiveRecord::RecordNotFound
      render json: {msg: "Unsuccesful", status: 404}
  end

  def verify_user_authenticated
    x_auth_token = request.headers['HTTP_X_AUTH']
    unless x_auth_token == AUTH_KEY
      render json: {msg: "Unauthenticated User"}, status: 401
    end
    @verified_authentication = true
  end


  def employee_params
    params.require(:employee).permit(:emp_id, :name, :salary, :description, :age)
  end
end
