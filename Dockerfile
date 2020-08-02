FROM python:3.7.3-stretch
RUN apt-get update && apt-get install -y nginx supervisor uwsgi uwsgi-plugin-python3

ADD src /app/flask
ADD nginx.conf /etc/nginx/conf.d/
ADD supervisor.conf /etc

WORKDIR /app/flask

RUN  unset -v PYTHONPATH
RUN pip3.7 install -r requirements.txt -t /app/flask

EXPOSE 80

CMD ["supervisord","-c","/etc/supervisor.conf"]