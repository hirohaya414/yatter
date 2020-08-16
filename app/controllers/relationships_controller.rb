class RelationshipsController < ApplicationController
  def create
  	current_member.follow(params[:member_id])
  	redirect_to request.referer, success: 'メンバーをフォローしました！'
  end

  def destroy
  	current_member.unfollow(params[:member_id])
    redirect_to request.referer, danger: 'メンバーのフォローを解除しました。'
  end

  def follower
  	@member = Member.find(params[:member_id])
    @members_all = @member.following_member
  	@members = @member.following_member.page(params[:page]).reverse_order
  end

  def followed
  	@member = Member.find(params[:member_id])
  	@members_all = @member.follower_member
  	@members = @member.follower_member.page(params[:page]).reverse_order
  end
end
