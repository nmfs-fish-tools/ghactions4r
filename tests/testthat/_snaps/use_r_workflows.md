# use_r_cmd_check() works with defaults

    Code
      test
    Output
       [1] "# Run r cmd check"                                                                                                                        
       [2] "name: call-r-cmd-check"                                                                                                                   
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "# The default build trigger is to run the action on every push and pull request, for any branch"                                          
       [6] "  push:"                                                                                                                                  
       [7] "  pull_request:"                                                                                                                          
       [8] "  # To run the default repository branch weekly on sunday, uncomment the following 2 lines"                                               
       [9] "  #schedule:"                                                                                                                             
      [10] "    #- cron: '0 0 * * 0'"                                                                                                                 
      [11] "jobs:"                                                                                                                                    
      [12] "  call-workflow:"                                                                                                                         
      [13] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/r-cmd-check.yml@main"                                                             

# use_r_cmd_check() works with full build option

    Code
      test
    Output
       [1] "# Run r cmd check"                                                                                                                        
       [2] "name: call-r-cmd-check"                                                                                                                   
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "# The default build trigger is to run the action on every push and pull request, for any branch"                                          
       [6] "  push:"                                                                                                                                  
       [7] "  pull_request:"                                                                                                                          
       [8] "  # To run the default repository branch weekly on sunday, uncomment the following 2 lines"                                               
       [9] "  #schedule:"                                                                                                                             
      [10] "    #- cron: '0 0 * * 0'"                                                                                                                 
      [11] "jobs:"                                                                                                                                    
      [12] "  call-workflow:"                                                                                                                         
      [13] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/r-cmd-check.yml@main"                                                             
      [14] "    with:"                                                                                                                                
      [15] "      use_full_build_matrix: true"                                                                                                        

