class UsersController < ApplicationController
  
  
  before_action :authenticate_user!, only: [:show]
  
  def index
    
    kato = {:homepoint => params[:homepoint], :level => params[:level], :history => params[:history]}
    search_user(kato)
    
  end

  def show
    @user = User.find(params[:id])
    @level = {"s" => "最上級", "a" => "上級", "b" => "中級", "c" => "初級"}
    @teach = {"p" => "ok", "i" => "no"}
    @board_type = {"s" => "ショート","l" =>"ロング"}
    
    # ここの下にDM機能用のコードを書く ↓
    @currentUserEntry = Entry.where(user_id: current_user.id)
    #洗濯したユーザのメッセージルーム情報を取得する
    @userEntry = Entry.where(user_id: @user.id)
    
    @isRoom = false
    #current_userと選択したユーザ間に共通のメッセージルームが存在すればフラグを立てる
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
            @room = Room.find(@roomId)
          end
        end
      end
      #無ければ作る
      if !@isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
    
    # -------------- ここまで end
  end
  
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  
  private
    def search_user(keywords)
        if keywords[:homepoint] != "" && keywords[:homepoint].present?
          @users = User.where("homepoint LIKE ?", "%#{keywords[:homepoint]}%")
        else
          @users = User.all
        end
        
        if keywords[:level] != "" && keywords[:level].present?
          @users = @users.where(level: keywords[:level])
        else
          @users = @users
        end
        
        if keywords[:history] != "" && keywords[:history].present?
            if keywords[:history].to_i == 0
              @users = @users.where(history: [0, nil])
            elsif keywords[:history].to_i == 1
              @users = @users.where(history: [1,2])
            elsif keywords[:history].to_i == 3
              @users = @users.where(history: [3,4])
            elsif keywords[:history].to_i == 5
              logger.debug("======================  = #{keywords[:history]}")
              @users = @users.where(history: [5,6,7,8,9])
            elsif keywords[:history].to_i == 10
              logger.debug("======================  = #{keywords[:history]}")
              @users = @users.where("history >= ?", 10)
            else
              @users = @users
            end
          else
            @users = @users
          end
      end
end  
