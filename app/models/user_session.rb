class UserSession

	def initialize(session)
	    @session = session
	    @session[:comment_ids] ||= []
    end

    

    def add_comment(comment)
		# session[:comment_ids] ||= []
		session[:comment_ids] << comment.id

	end

	def edit_comment?(comment)
		@session[:comment_ids].include?(comment.id) && comment.created_at > 1.minutes.ago
	end

end