class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  
    def create
    
    
        @user = User.create(user_params)
        if @user.valid?
          
          render json: { user: UserSerializer.new(@user) }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
     
      private
      def user_params
        params.require(:user).permit(:name, :last_initial, :picture, :due_date, :available_date, :is_doula, :specialty, :certified, :birth_doula, :postpartum_doula, :previous_births, :county_1, :county_2, :county_3, :username, :password, :bio)
      end
end
