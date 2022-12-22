FROM registry.access.redhat.com/ubi8/ruby-27
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
RUN mkdir /chanu/chanu/src/
WORKDIR /chanu/chanu/src/
COPY . /chanu/chanu/src/
ENV GEM_HOME ~/.gem
RUN bundle install
CMD ["./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/
USER default
