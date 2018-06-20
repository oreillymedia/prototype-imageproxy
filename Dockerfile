FROM golang:1.10.3

ADD . /go/src/github.com/oreillymedia/prototype-imageproxy

RUN cd /go/src/github.com/oreillymedia/prototype-imageproxy && go get ./...
RUN go install github.com/oreillymedia/prototype-imageproxy

ENV ADDRESS 0.0.0.0:3000
ENV BASEURL https://s3.amazonaws.com/orm-redesign-assets/
ENV WHITELIST dmgpayxepw99m.cloudfront.net,d3ansictanv2wj.cloudfront.net,s3.amazonaws.com

# CMD []
ENTRYPOINT ["/go/bin/prototype-imageproxy"]

EXPOSE 3000
