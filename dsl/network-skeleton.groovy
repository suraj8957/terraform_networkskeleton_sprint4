pipelineJob('network-skeleton-pipeline') {

    description('Terraform Network Skeleton Deployment Pipeline')

    parameters {

        choiceParam(
            'ACTION',
            ['plan', 'apply', 'destroy'],
            'Select Terraform Action'
        )
    }

    definition {

        cpsScm {

            scm {

                git {

                    remote {

                        url('git@github.com:suraj8957/terraform_networkskeleton_sprint4.git')
                    }

                    branch('terraform_network_skeleton_spint4')
                }
            }

            scriptPath('Jenkinsfile')
        }
    }
}
