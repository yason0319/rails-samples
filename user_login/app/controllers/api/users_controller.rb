# 通常ユーザーが利用できるapiに関する記述

class Api::UsersController < ApplicationController
  # 外部からのPOSTはセキュリティ的に弾かれるので下記で対応
  protect_from_forgery except: :create

  # 追加するべきコントローラーについて
  # ユーザーが入力したユーザー名とパスワードが合致しているか探し、正しければ許可を返すapi
  # ユーザーが入力したユーザー名を検索し、被りがなければ新規に登録するapi

  # GET /users
  # ユーザー一覧を取得する
  def index
    @users = User.order('updated_at ASC')
  end

  # POST /reg
  # 入力したユーザー情報を登録する
  def registration
    @name = params[:name]
    # @pass = params[:pass]
    # @email = params[:email]
    users = User.order('updated_at ASC')
    dpl = false
    users.each do | user |
      if @name == user.name then
        @result = "same user already exist"
        dpl = true
      end
    end

    if !dpl then
      @user = User.new(user_params)
      if @user.save then
        @result = "OK"
      else
        @result = "registration error"
      end
    end

  end

  # POST /users
  # ユーザーを登録する
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /users
  # 受けたnameとpassをデータと比較して良ければ結果を返す
  def check
    @name = params[:name]
    @pass = params[:pass]
    users = User.order('updated_at DESC');
    match = false
    users.each do | user |
      if @name == user.name then
        if @pass == user.passwd then
          @result = "OK"
          match = true
        else
          @result = "wrong pass"
        end
      end
    end
    if !match then
      @result = "not exist user"
    end
  end

  def destroy
    if params[:id] != 1 then
      @user = User.find(params[:id])
      @user.destroy
    end
  end

  # バリデーションチェック？
  private
  def user_params
    params.fetch(:user, {}).permit(
      :login, :name, :passwd, :email
    )
  end
end
