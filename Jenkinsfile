node {

    stage ('Checkout') {
        checkout scm
    }

    stage ('Build dotCMS Docker images') {
        def versions = versionsToBuild.split("\n")

        for (i=0;i<versions.size();i++) {
            def version = versions[i];

            def image = docker.build("jorith88/dotcms:${version}", "--pull --no-cache ${version}")
            image.push()

            if (version == latestVersion) {
                image.push('latest')
            }
        }

        emailext body: 'Pushed new images to Docker Hub.', subject: 'DotCMS Docker images', to: '${buildReadyEmailAddress}'
    }
}