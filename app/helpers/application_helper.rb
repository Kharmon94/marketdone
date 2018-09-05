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

  # def link_to_add_fields(name, f, type)
	 #  new_object = f.object.send "build_#{type}"
	 #  id = "new_#{type}"
	 #  fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
	 #    render(type.to_s + "_fields", f: builder)
	 #  end
	 #  link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  # end

    def link_to_add_fields(name, form, association)
	    new_object = form.object.send(association).klass.new
	    id = new_object.object_id
	    fields = form.fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_fields", form: builder)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	  end

end
