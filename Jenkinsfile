pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@52.66.240.187 '
				sudo rm -rf chatApp13/
				'
				scp -r /var/lib/jenkins/workspace/chatApp13 root@52.66.240.187:
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@52.66.240.187 '
				cd chatApp13/
				$(aws ecr get-login --registry-ids 760496128264 --no-include-email --region ap-south-1)
				#docker-compose down 
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi -f chatapp13_chat:latest 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chatapp13_chat
				docker-compose up -d
				#docker stop chatapplication
				#docker rm chatapplication
				#docker build -t chat .
				'
				'''
			}
		}
		stage('Push Image') {
			steps { 
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@52.66.240.187 '
				docker tag chatapp13_chat 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chatapp13_chat
				docker push 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chatapp13_chat
				#docker tag chat:latest 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chat
				#docker push 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chat
				'
				'''
			}
		}
		stage('Deploy') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa ubuntu@13.233.255.236 '
				kubectl delete $(kubectl get po -o=name | grep chat-deployment)
				'
				echo Deploy Successfull
				'''
			}
		}

	}
	post {
		always {
			echo 'Stage is success'
		}
	}
}

