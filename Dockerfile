FROM rocker/tidyverse:latest
ENV TZ="Europe/Rome"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    pkg-config \
    wget \
    curl \
    libraptor2-dev \
    librasqal3-dev \
    libreadline6-dev \
    librdf0-dev \
    ca-certificates \
    gpg \
    gpg-agent \
    apt-utils \
    dialog \
    python-setuptools \
    lmodern \
    fonts-lmodern \
    ssh \
    less \
    emacs \
    tcl-dev \
    git-all \
    git-flow \
    coreutils \
    gnutls-bin \
    moreutils \
    autoconf \
    libc6-dev \
    ncurses-dev \
    automake \
    libtool \
    bison \
    cmake  \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends tzdata apt-utils \
  && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata    

RUN apt-get update && apt-get install -y --no-install-recommends \
    libopenblas-dev \
    libyaml-dev \
    libarpack2-dev \
    libpcre3 \
    libpcre3-dev \
    liblzma-dev \
    libbz2-dev \
    librsvg2-bin \
    libgmp3-dev \
    gfortran \
    libxml2 \
    libxml2-dev \
    libicu-dev \
    libxslt-dev \
    libssl-dev \
    libpq-dev \
    libsodium-dev \
    cargo \
    libgsl-dev \
    libgeos-dev \
    libgdal-dev \
    libproj-dev \
    libudunits2-dev \
    libv8-dev \
    libcairo2-dev \
    libnetcdf-dev \
    libprotobuf-dev \
    protobuf-compiler  \
    libsqlite-dev \
    libpq-dev \
    libssh2-1-dev \
    libsasl2-dev \
    libopenblas-dev \
    libyaml-dev \
    libarpack2-dev \
    default-jdk \
    libpng-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*
    
RUN install2.r --error -n 4 -r 'http://cran.rstudio.com' \
    httr \
    futile.logger \
    yaml \
    reshape2 \
    jsonlite \
    brew \
    rprojroot \
    openxlsx \
    Hmisc \
    plumber \
    bookdown \
    ggmap \
    tinytex \
    testthat \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN R -e 'tinytex::install_tinytex(extra_packages = c( \
    "xcolor", \
    "mdwtools", \
    "tabu", \
    "varwidth", \
    "multirow", \
    "wrapfig", \
    "colortbl", \
    "pdflscape", \
    "threeparttable", \
    "threeparttablex", \
    "environ", \
    "trimspaces", \
    "ulem", \
    "makecell", \
    "epstopdf-pkg" \
    ))'

