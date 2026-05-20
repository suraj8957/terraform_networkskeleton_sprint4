pipelineJob('network-skeleton-pipeline') {

    description('Pipeline for Terraform Network Skeleton Deployment')

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
