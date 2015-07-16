module ApplicationHelper
	def link_to_add_form_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    field = f.fields_for(association, new_object, child_index: id) do |builder|
      render("forms/fields/" + association.to_s.singularize +  "_#{name}", f: builder)
    end

    link_to(name,'#',class: "add_form_fields btn btn-info", data:{id: id,fields: field.gsub("\n","")})
  end	

  def link_to_add_option_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    option_field = f.fields_for(association, new_object, child_index: id) do |builder|
      render("forms/fields/" + association.to_s.singularize +  "_field", f: builder)
    end

    link_to(name,'#',class: "add_option_fields btn btn-xs btn-primary", data:{id: id,fields: option_field.gsub("\n","")})
  end	
end