# use_calc_coverage()) works

    Code
      test
    Output
      [1] "# call a workflow that runs covr::codecov() to calculate code coverage"                                                                   
      [2] "name: call-calc_coverage"                                                                                                                 
      [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
      [4] "# The default is to run the workflow on every push or pull request to every branch."                                                      
      [5] "on: [push, pull_request]"                                                                                                                 
      [6] "jobs:"                                                                                                                                    
      [7] "  call-workflow:"                                                                                                                         
      [8] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/calc-coverage.yml@main"                                                           

# use_doc_and_style_r() works

    Code
      test
    Output
       [1] "# document and style R code using a reusable workflow"                                                                                    
       [2] "name: call-doc-and-style-r"                                                                                                               
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "  pull_request:"                                                                                                                          
       [6] "jobs:"                                                                                                                                    
       [7] "  call-workflow:"                                                                                                                         
       [8] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                         
       [9] "    with:"                                                                                                                                
      [10] "      run-rm_dollar_sign: true"                                                                                                           
      [11] "      commit-directly: true"                                                                                                              
      [12] "  "                                                                                                                                       

# use_doc_and_style_r() works with other options

    Code
      test
    Output
       [1] "# document and style R code using a reusable workflow"                                                                                    
       [2] "name: call-doc-and-style-r"                                                                                                               
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "  schedule:"                                                                                                                              
       [6] "# Use https://crontab.guru/ to edit the time"                                                                                             
       [7] "    - cron:  '15 02 * * 0'"                                                                                                               
       [8] "jobs:"                                                                                                                                    
       [9] "  call-workflow:"                                                                                                                         
      [10] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                         
      [11] "  "                                                                                                                                       

# use_doc_and_style_r() works with push to main

    Code
      test
    Output
       [1] "# document and style R code using a reusable workflow"                                                                                    
       [2] "name: call-doc-and-style-r"                                                                                                               
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "  push:"                                                                                                                                  
       [6] "    branches: [main]"                                                                                                                     
       [7] "jobs:"                                                                                                                                    
       [8] "  call-workflow:"                                                                                                                         
       [9] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                         
      [10] "  "                                                                                                                                       

# use_doc_and_style_r() works with manual trigger

    Code
      test
    Output
      [1] "# document and style R code using a reusable workflow"                                                                                    
      [2] "name: call-doc-and-style-r"                                                                                                               
      [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
      [4] "on:"                                                                                                                                      
      [5] "  workflow_dispatch:"                                                                                                                     
      [6] "jobs:"                                                                                                                                    
      [7] "  call-workflow:"                                                                                                                         
      [8] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                         
      [9] "  "                                                                                                                                       

# use_doc_and_style_r() works with pat option

    Code
      test
    Output
       [1] "# document and style R code using a reusable workflow"                                                                                    
       [2] "name: call-doc-and-style-r"                                                                                                               
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "  push:"                                                                                                                                  
       [6] "    branches: [main]"                                                                                                                     
       [7] "jobs:"                                                                                                                                    
       [8] "  call-workflow:"                                                                                                                         
       [9] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                         
      [10] "    secrets:"                                                                                                                             
      [11] "      PAT: ${{ secrets.MYPAT }}"                                                                                                          
      [12] "  "                                                                                                                                       

# use_update_pkgdown()) works

    Code
      test
    Output
       [1] "# updates exiting pkgdown site for a repository"                                                                                          
       [2] "# deploys to a branch gh-pages"                                                                                                           
       [3] "name: call-update-pkgdown"                                                                                                                
       [4] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [5] "on:"                                                                                                                                      
       [6] "# this workflow runs on pushes to main or master or any time a new tag is pushed"                                                         
       [7] "  push:"                                                                                                                                  
       [8] "    branches: [main, master]"                                                                                                             
       [9] "    tags: ['*']"                                                                                                                          
      [10] "jobs:"                                                                                                                                    
      [11] "  call-workflow:"                                                                                                                         
      [12] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/update-pkgdown.yml@main"                                                          

# use_update_roxygen_docs() works

    Code
      test
    Output
       [1] "# run devtools::document and open any changes as a pull request to the branch that started the workflow"         
       [2] "name: call-update-docs"                                                                                          
       [3] "on:"                                                                                                             
       [4] "# workflow_dispatch requires pushing a button to run the workflow manually. uncomment the following line to add:"
       [5] "  #workflow_dispatch:"                                                                                           
       [6] "  # Runs the workflow on each push to the main or master branch:"                                                
       [7] "  push:"                                                                                                         
       [8] "    branches: [main, master]"                                                                                    
       [9] "jobs:"                                                                                                           
      [10] "  call-workflow:"                                                                                                
      [11] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/update-roxygen-docs.yml@main"                            

# use_style_r_code() works

    Code
      test
    Output
       [1] "# use styler::style_active_package() to style code and open any changes as a pull request to the branch that started the workflow"        
       [2] "name: call-style"                                                                                                                         
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "# workflow_dispatch requires pushing a button to run the workflow manually. uncomment the following line to add:"                         
       [6] "  #workflow_dispatch:"                                                                                                                    
       [7] "  # Runs the workflow on each push to the main or master branch:"                                                                         
       [8] "  push:"                                                                                                                                  
       [9] "    branches: [main, master]"                                                                                                             
      [10] "jobs:"                                                                                                                                    
      [11] "  call-workflow:"                                                                                                                         
      [12] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/style-r-code.yml@main"                                                            

# use_build_deploy_bookdown() works

    Code
      txt
    Output
       [1] "# builds bookdown in a repo that is an R pkg, then deploys to a branch gh-pages"                                                          
       [2] "name: call-build-deploy-bookdown"                                                                                                         
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "# this workflow runs on pushes to main or master or manually with the click of a button in actions."                                      
       [6] "  push:"                                                                                                                                  
       [7] "    branches: [main, master]"                                                                                                             
       [8] "  workflow_dispatch:"                                                                                                                     
       [9] "jobs:"                                                                                                                                    
      [10] "  call-workflow:"                                                                                                                         
      [11] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/build-deploy-bookdown.yml@main"                                                   
      [12] "      with:"                                                                                                                              
      [13] "        bookdown_input: . # where the bookdown .Rmd files are located"                                                                    
      [14] "        bookdown_output_dir: _book # where the bookdown files are rendered to."                                                           
      [15] "        deployment_dir: _book # The subfolder of the gh-pages branch that the bookdown is deployed to."                                   

# use_spell_check() works

    Code
      test
    Output
       [1] "# run devtools::spell_check()"                                                                                                            
       [2] "name: call-spell-check"                                                                                                                   
       [3] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [4] "on:"                                                                                                                                      
       [5] "# this workflow runs on pushing to main, pull requests to main, and manually."                                                            
       [6] "  push:"                                                                                                                                  
       [7] "    branches:"                                                                                                                            
       [8] "      - main"                                                                                                                             
       [9] "  pull_request:"                                                                                                                          
      [10] "    branches:"                                                                                                                            
      [11] "      - main"                                                                                                                             
      [12] "  workflow_dispatch:"                                                                                                                     
      [13] "jobs:"                                                                                                                                    
      [14] "  call-workflow:"                                                                                                                         
      [15] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/spell-check.yml@main"                                                             

# use_connect_publish() works

    Code
      test
    Output
       [1] "# This action publishes to connect using the git-backed workflow. Note that"                                                              
       [2] "# it is only necessary to do it this way if the product is in a private or"                                                               
       [3] "# internal repository; otherwise, it is far easier to deploy following the"                                                               
       [4] "# instructions in https://docs.posit.co/connect/user/git-backed/"                                                                         
       [5] ""                                                                                                                                         
       [6] "# To use this workflow, the user will need to generate the manifest.json,"                                                                
       [7] "# and add 2 secrets, one named"                                                                                                           
       [8] "# CONNECT_URL containing the connect url (complete with https:// in front of"                                                             
       [9] "# the address) and one named CONNECT_API_KEY, containing an API Key from connect."                                                        
      [10] "# To generate the manifest file, follow instructions in the create a manifest "                                                           
      [11] "# from r setup and pushing it to github:"                                                                                                 
      [12] "# https://docs.posit.co/connect/user/git-backed/#creating-a-manifest-file-from-r"                                                         
      [13] "# See  https://docs.posit.co/connect/user/api-keys/#api-keys-creating for"                                                                
      [14] "# instructions on creating and API key from connect and"                                                                                  
      [15] "# https://octopus.com/blog/githubactions-secrets for instructions on creating"                                                            
      [16] "# secrets."                                                                                                                               
      [17] "name: call-connect-publish"                                                                                                               
      [18] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
      [19] "on:"                                                                                                                                      
      [20] "  push:"                                                                                                                                  
      [21] "    branches: [main, master]"                                                                                                             
      [22] "# could change the build trigger to be specific to changes in the product, e.g.,"                                                         
      [23] "# for changes only in the R markdown product called my-prod.Rmd:"                                                                         
      [24] "#on:"                                                                                                                                     
      [25] "#  push:"                                                                                                                                 
      [26] "#    branches: [main, master]"                                                                                                            
      [27] "#    paths:"                                                                                                                              
      [28] "#      - 'my-prod.Rmd' "                                                                                                                  
      [29] "jobs:"                                                                                                                                    
      [30] "  call-workflow:"                                                                                                                         
      [31] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/connect-publish.yml@main"                                                         
      [32] "    secrets:"                                                                                                                             
      [33] "      # can change secrets.CONNECT_URL or secrets.CONNECT_API_KEY to a different "                                                        
      [34] "      # secret name if it is named differently in the repository."                                                                        
      [35] "      CONNECT_URL: ${{ secrets.CONNECT_URL }} "                                                                                           
      [36] "      CONNECT_API_KEY: ${{ secrets.CONNECT_API_KEY }}"                                                                                    

