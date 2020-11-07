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