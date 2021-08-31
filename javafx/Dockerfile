FROM gtcs2110/autograder-base:1.7.0

# Install OpenJDK 11 with JavaFX from Zulu along with dummy X server
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        xserver-xorg-video-dummy \
        java-common \
        libgl1-mesa-glx libxi6 libxtst6 libgtk2.0-0 libatk1.0-0 libpango1.0-0 libgdk-pixbuf2.0-0 libcairo2 \
    && wget -P /tmp/pkgs https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-fx-jdk11.0.11-linux_amd64.deb \
    && dpkg -i /tmp/pkgs/zulu11.48.21-ca-fx-jdk11.0.11-linux_amd64.deb

# Cleanup
RUN rm -rf /tmp/pkgs && apt-get clean
