# postgres_builds
used to store postgres builds used in our apps

# Vorgang für den Build, auszuführen im Ordner mit der Dockerfile
postgresql-17.4.tar.bz2 heruntergeladen in dieses Verzeichnis

docker build -t postgresql .

WINDOWS:
docker run --rm -v %CD%\output:/output postgresql tar czf /output/pgsql.tar.gz /usr/local/pgsql

MAC:
mkdir -p output

docker run --rm -v "$(pwd)/output:/output" postgresql \
  tar czf /output/pgsql.tar.gz /usr/local/pgsql
