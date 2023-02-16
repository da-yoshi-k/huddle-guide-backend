class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate!

  def index
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    posts = Post.where(workshop_id: workshop.id)
    json_str = PostResource.new(posts).serialize
    render json: json_str
  end

  def create
    count = Post.where(user: current_user.id, workshop: params[:workshop_id]).count
    return unless count <= 3

    post = Post.new(post_params)
    post.save
  end

  def update
    post = current_user.posts.find(params[:post][:id])
    post.update(post_params)
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
  end

  private

  def post_params
    params.require(:post).permit(:content, :level).merge(user_id: current_user.id, workshop_id: params[:workshop_id])
  end
end
