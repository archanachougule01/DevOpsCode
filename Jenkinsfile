pipeline{
        agent any
        tools{
            maven 'Maven3.9.4'
        }
        stages{
            stage ('Build'){
                steps{
                    checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/archanachougule01/DevOpsCode']])
                    sh 'mvn clean install'
                }
            }
        //     stage ('SonarCheck'){
        //         steps {
        //          script {
        //   // requires SonarQube Scanner 2.8+
        //             scannerHome = tool 'sonarQubeScanner'
        //          }
        //         withSonarQubeEnv('sonarQubeScanner') {
        //          sh "${scannerHome}/bin/sonar-scanner"
        //         }
        //     }
        stage('SonarQube Analysis') {
            steps{
                sh 'mvn clean verify sonar:sonar \
                -Dsonar.projectKey=sonarproj1 \
                -Dsonar.host.url=http://localhost:9000 \
                -Dsonar.login=sqp_fa08c3b4677606088e6a73105772ecfad590028f'

        }
        }

            stage ('Deploy'){
                steps{
                    deploy adapters: [tomcat9(credentialsId: '83d71014-13ba-41ba-a5c3-3813289713aa', path: '', url: 'http://localhost:8080/')], contextPath: 'DevOpsCode', war: '**/*.war'
                    }
            }

    }
}
