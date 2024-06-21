class GroupController < ApplicationController
  def index
    @group = Group.all 
    @u = User.all 
  end

  def new
    @group = Group.new 
  end

  def create
    if group_params[:photo].present?
      uploaded_file = group_params[:photo].tempfile
      result = Cloudinary::Uploader.upload(uploaded_file, folder: "FamilyChat")
      img_url = result['secure_url']
    end 
    @group = Group.new(name: group_params[:name], id_admin: current_user.id,
                       description: group_params[:description], photo: img_url)
    if @group.save
      current_user.groups << @group
      redirect_to search_group_path
    else
      render :new 
    end 
  end 

  def edit
  end

  def update
  end

  def join 
    @group = Group.find(params[:id])
    @group.users << current_user 
    #current_user.groups << @group 
    redirect_to search_group_path
  end 

  def group_params
    params.require(:group).permit(:name, :description, :photo, :id_admin)
  end 
end
