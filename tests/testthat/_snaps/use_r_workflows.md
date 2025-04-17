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
      [13] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/r-cmd-check.yml@main"                                                             
      [14] "    with:"                                                                                                                                
      [15] "      use_full_build_matrix: true"                                                                                                        
      [16] "      depends_on_tmb: true"                                                                                                               
      [17] "      depends_on_quarto: true"                                                                                                            

---

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
      [15] "      depends_on_tmb: true"                                                                                                               
      [16] "      depends_on_quarto: true"                                                                                                            

---

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
      [16] "      depends_on_quarto: true"                                                                                                            

---

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
      [15] "      depends_on_quarto: true"                                                                                                            

---

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
      [16] "      depends_on_tmb: true"                                                                                                               

---

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
      [15] "      depends_on_tmb: true"                                                                                                               

---

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

---

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

# all use_r_cmd_check() options work with additional args

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      use_full_build_matrix: true"                                                                                                        
      [25] "      depends_on_tmb: true"                                                                                                               
      [26] "      depends_on_quarto: true"                                                                                                            

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      depends_on_tmb: true"                                                                                                               
      [25] "      depends_on_quarto: true"                                                                                                            

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      use_full_build_matrix: true"                                                                                                        
      [25] "      depends_on_quarto: true"                                                                                                            

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      depends_on_quarto: true"                                                                                                            

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      use_full_build_matrix: true"                                                                                                        
      [25] "      depends_on_tmb: true"                                                                                                               

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      depends_on_tmb: true"                                                                                                               

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             
      [24] "      use_full_build_matrix: true"                                                                                                        

---

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
      [15] "      additional_args_ubuntu: |"                                                                                                          
      [16] "        sudo apt-get update"                                                                                                              
      [17] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [18] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [19] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [20] "      additional_args_macos: |"                                                                                                           
      [21] "        brew install curl"                                                                                                                
      [22] "      additional_args_windows: |"                                                                                                         
      [23] "        tree"                                                                                                                             

# use_r_cmd_check() works with additional_args mac only

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
      [15] "      additional_args_macos: |"                                                                                                           
      [16] "        brew install curl"                                                                                                                
      [17] "      use_full_build_matrix: true"                                                                                                        

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
       [8] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/calc-coverage.yml@main"                                                           
       [9] "    secrets:"                                                                                                                             
      [10] "      CODECOV_TOKEN: ${{ secrets.CODECOV_TOKEN}}"                                                                                         

# use_calc_coverage() works with use-public-rspm = FALSE

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
       [9] "    with:"                                                                                                                                
      [10] "      use-public-rspm: false"                                                                                                             
      [11] "    secrets:"                                                                                                                             
      [12] "      CODECOV_TOKEN: ${{ secrets.CODECOV_TOKEN}}"                                                                                         

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
      [14] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/create-cov-badge.yml@create-cov-badge # change to main"                           

# use_create_cov_badge() works with use-public-rspm = FALSE

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
      [14] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/create-cov-badge.yml@create-cov-badge # change to main"                           
      [15] "    with:"                                                                                                                                
      [16] "      use-public-rspm: false"                                                                                                             

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

# use_update_pkgdown()) works with additional_args

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
      [13] "    with:"                                                                                                                                
      [14] "      additional_args_ubuntu: |"                                                                                                          
      [15] "        sudo apt-get update"                                                                                                              
      [16] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [17] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [18] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [19] "      additional_args_macos: |"                                                                                                           
      [20] "        brew install curl"                                                                                                                
      [21] "      additional_args_windows: |"                                                                                                         
      [22] "        tree"                                                                                                                             

# use_build_pkgdown()) works with additional_args

    Code
      test
    Output
       [1] "# Checks that the pkgdown site builds for a repository."                                                                                  
       [2] "# this assumes pkgdown is already set up."                                                                                                
       [3] "name: call-build-pkgdown"                                                                                                                 
       [4] "# on specifies the build triggers. See more info at https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows"
       [5] "on:"                                                                                                                                      
       [6] "# this workflow runs on pushes to main or master or any time a new tag is pushed"                                                         
       [7] "# it also runs everytime a pull request to main or master is opened."                                                                     
       [8] "  push:"                                                                                                                                  
       [9] "    branches: [main, master]"                                                                                                             
      [10] "    tags: ['*']"                                                                                                                          
      [11] "  pull_request:"                                                                                                                          
      [12] "    branches: [main, master]"                                                                                                             
      [13] "jobs:"                                                                                                                                    
      [14] "  call-workflow:"                                                                                                                         
      [15] "    uses: nmfs-fish-tools/ghactions4r/.github/workflows/build-pkgdown.yml@main"                                                           
      [16] "    with:"                                                                                                                                
      [17] "      additional_args_ubuntu: |"                                                                                                          
      [18] "        sudo apt-get update"                                                                                                              
      [19] "        sudo apt-get install -y libcurl4-openssl-dev"                                                                                     
      [20] "        sudo add-apt-repository ppa:ubuntu-toolchain-r/test"                                                                              
      [21] "        sudo apt-get install --only-upgrade libstdc++6"                                                                                   
      [22] "      additional_args_macos: |"                                                                                                           
      [23] "        brew install curl"                                                                                                                
      [24] "      additional_args_windows: |"                                                                                                         
      [25] "        tree"                                                                                                                             

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

