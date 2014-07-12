# todo: language labels into yml
class PastesController < ApplicationController
  unloadable

  before_filter :load_project
  before_filter :authorize
  before_filter :before_each

  protect_from_forgery :except => [:api]
  accept_api_auth :api

  def index
    @items = Paste.where(:project_id=>@project.id, :user_id=>User.current.id).order("created_at DESC")
  end

  def api
    if request.post?

      if save({ :content => request.body.read })
        url = url_for :controller=> "pastes", :action=> "show", :id=> @item.id
        render :text => url, :content_type => 'text/plain'
      else
        render 500
      end
    end
    return
  end

  def add
    if request.post?

      if save(params[:paste])
        url = url_for :controller=> "pastes", :action=> "show", :id=> @item.id
        redirect_to :action=> 'index', :notice => url
      end

    else
      @item = Paste.new
    end
  end

  def show
    get_item
    render_404 unless @item
  end

  def raw
    get_item
    if @item
      render :text => @item.content, :content_type => 'text/plain'
    else
      render_404
    end
  end

  private
  def get_item
    @item = Paste.where(:id=> params[:id], :project_id=> @project.id)[0]
    Paste.touch(params[:id])
  end

  def before_each
    Paste.purge_old
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def save(data)
    @item = Paste.new(data)

    @item.user_id = User.current.id
    @item.project_id = @project.id
    @item.accessed_at = Time.now

    @item.save
  end
end
