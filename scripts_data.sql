/*================================================================*/

/*DELETING ALL DATA */

/*Delte micro contracts configurations */
DELETE FROM takt.micro_contract_configuration WHERE idConfiguration >= 0;

/*Delete itens */
DELETE FROM takt.item WHERE idItem >= 0;

/*Delete itens types */
DELETE FROM takt.item_type WHERE idItemType >= 0;

/*Delete micro contracts */
DELETE FROM takt.micro_contract WHERE idMicroContract >= 0;


/*Delete macro proccesses */
DELETE FROM takt.macro_proccess WHERE idMacroProccess >= 0;

/*Delete phases */
DELETE FROM takt.phase WHERE idPhase >=0;
 
/*Delete stakeholders */
DELETE FROM takt.stakeholder WHERE idStakeholder >=0;

/*Delete roles */
DELETE FROM takt.role WHERE idRole >= 0;

/*Delete users*/
DELETE FROM takt.user WHERE idUser >= 0;

/*================================================================*/

/*AUTO INCREMENT INITIALIZATION */

ALTER TABLE takt.user AUTO_INCREMENT = 1;
ALTER TABLE takt.stakeholder AUTO_INCREMENT = 1;
ALTER TABLE takt.role AUTO_INCREMENT = 1;
ALTER TABLE takt.macro_proccess AUTO_INCREMENT = 1;
ALTER TABLE takt.phase AUTO_INCREMENT = 1;
ALTER TABLE takt.micro_contract AUTO_INCREMENT = 1;
ALTER TABLE takt.item AUTO_INCREMENT = 1;
ALTER TABLE takt.item_type AUTO_INCREMENT = 1;

/*===============================================================*/

/*INSERT SYSTEM USERS */

INSERT INTO takt.user (idUser, email) VALUES (0, 'gp@test.com');
INSERT INTO takt.user (idUser, email) VALUES (0, 'proxypo@test.com');
INSERT INTO takt.user (idUser, email) VALUES (0, 'arquiteto@test.com');
INSERT INTO takt.user (idUser, email) VALUES (0, 'designer@test.com');
INSERT INTO takt.user (idUser, email) VALUES (0, 'qa@test.com');
INSERT INTO takt.user (idUser, email) VALUES (0, 'developer@test.com');

SELECT * FROM takt.user;

/*================================================================*/

/*INSERT ROLES */

INSERT INTO takt.role (idRole, name, description) VALUES (0, 'Gerente de projetos', '');
INSERT INTO takt.role (idRole, name, description) VALUES (0, 'Proxy P.O', '');
INSERT INTO takt.role (idRole, name, description) VALUES (0, 'Arquiteto', '');
INSERT INTO takt.role (idRole, name, description) VALUES (0, 'Designer', '');
INSERT INTO takt.role (idRole, name, description) VALUES (0, 'Analista de QA', '');
INSERT INTO takt.role (idRole, name, description) VALUES (0, 'Developer', '');

SELECT * FROM takt.role;

/*================================================================*/

/*INSERT STAKEHOLDERS */

INSERT INTO takt.stakeholder (idStakeholder, name, idUser, idRole) VALUES (0, 'Gerente de Projetos João', 1, 1);
INSERT INTO takt.stakeholder (idStakeholder, name, idUser, idRole) VALUES (0, 'Proxy P.O Madalena', 2, 2);
INSERT INTO takt.stakeholder (idStakeholder, name, idUser, idRole) VALUES (0, 'Arquiteto Genivaldo', 3, 3);
INSERT INTO takt.stakeholder (idStakeholder, name, idUser, idRole) VALUES (0, 'Designer Juliana', 4, 4);
INSERT INTO takt.stakeholder (idStakeholder, name, idUser, idRole) VALUES (0, 'Analista de QA Flávio', 5, 5);
INSERT INTO takt.stakeholder (idStakeholder, name, idUser, idRole) VALUES (0, 'Developer Jorge', 6, 6);

SELECT * FROM takt.stakeholder;

/*================================================================*/

/*INSERT MACRO PROCCESSES */

