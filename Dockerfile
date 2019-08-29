# This is the application Dockerfile that we're tying to build with jenkins
FROM registry.access.redhat.com/dotnet/dotnet-22-rhel7:2.2-8

ENTRYPOINT [ "echo ", "hello world" ]