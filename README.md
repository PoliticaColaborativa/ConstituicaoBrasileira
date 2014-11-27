# Constituição da República Federativa do Brasil — Original de 1988

Com base no [hipertexto](http://www.senado.gov.br/legislacao/const/con1988/CON1988_05.10.1988/index.shtm) que é disponibilizado pelo Senado Federal.

## Motivação e Objetivos

Este projeto tem como objetivo transcrever a Constituição da República Federativa do Brasil de um documento com [dados não estruturados](http://en.wikipedia.org/wiki/Unstructured_data) para um [documento estruturado](http://en.wikipedia.org/wiki/Structured_document), e transpor as emendas constitucionais para versionamento em Git.

A constituição federal, atualmente, é representada ou através de livro em papel ou através de páginas estáticas HTML contendo hiperlinks. Apesar do formato HTML ser semi-estruturado e existir a possibilidade de serem criadas ferramentas de análise da estrutura do HTML e seus hiperlinks, esse formato apenas busca dar uma representação digital do papel, sem explorar o potencial informático hoje disponível.

O artigo científico "[Law is Code: A Software Engineering Approach to Analyzing the United States Code](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2511947)" utiliza técnicas de Engenharia de Software para avaliar um documento jurídico da mesma forma que se avalia software: quanto a evolução, acoplamento, complexidade, entre outros critérios.

Com tal motivação, este projeto visa ensaiar a transcrição digital da constituição brasileira de 1988 e suas emendas, com o intuito de pensar novos formatos de representação da constituição e novas formas de extrair seus dados.

**Estratégia**

Nossa estratégia atual consiste em utilizar o formato Markdown para representar o "código fonte" da constituição e a sua estrutura hierárquica, tendo em vista que é viável convererter desse formato para vários outros tais como HTML, JSON, TEX, ODT e PDF.

Queremos avaliar estratégias de derivação para:
- Representação visual em grafos e _treemap_
- Representação visual de fatos históricos
- Representação visual do impacto na evolução da constituição
- Representação de nível de maturidade da constituição: onde estamos, o que é aceitável e o que precisa melhorar

Leia o [wiki](../../wiki) e aprenda como participar deste projeto.
