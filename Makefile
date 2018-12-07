build:
	rm -rf public
	hugo

deploy: build
	aws s3 cp public/ s3://mikeluo.site --recursive --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E8X0C63E4HLJ5 --paths '/*' 
