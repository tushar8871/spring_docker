# spring_docker

Created a jenkins freestyle job 

Add Build step with Invoke-top-level maven target:

Add :-  clean install

after add one more build step execute windows batch command

docker rm -f spring
docker rmi -f springboot:0.1
docker build -t springboot:0.1 .
docker run --name spring -d -p 8000:8000 springboot:0.1


Created a jenkins pipeline job 

Go to pipeline and create your script directly their or you can use Jenkinsfile. I have add the content in JenkinsPipeline file
