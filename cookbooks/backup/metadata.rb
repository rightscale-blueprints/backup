maintainer       "Blissio"
maintainer_email "alastair@blissio.com"
license          "MIT"
description      "Installs/Configures backup"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.textile'))
version          "0.0.1"

depends "aws"
depends "fog"

recipe "backup", "Sets up the backup RubyGem (plus configuration) and it's dependencies."

attribute "backup/user",
  :display_name => "Backup User",
  :description => "The system user for backups.",
  :required => "recommended",
  :default => "root",
  :recipes => [ "backup::default" ]

attribute "backup/name",
  :display_name => "Backup default name",
  :description => "The the default name for backups.",
  :required => "optional",
  :default => "server_backup",
  :recipes => [ "backup::default" ]
  
attribute "backup/description",
  :display_name => "Backup default description",
  :description => "The the default description for backups.",
  :required => "optional",
  :default => "a chef generated server backup",
  :recipes => [ "backup::default" ]

attribute "backup/database/username",
  :display_name => "Backup database user",
  :description => "The db user for database-related backups.",
  :required => "optional",
  :default => 'mysql',
  :recipes => [ "backup::default" ]

attribute "backup/database/password",
  :display_name => "Backup database password",
  :description => "The db pasword for database-related backups.",
  :required => "optional",
  :recipes => [ "backup::default" ]

attribute "backup/s3/bucket_region",
  :display_name => "Backup S3 bucket region",
  :description => "The default region for S3 buckets used with S3 related backups.",
  :required => "optional",
  :default => 'us-east-1',
  :recipes => [ "backup::default" ]
  
attribute "backup/s3/bucket_name",
  :display_name => "Backup S3 bucket name",
  :description => "The default S3 bucket name used with S3 related backups.",
  :required => "optional",
  :recipes => [ "backup::default" ]
  
attribute "backup/s3/keep",
  :display_name => "Backup S3 keep",
  :description => "The number of S3 backets to keep with S3 related backups.",
  :required => "recommended",
  :default => '10',
  :recipes => [ "backup::default" ]
  
attribute "backup/mail/on_success",
  :display_name => "Backup mail on success",
  :description => "Whether to email someone on success of a backup.",
  :required => "optional",
  :default => "true",
  :recipes => [ "backup::default" ]
  
attribute "backup/mail/on_success",
  :display_name => "Backup mail on failure",
  :description => "Whether to email someone on failure of a backup.",
  :required => "optional",
  :default => "true",
  :recipes => [ "backup::default" ]  
  
attribute "backup/mail/from_address",
  :display_name => "Backup mail From: address",
  :description => "The email address mails should be spoofed from.",
  :required => "optional",
  :default => "backup@doesnotexist.com",
  :recipes => [ "backup::default" ] 

attribute "backup/mail/from_address",
  :display_name => "Backup mail To: address",
  :description => "The email address mails should be sent to.",
  :required => "optional",
  :default => "backup@doesnotexist.com",
  :recipes => [ "backup::default" ]
  
attribute "aws/aws_access_key_id",
  :display_name => "AWS Access Key ID",
  :description => "The AWS access key ID to be used with EC2 related backups.",
  :required => "recommended",
  :default => "YOUR_ACCESS_KEY",
  :recipes => [ "aws::default", "backup::default" ]

attribute "aws/aws_secret_access_key",
  :display_name => "AWS Secret Access Key",
  :description => "The AWS secret access key to be used with EC2 related backups.",
  :required => "recommended",
  :default => "YOUR_SECRET_ACCESS_KEY",
  :recipes => [ "aws::default", "backup::default" ]