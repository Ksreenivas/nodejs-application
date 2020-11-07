# Pipeline (This is not Tested)

- Create free style job in jenkin https://plugins.jenkins.io/job-dsl/
- Create free style job using this script manually, Free style job Build from groovy script file [seedPipeline.groovy](https://github.com/Ksreenivas/nodejs-application/blob/main/ci_cd-pipeline/jobDSL/seedPipeline.groovy) This seed job scans and create a MBP MultiBranchPipeline for all the groovy scripts [jobDSL](https://github.com/Ksreenivas/nodejs-application/tree/main/ci_cd-pipeline/jobDSL)

```bash
node('master') {
  stage('Checkout') {
    // Clean workspace and checkout shared library repository on the jenkins master
    cleanWs()
    checkout scm
  }

  stage('Seed') {
    // seed the jobs
    jobDsl(targets: 'ci_cd-pipeline/jobDSL/*.groovy', sandbox: false)
  }
}
```

- Above created free style job creates MultiBranchPipeline for [Node.js](https://github.com/Ksreenivas/nodejs-application/blob/main/ci_cd-pipeline/jobDSL/multibranchJobNodejs.groovy) 
- Above created free style job creates MultiBranchPipeline for [Packer](https://github.com/Ksreenivas/nodejs-application/blob/main/ci_cd-pipeline/jobDSL/multibranchJobPacker.groovy) 
- Above created free style job creates MultiBranchPipeline for [Terraform](https://github.com/Ksreenivas/nodejs-application/blob/main/ci_cd-pipeline/jobDSL/multibranchJobTerraform.groovy) 