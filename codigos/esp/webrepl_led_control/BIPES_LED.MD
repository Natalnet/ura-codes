# Controle do led interno usando BIPES e WEB Repl

Esse projeto contém os códigos necessários e passo a passo para o controle do led interno do ESP-32 de forma remota.

## Pré-requisitos

##### Antes de todo o processo, acesse esse pequeno passo a passo para instalar o firmware em seu ESP-32. [Acesse aqui](https://www.youtube.com/watch?v=uL_kh7kD6Qc)

* Baixe a versão do firmware Micro Python v1.19.1 [Baixe aqui](https://micropython.org/resources/firmware/esp32-20220618-v1.19.1.bin)

* Configure seu ESP-32 para o suporte ao Web Repl [Tutorial](https://learn.adafruit.com/micropython-basics-esp8266-webrepl/access-webrepl)

## Configuração interna

Para que o sistema remoto esteja disponível, é necessário que seu ESP-32 esteja conectado a uma rede com conexão a internet, portanto, altere as credencias presentes na configuração interna:

```bash
{
    "ssid":"<ssid>",
    "password":"<password>"
}
```

## Conexão com o BIPES

Antes de começarmos a programar devemos acessar o site do BIPES. [Acesse aqui](http://bipes.net.br/ide/)

* Aperte no botão de conexão, semelhante ao ícone do WiFi

![1](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_header.png)

##### Escolha a placa "ESP-32" após a configuração do ambiente de desenvolvimento.

* Escolha o método padrão de conexão

![2](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_cfg.png)

##### Nesta opção, vamos escolher o método usando conexão remota através do IP gerado pelo ESP-32 (exemplo: "ws://192.168.4.1:8266/").

## Código do LED feito no BIPES

Com os passos anteriores concluídos, este é o código que devem ser produzido no web IDE BIPES, utilizando a programação em blocos

![3](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_code_gpio2.png)

## Executando o código no BIPES

Depois do código feito, basta executar:

![4](https://github.com/Natalnet/ura-codes/blob/master/imagens/bipes_exec.png)



