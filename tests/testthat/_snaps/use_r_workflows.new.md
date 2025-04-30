# all use_r_cmd_check() options work without additional args

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
      [13] "    uses: nmfs-ost/ghactions4r/.github/workflows/r-cmd-check.yml@main"                                                                    
      [14] "    with:"                                                                                                                                
      [15] "      use_full_build_matrix: true"                                                                                                        
      [16] "      depends_on_tmb: true"                                                                                                               
      [17] "      depends_on_quarto: true"                                                                                                            

# use_calc_cov_summaries() works

    Code
      test
    Output
       [1] "# call a workflow that runs covr::codecov() to calculate code coverage, then"                                                             
       [2] "# uses octocov to summarize the coverage information and post it as appropriate."                                                         
       [3] ""                                                                                                                                         
       [4] "# note that a .octocov.yml file in the repository is also necessary."                                                                     
       [5] "name: call-calc-cov-summaries"                                                                                                            
       [6] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [7] "# The default is to run the workflow on every push or pull request opened to main."                                                       
       [8] "on:"                                                                                                                                      
       [9] "  workflow_dispatch:"                                                                                                                     
      [10] "  push:"                                                                                                                                  
      [11] "    branches:"                                                                                                                            
      [12] "      - main"                                                                                                                             
      [13] "  pull_request:"                                                                                                                          
      [14] "    types:"                                                                                                                               
      [15] "      - opened"                                                                                                                           
      [16] "    branches:"                                                                                                                            
      [17] "      - main"                                                                                                                             
      [18] "jobs:"                                                                                                                                    
      [19] "  call-workflow:"                                                                                                                         
      [20] "    uses: nmfs-ost/ghactions4r/.github/workflows/calc-cov-summaries.yml@main"                                                             

---

    Code
      test_octoyml
    Output
       [1] "# .octocov.yml. See definitions: https://github.com/k1LoW/octocov?tab=readme-ov-file#configuration"
       [2] "coverage:"                                                                                         
       [3] "  paths:"                                                                                          
       [4] "    - coverage.xml"                                                                                
       [5] "codeToTestRatio:"                                                                                  
       [6] "  code:"                                                                                           
       [7] "    - 'R/**.R'"                                                                                    
       [8] "  test:"                                                                                           
       [9] "    - 'tests/testthat/test*.R'"                                                                    
      [10] "testExecutionTime:"                                                                                
      [11] "  if: true"                                                                                        
      [12] "comment:"                                                                                          
      [13] "  if: is_pull_request"                                                                             
      [14] "summary:"                                                                                          
      [15] "  if: true"                                                                                        

# use_calc_coverage() works

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
       [8] "    uses: nmfs-ost/ghactions4r/.github/workflows/calc-coverage.yml@main"                                                                  
       [9] "    secrets:"                                                                                                                             
      [10] "      CODECOV_TOKEN: ${{ secrets.CODECOV_TOKEN}}"                                                                                         

# use_create_cov_badge() works

    Code
      test
    Output
       [1] "# Reusable workflow to calculate coverage add it to a badge that is stored on "                                                           
       [2] "# a branch in the repo called badges."                                                                                                    
       [3] "# note that this has only been tested to build a badge with the main branch"                                                              
       [4] "# coverage; it may not work to calculate coverage from other branches."                                                                   
       [5] "name: call-create-cov-badge"                                                                                                              
       [6] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [7] "# other option would be to run this on a schedule. Other build trigger options may not work well."                                        
       [8] "on:"                                                                                                                                      
       [9] "  push:"                                                                                                                                  
      [10] "    branches:"                                                                                                                            
      [11] "      - main"                                                                                                                             
      [12] "jobs:"                                                                                                                                    
      [13] "  call-workflow:"                                                                                                                         
      [14] "    uses: nmfs-ost/ghactions4r/.github/workflows/create-cov-badge.yml@main"                                                               

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
      [10] "    uses: nmfs-ost/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                                
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
       [9] "    uses: nmfs-ost/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                                
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
      [8] "    uses: nmfs-ost/ghactions4r/.github/workflows/doc-and-style-r.yml@main"                                                                
      [9] "  "                                                                                                                                       

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
      [12] "    uses: nmfs-ost/ghactions4r/.github/workflows/update-pkgdown.yml@main"                                                                 

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
      [15] "    uses: nmfs-ost/ghactions4r/.github/workflows/spell-check.yml@main"                                                                    

