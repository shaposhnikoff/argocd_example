pipeline {
   agent  any

   options {
   ansiColor('xterm')
    }
   
   parameters {
      booleanParam(name: 'alpine', defaultValue: false, description: 'alpine base')
  }
	
	environment {
               dockerhub=credentials('dockerhub') 
            }
            
   
    stages {

	    stage('Printenv') {
            when {expression { params.PRINTENV == true }}
            steps {
                sh 'printenv'
		    
            }
        }
        
        stage('AMI') {
            environment {
                COMMIT_ID = sh ( returnStdout: true, script: 'git rev-parse --short HEAD' )
                BRANCH = "${GIT_BRANCH.split("/")[1]}"
		arm_ami_base = "ami-0e052983952750fca"
            }
            
     stages {
		    
        	    
       

		    
         	 stage('Prepare buider') {
                  when {expression { params.alpine == true }}
                    steps {
                        dir("alpine"){
			    sh """ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes """
			    sh """ docker buildx rm builder """
			    sh """ docker buildx create --name builder --driver docker-container --use """
			    sh """ docker buildx inspect --bootstrap """
			    		
				
                       }
                    }
                }

         	 stage('Build Alpine base image') {
                  when {expression { params.alpine == true }}
                    steps {
                        dir("."){
			    sh """ echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin """
			    sh """  docker buildx build \
  					--platform linux/arm64,linux/amd64 --push \
  					-t docker.io/shaposhnikoff/argocg_example:latest -f Dockerfile . """
				
				
                       }
                    }
                }

	    }
	}}}
