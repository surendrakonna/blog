 class Api::DocsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @html = Aws::S3::Object.new(ENV['API_DOCS_BUCKET'], "api_doc.html").get.body.string
    render html: @html.html_safe, content_type: "text/html"
  end

end
