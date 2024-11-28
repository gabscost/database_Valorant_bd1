drop table if exists player cascade;
drop table if exists mapa cascade;
drop table if exists modo_de_jogo cascade;
drop table if exists Agentes cascade;
drop table if exists Categoria_Agente cascade;
drop table if exists Selecao_agente cascade;
drop table if exists Partida cascade;
drop table if exists Competitivo cascade;
drop table if exists SemClass cascade;
drop table if exists iniciar cascade;
drop table if exists Personalizada cascade;
drop table if exists Acontece_partida cascade;
drop table if exists config cascade;
drop table if exists carreira cascade;
drop table if exists temporada cascade;
drop table if exists passe_batalha cascade;
drop table if exists adquiri_passe cascade;

create table player(
id_player int,
tag_nome text,
nome_jogo text,
data_Reg date,
primary key (id_player)
);

create table mapa(
cod_mapa int,
nome text,
descricao text, 
data_lanca date,
loc text,
primary key (cod_mapa)	
);

create table modo_de_jogo(
id_modo int,
tipo text,
descricao text,	
primary key (id_modo)	
);

create table Competitivo(
	id_modo int references modo_de_jogo(id_modo),
	ranked text
);

create table semClass(
	id_mod int references modo_de_jogo(id_modo),
	xp text
);

create table Personalizada(
	id_modoo int references modo_de_jogo(id_modo),
	cheating text,
	tipo_p text
);
create table Categoria_Agente(
	cod_cat int primary key,
	tipo text,
	descricao text
);

create table Agentes(
cod_agente int,
nome_Agente text,
descricao text,
cod_cate int references Categoria_Agente(cod_cat),
primary key (cod_agente)	
);



create table Selecao_agente(
	idPlayer int references player(Id_player),
	cod_a int references Agentes(cod_agente),
	tempo smallint check (tempo>0)
);



create table Partida(
	id_partida int primary key,
	horap date,
	credito_kd text
);

create table iniciar(
	id_pl int references player(id_player),
	cod_agente int references Agentes(cod_agente),
	id_p INT REFERENCES Partida(id_partida)
);


CREATE TABLE Acontece_partida (
    id_mod INT REFERENCES modo_de_jogo(id_modo),
    id_mapa int REFERENCES mapa(cod_mapa),
    id_part INT REFERENCES Partida(id_partida)
);
create table config(
	id_cofig int primary key,
	id_player int references player(id_player),
	video text,
	audio text,
	sensi text
);

create table carreira(
	id_carreira int primary key,
	id_pla int references player(id_player),
	id_partida  INT REFERENCES Partida(id_partida),
	p_rank varchar(50)
);

create table temporada(
	id_temp int primary key,
	semestre char(10),
	descricao text
);


CREATE TABLE passe_batalha (
    id_passe int PRIMARY KEY,
    id_tempo INT REFERENCES temporada(id_temp),
    nome_item TEXT,
    descricao_item TEXT,
    exclusivo BOOLEAN,
    UNIQUE (nome_item)
);

create table adquiri_passe(
	id_passeB int references passe_batalha(id_passe),
	id_player int references player(Id_player)
);

insert into player values(1,'noobMaster#36','noobMaster63','16/08/2020'),
(2,'ShadowStriker#br01','ShadowStriker','19/10/2021'),
(3,'CyberNinjaX#03','CyberNinjaX','21/11/2022'),
(4,'QuantumReaper#100','QuantumReaper','31/01/2023'),
(5, 'GalacticStorm#55', 'GalacticStorm', '14/03/2023'),
(6, 'ThunderPulse#27', 'ThunderPulse', '02/06/2023'),
(7, 'InfernoPhoenix#78', 'InfernoPhoenix', '18/09/2023'),
(8, 'VortexViper#10', 'VortexViper', '25/11/2023'),
(9, 'NebulaKnight#42', 'NebulaKnight', '03/02/2023'),
(10, 'FrostByteX#89', 'FrostByteX', '19/04/2023');

insert into Categoria_Agente values 
(1,'Duelista','Agentes especializados em habilidades rapidas baseadas em tiros'),
(2,'Controlador','Agentes specilizados em fazer cortinas de fumaca'),
(3,'Sentinela','Agentes specilizados em defesa'),
(4,'Iniciador','Agentes especilizados em flahs/granadas de luz');

insert into Agentes values 
(1,'Sage','Capaz de reviver aliados',3),
(2, 'Jett', 'Ágil e letal com sua mobilidade', 1),
(3, 'Brimstone', 'Controla o campo de batalha com fumaça', 2),
(4, 'Cypher', 'Mestre em vigilância e informações', 3),
(5, 'Phoenix', 'Manipula o fogo para causar destruição', 1),
(6, 'Omen', 'Teletransporta-se pelo campo de batalha', 2),
(7, 'Killjoy', 'Usa gadgets para controlar o espaço inimigo', 3),
(8, 'Breach', 'Desencadeia terremotos e flashes para atacar', 4),
(9, 'Sova', 'Rastreia inimigos com setas e drones', 4),
(10, 'Raze', 'Usa explosivos para criar caos no campo de batalha', 1);