INSERT INTO takt.macro_proccess (idMacroProccess, name, description) VALUES (0, 'Processo de desenvolvimento de software', 'Contém todas as fases de um processo de desenvolvimento de software');
INSERT INTO takt.macro_proccess (idMacroProccess, name, description) VALUES (0, 'Test Micro Proccess', 'It is a test of an abstract micro proccess');

SELECT * FROM takt.macro_proccess;

/*================================================================*/

/*INSERT PHASES */

INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 1, 'Iniciação', 'Fase composta pela reunião de kickoff e elaboração de wireframe que servirá de insumo para as primeiras inceptions');
INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 1, 'Concepção inicial', 'Nessa fase fazemos as intro inceptions e elaboramos artefatos parcialmente');
INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 1, 'Concepção de cenários', 'Nessa fase envolvemos os líderes técnicos e analistas de qualidade para debater cenários com mais profundidade'); 
INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 1, 'Desenvolvimento e testes', 'Nessa fase teremos as sprints de desenvolvimento e deploy do produto');
INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 1, 'Implantação', 'Nessa fase teremos todo o trabalho relativo para preparar a aplicação desenvolvida para sua subida no ambiente produtivo');
INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 2, 'Test phase 1', 'First test phase');
INSERT INTO takt.phase (idPhase, idMacroProccess, name, description) VALUES (0, 2, 'Test phase 2', 'Second test phase');

SELECT * FROM takt.phase;

/*================================================================*/

/*INSERT MICRO CONTRACTS*/

/*Na instância, adicionar flag de inputs obrigatórios e flag de recorrência livre */

/* Micro contratos de iniciação */

/*Micro contratos da fase de iniciação*/
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 1, 'Fazer Kickoff', 'Organizar kickoff e preencher o PmCanvas com o time');

/* Micro contratos da fase de intro inceptions */
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 2, 'Fazer user stories e desenho do Aris através intro inceptions', 'Pacote de trabalho realizado durante as intro inceptions que consiste em elaborar a product backlog inicial, assim como o fluxo de aplicação no ARIS. Esses artefratos poderão ser refinados durante as futuras inceptions de cenários');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 2, 'Fazer desenho de arquitetura através das intro inceptions', 'Consiste em realizar, durante as intro inceptions, desenho de arquitetura inicial. Este desenho poderá ser refinado nas inceptions de cenários.');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 2, 'Fazer protótipos de tela  através das intro inceptions', 'Consiste no desenho e ajustes dos wireframes e protótipos de tela antes de serem refinados nas inceptions de cenários');

/*Micro contratos da fase de inceptions de cenários */
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 3, 'Refinar user stories e fluxo ARIS através de inceptions de cenário', 'Consiste em explorar diversas possibilidades para a user stories e seus fluxos, criando, eliminando e modificando a product backlog');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 3, 'Refinar desenho de arquitetura através de inceptions de cenário', 'Consiste em realizar, durante as inceptions de cenário, revisão e refinamento do desenho de arquitetura');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 3, 'Refinar protótipos de tela através de inceptions de cenário', 'Consiste no desenho e ajustes dos wireframes e protótipos de tela antes de serem refinados nas inceptions de cenários');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 3, 'Traçar cenários de teste nas inceptions de cenário', 'Consiste em traçar cenários de testes para cada user story da product backlog durante as inceptions de cenários');

/*Micro contratos da fase de desenvolvimento */
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 4, 'Ajustar user stories e fluxo ARIS durante o desenvolvimento', 'Consiste em eventuais ajustes de user stories e fluxos devido à descobertas efetuadas pelos developers');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 4, 'Ajustar desenho de solução durante o desenvolvimento', 'Consiste em ajustar desenho de solução durante a etapa de desenvolvimento');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 4, 'Ajustar protótipos durante o desenvolvimento', 'Consiste em ajustar protótipos de telas durante a etapa de desenvolvimento');
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 4, 'Desenvolver a aplicação', 'Consiste na execução das sprints de desenvolvimento'); 
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 4, 'Testar a aplicação e ajustar cenários de teste', 'Consiste na execução de testes automatizados da aplicação, assim como seus respectivos ajustes'); 

/*Micro contratos da fase de deploy */
INSERT INTO takt.micro_contract (idMicroContract, idPhase, name, description) VALUES (0, 5, 'Realizar deploy da aplicação', 'Consiste em todos os procedimentos relativos à implantação do produto depois do desenvolvimento completo'); 

