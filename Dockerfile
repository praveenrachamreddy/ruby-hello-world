FROM registry.access.redhat.com/ubi8/ruby-27
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
USER root
RUN mkdir /chanu
USER default
COPY . /chanu
ENV GEM_HOME ~/.gem
RUN bundle install
CMD ["./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/
USER default