insert into mapa values
(1, 'Bind', 'Um local místico e ligado a dimensões alternativas', '14/06/2020', 'Europa'),
(2, 'Split', 'Uma cidade futurista vertical com várias alturas', '14/06/2020', 'Ásia'),
(3, 'Haven', 'Uma ilha com três bomb sites para defesa ou ataque', '14/06/2020', 'Atlântico Norte'),
(4, 'Ascent', 'Uma cidade italiana rica em luxo e cultura', '02/09/2020', 'Europa'),
(5, 'Icebox', 'Uma instalação de pesquisa no Ártico com plataformas elevadas', '13/10/2020', 'Ártico'),
(6, 'Breeze', 'Uma ilha tropical com amplas áreas ao ar livre', '27/04/2021', 'Atlântico Sul');

insert into modo_de_jogo values(1,'Competitivo','Partida que da uma classificacao para o jogador'),
(2,'Sem Classificacao','partida nao gera rank, porem ela gera xp pra upar'),
(3,'Partida personalizada','Aqui o caos come solto, o limite e a imaginacao');

insert into Competitivo values(1,'ouro '),(1, 'Prata'),
(1,'bronze'),(1,'Ferro'), (1,'Platina'),(1,'Diamante'),(1,'Ascendente');

insert into semClass values
(2, '0'),
(2, '10'),
(2, '20'),
(2, '30'),
(2, '40'),
(2, '50'),
(2, '60'),
(2, '70'),
(2, '80'),
(2, '90'),
(2, '100');
insert into Personalizada values (3, 'Armas com munição infinita', 'Pega bandeira'),
(3, 'Municao e dinheiro infinitos ', 'Mata-Mata'),
(3, 'Habilidades infinitas', 'Ataque e Defesa'),
(3, 'Municao,dinheiro e Habilidades infinitas', 'Eliminação');
insert into Partida values
(1, '2023/01/01', '+27 pts'),
(2, '2023/02/01', '-28pts'),
(3, '2023/03/01', '+10'),
(4, '2023/04/01', '+12'),
(5, '2023/05/01', '+21'),
(6, '2023/06/01', '-34'),
(7, '2023/07/01', '-5'),
(8, '2023/08/02', '+23'),
(9, '2023/08/02', '+23'),
(10, '2023/08/02', '+23');

insert into carreira values
(1, 1, 1, 'Silver 2'),
(2, 2, 2, 'Gold 1'),
(3, 3, 3, 'Platinum 3'),
(4, 4, 4, 'Diamond 1'),
(5, 5, 5, 'Gold 2'),
(6, 6, 6, 'Platinum 1'),
(7, 7, 7, 'Diamond 3');

insert into iniciar values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);


insert into Acontece_partida values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(1, 4, 4),
(2, 5, 5), 
(3, 6, 6);

insert into Selecao_agente values
(1, 1, 30),  
(2, 3, 25), 
(3, 5, 40), 
(4, 7, 15), 
(5, 9, 35),  
(6, 2, 20),  
(7, 4, 32),  
(8, 6, 40),  
(9, 8, 18),  
(10, 10, 40);

insert into config values
(1, 1, 'alta', 'estereo', '2.5'),
(2, 2, 'média', 'surround', '3.0'),
(3, 3, 'baixa', 'mono', '1.8'),
(4, 4, 'média', 'estereo', '2.0'),
(5, 5, 'alta', 'surround', '3.2'),
(6, 6, 'baixa', 'mono', '1.5'),
(7, 7, 'média', 'estereo', '2.8');

insert into temporada values
(1, '2023-S1', 'Temporada 1 de 2023'),
(2, '2023-S2', 'Temporada 2 de 2023'),
(3, '2023-S3', 'Temporada 3 de 2023'),
(4, '2023-S4', 'Temporada 4 de 2023'),
(5, '2023-S5', 'Temporada 5 de 2023'),
(6, '2023-S6', 'Temporada 6 de 2023'),
(7, '2023-S7', 'Temporada 7 de 2023');

INSERT INTO passe_batalha  VALUES
(1,2, 'Skin de Arma Exclusiva', 'Uma skin exclusiva para a temporada', true),
(2,3, 'Emote Personalizado', 'Um emote divertido para suas comemorações', false),
(3,1, 'Chave de Caixa Misteriosa', 'Abre uma caixa com itens aleatórios', false),
(4,6, 'Spray Personalizado', 'Um spray exclusivo para marcar o território', true),
(5,4, 'Bandeira Exclusiva', 'Uma bandeira personalizada para mostrar seu estilo', true),
(6,5, 'Efeito de Munição Especial', 'Dá um efeito especial às suas balas', false);
insert into adquiri_passe values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

