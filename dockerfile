FROM instrumentisto/flutter

WORKDIR /app

COPY . .

# Remove qualquer arquivo da pasta .dart_tool
RUN rm -rf .dart_tool

RUN flutter pub get

RUN flutter config --enable-android

RUN flutter build apk --release --verbose
