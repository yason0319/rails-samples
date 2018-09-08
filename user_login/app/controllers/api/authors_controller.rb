class Api::AuthorsController < ApplicationController
  # 外部からのPOSTはセキュリティ的に弾かれるので下記で対応
  protect_from_forgery except: :create

  def create
    
  end

end
