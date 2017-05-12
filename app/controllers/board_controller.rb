class BoardController < ApplicationController
    def index
        @everyPost = Post.all
    end
    
    def new
         new_post = Post.new
         new_post.dbName = params[:inputName]
         new_post.dbTitle = params[:inputTitle]
         new_post.dbContent = params[:inputContent]
        
        
        redirect_to '/'
    end
end