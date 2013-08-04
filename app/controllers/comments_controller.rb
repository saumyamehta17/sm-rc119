class CommentsController < ApplicationController

	before_filter :authorize, :only => [:edit, :update]

	def create
		
		@post = Post.find(params[:post_id])
		@comments = @post.comments.new(params[:comment])

		if @comments.save
			user_session.add_comment(@comments)

			# session[:comment_ids] ||= []
			# session[:comment_ids] << @comments.id

			flash[:notice] = "Comment Successfully created"
			redirect_to @post
		else
			redirect_to :back
		end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(params[:comment])
			flash[:notice] = "comment Successfully updated"
			redirect_to @post
		else
			render :action => 'edit'
		end
	end

	def authorize
		# @comment = Comment.find(params[:id])
		# unless session[:comment_ids] && session[:comment_ids].include?(params[:id].to_i) && @comment.created_at > 1.minutes.ago
		# 	redirect_to root_url
		# end

		unless user_session.edit_comment?(Comment.find(params[:id]))
			redirect_to root_url
		end
	end
end
