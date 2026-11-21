FROM ghcr.io/unb-libraries/nginx:3.24.x

COPY ./build /build

RUN $RSYNC_COPY /build/conf/nginx/daemon "$NGINX_CONFD_DIR/" && \
  $RSYNC_COPY /build/conf/nginx/server "$NGINX_CONFD_DIR/"

ENTRYPOINT ["/scripts/run.sh"]

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="nginx" \
  org.opencontainers.image.title="guides.lib.unb.ca" \
  org.opencontainers.image.description="guides.lib.unb.ca redirects old URLs at UNB Libraries." \
  org.opencontainers.image.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.url="https://github.com/unb-libraries/guides.lib.unb.ca" \
  org.opencontainers.image.source="https://github.com/unb-libraries/guides.lib.unb.ca" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.created="$BUILD_DATE"
