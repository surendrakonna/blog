Aws.config.update({
  region: ENV['S3_REGION'],
  credentials: Aws::Credentials.new(ENV['S3_ACCESS_KEY_ID'], ENV['S3_SECRET_ACCESS_KEY'])
})