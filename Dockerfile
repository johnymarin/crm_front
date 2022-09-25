# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:stable AS build



# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"

# Run flutter doctor
RUN flutter doctor -v
RUN flutter channel master
RUN flutter upgrade

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN flutter pub get

# Copy app source code and AOT compile it.
COPY . .

RUN flutter build web
# Stage 2 - Create the run-time image


EXPOSE 8080
ENV PATH="${PATH}:$HOME/.pub-cache/bin"

# make server startup script executable and start the web server
RUN dart pub global activate dhttpd

WORKDIR /app/build/web

CMD ["dart", "pub", "global", "run", "dhttpd", "--host=0.0.0.0"]

