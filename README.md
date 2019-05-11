# sleep-number-alarm

This script will raise the Sleep Number bed to the "Watch TV" position so I can wake up without a million alarms.

Right now, I'm using a Jenkins server on my home network (running on my Raspberry Pi) to run it at 7:30am Monday through Friday. 

# Setup

### Raspberry Pi

As mentioned, I ran this on a Raspberry Pi at home. You can use another Jenkins server if you want. Some of my installation notes are in the `_docs/installation.md` file.

### Credentials

1. Generate a GitHub personal access token
2. Save it in your Jenkins credentials with username/password type. Ensure that the credentialsID is "github-api-key"
3. Get your Sleep IQ username and password; save those as a username/password type. Ensure that the credentialsID is equal to "SLEEPIQ".

### Job

* Create a Freestyle job called "Seed Test"
* Set the Git repository and select the proper credentials
    * Branch specifier: `*/master`
* "Build" => "Process Job DSLs"
    * Select "Look on Filesystem"
    * Under "DSL Scripts" enter `*.dsl`
    * The rest of the defaults are fine
* Save it
* Run it. This will create a new job titled "SleepNumber-Alarm"
* Run the "SleepNumber-Alarm" to confirm that it works.

## Roadmap

Ideally, this would be run as an Alexa Skill using a Lambda function so I could ask Alexa to make me sit up every morning - but I haven't learned how to create custom Alexa skills yet and I am not at that level with Golang yet. I'll aim to do that in the future, but for now this works.

I'll edit the time in Jenkins until I can write this Alexa skill.

Also - I should probably set an environment variable or parameter to the side of the bed. It's set to "right" at the moment because that's the side that I use.