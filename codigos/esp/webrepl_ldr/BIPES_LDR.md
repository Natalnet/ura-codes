# Controlando o LDR usando o BIPES e Web Repl

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

## Código do LDR feito no BIPES

Com o ESP-32 configurado, este é código produzido e que deve ser executado no BIPES

![1](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_code_ldr.png)