SELECT * FROM takt.micro_contract;

/*================================================================*/

/*INSERT ITENS */

/*Itens da etapa de iniciação */
INSERT INTO takt.item (idItem, name) VALUE (0, 'Briefing');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Pm Canvas');

/*Itens da etapa de intro inceptions */
INSERT INTO takt.item (idItem, name) VALUE (0, 'User Stories (a refinar)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Documentação Aris (a refinar)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Desenho de solução (a refinar)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Protótipos de tela (a refinar)');

/*Itens da etapa de inceptions de cenários */
INSERT INTO takt.item (idItem, name) VALUE (0, 'User Stories (refinadas, prontas para o dev.)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Documentação do Aris (refinada, pronta para o dev.)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Desenho de solução (refinado, pronto para o dev.)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Protótipos de tela (refinado, pronto para o dev.)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Cenários de teste para o dev');

/*Itens da etapa de desenvolvimento */
INSERT INTO takt.item (idItem, name) VALUE (0, 'User Stories (ajustadas durante o dev.)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Documentação do Aris (ajustadas durante o dev)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Desenho de solução (ajustadas durante o dev)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Protótipos de tela (ajustadas durante o dev)');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Produto desenvolvido');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Testes realizados');
INSERT INTO takt.item (idItem, name) VALUE (0, 'Produto entregue');

SELECT  * from takt.item;

/*================================================================*/

/*INSERT ITEM TYPES */

/*Item type 1*/
INSERT INTO takt.item_type (idItemType, name) VALUE (0, 'Input');
INSERT INTO takt.item_type (idItemType, name) VALUE (0, 'Output');

SELECT  * from takt.item_type;

/*================================================================*/

/*INSERT MICRO CONTRACT CONFIGURATIONS */

/*Fazer kickoff do projeto */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 1, 1, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 1, 2, 1, 2);

/*Fazer user stories e fluxo ARIS através das intro inceptions */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 2, 2, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 2, 3, 1, 2);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 2, 4, 1, 2);

/*Fazer desenho de solução através das intro inceptions */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 3, 2, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 3, 5, 1, 2);

/*Fazer protótipo de tela através das intro inceptions */ 
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 4, 2, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 4, 6, 1, 2);

/*Refinar user stories e fluxo aris através das inceptions de cenários */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 5, 3, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 5, 4, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 5, 5, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 5, 6, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 5, 7, 1, 2);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 5, 8, 1, 2);

/*Refinar desenho da arquitetura nas inceptions de cenários*/
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 6, 3, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 6, 4, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 6, 5, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 6, 6, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 6, 9, 1, 2);

/*Refinar protótipos de tela através de inceptions de cenário*/
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 7, 3, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 7, 4, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 7, 5, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 7, 6, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 7, 10, 1, 2);

/*Traças cenários de teste através das inceptions de cenário*/
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 8, 3, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 8, 4, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 8, 5, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 8, 6, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 8, 11, 1, 2);

/* Ajuster user stories e fluxo ARIS durante o desenvolvimento */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 7, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 8, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 9, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 10, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 11, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 12, 1, 2);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 9, 13, 1, 2);

/* Ajuster desenho de solução durante o desenvolvimento */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 10, 7, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 10, 8, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 10, 9, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 10, 10, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 10, 11, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 10, 14, 1, 2);

/* Ajuster protótipos de tela durante o desenvolvimento */
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 11, 7, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 11, 8, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 11, 9, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 11, 10, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 11, 11, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 11, 15, 1, 2);

/* Desenvolver a aplicação*/
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 12, 7, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 12, 8, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 12, 9, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 12, 10, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 12, 11, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 12, 16, 1, 2);

/* Testar a aplicação e ajustar cenários de teste*/
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 13, 7, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 13, 8, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 13, 9, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 13, 10, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 13, 11, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 13, 17, 1, 2);

/* Testar a aplicação e ajustar cenários de teste*/
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 14, 16, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 14, 17, 1, 1);
INSERT INTO takt.micro_contract_configuration (idConfiguration, idMicroContract, idItem, qtdItem, idItemType) VALUE (0, 14, 18, 1, 1);

SELECT  * from takt.micro_contract_configuration;

