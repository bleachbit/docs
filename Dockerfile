# syntax=docker/dockerfile:1

# Development image for the docs site.
#
# Gemfile.lock only lists x86_64-linux, so build on amd64 or run
# `bundle lock --add-platform aarch64-linux` first. Not Alpine: the locked
# sass-embedded, ffi and google-protobuf gems are glibc builds.

ARG RUBY_VERSION=3.4
ARG DEBIAN_RELEASE=trixie

FROM ruby:${RUBY_VERSION}-slim-${DEBIAN_RELEASE} AS base

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=UTC \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# jekyll-last-modified-at reads each file's last commit date
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*


FROM base AS gems

# eventmachine and http_parser.rb have no precompiled gems
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libssl-dev \
    && rm -rf /var/lib/apt/lists/*

ENV BUNDLE_FROZEN=true

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install && rm -rf "${BUNDLE_PATH}"/cache


FROM base AS dev

# Pass --build-arg UID=$(id -u) so generated files match the host owner
ARG UID=1000
ARG GID=1000

RUN if ! getent group "${GID}" >/dev/null; then groupadd --gid "${GID}" jekyll; fi \
    && useradd --uid "${UID}" --gid "${GID}" --create-home --shell /bin/bash jekyll

# git refuses to read a repo it thinks someone else owns
RUN git config --system --add safe.directory /app

COPY --from=gems --chown=${UID}:${GID} ${BUNDLE_PATH} ${BUNDLE_PATH}

# WORKDIR would create these root-owned, and jekyll writes to all three
RUN install -d -o "${UID}" -g "${GID}" /app /app/_site /app/.jekyll-cache

WORKDIR /app
COPY --chown=${UID}:${GID} . .

USER jekyll

# 4000 site, 35729 livereload
EXPOSE 4000 35729

# Also allows `docker run <image> jekyll build`
ENTRYPOINT ["bundle", "exec"]
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--drafts"]
