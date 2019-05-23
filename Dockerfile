FROM daewok/sbcl:1.5.2-alpine3.9 as build

WORKDIR /root/quicklisp/local-projects/circleci-101

COPY . /root/quicklisp/local-projects/circleci-101

RUN apk update && apk add wget && \
    wget https://beta.quicklisp.org/quicklisp.lisp && \
    cat quicklisp.lisp init-quicklisp.lisp | sbcl && \
    cp .sbclrc /root && \
    mkdir -p /root/.config/common-lisp && \
    cp asdf-output-translations.conf /root/.config/common-lisp && \
    cat build.lisp | sbcl

FROM alpine:3.9 as production

WORKDIR /app

COPY --from=build /root/quicklisp/local-projects/circleci-101/hello /app

EXPOSE 80

ENTRYPOINT [ "./hello" ]
