FROM maven:3.3-jdk-8

WORKDIR /code

ADD . /code/

RUN ["ls", "/code/target"]

RUN ["pwd"]

RUN ["ls", "-ltrh", "/code/target/myspringboot.jar"]

EXPOSE 8000

ENTRYPOINT [ "java", "-jar", "/code/target/myspringboot.jar" ]
