node {

    stage ('Checkout') {
        checkout scm
    }

    stage ('Build dotCMS Docker images') {
        try {
            def versions = versionsToBuild.split('\n')
            
            def i = 1
            
            for (version in versions) {
            buildAndPublishDotcmsImage(version)
                
                if (i == versions.size()) {
                    buildAndPublishDotcmsImage(version, 'latest')
                }
                
                i++
            }
        catch (error) {
            echo error
        }
    }
}

def buildAndPublishDotcmsImage(String version, String tagName = '') {
    def image = docker.build('jorith88/dotcms:' + version, '--no-cache ' + version)
    
    if (tagName != '') {
        image.push(tagName)
    } else {
        image.push()
    }
}