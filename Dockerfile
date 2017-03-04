FROM debian:stretch
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

RUN apt-get update && apt-get install -y \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libdatrie1 \
	libdbus-1-3 \
	libfontconfig1 \
	libfreetype6 \
	libgconf-2-4 \
	libgcrypt20 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk2.0-0 \
	libgpg-error0 \
	libgraphite2-3 \
	libnotify-bin \
	libnss3 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libxcomposite1 \
	libxcursor1 \
	libxdmcp6 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	liblzma5 \
	--no-install-recommends

ENV HOME /home/user
RUN rm -rf $HOME && useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME

ENV ELECTRON_VERSION 1.6.5

# download the source
RUN buildDeps=' \
		ca-certificates \
		curl \
		gnupg \
                git \
                unzip \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& apt-get update && apt-get install -y nodejs --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /opt/electron \
	&& curl -sSL "https://github.com/electron/electron/releases/download/v${ELECTRON_VERSION}/electron-v${ELECTRON_VERSION}-linux-x64.zip" -o /opt/electron/install.zip \
	&& unzip /opt/electron/install.zip \
	&& rm -rf /opt/electron/install.zip \
	&& ln -s /opt/electron/electron /bin/electron \
	&& cd $HOME && ls \
	&& git clone https://github.com/electron/electron-quick-start.git . --depth 1 \
	&& apt-get purge -y --auto-remove $buildDeps

WORKDIR $HOME
ENTRYPOINT [ "/bin/electron ~" ]

