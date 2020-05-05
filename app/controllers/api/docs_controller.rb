 class Api::DocsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @html = Aws::S3::Object.new(ENV['API_DOCS_BUCKET'], ENV['API_DOCS_FILE_NAME']).get.body.string
    render html: @html.html_safe, content_type: "text/html"
  end

end
