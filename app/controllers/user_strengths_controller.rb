class UserStrengthsController < ApplicationController
  before_action :set_user_strength, only: %i[ destroy ]

  def new
    @user_strength = UserStrength.new(user_id: params[:user_id])
    @index = Time.now.to_i
  end
    
  def destroy
    @user_strength.destroy!

    respond_to do |format|
      format.html { redirect_to user_strengths_url, notice: "UserStrength was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    def set_user_strength
      @user_strength = UserStrength.find(params[:id])
    end

end
