class PostsController < ActionController::Base
def show
# ...
tags = view_context.generate_tags(@post)
email_link = view_context.mail_to(@user.email)
# ...
end
end 

# module ApplicationHelper
#   def fancy_helper(str)
#     str.titleize
#   end
# end

# class MyController < ApplicationController
#    def index
#      @title = view_context.fancy_helper "dogs are awesome"
#    end
# ends
