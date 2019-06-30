FROM ubuntu:16.04
LABEL maintainer = "oyuksektepeli@gmail.com"
RUN apt-get update
RUN apt-get install -y python3
