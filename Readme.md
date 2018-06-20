## Prototype Imageproxy

For deploying to Elastic Beanstalk (EB)

```
dvm use 17.12.1-ce # what EB is on at time of writing

docker build -t zischwartz/prototype-imageproxy .
docker push zischwartz/prototype-imageproxy
zip ok.zip Dockerrun.aws.json
```

And then take the resulting zip file and put it on EB where it says Update and Deploy

**NB:** The env vars were added to the dockerfile in a moment of desperation. They shouldn't be necessary, as they should be set in the EB admin under Configuration | Software Configuration.

After which, you'll want to set up a cloudfront distribution for the imageproxy, or use an existing one.


### Heroku deploy

This repo now holds configuration to deploy the imageproxy to Elastic Beanstalk. To see the old Heroku deploy config, see the `heroku` branch.

This is a small repo that held the packages and Procfile for deploying the imageproxy on Heroku.


To update the packages:

- `godep save`
- `git add .; git commit -m 'updated dependencies'`
- `git push heroku master`
