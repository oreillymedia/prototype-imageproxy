## Prototype Imageproxy

This is a small repo that holds the packages and Procfile for deploying the imageproxy on Heroku.

To update the packages:

- `godep save`
- `git add .; git commit -m 'updated dependencies'`
- `git push heroku master`