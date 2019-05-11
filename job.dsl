pipelineJob("SleepNumber Alarm"){
    description("Wake me up at 7:30am every weekday.")
    keepDependencies(false)
	definition {
		cpsScm {
			scm {
				git {
					remote {
                        url("https://github.com/kmcquade/sleep-number-alarm.git")
                        credentials("github-api-key")
					}
					branch("*/master")
				}
			}
			scriptPath("Jenkinsfile")
          lightweight(true)
		}
	}
    disabled(false)
	configure {
		it / 'properties' / 'com.coravy.hudson.plugins.github.GithubProjectProperty' {
			'projectUrl'('https://github.com/kmcquade/sleep-number-alarm/')
			displayName()
		}
	}
    triggers {
        cron('30 07 * * 1-5')
    }
}