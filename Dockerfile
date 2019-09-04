# This is the application Dockerfile that we're tying to build with jenkins
FROM registry.access.redhat.com/dotnet/dotnet-22-rhel7:2.2-8

USER root

WORKDIR /app
RUN echo "echo 'hello world'" > some-app.sh
RUN chmod +x some-app.sh

USER default

ENTRYPOINT [ "bash", "-c", "some-app.sh" ]