FROM debian:latest

RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y curl && \
apt-get install -y make && \
apt-get install -y gcc

# install node
RUN apt-get update && \
apt-get install -y gnupg && \
curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install -y nodejs

# install google-chrome-stable latest
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
apt-get update && \
apt-get -y install google-chrome-stable

# install extra font packages
RUN apt-get install -y ttf-wqy-zenhei && \
wget http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb && \
apt-get -f install ./ttf-mscorefonts-installer_3.6_all.deb && \
rm ttf-mscorefonts-installer_3.6_all.deb

# install macOs font
RUN cd /usr/share/fonts/truetype/ && \
mkdir macOs
COPY macOs /usr/share/fonts/truetype/macOs/
RUN apt-get install -y fontconfig && \
fc-cache
