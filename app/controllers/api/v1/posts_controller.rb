class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate!

  def index
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    posts = Post.where(workshop_id: workshop.id)
    json_str = PostResource.new(posts).serialize
    render json: json_str
  end

  def create
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    for i in 0..2
      next if params[:posts][i][:content] == ''

      post_params = {
        content: params[:posts][i][:content],
        user: current_user,
        workshop:,
        level: params[:posts][i][:level]
      }
      post = Post.new(post_params)
      post.save
    end
    posts = Post.where(workshop_id: workshop.id)
    content = {
      type: 'create_post',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{workshop.id}", content)
    json_str = PostResource.new(posts).serialize
    render json: json_str
  end

  def update
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    if params[:post][:id] == 0
      post_params = {
        content: params[:post][:content],
        user: current_user,
        workshop:,
        level: params[:post][:level]
      }
      post = Post.new(post_params)
      post.save
    else
      post = current_user.posts.find(params[:post][:id])
      post.update(post_update_params)
    end
    content = {
      type: 'edit_post',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{workshop.id}", content)
  end

  private

  def post_update_params
    params.require(:post).permit(:content, :level)
  end
end
