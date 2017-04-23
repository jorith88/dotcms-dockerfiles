node {

    stage ('Checkout') {
        checkout scm
    }

    stage ('Build dotCMS Docker images') {
        def versions = versionsToBuild.split("\n")
        
        for (i=0;i<versions.size();i++) {
            def version = versions[i];
            
            buildAndPublishDotcmsImage(version, "")
            
            if (i == versions.size() - 1) {
                buildAndPublishDotcmsImage(version, "latest")
            }
        }
    }
}

def buildAndPublishDotcmsImage(String version, String tagName = "") {
    def image = docker.build("jorith88/dotcms:${version}", "--no-cache ${version}")
    
    if (tagName != '') {
        image.push(tagName)
    } else {
        image.push()
    }
}