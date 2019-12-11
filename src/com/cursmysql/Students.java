package com.cursmysql;

//STEP 1. Import required packages
import java.sql.*;

public class Students {
    private String numar_matricol;
    private String nume;
    private String prenume;
    private String cnp;
    private String data_nasterii;


    public Students(String nrMatricol, String nume, String prenume, String cnp, String dataNastere) {
        this.numar_matricol = nrMatricol;
        this.nume = nume;
        this.prenume = prenume;
        this.cnp = cnp;
        this.data_nasterii = dataNastere;


    }
    public String getNrMatricol() {
        return numar_matricol;
    }
    public String getNume() {
        return nume;
    }
    public String getPrenume() {
        return prenume;
    }
    public String getCnp() {
        return cnp;
    }
    public String getDataNastere() {
        return data_nasterii;
    }



    public static void showStudents(){

        String sql = "SELECT * FROM studenti";
        Connection connection = DbConnector.getDbConnection();
        Statement statement;
        ResultSet result;
        try {
            //STEP 4: Execute a query
            statement = connection.createStatement();
            result = statement.executeQuery(sql);
            int count = 0;

            //STEP 5: Extract data from result set
            while(result.next()){
                // Retrieve by column order
                Integer id = result.getInt(1);
                String nrMatricol = result.getString(2);
                String nume = result.getString(3);
                String prenume = result.getString(4);


//                String output = "Student #%d: %d - %s - %s - %s";
//                System.out.println(String.format(output, ++count, id, nrMatricol, nume, prenume));
                ++count;
                System.out.println("Student: Nr - "+count+" ID: "+id+" Nr. Matricol: "+nrMatricol+" Nume : "+nume+" Prenume: "+prenume);
            }
        }
        catch(SQLException e){
            System.err.println("Query error.");
        }
        catch(NullPointerException e){
            System.err.println("Element not found.");
        }
    }

    public static void insertStudents(Students student) {

        String sql = "INSERT INTO `studenti`(`numar_matricol`, `nume`, `prenume`,`cnp`,`data_nasterii`) " +
                "VALUES ('"+
                student.getNrMatricol()+"','" +
                student.getNume()+"','" +
                student.getPrenume()+"','" +
                student.getCnp()+"','" +
                student.getDataNastere() +"');";
        System.out.println(sql);
        Connection connection = DbConnector.getDbConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
            statement.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }







}
