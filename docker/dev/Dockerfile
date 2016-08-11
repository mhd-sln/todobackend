FROM cd/todobackend-base:latest

# Install dev/build dep
RUN apt-get update && \
  apt-get install -qy python-dev 

# Activate virtual enviroment and install wheel support
RUN . /appenv/bin/activate && \
  pip install wheel --upgrade

# PIP env variable
ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PIP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache

# OUTPUT
VOLUME /wheelhouse

# OUTPUT: Build cache
VOLUME /build

# OUTPUT
VOLUME /reports

# Add test entrypoint script
COPY scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x /usr/local/bin/test.sh

RUN apt-get install -y libmysqlclient-dev

ENTRYPOINT ["test.sh"]
CMD ["python", "manage.py", "test", "--noinput"]

COPY src /application
WORKDIR /application
