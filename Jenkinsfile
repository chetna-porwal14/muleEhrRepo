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
    bat 'mvn sonar:sonar -Dsonar.sources=src/ -Dsonar.host.url=http://localhost:9000 -Dsonar.login=0d975fee6ead6a54890d10558c1d78c43d93d202'
    }
	}
    stage('Deploy Application To Mulesoft Cloudhub'){
    steps{
    bat 'mvn package deploy -DmuleDeploy'
   }
   }

   
  }
}