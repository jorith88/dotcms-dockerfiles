node {

    checkout scm
    def app

    stage ('Build and publish dotCMS Docker image') {
        buildAndPublishDotcmsImage('4.0.1')
    }

    // version string is used as directory name, and as docker image tag
    def buildAndPublishDotcmsImage(String version) {
        dir(version) {
            def image = docker.build('dotcmstest:' + version, '--no-cache .')
            image.push()
        }
    }
}