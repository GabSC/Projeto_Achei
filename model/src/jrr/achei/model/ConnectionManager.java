package jrr.achei.model;

import java.sql.Connection;
import org.postgresql.ds.PGPoolingDataSource;

public class ConnectionManager {

    private PGPoolingDataSource dataSource;

    public Connection getConnection() throws Exception {
        Connection conn = dataSource.getConnection();
        conn.setAutoCommit(false);
        return conn;
    }
    //Inicio Singleton single to n

    private ConnectionManager() {
        dataSource = new PGPoolingDataSource();
        dataSource.setDataSourceName("achei");
        dataSource.setServerName("localhost");
        dataSource.setPortNumber(5432);
        dataSource.setDatabaseName("achei");
        dataSource.setUser("postgres");
        dataSource.setPassword("postgre");
        dataSource.setMaxConnections(30);
        dataSource.setInitialConnections(10);
    }
    
    private static ConnectionManager instance;

    public static ConnectionManager getInstance() {
        if (instance == null) {
            instance = new ConnectionManager();
        }
        return instance;
    }
    //Fim Singleton
}

//para cira rum singleton que uma unica instancia de um objeto em um programa todo, cria-se a classe,coloca-se o
// construtor como privado ,cria-se um atributo como privado e statico e do tipo da classe e deixa ele nulo
// cria-se um metodo getInstance() como publica statica que retorna a classe em questão
//dentro do metodo faz um if verificando se o objet que foi criado está nulo,se verddeiro
// objeto = new construtor(),se não verdadeiro não faz nada e o método já retorna o atributo instance