--listar jogadores com respectivos agentes, e a categoria de cada agente
SELECT p.tag_nome, a.nome_Agente, ca.tipo
FROM player p
JOIN Selecao_agente sa ON p.id_player = sa.idPlayer
JOIN Agentes a ON sa.cod_a = a.cod_agente
JOIN Categoria_Agente ca ON a.cod_cate = ca.cod_cat;
--partidas personalizadas e os mapas que estao nas partidas
SELECT p.id_partida, m.tipo, mp.nome
FROM Partida p
JOIN Acontece_partida ap ON p.id_partida = ap.id_part
JOIN modo_de_jogo m ON ap.id_mod = m.id_modo
JOIN mapa mp ON ap.id_mapa = mp.cod_mapa
WHERE m.tipo = 'Partida personalizada';

--obter quantidade de partidas jogadas por categoria de agentes 
SELECT ca.tipo, COUNT(*) AS total_partidas
FROM Categoria_Agente ca
JOIN Agentes a ON ca.cod_cat = a.cod_cate
JOIN Selecao_agente sa ON a.cod_agente = sa.cod_a
GROUP BY ca.tipo;

--itens exclusivos adquirido pelo player dos passes de batalhas, junto da descricao
SELECT p.tag_nome, pb.nome_item, pb.descricao_item
FROM player p
JOIN adquiri_passe ap ON p.id_player = ap.id_player
JOIN passe_batalha pb ON ap.id_passeB = pb.id_passe
WHERE pb.exclusivo = true;

--obter media de xp ganho em partidas Sem classificacao
SELECT AVG(CAST(sc.xp AS INT)) AS media_xp
FROM SemClass sc
JOIN modo_de_jogo m ON sc.id_mod = m.id_modo
WHERE m.tipo = 'Sem Classificacao';

--mapas associados a cada partida e o tipo de modo de jogo ocorrido nessas partidas.  
SELECT p.id_partida, m.nome AS mapa, mj.tipo AS modo
FROM Partida p
JOIN Acontece_partida ap ON p.id_partida = ap.id_part
JOIN mapa m ON ap.id_mapa = m.cod_mapa
JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo;

--Obter a contagem de jogadores por temporada
SELECT t.semestre, COUNT(p.id_player) AS total_jogadores
FROM temporada t
LEFT JOIN carreira c ON t.id_temp = c.id_partida
LEFT JOIN player p ON c.id_pla = p.id_player
GROUP BY t.semestre;
--Listar todas as partidas e os 
--jogadores associados:
SELECT p.id_partida, p.horap, pl.tag_nome
FROM Partida p
RIGHT JOIN iniciar i ON p.id_partida = i.id_p
RIGHT JOIN player pl ON i.id_pl = pl.id_player;


--Mostrar jogadores e suas configurações de áudio e vídeo:
SELECT p.tag_nome, c.video, c.audio, c.sensi
FROM player p
JOIN config c ON p.id_player = c.id_player;

-- Listar todos os mapas e modos de 
--jogo em partidas, com a indicação se são competitivas ou Personalizadas:
SELECT m.nome AS mapa, mj.tipo AS modo, 'Competitivo' AS categoria
FROM Partida p
JOIN Acontece_partida ap ON p.id_partida = ap.id_part
JOIN mapa m ON ap.id_mapa = m.cod_mapa
JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo
WHERE mj.tipo = 'Competitivo'
UNION
SELECT m.nome AS mapa, mj.tipo AS modo, 'Personalizada' AS categoria
FROM Partida p
JOIN Acontece_partida ap ON p.id_partida = ap.id_part
JOIN mapa m ON ap.id_mapa = m.cod_mapa
JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo
WHERE mj.tipo = 'Partida personalizada';

--listar os jogadores, agentes selecionados em partidas sem classificação:
SELECT p.tag_nome, a.nome_Agente, COUNT(DISTINCT p.id_player) AS total_players
FROM player p
JOIN Selecao_agente sa ON p.id_player = sa.idPlayer
JOIN Agentes a ON sa.cod_a = a.cod_agente
WHERE EXISTS (
    SELECT 1
    FROM Acontece_partida ap
    JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo
    WHERE ap.id_part = p.id_player
    AND mj.tipo = 'Sem Classificacao'
)
GROUP BY p.tag_nome, a.nome_Agente;





--partidas onde NENHUM jogador jogou partidas sem classificação:
SELECT id_partida
FROM Partida pa
WHERE NOT EXISTS (
    SELECT 1
    FROM player p
    JOIN Acontece_partida ap ON p.id_player = ap.id_part
    JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo
    WHERE pa.id_partida = ap.id_part
    AND mj.tipo = 'Sem Classificacao'
);


-- partidas personalizadas e o número de agentes selecionados por eles:
SELECT p.tag_nome, COUNT(DISTINCT sa.cod_a) AS agentes_selecionados
FROM player p
JOIN Selecao_agente sa ON p.id_player = sa.idPlayer
JOIN Partida pa ON sa.idPlayer = pa.id_partida
JOIN Acontece_partida ap ON pa.id_partida = ap.id_part
JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo
WHERE mj.tipo = 'Partida personalizada'
GROUP BY p.tag_nome;







