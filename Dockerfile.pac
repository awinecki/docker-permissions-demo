FROM alpine:latest

RUN addgroup -g 1919 pac
RUN adduser -D -u 1919 -G pac pac

USER pac
