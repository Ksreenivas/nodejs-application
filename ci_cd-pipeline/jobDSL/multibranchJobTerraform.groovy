multibranchPipelineJob("terraform") {

    triggers {
        cron('@hourly')
    }

    orphanedItemStrategy {
        discardOldItems {
            numToKeep(5)
        }
    }   

    branchSources {
        github {
            scanCredentialsId('Sets-scan-credentials-for-authentication-with-GitHub.')
            repoOwner('Ksreenivas')
            repository("nodejs-applicaiton")
            buildOriginBranch(true)
            buildOriginPRMerge(true)
            buildOriginBranchWithPR(false)
            id("terraform-branch-id")
        }
    }

    factory {
        // Search for Jenkinsfile inside repository
        workflowBranchProjectFactory {
            // scan for Jenkinsfile inside /terraform/Jenkinsfile
            scriptPath('/terraform/Jenkinsfile')
        }
    }
}