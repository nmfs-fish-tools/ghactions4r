# add_args() works with additional_args

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
      [13] "    with:"                                                                                                                                
      [14] "      additional_args_ubuntu: |"                                                                                                          
      [15] "        sudo apt-get update"                                                                                                              
      [16] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [17] "      additional_args_macos: |"                                                                                                           
      [18] "        brew install curl"                                                                                                                
      [19] "      additional_args_windows: |"                                                                                                         
      [20] "        tree"                                                                                                                             

# add_args() works with txt and prev_line

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
      [13] "      additional_args_ubuntu: |"                                                                                                          
      [14] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [15] "    with:"                                                                                                                                
      [16] "      additional_args_ubuntu: |"                                                                                                          
      [17] "        sudo apt-get update"                                                                                                              
      [18] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [19] "      additional_args_macos: |"                                                                                                           
      [20] "        brew install curl"                                                                                                                
      [21] "      additional_args_windows: |"                                                                                                         
      [22] "        tree"                                                                                                                             

