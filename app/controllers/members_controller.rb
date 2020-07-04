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
      redirect_to member_path(@member), warning: 'プロフィール情報を更新しました！'
    else
      render :edit
  end
  end

  def confirm
  end

  def hide
  	@member = Member.find(params[:id])
  	@member.update(is_deleted: true)
  	reset_session
  	redirect_to root_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private

  def member_params
    params.require(:member).permit(:profile_image, :name, :school_year, :email)
  end
end
