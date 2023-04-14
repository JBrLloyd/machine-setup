winget install `
  Kubernetes.minikube 
  TortoiseSVN.TortoiseSVN `
  starship `
  --accept-package-agreements

"Invoke-Expression (&starship init powershell)" | Out-File -Append $PROFILE
