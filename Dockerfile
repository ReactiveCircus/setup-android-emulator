FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Environment variables
ENV PROCESSOR=x86 \
    SYS_IMG=x86_64 \
    IMG_TYPE=google_apis \

# Accept all licenses
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Update SDK
RUN $ANDROID_HOME/tools/bin/sdkmanager --update

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

