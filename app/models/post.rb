class Post < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    
    has_many :replies
    belongs_to :user
end
