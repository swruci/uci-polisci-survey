module ApplicationHelper
    def markdown(text)
      options = {
        filter_html:     false,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
      }
  
      extensions = {
        autolink:           true,
        superscript:        true,
        lax_spacing:        true,
        disable_indented_code_blocks: true
      }
  
      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
  
      markdown.render(text).html_safe
    end
end
