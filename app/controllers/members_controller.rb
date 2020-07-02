class MembersController < ApplicationController
  def index
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
  	if @member.update(member_params)
		redirect_to member_path(@member)
	else
		render :edit
	end
  end

  def confirm
  end

  private
  def member_params
  	params.require(:member).permit(:profile_image, :name, :school_year, :email)
  end
end
