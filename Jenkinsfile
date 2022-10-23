pipeline {
   agent  any
	
   
    options {
    ansiColor('xterm')
    }
  
  environment {
               dockerhub=credentials('dockerhub') 
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

         	 stage('Build image') {
                  
                    steps {
                        dir("."){
			    sh """ echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin """
			    sh """  docker buildx build \
  					--platform linux/amd64 --push \
  					-t docker.io/shaposhnikoff/argocd_example:latest -f Dockerfile . """
				
				
                       }
                    }
                }
    
  }}}}
