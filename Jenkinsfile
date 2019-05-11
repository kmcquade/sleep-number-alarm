pipeline {
    agent any
    stages {
        stage('Wake up dude!'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'SLEEPIQ', passwordVariable: 'SLEEPIQ_PASS', usernameVariable: 'SLEEPIQ_USER')]) {
                git changelog: false, credentialsId: 'github-api-key', poll: false, url: 'https://github.com/kmcquade/sleep-number-alarm.git'
                    script{
                        print'Set stuff up'
                            sh '''#!/bin/sh
                            go_env="go1.12.4.linux-armv6l.tar.gz"
                            wget -c https://storage.googleapis.com/golang/go1.12.4.linux-armv6l.tar.gz
                            tar -zxf $go_env
                            if [ $? -ne 0 ];
                            then
                                echo "fail in extract go"
                                exit 1
                            fi
                            echo "OK for extract go"
                            rm -rf $go_env

                            # prepare PATH, GOROOT and GOPATH

                            export PATH=$(pwd)/go/bin:$PATH
                            export GOROOT=$(pwd)/go
                            export GOPATH=$(pwd)
                            go get github.com/danpenn/SleepIQ
                            go run main.go
                            if [ $? -ne 0 ];
                            then
                                echo "fail to go build"
                                exit 1
                            fi
                            echo "OK for go build"
                            '''
                    }
                }    
            }   
        }
    }
}