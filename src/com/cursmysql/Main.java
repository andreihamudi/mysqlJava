package com.cursmysql;




public class Main {

    public static void main(String[] args)  {

       // Students student = new Students("4MM", "Muntean", "Maria", "2910608832342","1991-06-08");
        //Students.insertStudents( student);
       // Students.showStudents();
        Teachers.createTable();
        DbConnector.closeConnection();
    }
}
