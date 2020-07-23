class MembersController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]
  before_action :baria_member, only: [:edit, :update]

  def index
    @members_all = Member.all
    @members = Member.page(params[:page]).reverse_order
  end

  def show
    @member = Member.find(params[:id])
    @articles = @member.articles
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

  def baria_member
    unless params[:id].to_i == current_member.id
      redirect_to member_path(current_member)
    end
  end

end
