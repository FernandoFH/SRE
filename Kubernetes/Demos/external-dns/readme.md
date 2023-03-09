-  Crearemos una IAM Policy y un Role para permitirle a External-DNS interactuar con la api de AWS.

`aws iam create-policy --policy-name externaldns_permissions --policy-document file://02-iam_policy.json`

- Creamos el I.R.S.A. (IAM Role for Service Account)

<code>
  eksctl create iamserviceaccount \
  --name external-dns \
  --namespace external-dns \
  --cluster golangvzla \
  --attach-policy-arn arn:aws:iam::714780641622:policy/externaldns_permissions \
  --approve \
  --override-existing-serviceaccounts 
<code>

- Extraemos el ARN del Role
<code>
eksctl get iamserviceaccount \
  --cluster golangvzla \
  -o json | jq \
  -r '.[] | select(.metadata.name=="external-dns").status.roleARN'
<code>