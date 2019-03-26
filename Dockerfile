FROM golang:1.12.1

ADD . /go/src/github.com/oreillymedia/prototype-imageproxy

RUN cd /go/src/github.com/oreillymedia/prototype-imageproxy && go get ./...
RUN go install github.com/oreillymedia/prototype-imageproxy

ENV ADDRESS 0.0.0.0:3000
ENV BASEURL http://orm-redesign-assets.s3-website-us-east-1.amazonaws.com/
#ENV WHITELIST dmgpayxepw99m.cloudfront.net,d3ansictanv2wj.cloudfront.net,d29c9qkvt9cqys.cloudfront.net,s3.amazonaws.com

# CMD []
ENTRYPOINT ["/go/bin/prototype-imageproxy"]

EXPOSE 3000
