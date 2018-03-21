module AncestryHelper

def nested_categories(categories)
  categories.map do |categories, sub_categories|
    render(category) + content_tag(:li, nested_categories(sub_categories), :class => "nested_categories")
  end.join.html_safe
end
  
end