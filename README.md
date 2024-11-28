# database_Valorant_bd1

# Banco de Dados de Valorant  

Este projeto apresenta a criação de um banco de dados dedicado ao universo do jogo **Valorant**, abordando aspectos relacionados a jogadores, partidas, agentes, modos de jogo, temporadas e itens sazonais. O objetivo é consolidar informações para facilitar análises, estratégias e a experiência geral dos jogadores.  

---

## 📝 **Objetivo**  
- Fornecer uma estrutura teórica para a organização de dados sobre Valorant.  
- Abordar os desafios inerentes ao gerenciamento de informações complexas e dinâmicas.  
- Proporcionar consultas SQL úteis para explorar informações relacionadas ao jogo.  

---

## 📂 **Estrutura do Banco de Dados**  

O banco de dados abrange as seguintes entidades principais:  
1. **Player:** Dados sobre os jogadores, como tag, nick e configurações.  
2. **Mapa:** Informações sobre os mapas disponíveis no jogo.  
3. **Modo de Jogo:** Detalhes sobre os diferentes modos, como competitivo e personalizado.  
4. **Agentes:** Informações sobre os personagens jogáveis e suas categorias.  
5. **Partidas:** Registro das partidas, incluindo agentes selecionados e mapas.  
6. **Temporadas:** Dados sobre temporadas e seus itens sazonais, como passes de batalha.  

---

## 🔄 **Modelagem**  

O banco de dados foi projetado considerando as relações entre jogadores, partidas, agentes e elementos sazonais do jogo. Um **Diagrama Entidade-Relacionamentos (ER)** organiza essas conexões para facilitar a compreensão e a análise de dados.  

---

## 📊 **Consultas SQL**  

Algumas consultas disponíveis no projeto:  

1. **Listar jogadores com seus agentes e a categoria de cada agente:**  
   ```sql
   SELECT p.tag_nome, a.nome_Agente, ca.tipo
   FROM player p
   JOIN Selecao_agente sa ON p.id_player = sa.idPlayer
   JOIN Agentes a ON sa.cod_a = a.cod_agente
   JOIN Categoria_Agente ca ON a.cod_cate = ca.cod_cat;
   ```  

2. **Obter mapas associados a partidas e o tipo de modo de jogo:**  
   ```sql
   SELECT p.id_partida, m.nome AS mapa, mj.tipo AS modo
   FROM Partida p
   JOIN Acontece_partida ap ON p.id_partida = ap.id_part
   JOIN mapa m ON ap.id_mapa = m.cod_mapa
   JOIN modo_de_jogo mj ON ap.id_mod = mj.id_modo;
   ```  

3. **Calcular a média de XP ganho em partidas sem classificação:**  
   ```sql
   SELECT AVG(CAST(sc.xp AS INT)) AS media_xp
   FROM SemClass sc
   JOIN modo_de_jogo m ON sc.id_mod = m.id_modo
   WHERE m.tipo = 'Sem Classificacao';
   ```  

4. **Obter itens exclusivos adquiridos pelos jogadores nos passes de batalha:**  
   ```sql
   SELECT p.tag_nome, pb.nome_item, pb.descricao_item
   FROM player p
   JOIN adquiri_passe ap ON p.id_player = ap.id_player
   JOIN passe_batalha pb ON ap.id_passeB = pb.id_passe
   WHERE pb.exclusivo = true;
   ```  

Mais consultas podem ser exploradas no código completo!  

---


## 🛠️ **Tecnologias Utilizadas**  

- **SQL (MySQL/PostgreSQL):** Para criação e gerenciamento do banco de dados.  
- **Ferramenta de Modelagem ER:** Para organizar visualmente as entidades e relações.  

---

## 🤝 **Contribuições**  

Contribuições são bem-vindas! Caso tenha ideias ou melhorias, sinta-se à vontade para abrir uma **issue** ou enviar um **pull request**.  

---
