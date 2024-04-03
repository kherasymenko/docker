
#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo << EOF > tempdir/Dockerfile
From python 

COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
COPY requirements.txt /home/myapp

RUN pip install -r /home/nyapp/requirements.txt

EXPOSE 8080 

CMD python3 /home/myapp/sample_app.py
EOF

cd tempdir

docker build -t sampleapp .
docker run -t -d -p 8080:8080 --name samplerunning sampleapp
docker ps -a

