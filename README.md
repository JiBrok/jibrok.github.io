# [jibrok.com](http://jibrok.com)

[https://jekyllrb.com/docs/](https://jekyllrb.com/docs/)

## Development Commands

### Setup
* gem install jekyll bundler
* bundle install

### Local Development
* bundle exec jekyll serve
* bundle exec jekyll serve --profile
* bundle exec jekyll serve --incremental

### WebP Image Generation
* Run `./convert_to_webp.sh` to generate WebP versions of all images
* This script converts PNG/JPG/JPEG files to WebP format with 85% quality
* WebP images provide better compression and faster loading times
