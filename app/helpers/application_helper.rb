module ApplicationHelper

  def auth_input
    <<-HTML.html_safe
    <input type="hidden"
          name="authenticity_token"
          value=#{ form_authenticity_token }>
    HTML
  end

  def put_input
    <<-HTML.html_safe
    <input type="hidden" name="_method" value="PUT" >
    HTML
  end
end
