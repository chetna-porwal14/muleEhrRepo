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
    bat 'mvn sonar:sonar -Dsonar.sources=src/ -Dsonar.host.url=http://localhost:9000 -Dsonar.login=dde8b6f91b84de4eda5b0dd466c65e5a52e09897'
    }
	}
    stage('Deploy Application To Mulesoft Cloudhub'){
    steps{
    bat 'mvn package deploy -DmuleDeploy'
   }
   }

   
  }
}