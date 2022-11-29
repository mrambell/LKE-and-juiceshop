# Aka - JuiceShop Helm Chart
Installs JuiceShop via Helm into k8s

## Usage
Install
```kubernetes helm
helm install aka-juice -n <namespace> helm/aka-juice

# overwrite vars:
helm install aka-juice -n mike-test --set app.juiceshop.ingress.url="www.mattia.juice.org" helm/aka-juice
```

Check version / installation
```kubernetes helm
helm list
```

Uninstall
```kubernetes helm
helm uninstall aka-juice
```

## Requirements
Within k8s:
- ingress-nginx 
- cert-manager (incl. usable [cluster]?-issuer)
- external-dns (incl. enabled AKAMAI plugin) version >= xx.xx.xx

Local:
- helm

