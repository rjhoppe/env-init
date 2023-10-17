$py = python --version
$dir = "c:\Users\Rick\Documents\Python_Practice\"
if ($py -eq $null) {
  Write-Host "No Python version found. Please download and install Python before trying again."
} else {
  $env_dir = Read-Host -Prompt "List the directory for your new Python project`nEX: AWS\aws-python-lambda-func`nProject directory"
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

$project_type = Read-Host -Prompt "Select your project type: Basic | Data | Cloud"

if ($project_type -eq "Data") {
  Write-Host "Creating .env file..."
  New-Item -Path . -Name ".env" -ItemType "file"
  Write-Host "Activating env..." 
  .venv\Scripts\activate
  Write-Host "Installing necessary libraries..."
  python -m pip install pandas numpy sqlalchemy pytest python-dotenv
  Add-Content .\main.py "import numpy as np"
  Add-Content .\main.py "import pandas as pd"
  Add-Content .\main.py "from dotenv import load_dotenv"
  Add-Content .\main.py "import sqlalchemy"
  Add-Content .\main.py "import pytest"
  python -m pip freeze > requirements.txt
}

Write-Host "New $($project_type) Python env set up, happy hacking!"
code .