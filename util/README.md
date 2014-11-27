# Script auxiliar para capturar o texto de 1988

Seguem instruções para quem usam Windows.

Instale as dependências:
- [Ruby](http://rubyinstaller.org/)
- [DevKit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)
- Nokogiri: `gem install nokogiri`
- [Curb](http://blog.cloud-mes.com/2014/08/19/how-to-install-gem-curb-in-windows/)

Configure o ambiente no PowerShell do GitShell:
```powershell
PS> cd ConstituicaoBrasileira\util
PS> $env:Path += ";" + $pwd.Path

PS> cd DIRETÓRIO_DE_INTERESSE
```

**Exemplo para pegar o artigo 2º:**
```powershell
PS> cd ..\pt-br\titulo_i
PS> con1988.rb 2
```
