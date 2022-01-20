FROM gtcs2110/autograder-base:1.8.0

# Install OpenJDK 17 with JavaFX along with dummy X server
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        xserver-xorg-video-dummy \
        java-common openjdk-17-jdk openjfx \
        libgl1-mesa-glx libxi6 libxtst6 libgtk2.0-0 libatk1.0-0 libpango1.0-0 libgdk-pixbuf2.0-0 libcairo2

# Cleanup
RUN rm -rf /tmp/pkgs && apt-get clean
