class Doc < ActiveRecord::Base
  has_attached_file :docfile,
                    :storage=>{
                      ###'development'=>:s3,
                      'development'=>:filesystem,
                      'production'=>:s3
                    }[Rails.env],

                    :url => {
                      'development'=> "#{Rails.root}/public/docs/:attachment/:id/:basename.:extension",
                      'production'=> "heroku/:attachment/:id/:basename.:extension"
                    }[Rails.env],


                    :path => {
                      'development'=> "#{Rails.root}/public/docs/:attachment/:id/:basename.:extension",
                      'production'=> "heroku/:attachment/:id/:basename.:extension"
                    }[Rails.env],
                    :bucket         => ENV['S3_BUCKET'],
                    :s3_credentials => { :access_key_id     => ENV['S3_KEY'],
                                         :secret_access_key => ENV['S3_SECRET']}

  validates_attachment_size :docfile, :less_than => 10.megabytes


end
