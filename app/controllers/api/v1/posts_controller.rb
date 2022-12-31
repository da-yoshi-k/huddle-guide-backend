class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate!

  def index
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop])
    posts = Post.where(workshop_id: workshop.id)
    json_str = PostResource.new(posts).serialize
    render json: json_str
  end

  def create
    workshop = Workshop.find(params[:posts][0][:workshop_id])
    for i in 0..2
      next if params[:posts][i][:content] == ""

      post_params = {
        content: params[:posts][i][:content],
        user: current_user,
        workshop: workshop
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
    workshop = Workshop.find(params[:posts][:workshop_id])
    # if params[:post][:id] == 0
    #   post_params = {
    #     content: params[:posts][:content],
    #     user: current_user,
    #     workshop: workshop
    #   }
    #   post = Post.new(post_params)
    #   post.save
    # else
    #   post = current_user.posts.find(params[:posts][:id])
    #   post.update(post_update_params)
    # end
  end

  private

  def post_update_params
    params.require(:post).permit(:content)
  end
end
