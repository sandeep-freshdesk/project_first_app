class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    puts "IIINNNDDDEEEXXXXX check this one too #{@users}"
    puts "and length is = #{@users.length}"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    puts "SSSSHHHHOOOOOOWWWWWW #{User}"
    puts "params ===== #{params}"
    @user = User.find(params[:id])
    puts "in show @user == #{@user}"
    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    puts "NNNNNNEEEEEEEWWWWWWWW"
    @user = User.new
    puts "in New @user === #{@user}"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    puts "EEEEEDDDDDIIIIIITTTTTTT"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    puts "CCCCCRRRRREEEEAAAAAATTTTTEEEEE"
    puts "params ==  #{params}"
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    puts "UUUUUUUPPPPPPPPDDDDDDDAAAAAAATTTTTEEEEEEEEE"
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    puts "DDDDDDDEEEEESSSSSTTTTRRRROOOOYYYYY"
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
