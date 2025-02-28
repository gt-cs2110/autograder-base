FROM gtcs2110/autograder-base:1.11.1

# Install OpenJDK 17 along with dummy X server
#
# Despite this Docker container being called "autograder-base-javafx",
# It doesn't install JFX. (It's okay, the wrong JavaFX was being installed anyway).
# This container installs the display servers that will allow JavaFX programs to be run.
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        xserver-xorg-video-dummy \
        java-common openjdk-21-jdk \
        libgl1-mesa-glx libxi6 libxtst6 libgtk-3-0 libatk1.0-0 libpango1.0-0 libgdk-pixbuf2.0-0 libcairo2

# Cleanup
RUN rm -rf /tmp/pkgs && apt-get clean
