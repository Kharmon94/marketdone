module ApplicationHelper

	def tag_cloud(tags, classes)
	  max = tags.sort_by(&:count).last
	  tags.each do |tag|
	    index = tag.count.to_f / max.count * (classes.size - 1)
	    yield(tag, classes[index.round])
	  end
	end

  def stripe_url
    "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=#{ENV['STRIPE_CONNECT_ID']}&scope=read_write"
  end

end
