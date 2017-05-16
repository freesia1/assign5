class CommentController < ApplicationController
    def reply_create
        
        new_comment = Reply.new
        new_comment.post_id = params[:reply_id]
        new_comment.content = params[:replyContent]
        new_comment.editor = params[:replyEditor]
        new_comment.save
        
        redirect_to :back
    
    end
    
    def reply_delete
        @delete_reply = Reply.find(params[:id])
        @delete_reply.destroy
        
        redirect_to :back
    end
end
