pipeline
{
 agent any
 stages{
    stage('Build Application'){
    steps{
    bat 'mvn clean install'
   }
   }
    stage('Sonarqube Qualitycheck') {
   steps {
    bat 'mvn sonar:sonar -Dsonar.sources=src/ -Dsonar.host.url=http://localhost:9000 -Dsonar.login=99eec442370591b797de0999ff468b4c13d5ec7f'
    }
	}
    stage('Deploy Application To Mulesoft Cloudhub'){
    steps{
    bat 'mvn package deploy -DmuleDeploy'
   }
   }

   
  }
}