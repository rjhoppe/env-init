$lang_select = Read-Host -Prompt "Select your new project language: Python `nGo `nNode.js"

if ($lang_select -eq "Python") {
  $py = python --version
  $dir = "c:\Users\Rick\Documents\Python_Practice"
  if ($py -eq $null) {
    Write-Host "No Python version found. Please download and install Python before trying again."
  } else {
    $env_dir = Read-Host -Prompt "List the directory for your new Python project: `nEX: AWS\aws-python-lambda-func"
  }

  $full_dir = $dir+$env_dir

  if (Test-Path -Path $full_dir) {
    Write-Host "Moving into directory..."
    cd $full_dir
    Write-Host "Creating venv..."
    python -m venv .venv
    New-Item -Path . -Name "main.py" -ItemType "file"
  } else {
    Write-Host "Creating directory..."
    mkdir $full_dir
    Write-Host "Moving into directory..."
    cd $full_dir
    Write-Host "Creating venv..."
    python -m venv .venv
    Write-Host "Creating necessary files..."
    New-Item -Path . -Name "main.py" -ItemType "file"
    New-Item -Path . -Name "requirements.txt" -ItemType "file"
  }

  $project_type = Read-Host -Prompt "Select your project type: Basic `nData `nCloud"

  if ($project_type -eq "Data") {
    Write-Host "Installing necessary libraries..."
    python -m pip install pandas numpy sqlalchemy python-dotenv
  }

  Write-Host "New $($project_type) Python env set up, happy hacking!"
  code .


} else if ($lang_select -eq "Node.js") {
  $node = node --version
  $dir = "c:\Users\Rick\Documents\JavaScript_Practice"
    if ($node -eq $null) {
    Write-Host "No Node.js version found. Please download and install Node.js before trying again."
  } else {
    $env_dir = Read-Host -Prompt "List the directory for your new Node.js project: `nEX: node-calculator-app"
  }

  $full_dir = $dir+$env_dir

  if (Test-Path -Path $full_dir) {
    Write-Host "Moving into directory..."
    cd $full_dir
  } else {
    Write-Host "Creating directory..."
    mkdir $full_dir
    Write-Host "Moving into directory..."
    cd $full_dir
  }

  $project_type = Read-Host -Prompt "Select your project type: Basic `nReact `nNext.js"
  
  if ($project_type -eq "Basic") {
    Write-Host "Creating necessary files..."
    New-Item -Path . -Name "index.html" -ItemType "file"
    New-Item -Path . -Name "styles.css" -ItemType "file"
    New-Item -Path . -Name "script.js" -ItemType "file"
  } else if ($project_type -eq "React") {
    $project_name = Read-Host -Prompt "Enter in your React project name: `nEX: react-movie-app"
    Write-Host "Creating React env..."
    yarn create react-app $project_name
  }

  Write-Host "New $($project_type) Node.js env set up, happy hacking!"
  code .

}


