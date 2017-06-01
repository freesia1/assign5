class BoardController < ApplicationController
    def index
        # 전체목록 보여주기
        # if user_signed_in?
         @view_posts = Post.all.reverse
        # else
        # redirect_to '/users/sign_in'
        # end
    end
    
    
    def show
        # 게시물 제목을 눌렀을 때 특정 게시물 나오기 
        # 먼저 특정게시물을 찾아야돼
        # 이걸 어떻게 찾냐면 id값으로 찾는다.
        @show_id = params[:id]
        # 찾은 데이터를 view로 보내서 출력! => 변순에 날개를 붙인다 비둘기
        @show_post = Post.find(@show_id)
        
    end
    
    def new
        #게시물을 입력하는 form 
    end
    
    
    def create
        # require 'carrierwave/orm/activerecord'
        # # 게시물을 db에 저장하는 액션
         u = AvatarUploader.new
         u.store!(params[:imagefile])
        
        @post_title = params[:inputTitle]
        @post_content = params[:inputContent]
        @post_editor = params[:inputName]
        
        new_post = Post.new #db에 저장 공간을 만들어준다. 이름정해주기
        new_post.title = @post_title
        # =new_post.title = params[:inputTitle]
        new_post.content = @post_content
        new_post.editor = @post_editor
        # new_post.avatar = params[:file]
        new_post.user_id = current_user.user_id
         #저장
        
       
        new_post.avatar = u
        new_post.save
        
        
        redirect_to '/'
    end
    
    
    def edit
        # 수정하는 form
        # 특정게시물을 찾아서 보여주는 건데 특정게시물은 id값으로 찾는다 보여주는 건 form태그 안에서
        
        # 찾은 데이터를 view로 보내서 출력! => 변순에 날개를 붙인다 비둘기
        @edit_post = Post.find(params[:id])
    end


    def update
        # 수정하는 액션(특정게시물 찾아서 수정하는 것)
        # 특정게시물을 찾아서 새로 작성 한 데이터로 덮어쓰기
        @edit_post = Post.find(params[:id])
        @edit_post.editor = params[:inputName]
        @edit_post.title = params[:inputTitle]
        @edit_post.content = params[:inputContent]
        @edit_post.save
        
        redirect_to '/'
    end


    def delete
        #특정게시물 삭제
        # 특정게시물을 찾아서 삭제하는 것
        @delete_post = Post.find(params[:id])
        @delete_post.destroy
        
        redirect_to '/'
    end

    

end