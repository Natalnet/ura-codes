# Controle do led interno usando BIPES e WEB Repl

Esse projeto contém os códigos necessários e passo a passo para o controle do led interno do ESP-32 de forma remota.

## Pré-requisitos

##### Antes de todo o processo, acesse esse pequeno passo a passo para instalar o firmware em seu ESP-32. [Acesse aqui](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_exec.png)

## Configuração interna

Para que o sistema remoto esteja disponível, é necessário que seu ESP-32 esteja conectado a uma rede com conexão a internet, portanto, altere as credencias presentes na configuração interna:

```bash
{
    "ssid":"<ssid>",
    "password":"<password>"
}
```

## Código do LED feito no BIPES

Com os passos anteriores concluídos, este é o código que devem ser produzido no web IDE BIPES, utilizando a programação em blocos

![1](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_code_gpio2.png)





