FROM golang:1.10-stretch

RUN go get -u golang.org/x/vgo
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

COPY version.sh /version.sh

CMD ["/version.sh"]
