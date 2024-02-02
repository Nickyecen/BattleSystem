lista_constantes = []

file_name = input("Digite o arquivo do jogador:\n")

while file_name != ".":

    player_const = file_name.split('.')[0].upper()
    player_pic_const = player_const + "-PIC"

    gen_name = input("Digite o nome da geração:\n")
    player_name = input("Digite o verdadeiro nome do personagem:\n")

    print("Digite o os apelidos separados por espaço:")
    lista = input().split()

    definição = "(define "+player_pic_const+" (bitmap \"images/hololive/"+gen_name+"/"+file_name+"\"))\n(define "+player_const+" (make-player \""+player_name+"\" 24 (scale (/ PIC_SIZE (image-width "+player_pic_const+")) "+player_pic_const+")))\n"
    for apelido in lista:
        definição += "(define "+apelido.upper()+" "+player_const+") "
    definição += "\n"

    lista_constantes.append(definição)

    file_name = input("Digite o arquivo do jogador:\n")

print()
for definição in lista_constantes:
    print(definição)
    print()