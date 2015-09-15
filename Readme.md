## Prototype Imageproxy

This is a small repo that holds the packages and Procfile for deploying the imageproxy on Heroku.

To update the packages:

- `godep save`
- `git add .; git commit -m 'updated dependencies'`
- `git push heroku master`

### Heroku deploy

This repo now holds configuration to deploy the imageproxy to Elastic Beanstalk. To see the old Heroku deploy config, see the `heroku` branch.
