FROM ghcr.io/unb-libraries/nginx:3.x

COPY ./build /build

RUN $RSYNC_COPY /build/conf/nginx/daemon "$NGINX_CONFD_DIR/" && \
  $RSYNC_COPY /build/conf/nginx/server "$NGINX_CONFD_DIR/"

ENTRYPOINT ["/scripts/run.sh"]

LABEL ca.unb.lib.generator="nginx" \
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="MIT" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="guides.lib.unb.ca redirects old URLs at UNB Libraries." \
  org.label-schema.name="nginx" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.url="https://github.com/unb-libraries/guides.lib.unb.ca" \
  org.label-schema.vcs-ref="prod" \
  org.label-schema.vcs-url="https://github.com/unb-libraries/guides.lib.unb.ca" \
  org.label-schema.vendor="University of New Brunswick Libraries" \
  org.label-schema.version=$VERSION \
  org.opencontainers.image.source="https://github.com/unb-libraries/guides.lib.unb.ca"
