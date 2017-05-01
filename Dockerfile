FROM docker.elastic.co/kibana/kibana-ubuntu-base:latest
MAINTAINER Elastic Docker Team <docker@elastic.co>
ENV KIBANA_DOWNLOAD_URL="https://artifacts.elastic.co/downloads/kibana/kibana-5.3.2-linux-x86_64.tar.gz"
EXPOSE 5601

WORKDIR /usr/share/kibana
RUN curl -Ls ${KIBANA_DOWNLOAD_URL} | tar --strip-components=1 -zxf - && \
    ln -s /usr/share/kibana /opt/kibana

# Set some Kibana configuration defaults.
ADD config/kibana.yml /usr/share/kibana/config/

# Add the launcher/wrapper script. It knows how to interpret environment
# variables and translate them to Kibana CLI options.
ADD bin/kibana-docker /usr/local/bin/

# Add a self-signed SSL certificate for use in examples.
ADD ssl/kibana.example.org.* /usr/share/kibana/config/

RUN usermod --home /usr/share/kibana kibana
USER kibana
# we don't want the xpack
# RUN bin/kibana-plugin install ${X_PACK_URL}
ENV PATH=/usr/share/kibana/bin:$PATH
CMD /usr/local/bin/kibana-docker