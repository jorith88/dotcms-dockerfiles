node {

    stage ('Checkout') {
        checkout scm
    }

    stage ('Build dotCMS Docker images') {
        def versions = versionsToBuild.split('\n')
        
        def i = 1
        
        for (version in versions) {
           buildAndPublishDotcmsImage(version)
            
            if (i == versions.size()) {
                buildAndPublishDotcmsImage(version, 'latest')
            }
            
            i++
        }
    }
}

def buildAndPublishDotcmsImage(String version, String tagName = '') {
    dir(version) {
        def image = docker.build('jorith88/dotcms:' + version, '--no-cache .')
        
        if (tagName != '') {
            image.push(tagName)
        } else {
            image.push()
        }
    }
}