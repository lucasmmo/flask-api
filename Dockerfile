FROM python

WORKDIR /code
ENV FLASK_APP=src/app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN pip3 install pipenv
RUN pipenv --python /usr/bin/python3
COPY Pipfile*    .
RUN pipenv lock --keep-outdated --requirements > requirements.txt
RUN pip3 install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]