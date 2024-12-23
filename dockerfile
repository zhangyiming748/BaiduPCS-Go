FROM golang:1.23.4-alpine3.21 AS builder

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

COPY BaiduPCS-Go /root/BaiduPCS-Go

WORKDIR /root/BaiduPCS-Go

RUN go build -o /usr/local/bin/BaiduPCS main.go

FROM alpine:3.21

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

COPY --from=builder /usr/local/bin/BaiduPCS /usr/local/bin/BaiduPCS

CMD ["bash"]