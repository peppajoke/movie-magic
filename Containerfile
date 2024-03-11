FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN movie_magic create-db
RUN movie_magic populate-db
RUN movie_magic add-user -u admin -p admin
EXPOSE 5000
CMD ["movie_magic", "run"]
