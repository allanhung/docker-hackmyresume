FROM node
MAINTAINER Jean-Avit Promis "docker@katagena.com"

ENV RESUME_FILE   resume.json
ENV OUTPUT_TEMPLATE modern
ENV PHONE +33602030405
ENV EMAIL docker@katagena.com
ENV ADDRESS "25 Rue Delphin Loche"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl wkhtmltopdf && \
    rm -rf /var/lib/apt/lists/*

RUN npm install hackmyresume@">=1.3.0" -g

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html

CMD /start.sh
